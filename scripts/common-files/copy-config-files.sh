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

# Simple JSON parsing using awk
awk '
BEGIN { 
  in_obj = 0
  file = ""
  target = ""
}
/{/ { in_obj = 1 }
in_obj && /"file"/ { 
  match($0, /"file"[[:space:]]*:[[:space:]]*"([^"]*)"/, arr)
  file = arr[1]
}
in_obj && /"target"/ {
  match($0, /"target"[[:space:]]*:[[:space:]]*"([^"]*)"/, arr)
  target = arr[1]
}
/}/ && in_obj {
  if (file != "" && target != "") {
    print file "|" target
  }
  in_obj = 0
  file = ""
  target = ""
}
' "$CONFIG_FILE" | while IFS='|' read -r src target; do
  if [ -z "$src" ] || [ -z "$target" ]; then
    echo "Warning: Empty src or target"
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
