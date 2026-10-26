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

dry_run="${CLEANUP_DRY_RUN:-0}"

if [ -z "$(git ls-files)" ]; then
  echo "gh-pages branch is empty. Nothing to clean."
  exit 0
fi

git remote set-url origin "https://x-access-token:${GITHUB_TOKEN}@github.com/${REPO}.git"

shopt -s globstar nullglob
removed=0
declare -A branch_dirs
declare -A branch_marker_dir

echo "=== Scanning for branch directories with .branch-name markers ==="
echo "Expected structure: {branch_name}/{ig_name}/.branch-name"

for metadata in **/.branch-name; do
  if [ ! -f "$metadata" ]; then
    continue
  fi
  branch=$(cat "$metadata" | tr -d '\r')
  dir=$(dirname "$metadata")
  dir_no_prefix=${dir#./}

  # Use full branch name from marker to support branch names with slashes
  # Structure is: branch_name/ig_name/.branch-name
  branch_dir="$branch"

  if [ -z "$branch" ]; then
    echo "⚠️  Skipping $dir because branch marker is empty."
    continue
  fi

  # Skip protected directories (IG/ is the production directory)
  if [ -z "$dir_no_prefix" ] || [ "$dir_no_prefix" = "." ] || [ "$dir_no_prefix" = "IG" ] || [[ "$dir_no_prefix" == IG/* ]]; then
    echo "🔒 Preserving $dir (protected directory)"
    continue
  fi

  branch_dirs["$branch_dir"]=1
  if [ -z "${branch_marker_dir[$branch_dir]+x}" ]; then
    branch_marker_dir["$branch_dir"]="$dir_no_prefix"
  fi
done

for branch_dir in "${!branch_dirs[@]}"; do
  marker_dir="${branch_marker_dir[$branch_dir]}"

  echo "📂 Found branch directory: '$branch_dir/' (from marker in $marker_dir)"
  echo "   Branch name from marker: '$branch_dir'"

  # Check if the branch still exists remotely
  if git ls-remote --heads origin "$branch_dir" | grep -q "."; then
    echo "   ✅ Branch '$branch_dir' still exists -> keeping directory '$branch_dir/'"
    continue
  fi

  # Branch deleted -> remove entire branch directory (all IGs under this branch)
  echo "   🗑️  Branch '$branch_dir' deleted -> removing entire directory '$branch_dir/' (all IGs)"
  if [ "$dry_run" = "1" ]; then
    echo "   (dry-run) Would remove '$branch_dir/'"
    removed=1
  else
    rm -rf "$branch_dir"
    removed=1
  fi
done

if [ "$removed" -eq 0 ]; then
  echo ""
  echo "✨ No stale branch directories found. gh-pages is clean."
  exit 0
fi

echo ""
echo "🧹 Cleaning up empty directories..."
if [ "$dry_run" = "1" ]; then
  find . -mindepth 1 -type d -empty ! -path './IG' ! -path './IG/*'
  echo "(dry-run) Would delete empty directories listed above."
else
  find . -mindepth 1 -type d -empty ! -path './IG' ! -path './IG/*' -delete
fi

if [ "$dry_run" = "1" ]; then
  echo ""
  echo "ℹ️  Dry-run enabled. Skipping git commit and push."
  exit 0
fi

git add --all
if git diff --cached --quiet; then
  echo ""
  echo "ℹ️  No changes to commit after cleanup."
  exit 0
fi

echo ""
echo "💾 Committing cleanup changes..."
git commit -m "chore: remove gh-pages directories for deleted branches"
git push origin gh-pages

echo ""
echo "✅ Cleanup completed successfully!"
