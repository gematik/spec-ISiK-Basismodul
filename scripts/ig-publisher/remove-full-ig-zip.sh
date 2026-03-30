#!/usr/bin/env bash
set -euo pipefail

output_dir="${OUTPUT_DIR:-}"

if [ -z "${output_dir}" ]; then
  echo "OUTPUT_DIR is required"
  exit 1
fi

if [ ! -d "${output_dir}" ]; then
  echo "Output directory not found: ${output_dir}"
  exit 1
fi

removed_any=false
while IFS= read -r zip_file; do
  echo "Removing oversized artifact: ${zip_file}"
  rm -f "${zip_file}"
  removed_any=true
done < <(find "${output_dir}" -type f -name "full-ig.zip")

if [ "${removed_any}" = false ]; then
  echo "No full-ig.zip found in ${output_dir}"
fi
