#!/usr/bin/env bash
# Script to copy files specified in config.json to the respective IG directories

set -u

CONFIG_FILE="scripts/common-files/config.json"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Config file $CONFIG_FILE not found - skipping"
  exit 0
fi

echo "Processing config.json entries for IG: $IG_NAME"
echo "IG_PUBLISHER_DIR: $IG_PUBLISHER_DIR"

# Remove whitespace and newlines, then split by closing braces
sed 's/[[:space:]]\+/ /g' "$CONFIG_FILE" | tr -d '\n' | sed 's/}, /}\n/g' | while read -r item; do
  # Skip empty lines and array markers
  [ -z "$item" ] && continue
  [[ "$item" == *\[* ]] && continue
  [[ "$item" == *\]* ]] && continue
  
  # Extract "file" value
  src=$(echo "$item" | sed -n 's/.*"file"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
  
  # Extract "target" value
  target=$(echo "$item" | sed -n 's/.*"target"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
  
  if [ -z "$src" ] || [ -z "$target" ]; then
    continue
  fi
  
  echo "Processing: src=$src target=$target"
  
  # Resolve paths relative to IG_PUBLISHER_DIR
  target_path="${IG_PUBLISHER_DIR}/${target}"
  
  if [ -f "$src" ]; then
    echo "Copying $src to $target_path"
    mkdir -p "$(dirname "$target_path")" || echo "Failed to create directory"
    cp "$src" "$target_path" || echo "Failed to copy file"
  else
    echo "Warning: Source file $src not found"
  fi
done

echo "Config files processed successfully"
