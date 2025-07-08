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

def check_file_exists(base_path, ref_path):
    # Normalize slashes and remove leading slashes
    normalized_ref = ref_path.replace("\\", "/").lstrip("/\\")
    abs_path = os.path.normpath(os.path.join(base_path, normalized_ref))
    return os.path.isfile(abs_path)

def check_id_in_jsons(search_id, json_dir):
    for dirpath, _, filenames in os.walk(json_dir):
        for filename in filenames:
            if filename.endswith('.json'):
                json_path = os.path.join(dirpath, filename)
                try:
                    with open(json_path, encoding="utf-8") as f:
                        data = json.load(f)
                        if isinstance(data, dict):
                            if data.get("id") == search_id:
                                return True
                        elif isinstance(data, list):
                            for item in data:
                                if isinstance(item, dict) and item.get("id") == search_id:
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
            topic_map[topic] = md_file
    return topic_map

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

def main():
    guides_dir = "./guides"
    json_dir = "./Resources/fsh-generated/resources"
    output_dir = "./output-rendering_check"
    log_file = os.path.join(output_dir, "rendering_check_log.md")

    md_files = find_markdown_files(guides_dir)
    all_refs = []
    for md_file in md_files:
        refs = extract_references(md_file)
        all_refs.extend(refs)
    total_refs = len(all_refs)

    topic_map = build_topic_map(md_files)
    errors = []
    repo_root = os.path.abspath(".")

    for ref in all_refs:
        ref_str = ref["ref"]
        line = ref["line"]
        if has_extension(ref_str):
            if not check_file_exists(repo_root, ref_str):
                errors.append({
                    "quelle": f"{ref['src']}:{line}",
                    "typ": ref["type"],
                    "referenz": ref_str,
                    "fehler": "Datei nicht gefunden"
                })
        else:
            found_in_json = check_id_in_jsons(ref_str, json_dir)
            found_as_topic = ref_str in topic_map
            if not found_in_json and not found_as_topic:
                errors.append({
                    "quelle": f"{ref['src']}:{line}",
                    "typ": ref["type"],
                    "referenz": ref_str,
                    "fehler": "Weder ID in JSON noch Topic gefunden"
                })

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
