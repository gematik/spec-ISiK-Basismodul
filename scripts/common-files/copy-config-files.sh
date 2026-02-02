#!/usr/bin/env bash
# Script to copy files specified in config.json to the respective IG directories

set -euo pipefail

CONFIG_FILE="scripts/common-files/config.json"

echo "=== Copy Config Files Script ==="
echo "IG: $IG_NAME"
echo "IG Directory: $IG_PUBLISHER_DIR"
echo "Working Directory: $(pwd)"
echo ""

if [ ! -f "$CONFIG_FILE" ]; then
  echo "ERROR: Config file $CONFIG_FILE not found"
  exit 1
fi

echo "Reading config from: $CONFIG_FILE"
echo ""

# Extract all "file" values into an array
mapfile -t files < <(grep -oP '"file"\s*:\s*"\K[^"]+' "$CONFIG_FILE")

# Extract all "target" values into an array
mapfile -t targets < <(grep -oP '"target"\s*:\s*"\K[^"]+' "$CONFIG_FILE")

# Check if we found any entries
if [ ${#files[@]} -eq 0 ]; then
  echo "ERROR: No file entries found in $CONFIG_FILE"
  exit 1
fi

if [ ${#files[@]} -ne ${#targets[@]} ]; then
  echo "ERROR: Mismatch between number of files (${#files[@]}) and targets (${#targets[@]})"
  exit 1
fi

echo "Found ${#files[@]} file(s) to copy"
echo ""

# Process each file/target pair
success_count=0
for i in "${!files[@]}"; do
  src="${files[$i]}"
  target_dir_rel="${targets[$i]}"
  
  echo "[$((i+1))/${#files[@]}] Processing: $src -> $target_dir_rel"
  
  # Check if source file exists
  if [ ! -f "$src" ]; then
    echo "  ERROR: Source file not found: $src"
    echo "  Absolute path would be: $(pwd)/$src"
    exit 1
  fi
  
  # Get filename
  filename=$(basename "$src")
  
  # Construct target path
  target_dir="${IG_PUBLISHER_DIR}/${target_dir_rel}"
  target_path="${target_dir}/${filename}"
  
  echo "  Source: $src"
  echo "  Target: $target_path"
  
  # Create target directory
  if ! mkdir -p "$target_dir"; then
    echo "  ERROR: Failed to create directory: $target_dir"
    exit 1
  fi
  
  # Copy file
  if ! cp "$src" "$target_path"; then
    echo "  ERROR: Failed to copy file"
    exit 1
  fi
  
  # Verify copy
  if [ ! -f "$target_path" ]; then
    echo "  ERROR: File was not copied successfully"
    exit 1
  fi
  
  echo "  SUCCESS: Copied $filename"
  success_count=$((success_count + 1))
  echo ""
done

echo "=== Summary ==="
echo "Successfully copied $success_count file(s)"
echo "==============="
