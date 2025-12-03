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

3. Für {{pagelink:...}}-Referenzen mit einem Slash (/) im Wert und dem letzten Segment "CapabilityStatements" oder ".page.md" wird zusätzlich geprüft, ob ein entsprechender Ordner oder eine Datei im guides-Baum existiert. Ist dies der Fall, gilt die Referenz als gültig, auch wenn keine Topic- oder ID-Übereinstimmung vorliegt.

4. Die Prüfung ist betriebssystemunabhängig und tolerant gegenüber unterschiedlichen Schreibweisen von Pfaden ("/" oder "\").

5. Alle Fehler werden mit Quelle, Typ, Referenz und Fehlerursache protokolliert und als Markdown-Tabelle in einer Logdatei abgelegt.

6. Die Gesamtzahl der gefundenen Referenzen und Fehler wird ausgegeben.

Diese Anforderungen dienen der Qualitätssicherung von Dokumentations- und Referenzintegrität in komplexen Repository-Strukturen.
"""


import os
import re
import json
import datetime

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
                    # Bereinige die Referenz: Entferne alles nach dem ersten Komma
                    ref_clean = match.strip()
                    if ',' in ref_clean:
                        ref_clean = ref_clean.split(',')[0].strip()
                    
                    refs.append({
                        "type": ptype,
                        "ref": ref_clean,  # Verwende die bereinigte Referenz
                        "src": md_file,
                        "line": i,
                    })
    return refs

def check_file_exists(repo_root, ref_path):
    """
    Prüft, ob eine Datei existiert. Vollständig slash/backslash-agnostisch.
    """
    # Normalisiere den Pfad (ersetze alle Backslashes durch Slashes)
    ref_norm = ref_path.replace("\\", "/").lstrip("/")
    
    # Teile den Pfad in Segmente auf und konstruiere ihn betriebssystemspezifisch
    path_parts = ref_norm.split("/")
    full_path = os.path.join(repo_root, *path_parts)
    abs_path = os.path.abspath(full_path)
    
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



def is_pagelink_special_case(ref_type, ref_str):
    """
    Prüft, ob es sich um einen pagelink mit speziellem Fall handelt:
    - CapabilityStatements-Ordner
    - .page.md-Datei
    """
    if ref_type != "pagelink":
        return False
    
    ref_norm = ref_str.replace("\\", "/")
    
    # Prüfe auf Slash im Wert
    if "/" not in ref_norm:
        return False
    
    parts = ref_norm.strip("/").split("/")
    
    # Fall 1: Letztes Segment ist "CapabilityStatements"
    if len(parts) >= 1 and parts[-1] == "CapabilityStatements":
        return True
    
    # Fall 2: Letztes Segment endet auf ".page.md"
    if len(parts) >= 1 and parts[-1].endswith(".page.md"):
        return True
    
    return False

def get_module_from_file_path(file_path, guides_dir):
    """
    Ermittelt das Modul (z.B. Basis-5, ICU-5) aus dem Dateipfad.
    Vollständig slash/backslash-agnostisch.
    """
    try:
        # Normalisiere beide Pfade
        file_path_norm = os.path.abspath(file_path)
        guides_dir_norm = os.path.abspath(guides_dir)
        
        print(f"DEBUG: file_path_norm: {file_path_norm}")
        print(f"DEBUG: guides_dir_norm: {guides_dir_norm}")
        
        # Prüfe, ob die Datei im guides-Verzeichnis liegt
        if not file_path_norm.startswith(guides_dir_norm):
            print(f"DEBUG: Datei liegt nicht im guides-Verzeichnis")
            return None
            
        # Extrahiere den relativen Pfad (betriebssystemspezifisch)
        rel_path = os.path.relpath(file_path_norm, guides_dir_norm)
        print(f"DEBUG: rel_path: {rel_path}")
        
        # Das erste Segment ist das Modul (betriebssystemspezifische Trennung)
        parts = rel_path.split(os.sep)
        if len(parts) > 0 and parts[0] != "." and parts[0] != "..":
            module = parts[0]
            print(f"DEBUG: Erkanntes Modul: {module}")
            return module
            
    except Exception as e:
        print(f"DEBUG: Fehler beim Ermitteln des Moduls für {file_path}: {e}")
        return None
    
    return None

def pagelink_special_case_exists(ref_str, guides_dir, repo_root, source_file, debug_messages=None):
    """
    Prüft, ob die referenzierte Datei/Ordner existiert.
    Vollständig slash/backslash-agnostisch mit detailliertem Debug.
    """
    # Normalisiere den Referenz-Pfad (ersetze alle Backslashes durch Slashes)
    ref_norm = ref_str.replace("\\", "/").strip("/")
    
    debug_print(f"\n=== DEBUG pagelink_special_case_exists ===", debug_messages)
    debug_print(f"Original ref_str: '{ref_str}'", debug_messages)
    debug_print(f"Normalized ref_norm: '{ref_norm}'", debug_messages)
    debug_print(f"Source file: '{source_file}'", debug_messages)
    debug_print(f"Repo root: '{repo_root}'", debug_messages)
    debug_print(f"Guides dir: '{guides_dir}'", debug_messages)
    
    
    # Fall 1: Absoluter Pfad beginnend mit "guides/"
    if ref_norm.startswith("guides/"):
        print(f"DEBUG: Absoluter Pfad erkannt")
        
        # Entferne "guides/" und konstruiere den Pfad
        relative_part = ref_norm[7:]  # Entferne "guides/"
        print(f"DEBUG: Relative part: '{relative_part}'")
        
        # Konstruiere den Pfad betriebssystemspezifisch
        path_parts = relative_part.split("/")
        print(f"DEBUG: Path parts: {path_parts}")
        
        # Verschiedene Pfad-Konstruktionen versuchen
        # Option 1: Direkt vom repo_root
        full_path_1 = os.path.join(repo_root, ref_norm)
        abs_path_1 = os.path.abspath(full_path_1)
        print(f"DEBUG: Option 1 - Direkter Pfad: '{abs_path_1}'")
        print(f"DEBUG: Option 1 - Existiert: {os.path.exists(abs_path_1)}")
        
        # Option 2: Über guides_dir
        guides_clean = guides_dir.lstrip("./")
        full_path_2 = os.path.join(repo_root, guides_clean, *path_parts)
        abs_path_2 = os.path.abspath(full_path_2)
        print(f"DEBUG: Option 2 - Über guides_dir: '{abs_path_2}'")
        print(f"DEBUG: Option 2 - Existiert: {os.path.exists(abs_path_2)}")
        
        # Option 3: Pfad ohne "guides/" Präfix
        full_path_3 = os.path.join(repo_root, guides_clean, relative_part)
        abs_path_3 = os.path.abspath(full_path_3)
        print(f"DEBUG: Option 3 - Ohne guides/ Präfix: '{abs_path_3}'")
        print(f"DEBUG: Option 3 - Existiert: {os.path.exists(abs_path_3)}")
        
        # Prüfe alle Optionen
        for i, (path_desc, abs_path) in enumerate([
            ("Option 1", abs_path_1),
            ("Option 2", abs_path_2), 
            ("Option 3", abs_path_3)
        ], 1):
            if os.path.exists(abs_path):
                if os.path.isfile(abs_path):
                    print(f"DEBUG: ✅ {path_desc} - Datei gefunden: {abs_path}")
                    return True
                elif os.path.isdir(abs_path):
                    print(f"DEBUG: ✅ {path_desc} - Ordner gefunden: {abs_path}")
                    return True
        
        # Zusätzliche Debug-Info: Liste Dateien im erwarteten Verzeichnis
        expected_dir = os.path.dirname(abs_path_3)
        expected_filename = os.path.basename(abs_path_3)
        print(f"DEBUG: Erwartetes Verzeichnis: '{expected_dir}'")
        print(f"DEBUG: Erwarteter Dateiname: '{expected_filename}'")
        
        if os.path.exists(expected_dir):
            try:
                files_in_dir = os.listdir(expected_dir)
                print(f"DEBUG: Dateien im Verzeichnis: {files_in_dir}")
                
                # Prüfe case-insensitive
                for file in files_in_dir:
                    if file.lower() == expected_filename.lower():
                        print(f"DEBUG: ✅ Case-insensitive Match gefunden: {file}")
                        return True
                        
            except Exception as e:
                print(f"DEBUG: Fehler beim Auflisten der Dateien: {e}")
        
        print(f"DEBUG: ❌ Datei/Ordner nicht gefunden")
        return False
    
    # Fall 2: Relativer Pfad - suche im aktuellen Modul
    print(f"DEBUG: Relativer Pfad erkannt")
    module = get_module_from_file_path(source_file, guides_dir)
    if not module:
        print(f"DEBUG: Konnte Modul nicht ermitteln für Datei: {source_file}")
        return False
    
    print(f"DEBUG: Erkanntes Modul: {module} für Datei: {source_file}")
    
    # Konstruiere den vollständigen Pfad im spezifischen Modul
    path_parts = ref_norm.split("/")
    guides_clean = guides_dir.lstrip("./")
    full_path = os.path.join(repo_root, guides_clean, module, *path_parts)
    abs_path = os.path.abspath(full_path)
    
    print(f"DEBUG: Prüfe relativen Pfad: {abs_path}")
    
    # Prüfe sowohl auf Datei als auch auf Ordner
    if os.path.exists(abs_path):
        if os.path.isfile(abs_path):
            print(f"DEBUG: ✅ Datei gefunden: {abs_path}")
            return True
        elif os.path.isdir(abs_path):
            print(f"DEBUG: ✅ Ordner gefunden: {abs_path}")
            return True
    else:
        print(f"DEBUG: ❌ Pfad nicht gefunden: {abs_path}")
        return False
    
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

def write_debug_log(debug_messages, filename):
    """
    Schreibt alle Debug-Nachrichten in eine separate Logdatei.
    """
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w", encoding="utf-8") as f:
        f.write("# Debug Log - Rendering Check\n\n")
        f.write(f"**Datum:** {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write("---\n\n")
        for message in debug_messages:
            f.write(f"{message}\n")

def debug_print(message, debug_messages_list=None):
    """
    Druckt eine Debug-Nachricht und sammelt sie optional für das Log.
    """
    print(message)
    if debug_messages_list is not None:
        debug_messages_list.append(message)

def check_reference(ref, repo_root, guides_dir, json_dir, topic_map, debug_messages=None):
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
    
    # 2. Spezialfall: pagelink mit CapabilityStatements-Ordner oder .page.md-Datei
    if is_pagelink_special_case(ref_type, ref_str):
        if pagelink_special_case_exists(ref_str, guides_dir, repo_root, src, debug_messages):
            return None  # Ordner/Datei gefunden, kein Fehler
        # Wenn Ordner/Datei nicht gefunden, weiter mit normaler Prüfung
    
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
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_dir = os.path.join(script_dir, "output-rendering_check")
    log_file = os.path.join(output_dir, "rendering_check_log.md")
    debug_log_file = os.path.join(output_dir, "debug_log.md")

    repo_root = os.path.abspath(".")
    
    # Debug-Nachrichten sammeln
    debug_messages = []
    
    debug_print(f"DEBUG: Repository root: {repo_root}", debug_messages)
    debug_print(f"DEBUG: Guides directory: {os.path.abspath(guides_dir)}", debug_messages)
    
    md_files = find_markdown_files(guides_dir)
    all_refs = []
    for md_file in md_files:
        refs = extract_references(md_file)
        all_refs.extend(refs)
    total_refs = len(all_refs)

    topic_map = build_topic_map(md_files)
    errors = []

    for ref in all_refs:
        # Debug nur für problematische .page.md Referenzen
        if ref["type"] == "pagelink" and "Operations.page.md" in ref["ref"]:
            debug_print(f"\nDEBUG: Verarbeite Operations.page.md pagelink: {ref}", debug_messages)
        
        error = check_reference(ref, repo_root, guides_dir, json_dir, topic_map, debug_messages)
        if error:
            errors.append(error)

    debug_print(f"Anzahl der gefundenen Referenzen: {total_refs}", debug_messages)
    debug_print(f"Anzahl der Fehler: {len(errors)}", debug_messages)

    # Schreibe beide Logs
    write_markdown_log(errors, total_refs, log_file)
    write_debug_log(debug_messages, debug_log_file)
    
    print(f"Logdatei wurde geschrieben: {log_file}")
    print(f"Debug-Logdatei wurde geschrieben: {debug_log_file}")

if __name__ == "__main__":
    main()
