#!/usr/bin/env bash
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

set -euo pipefail

git config --global --add safe.directory "$(pwd)" || true
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

echo "=== git status --porcelain ==="
git status --porcelain || true
echo "=== git diff --name-only ==="
git diff --name-only || true

echo "=== Files before staging ==="
echo "fsh-generated directories:"
find publisher-guides -type d -name "fsh-generated" -exec ls -la {} \; 2>/dev/null || echo "No fsh-generated directories"
echo ""
echo "input/resources directories:"
find publisher-guides -type d -path "*/input/resources" -exec ls -la {} \; 2>/dev/null | head -20 || echo "No input/resources directories"
echo ""

echo "=== Staging publisher-guides/*/fsh-generated/resources ==="
git add publisher-guides/*/fsh-generated/resources || true

echo "=== Staging publisher-guides/*/fsh-generated/includes/menu.xml ==="
git add publisher-guides/*/fsh-generated/includes/menu.xml || true

echo "=== Staging publisher-guides/*/sushi-config.yaml ==="
git add publisher-guides/*/sushi-config.yaml || true

echo "=== Staging publisher-guides/*/input ==="
git add publisher-guides/*/input || true

echo "=== Staged changes ==="
git diff --name-only --cached || true

if git diff --cached --quiet; then
  echo "No changes to commit"
  exit 0
fi

echo "=== Committing changes ==="
branch_name="${GITHUB_HEAD_REF:-${GITHUB_REF_NAME}}"
git commit -m "chore: update SUSHI-generated artifacts [ig-publisher]"
git push origin "HEAD:${branch_name}"
echo "=== Commit and push completed ==="
