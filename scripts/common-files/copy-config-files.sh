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

# Debug: Show raw content
echo "DEBUG: Raw config.json content:"
cat "$CONFIG_FILE"
echo ""

# Remove whitespace and newlines, then split by closing braces
echo "DEBUG: Processing JSON..."
processed=$(sed 's/[[:space:]]\+/ /g' "$CONFIG_FILE" | tr -d '\n' | sed 's/}, /}\n/g')
echo "DEBUG: Processed items:"
echo "$processed"
echo ""

item_count=0
echo "$processed" | while read -r item; do
  # Skip empty lines and array markers
  [ -z "$item" ] && continue
  [[ "$item" == *\[* ]] && continue
  [[ "$item" == *\]* ]] && continue
  
  item_count=$((item_count + 1))
  echo "DEBUG: Item $item_count: $item"
  
  # Extract "file" value
  src=$(echo "$item" | sed -n 's/.*"file"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
  
  # Extract "target" value
  target=$(echo "$item" | sed -n 's/.*"target"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
  
  echo "DEBUG: src='$src' target='$target'"
  
  if [ -z "$src" ] || [ -z "$target" ]; then
    echo "DEBUG: Skipping - src or target is empty"
    continue
  fi
  
  echo "Processing: src=$src target=$target"
  
  if [ ! -f "$src" ]; then
    echo "Error: Source file $src not found"
    continue
  fi
  
  # Get filename from source
  filename=$(basename "$src")
  
  # Resolve target directory relative to IG_PUBLISHER_DIR
  target_dir="${IG_PUBLISHER_DIR}/${target}"
  target_path="${target_dir}/${filename}"
  
  echo "Copying $src to $target_path"
  mkdir -p "$target_dir" || {
    echo "Error: Failed to create directory $target_dir"
    continue
  }
  cp "$src" "$target_path" || {
    echo "Error: Failed to copy $src to $target_path"
    continue
  }
  echo "Successfully copied $filename to $target_dir"
done

echo "Config files processed successfully"
