# This script update the index.html file with the latest data from IG-folder Version added to the IG Folder. Alternatively a Version for the update can be provided as an argument.

import os
import sys
import re
import datetime

#get the current date
current_date = datetime.datetime.now().strftime("%Y-%m-%d")

#define new content as a html table row
def create_new_row(version, current_date):
    return f"""
        <tr>
        <td>{current_date}</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/{version}/ImplementationGuide-markdown-Einfuehrung.html">{version}</a>
        </td>
        <td>Technical Correction {version}</td>
        <td>{version}</td>
        </tr>
    """

# Function to update the index.html file
def update_index_html(version=None):
    project_root = os.path.dirname(os.path.dirname(__file__))
    index_file_path = os.path.join(project_root, "index.html")

    # Determine the version to use
    if version is None:
        print("No Version provided. Please provide a version as an argument, e.g. 4.0.5 or 4.0.0-rc2 (release candidate)")
        sys.exit(1)


    # Read the current index.html content
    with open(index_file_path, 'r', encoding='utf-8') as file:
        content = file.read()

    # Update the content with the new version
    new_row = create_new_row(version, current_date)

    # Find the specific line in the HTML table based on the previous version, for instance for an input like 4.0.4 ist should find the html tbody section with the 4.0.3 version, and add the new row above that.
    # This is done to keep the table sorted in descending order.
    # The regex pattern is used to find the tbody section with the previous version.
    version_pattern = re.compile(r'<td>\d{2}\.\d{2}\.\d{4}</td>\s*<td>\s*<a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/(\d+\.\d+\.\d+(-\w+)?)/ImplementationGuide-markdown-Einfuehrung.html">\1</a>\s*</td>')
    # Find all matches in the content
    matches = list(version_pattern.finditer(content))

    if not matches:
        print("No previous version found in index.html")
        sys.exit(1)

    # Insert the new row above the first match (most recent version)
    first_match = matches[0]
    updated_content = content[:first_match.start()] + new_row + content[first_match.start():]

    # Write the updated content back to index.html
    with open(index_file_path, 'w', encoding='utf-8') as file:
        file.write(updated_content)

    print(f"index.html updated to version {version}")


# Main execution
if __name__ == "__main__":
    if len(sys.argv) > 1:
        update_index_html(sys.argv[1])
    else:
        update_index_html()