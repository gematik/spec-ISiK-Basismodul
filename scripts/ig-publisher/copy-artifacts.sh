#!/usr/bin/env bash
set -euo pipefail

artifacts_dir="${ARTIFACTS_DIR:-artifacts}"

echo "Artifacts directory: ${artifacts_dir}"
if [ -d "${artifacts_dir}" ]; then
  ls -la "${artifacts_dir}" || true
  echo "Artifacts subdirectories:"
  find "${artifacts_dir}" -maxdepth 2 -type d -print | head -40 || true
else
  echo "Artifacts directory does not exist."
fi

for dir in "${artifacts_dir}"/sushi-generated-ig-*/; do
  [ -d "$dir" ] || continue
  base=$(basename "$dir")
  ig_name=$(echo "$base" | sed 's/sushi-generated-ig-//')
  echo "Processing SUSHI-generated artifact $base for IG: $ig_name"

  ig_path=""
  if [ -f "$dir/ig-dir.txt" ]; then
    ig_path=$(cat "$dir/ig-dir.txt")
    rm -f "$dir/ig-dir.txt"
  fi
  if [ -z "$ig_path" ]; then
    ig_path=$(find publisher-guides -maxdepth 1 -type d -name "*$ig_name*" -print -quit)
  fi
  if [ -n "$ig_path" ]; then
    target_dir="$ig_path/fsh-generated"
    echo "Copying SUSHI-generated files to ${target_dir}/"
    mkdir -p "${target_dir}"
    rm -rf "${target_dir:?}/*" || true
    cp -r "$dir"* "${target_dir}/" || true
  else
    echo "Warning: No matching directory found for $ig_name (SUSHI artifact)"
  fi
done

for dir in "${artifacts_dir}"/expanded-resources-*/; do
  [ -d "$dir" ] || continue
  base=$(basename "$dir")
  ig_name=$(echo "$base" | sed 's/expanded-resources-//')
  echo "Processing expanded-resources artifact $base for IG: $ig_name"

  ig_path=""
  if [ -f "$dir/ig-dir.txt" ]; then
    ig_path=$(cat "$dir/ig-dir.txt")
    rm -f "$dir/ig-dir.txt"
  fi
  if [ -z "$ig_path" ]; then
    ig_path=$(find publisher-guides -maxdepth 1 -type d -name "*$ig_name*" -print -quit)
  fi
  if [ -n "$ig_path" ]; then
    echo "Copying expanded resources to $ig_path/input/resources/"
    mkdir -p "$ig_path/input/resources"
    rm -rf "$ig_path/input/resources/"* || true
    cp -r "$dir"* "$ig_path/input/resources/" || true
  else
    echo "Warning: No matching directory found for $ig_name (expanded resources)"
  fi
done

for dir in "${artifacts_dir}"/input-includes-*/; do
  [ -d "$dir" ] || continue
  base=$(basename "$dir")
  ig_name=$(echo "$base" | sed 's/input-includes-//')
  echo "Processing input-includes artifact $base for IG: $ig_name"

  ig_path=""
  if [ -f "$dir/ig-dir.txt" ]; then
    ig_path=$(cat "$dir/ig-dir.txt")
    rm -f "$dir/ig-dir.txt"
  fi
  if [ -z "$ig_path" ]; then
    ig_path=$(find publisher-guides -maxdepth 1 -type d -name "*$ig_name*" -print -quit)
  fi
  if [ -n "$ig_path" ]; then
    echo "Copying input includes to $ig_path/input/includes/"
    mkdir -p "$ig_path/input/includes"
    rm -rf "$ig_path/input/includes/"* || true
    cp -r "$dir"* "$ig_path/input/includes/" || true
  else
    echo "Warning: No matching directory found for $ig_name (input includes)"
  fi
done

for dir in "${artifacts_dir}"/input-pagecontent-*/; do
  [ -d "$dir" ] || continue
  base=$(basename "$dir")
  ig_name=$(echo "$base" | sed 's/input-pagecontent-//')
  echo "Processing input-pagecontent artifact $base for IG: $ig_name"

  ig_path=""
  if [ -f "$dir/ig-dir.txt" ]; then
    ig_path=$(cat "$dir/ig-dir.txt")
    rm -f "$dir/ig-dir.txt"
  fi
  if [ -z "$ig_path" ]; then
    ig_path=$(find publisher-guides -maxdepth 1 -type d -name "*$ig_name*" -print -quit)
  fi
  if [ -n "$ig_path" ]; then
    echo "Copying input pagecontent to $ig_path/input/pagecontent/"
    mkdir -p "$ig_path/input/pagecontent"
    rm -rf "$ig_path/input/pagecontent/"* || true
    cp -r "$dir"* "$ig_path/input/pagecontent/" || true
  else
    echo "Warning: No matching directory found for $ig_name (input pagecontent)"
  fi
done
