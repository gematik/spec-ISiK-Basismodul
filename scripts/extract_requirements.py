# Copyright 2026, gematik GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# *******
#
# For additional notes and disclaimer from gematik and in case of changes
# by gematik, find details in the "Readme" file.


import os
import re

def find_requirements(directory, root_directory):
    requirements = []
    pattern = re.compile(r'\b(ANF-CON-\d{3})\b')
    
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".md") and file != "Anforderungsuebersicht.md":  # Exclude specific file
                filepath = os.path.join(root, file)
                relative_path = os.path.relpath(filepath, root_directory).replace("\\", "/")
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                matches = pattern.findall(content)
                for match in set(matches):  # Ensure unique matches per file
                    requirements.append((match, relative_path))
    
    return requirements

def generate_markdown_table(requirements):
    table = "| ID | Anforderung |\n|----|-------------|\n"
    for req_id, filepath in requirements:
        table += f"| {req_id} | {{{{pagelink:ImplementationGuide/{filepath}}}}} |\n"
    return table

if __name__ == "__main__":
    root_directory = "./ImplementationGuide"  # Define the root directory
    directory = os.path.join(root_directory, "markdown")  # Search within markdown subdirectory
    requirements = find_requirements(directory, root_directory)
    markdown_table = generate_markdown_table(requirements)
    
    output_file = "requirements_table.md"
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(markdown_table)
    
    print(f"Markdown table saved to {output_file}")
