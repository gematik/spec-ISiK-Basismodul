# This script works only for Technical correction updates, e.g. augmenting from 4.0.1 to 4.0.2. For Major or Minor updates, the script needs to be adjusted to handle the versioning correctly or it should be done manually.
# TODO This script update the index.html file with the latest data from IG-folder Version added to the IG Folder. Alternatively a Version for the update can be provided as an argument.

import os
import sys
import re
import datetime

# Constants
PROJECT_ROOT = os.path.dirname(os.path.dirname(__file__))
INDEX_FILE_PATH = os.path.join(PROJECT_ROOT, "index.html")
HTML_TEMPLATE = """
    <tr>
    <td>{current_date}</td> 
    <td>
        <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/{version}/ImplementationGuide-markdown-Einfuehrung.html">{version}</a>
    </td>
    <td>Technical Correction {version}</td>
    <td>{version}</td>
    </tr>
"""
VERSION_PATTERN = re.compile(
    r'<tr>\s*<td>\d{2}\.\d{2}\.\d{4}</td>\s*<td>\s*<a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/(\d+\.\d+\.\d+(-\w+)?)/ImplementationGuide-markdown-Einfuehrung.html">\1</a>\s*</td>'
)

def get_current_date_str():
    return datetime.datetime.now().strftime("%Y-%m-%d")

def create_new_row(version, current_date_str):
    return HTML_TEMPLATE.format(current_date=current_date_str, version=version)

def read_index_html():
    with open(INDEX_FILE_PATH, 'r', encoding='utf-8') as file:
        return file.read()

def write_index_html(content):
    with open(INDEX_FILE_PATH, 'w', encoding='utf-8') as file:
        file.write(content)

def validate_version(version, content):
    if version is None:
        print("No Version provided. Please provide a version as an argument, e.g. 4.0.5 or 4.0.0-rc2 (release candidate)")
        sys.exit(1)
    # Check if the version is in the correct format
    semver_pattern = re.compile(r'^\d+\.\d+\.\d+(-\w+)?$')
    if not semver_pattern.match(version):
        print("Invalid version format. Please provide a version in the format X.Y.Z or X.Y.Z-rcN (e.g., 4.0.5 or 4.0.0-rc2).")
        sys.exit(1)
    # Check if the version already exists in the index.html file
    #TODO
    if re.search(r'ImplementationGuide-markdown-Einfuehrung.html">' + re.escape(version), content) is not None:
        print(f"Version {version} already exists in the index.html file.")
        sys.exit(1)
    

def find_insert_position(content, version):
    matches = list(VERSION_PATTERN.finditer(content))
    if not matches:
        print("No previous version found in index.html")
        sys.exit(1)

    for match in matches:
        if match and match.group(1) < version:
            return match.start()

    print("No suitable position found to insert the new version.")
    sys.exit(1)

def update_content(content, new_row, insert_position):
    return content[:insert_position] + new_row + content[insert_position:]

def update_index_html(version=None):
    content = read_index_html()
    validate_version(version, content)
    current_date_str = get_current_date_str()
    new_row = create_new_row(version, current_date_str)
    insert_position = find_insert_position(content, version)
    updated_content = update_content(content, new_row, insert_position)
    write_index_html(updated_content)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        version = sys.argv[1]
    else:
        version = None
    update_index_html(version)