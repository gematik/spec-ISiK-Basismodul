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
echo "Current working directory: $(pwd)"
echo ""

# Debug: Show raw content
echo "DEBUG: Raw config.json content:"
cat "$CONFIG_FILE"
echo ""

# Create temp file for processed JSON
temp_file="/tmp/config_processed_$$.txt"
sed 's/[[:space:]]\+/ /g' "$CONFIG_FILE" | tr -d '\n' | sed 's/}, /}\n/g' > "$temp_file"

echo "DEBUG: Processed items from $temp_file:"
cat "$temp_file"
echo ""

# Process line by line without subshell
while IFS= read -r item; do
  # Skip empty lines and array markers
  [ -z "$item" ] && continue
  [[ "$item" == *\[* ]] && continue
  [[ "$item" == *\]* ]] && continue
  
  echo "DEBUG: Processing item: $item"
  
  # Extract "file" value
  src=$(echo "$item" | sed -n 's/.*"file"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
  
  # Extract "target" value
  target=$(echo "$item" | sed -n 's/.*"target"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
  
  echo "DEBUG: Extracted src='$src' target='$target'"
  
  if [ -z "$src" ] || [ -z "$target" ]; then
    echo "DEBUG: Skipping - src or target is empty"
    continue
  fi
  
  echo "Processing: src=$src target=$target"
  
  if [ ! -f "$src" ]; then
    echo "Error: Source file '$src' not found (pwd: $(pwd))"
    continue
  fi
  
  # Get filename from source
  filename=$(basename "$src")
  
  # Resolve target directory relative to IG_PUBLISHER_DIR
  target_dir="${IG_PUBLISHER_DIR}/${target}"
  target_path="${target_dir}/${filename}"
  
  echo "Creating directory: $target_dir"
  mkdir -p "$target_dir" || {
    echo "Error: Failed to create directory $target_dir"
    continue
  }
  
  echo "Copying $src to $target_path"
  cp "$src" "$target_path" || {
    echo "Error: Failed to copy $src to $target_path"
    continue
  }
  echo "Successfully copied $filename to $target_dir"
  
done < "$temp_file"

# Cleanup
rm -f "$temp_file"

echo "Config files processed successfully"
