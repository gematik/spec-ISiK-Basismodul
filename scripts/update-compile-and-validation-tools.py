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

### This script updates the main.yml file with the latest versions of firely-terminal and sushi and can be used locally
import requests
import os

def get_latest_version(repo):
    url = f"https://api.github.com/repos/{repo}/releases/latest"
    response = requests.get(url)
    response.raise_for_status()
    return response.json()["tag_name"]

if __name__ == "__main__":
    firely_terminal_version = get_latest_version("FirelyTeam/firely-terminal-pipeline")
    sushi_version = get_latest_version("FHIR/sushi")

    script_dir = os.path.dirname(__file__)
    main_yml_path = os.path.abspath(os.path.join(script_dir, "../.github/workflows/main.yml"))
    
    with open(main_yml_path, "r") as file:
        lines = file.readlines()

    with open(main_yml_path, "w") as file:
        for line in lines:
            if line.strip().startswith("uses: FirelyTeam/firely-terminal-pipeline@"):
                file.write(f"        uses: FirelyTeam/firely-terminal-pipeline@{firely_terminal_version}\n")
            elif line.strip().startswith("SUSHI_VERSION:"):
                file.write(f"        SUSHI_VERSION: {sushi_version}\n")
            else:
                file.write(line)

    print(f"Updated main.yml with firely-terminal=={firely_terminal_version} and sushi=={sushi_version}")