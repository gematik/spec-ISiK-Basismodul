#!/usr/bin/env bash
# Script to copy files specified in config.json to the respective IG directories

set -euo pipefail

CONFIG_FILE="scripts/common-files/config.json"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Config file $CONFIG_FILE not found - skipping"
  exit 0
fi

echo "Processing config.json entries for IG: $IG_NAME"

# Parse JSON without jq using sed/grep
# Extract each object from the JSON array
grep -o '{[^}]*}' "$CONFIG_FILE" | while read -r item; do
  # Extract "file" value
  src=$(echo "$item" | grep -o '"file"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"\([^"]*\)".*/\1/')
  
  # Extract "target" value
  target=$(echo "$item" | grep -o '"target"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"\([^"]*\)".*/\1/')
  
  if [ -z "$src" ] || [ -z "$target" ]; then
    echo "Warning: Could not parse entry: $item"
    continue
  fi
  
  # Resolve paths relative to IG_PUBLISHER_DIR
  target_path="${IG_PUBLISHER_DIR}/${target}"
  
  if [ -f "$src" ]; then
    echo "Copying $src to $target_path"
    mkdir -p "$(dirname "$target_path")"
    cp "$src" "$target_path"
  else
    echo "Warning: Source file $src not found"
  fi
done

echo "Config files processed successfully"
