#!/bin/bash
# Script to copy files specified in config.json to the respective IG directories

set -euo pipefail

CONFIG_FILE="scripts/common-files/config.json"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Config file $CONFIG_FILE not found - skipping"
  exit 0
fi

echo "Processing config.json entries for IG: $IG_NAME"

# Parse JSON and copy files
jq -c '.[]' "$CONFIG_FILE" | while read -r item; do
  src=$(echo "$item" | jq -r '.file')
  target=$(echo "$item" | jq -r '.target')
  
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
