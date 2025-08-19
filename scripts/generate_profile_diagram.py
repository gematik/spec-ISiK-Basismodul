#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
FHIR Profile Inheritance Diagram Generator
==========================================

Generates PlantUML diagrams for FHIR profile inheritance from FSH files.

Usage:
    python generate_profile_diagram.py [input_dir] [output_file]

Args:
    input_dir: Pfad zum FSH-Ordner (default: Resources/input/fsh/ICU)
    output_file: Ausgabe-Datei (default: Material/ICU/Profile_Inheritance_Diagram.puml)
"""

import os
import re
import sys
from pathlib import Path

def sanitize_profile_name(name):
    """
    Sanitizes profile names for use as PlantUML identifiers.
    
    Args:
        name (str): The profile name to sanitize
        
    Returns:
        str: Sanitized name suitable for PlantUML identifiers
    """
    return name.replace("-", "_")

def extract_fsh_profiles(directory):
    """Extrahiert Profile und ihre Vererbungsbeziehungen aus FSH-Dateien"""
    profiles = {}
    relationships = []
    external_parents = set()
    
    directory_path = Path(directory)
    if not directory_path.exists():
        print(f"❌ Fehler: Ordner {directory} existiert nicht!")
        return profiles, relationships, external_parents
    
    print(f"📁 Durchsuche Ordner: {directory}")
    
    fsh_files = list(directory_path.glob("*.fsh"))
    if not fsh_files:
        print(f"⚠️  Keine FSH-Dateien in {directory} gefunden!")
        return profiles, relationships, external_parents
    
    for fsh_file in fsh_files:
        print(f"  📄 Analysiere Datei: {fsh_file.name}")
        
        try:
            with open(fsh_file, 'r', encoding='utf-8') as f:
                content = f.read()
        except Exception as e:
            print(f"  ⚠️  Fehler beim Lesen von {fsh_file.name}: {e}")
            continue
            
        # Finde Profile-Definition
        profile_match = re.search(r'Profile:\s+(\S+)', content)
        if profile_match:
            profile_name = profile_match.group(1)
            print(f"    ✅ Profil gefunden: {profile_name}")
            
            # Finde Parent-Beziehung
            parent_match = re.search(r'Parent:\s+(\S+)', content)
            if parent_match:
                parent_name = parent_match.group(1)
                print(f"    🔗 Parent gefunden: {parent_name}")
                relationships.append({
                    'child': profile_name,
                    'parent': parent_name,
                    'file': fsh_file.name
                })
                
                # Markiere Parent als extern
                external_parents.add(parent_name)
            
            # Zusätzliche Informationen extrahieren
            title_match = re.search(r'Title:\s*"([^"]+)"', content)
            id_match = re.search(r'Id:\s+(\S+)', content)
            description_match = re.search(r'Description:\s*"([^"]+)"', content)
            
            profiles[profile_name] = {
                'file': fsh_file.name,
                'title': title_match.group(1) if title_match else profile_name,
                'id': id_match.group(1) if id_match else None,
                'description': description_match.group(1) if description_match else None,
                'has_parent': parent_match is not None,
                'is_local': True
            }
        else:
            print(f"    ℹ️  Kein Profil in {fsh_file.name} gefunden")
    
    # Entferne Parents, die auch lokal definiert sind
    local_profile_names = set(profiles.keys())
    external_parents = external_parents - local_profile_names
    
    # Füge externe Parent-Profile hinzu
    for parent in external_parents:
        profiles[parent] = {
            'file': 'External/Unknown',
            'title': parent,
            'id': None,
            'description': 'External profile (not defined in this folder)',
            'has_parent': False,
            'is_local': False
        }
    
    return profiles, relationships, external_parents

def scan_for_missing_parents(base_directory, missing_parents):
    """Sucht nach fehlenden Parent-Profilen in anderen Ordnern"""
    found_parents = {}
    base_path = Path(base_directory)
    
    if not base_path.exists():
        print(f"⚠️  Basis-Ordner {base_directory} nicht gefunden!")
        return found_parents
    
    print(f"🔍 Suche nach Parent-Profilen in {base_directory}...")
    
    for fsh_file in base_path.rglob("*.fsh"):
        try:
            with open(fsh_file, 'r', encoding='utf-8') as f:
                content = f.read()
            
            profile_match = re.search(r'Profile:\s+(\S+)', content)
            if profile_match:
                profile_name = profile_match.group(1)
                if profile_name in missing_parents:
                    rel_path = fsh_file.relative_to(base_path)
                    found_parents[profile_name] = str(rel_path)
                    print(f"  ✅ {profile_name} gefunden in: {rel_path}")
        except Exception as e:
            print(f"  ⚠️  Fehler beim Lesen von {fsh_file}: {e}")
    
    return found_parents

def generate_plantuml_diagram(profiles, relationships, external_parents, output_path):
    """Generiert PlantUML-Diagramm für Profile-Vererbung"""
    
    plantuml_content = """@startuml
skinparam class {
    BackgroundColor<<Local>> White
    BackgroundColor<<External>> LightGray
    BorderColor Black
    FontSize 10
    FontColor Black
}
skinparam note {
    BackgroundColor LightYellow
    FontColor Black
}

"""
    
    # Kategorisiere Profile
    local_profiles = [p for p, info in profiles.items() if info['is_local']]
    external_profiles = [p for p, info in profiles.items() if not info['is_local']]
    
    # Lokale Profile
    if local_profiles:
        plantuml_content += "package \"Local Profiles\" {\n"
        for profile_name in local_profiles:
            info = profiles[profile_name]
            # Kürze lange Namen für bessere Darstellung
            display_name = profile_name
            if len(profile_name) > 30:
                display_name = profile_name[:27] + "..."
            
            plantuml_content += f'  class "{display_name}" as {sanitize_profile_name(profile_name)} <<Local>> {{\n'
            if info.get('id'):
                plantuml_content += f'    + ID: {info["id"]}\n'
            if info.get('title') and info['title'] != profile_name:
                # Kürze Titel wenn zu lang
                title = info['title']
                if len(title) > 40:
                    title = title[:37] + "..."
                plantuml_content += f'    + Title: {title}\n'
            plantuml_content += '  }\n'
        plantuml_content += "}\n\n"
    
    # Externe Profile
    if external_profiles:
        plantuml_content += "package \"External/Parent Profiles\" {\n"
        for profile_name in external_profiles:
            info = profiles[profile_name]
            display_name = profile_name
            if len(profile_name) > 30:
                display_name = profile_name[:27] + "..."
                
            plantuml_content += f'  class "{display_name}" as {sanitize_profile_name(profile_name)} <<External>> {{\n'
            plantuml_content += '  }\n'
        plantuml_content += "}\n\n"
    
    # Füge Beziehungen hinzu
    plantuml_content += "' Inheritance relationships\n"
    for rel in relationships:
        parent_id = sanitize_profile_name(rel["parent"])
        child_id = sanitize_profile_name(rel["child"])
        plantuml_content += f'{parent_id} <|-- {child_id}\n'
    
    plantuml_content += "\n@enduml"
    
    # Erstelle Ausgabe-Ordner falls nicht vorhanden
    output_dir = Path(output_path).parent
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Schreibe in Datei
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(plantuml_content)
    
    print(f"📊 Diagramm erstellt: {output_path}")
    return {
        'local_profiles': local_profiles,
        'external_profiles': external_profiles,
        'relationships': relationships
    }

def print_summary(result, external_parents, found_parents):
    """Gibt eine Zusammenfassung der Analyse aus"""
    print("\n" + "="*50)
    print("📈 ANALYSE ZUSAMMENFASSUNG")
    print("="*50)
    
    print(f"📋 Lokale Profile gefunden: {len(result['local_profiles'])}")
    for profile in result['local_profiles']:
        print(f"  • {profile}")
    
    if external_parents:
        print(f"\n🔗 Externe Parent-Profile: {len(external_parents)}")
        for parent in external_parents:
            status = "✅ gefunden" if parent in found_parents else "❓ unbekannt"
            location = f" in {found_parents[parent]}" if parent in found_parents else ""
            print(f"  • {parent} - {status}{location}")
    
    print(f"\n🔄 Vererbungsbeziehungen: {len(result['relationships'])}")
    for rel in result['relationships']:
        print(f"  • {rel['parent']} → {rel['child']} (in {rel['file']})")

def generate_svg_from_plantuml(puml_file, svg_file):
    """Generiert SVG-Datei aus PlantUML-Datei"""
    try:
        import subprocess
        # Versuche PlantUML zu finden und auszuführen
        commands_to_try = [
            ["plantuml", "-tsvg", puml_file],
            ["java", "-jar", "plantuml.jar", "-tsvg", puml_file],
            ["java", "-DPLANTUML_LIMIT_SIZE=32768", "-jar", "plantuml.jar", "-tsvg", puml_file]
        ]
        
        for cmd in commands_to_try:
            try:
                result = subprocess.run(cmd, capture_output=True, text=True, check=True)
                return True
            except (subprocess.CalledProcessError, FileNotFoundError):
                continue
        
        return False
    except ImportError:
        return False

def main():
    """Hauptfunktion"""
    # Standardwerte
    default_input = "Resources/input/fsh/ICU"
    default_output = "Material/ICU/Profile_Inheritance_Diagram.puml"
    base_search_dir = "Resources/input/fsh"
    
    # Kommandozeilenargumente verarbeiten
    input_dir = sys.argv[1] if len(sys.argv) > 1 else default_input
    output_file = sys.argv[2] if len(sys.argv) > 2 else default_output
    
    print("🚀 FHIR Profile Inheritance Diagram Generator")
    print("=" * 50)
    print(f"📂 Input-Ordner: {input_dir}")
    print(f"📝 Output-Datei: {output_file}")
    print()
    
    # Analysiere Profile
    profiles, relationships, external_parents = extract_fsh_profiles(input_dir)
    
    if not profiles:
        print("❌ Keine Profile gefunden! Beende Ausführung.")
        return 1
    
    # Suche nach fehlenden Parent-Profilen
    found_parents = {}
    if external_parents:
        found_parents = scan_for_missing_parents(base_search_dir, external_parents)
        
        # Aktualisiere externe Profile mit gefundenen Pfaden
        for parent, path in found_parents.items():
            if parent in profiles:
                profiles[parent]['file'] = path
    
    # Generiere Diagramm
    result = generate_plantuml_diagram(profiles, relationships, external_parents, output_file)
    
    # Generiere SVG-Datei
    svg_file = output_file.replace('.puml', '.svg')
    if generate_svg_from_plantuml(output_file, svg_file):
        print(f"📊 SVG-Diagramm erstellt: {svg_file}")
    else:
        print("⚠️  SVG-Generierung fehlgeschlagen (PlantUML nicht verfügbar)")
        print("💡 Installieren Sie PlantUML um SVG-Dateien zu generieren:")
        print("   choco install plantuml  # oder")
        print("   java -jar plantuml.jar")
    
    # Ausgabe der Ergebnisse
    print_summary(result, external_parents, found_parents)
    
    print(f"\n✅ Erfolgreich abgeschlossen!")
    print(f"💡 Tipp: Verwenden Sie PlantUML um das Diagramm zu rendern:")
    print(f"   plantuml {output_file}")
    
    return 0

if __name__ == "__main__":
    exit_code = main()
    sys.exit(exit_code)
