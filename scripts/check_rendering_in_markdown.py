"""
Prüfskript für Referenzen in Markdown-Dokumentation

Anforderungen:

1. Alle Markdown-Dateien in einem angegebenen Wurzelverzeichnis (z.B. /guides) und dessen Unterordnern werden nach bestimmten Referenzmustern durchsucht:
   - {{render:...}}
   - {{pagelink:...}}
   - {{page:...}}
   - {{link:...}}

2. Für jede gefundene Referenz wird geprüft:
   a) Wenn eine Dateiendung vorhanden ist (z.B. .json, .png), ob die referenzierte Datei im Repository existiert.
   b) Wenn keine Dateiendung vorhanden ist:
      - Ob es eine JSON-Datei in einem festgelegten Verzeichnis gibt, in deren Inhalt das Feld "id" mit dem Referenzwert (case-insensitive) übereinstimmt.
      - Ob in einer Markdown-Datei ein Topic-Frontmatter (---\ntopic: ...\n---) mit passendem Namen (case-insensitive) existiert.

3. Für {{pagelink:...}}-Referenzen mit einem Slash (/) im Wert und dem letzten Segment "CapabilityStatements" wird zusätzlich geprüft, ob ein entsprechender Ordner im guides-Baum existiert. Ist dies der Fall, gilt die Referenz als gültig, auch wenn keine Topic- oder ID-Übereinstimmung vorliegt.

4. Die Prüfung ist betriebssystemunabhängig und tolerant gegenüber unterschiedlichen Schreibweisen von Pfaden ("/" oder "\").

5. Alle Fehler werden mit Quelle, Typ, Referenz und Fehlerursache protokolliert und als Markdown-Tabelle in einer Logdatei abgelegt.

6. Die Gesamtzahl der gefundenen Referenzen und Fehler wird ausgegeben.

Diese Anforderungen dienen der Qualitätssicherung von Dokumentations- und Referenzintegrität in komplexen Repository-Strukturen.
"""


import os
import re
import json

def find_markdown_files(root_dir):
    md_files = []
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.md'):
                md_files.append(os.path.join(dirpath, filename))
    return md_files

def extract_references(md_file):
    patterns = [
        (r"\{\{render:([^}]+)\}\}", "render"),
        (r"\{\{pagelink:([^}]+)\}\}", "pagelink"),
        (r"\{\{page:([^}]+)\}\}", "page"),
        (r"\{\{link:([^}]+)\}\}", "link"),
    ]
    refs = []
    with open(md_file, encoding="utf-8") as f:
        for i, line in enumerate(f, 1):
            for pattern, ptype in patterns:
                for match in re.findall(pattern, line):
                    refs.append({
                        "type": ptype,
                        "ref": match.strip(),
                        "src": md_file,
                        "line": i,
                    })
    return refs

def check_file_exists(repo_root, ref_path):
    normalized_ref = ref_path.replace("\\", "/").lstrip("/\\")
    abs_path = os.path.normpath(os.path.join(repo_root, normalized_ref))
    return os.path.isfile(abs_path)

def check_directory_exists(repo_root, dir_path):
    """
    dir_path: string, e.g. "Einfuehrung/Artefakte/CapabilityStatements" or with backslashes
    """
    normalized_dir = dir_path.replace("\\", "/").lstrip("/\\")
    abs_path = os.path.normpath(os.path.join(repo_root, normalized_dir))
    return os.path.isdir(abs_path)

def check_id_in_jsons(search_id, json_dir):
    search_id_lower = search_id.lower()
    for dirpath, _, filenames in os.walk(json_dir):
        for filename in filenames:
            if filename.endswith('.json'):
                json_path = os.path.join(dirpath, filename)
                try:
                    with open(json_path, encoding="utf-8") as f:
                        data = json.load(f)
                        if isinstance(data, dict):
                            if str(data.get("id", "")).lower() == search_id_lower:
                                return True
                        elif isinstance(data, list):
                            for item in data:
                                if isinstance(item, dict) and str(item.get("id", "")).lower() == search_id_lower:
                                    return True
                except Exception:
                    continue
    return False

def has_extension(ref):
    return bool(re.search(r"\.[a-zA-Z0-9]+$", ref))

def extract_topics_from_md(md_file):
    topics = []
    with open(md_file, encoding="utf-8") as f:
        content = f.read()
    frontmatter_match = re.match(r"^---\s*\n(.*?)\n---", content, re.DOTALL)
    if frontmatter_match:
        frontmatter = frontmatter_match.group(1)
        topic_match = re.search(r"^topic:\s*([^\n]+)", frontmatter, re.MULTILINE)
        if topic_match:
            topics.append(topic_match.group(1).strip())
    return topics

def build_topic_map(md_files):
    topic_map = {}
    for md_file in md_files:
        topics = extract_topics_from_md(md_file)
        for topic in topics:
            topic_map[topic.lower()] = md_file  # case-insensitive mapping
    return topic_map

def is_pagelink_capstatements(ref_type, ref_str):
    """
    Prüft, ob es sich um einen pagelink auf einen CapabilityStatements-Ordner handelt.
    """
    if ref_type != "pagelink":
        return False
    
    ref_norm = ref_str.replace("\\", "/")
    parts = ref_norm.strip("/").split("/")
    
    is_capstatements = len(parts) >= 1 and parts[-1] == "CapabilityStatements"
    
    if is_capstatements:
        print(f"DEBUG: CapabilityStatements pagelink erkannt: {ref_str}")  # Debug-Ausgabe
    
    return is_capstatements

def get_module_from_file_path(file_path, guides_dir):
    """
    Ermittelt das Modul (z.B. Basis-5, ICU-5) aus dem Dateipfad.
    """
    try:
        # Normalisiere den Pfad
        normalized_path = os.path.normpath(file_path)
        normalized_guides = os.path.normpath(guides_dir)
        
        # Finde den relativen Pfad ab guides/
        if guides_dir.startswith('./'):
            guides_dir_abs = os.path.abspath(guides_dir)
        else:
            guides_dir_abs = os.path.abspath(guides_dir)
            
        file_path_abs = os.path.abspath(file_path)
        
        # Prüfe, ob die Datei im guides-Verzeichnis liegt
        if not file_path_abs.startswith(guides_dir_abs):
            return None
            
        # Extrahiere den relativen Pfad
        rel_path = os.path.relpath(file_path_abs, guides_dir_abs)
        
        # Das erste Segment ist das Modul
        parts = rel_path.split(os.sep)
        if len(parts) > 0:
            return parts[0]
            
    except Exception as e:
        print(f"DEBUG: Fehler beim Ermitteln des Moduls für {file_path}: {e}")
        return None
    
    return None

def pagelink_capstatements_folder_exists(ref_str, guides_dir, repo_root, source_file):
    """
    Prüft, ob der referenzierte CapabilityStatements-Ordner im gleichen Modul wie die Quelldatei existiert.
    """
    # Ermittle das Modul aus der Quelldatei
    module = get_module_from_file_path(source_file, guides_dir)
    if not module:
        print(f"DEBUG: Konnte Modul nicht ermitteln für Datei: {source_file}")
        return False
    
    print(f"DEBUG: Erkanntes Modul: {module} für Datei: {source_file}")
    
    # Normalisiere den Referenz-Pfad
    ref_norm = ref_str.replace("\\", "/").strip("/")
    
    # Konstruiere den vollständigen Pfad im spezifischen Modul
    full_path = os.path.join(repo_root, guides_dir, module, ref_norm)
    abs_path = os.path.normpath(full_path)
    
    print(f"DEBUG: Prüfe CapabilityStatements-Ordner: {abs_path}")
    
    exists = os.path.isdir(abs_path)
    if exists:
        print(f"DEBUG: ✅ CapabilityStatements-Ordner gefunden: {abs_path}")
    else:
        print(f"DEBUG: ❌ CapabilityStatements-Ordner nicht gefunden: {abs_path}")
    
    return exists

def write_markdown_log(errors, total_refs, filename):
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w", encoding="utf-8") as f:
        f.write(f"**Anzahl der gefundenen Referenzen:** {total_refs}\n\n")
        f.write(f"**Anzahl der Fehler:** {len(errors)}\n\n")
        if errors:
            f.write("| Quelle | Typ | Referenz | Fehler |\n")
            f.write("|--------|-----|----------|--------|\n")
            for err in errors:
                f.write(f"| {err['quelle']} | {err['typ']} | {err['referenz']} | {err['fehler']} |\n")
        else:
            f.write("✅ Keine Fehler gefunden!\n")

def check_reference(ref, repo_root, guides_dir, json_dir, topic_map):
    ref_str = ref["ref"]
    ref_type = ref["type"]
    src = ref["src"]
    line = ref["line"]

    # 1. Prüfung: Hat die Referenz eine Dateiendung?
    if has_extension(ref_str):
        if not check_file_exists(repo_root, ref_str):
            return {
                "quelle": f"{src}:{line}",
                "typ": ref_type,
                "referenz": ref_str,
                "fehler": "Datei nicht gefunden"
            }
        return None  # Datei gefunden, kein Fehler
    
    # 2. Spezialfall: pagelink mit CapabilityStatements-Ordner
    if is_pagelink_capstatements(ref_type, ref_str):
        if pagelink_capstatements_folder_exists(ref_str, guides_dir, repo_root, src):
            return None  # Ordner gefunden, kein Fehler
        # Wenn Ordner nicht gefunden, weiter mit normaler Prüfung
    
    # 3. Normale Prüfung für Referenzen ohne Dateiendung
    found_in_json = check_id_in_jsons(ref_str, json_dir)
    found_as_topic = ref_str.lower() in topic_map
    
    if not found_in_json and not found_as_topic:
        return {
            "quelle": f"{src}:{line}",
            "typ": ref_type,
            "referenz": ref_str,
            "fehler": "Weder ID in JSON noch Topic gefunden"
        }
    
    return None  # Kein Fehler gefunden

def main():
    guides_dir = "./guides"
    json_dir = "./Resources/fsh-generated/resources"
    script_dir = os.path.dirname(os.path.abspath(__file__))  # Ordner, in dem das Skript liegt
    output_dir = os.path.join(script_dir, "output-rendering_check")
    log_file = os.path.join(output_dir, "rendering_check_log.md")

    repo_root = os.path.abspath(".")
    md_files = find_markdown_files(guides_dir)
    all_refs = []
    for md_file in md_files:
        refs = extract_references(md_file)
        all_refs.extend(refs)
    total_refs = len(all_refs)

    topic_map = build_topic_map(md_files)
    errors = []

    for ref in all_refs:
        if ref["type"] == "pagelink" and "CapabilityStatements" in ref["ref"]:
            print(f"DEBUG: Verarbeite pagelink: {ref}")
        
        error = check_reference(ref, repo_root, guides_dir, json_dir, topic_map)
        if error:
            errors.append(error)
    
    # Konsolenausgabe
    print(f"Anzahl der gefundenen Referenzen: {total_refs}")
    print(f"Anzahl der Fehler: {len(errors)}\n")
    if errors:
        print("| Quelle | Typ | Referenz | Fehler |")
        print("|--------|-----|----------|--------|")
        for err in errors:
            print(f"| {err['quelle']} | {err['typ']} | {err['referenz']} | {err['fehler']} |")
    else:
        print("✅ Keine Fehler gefunden!")

    # Logdatei schreiben
    write_markdown_log(errors, total_refs, log_file)
    print(f"\nLogdatei wurde geschrieben: {log_file}")

if __name__ == "__main__":
    main()
