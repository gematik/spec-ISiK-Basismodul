#!/usr/bin/env bash
set -euo pipefail

output_dir="${OUTPUT_DIR:-}"
max_file_size_bytes="${MAX_FILE_SIZE_BYTES:-52428800}"

if [ -z "${output_dir}" ]; then
  echo "OUTPUT_DIR is required"
  exit 1
fi

if [ ! -d "${output_dir}" ]; then
  echo "Output directory not found: ${output_dir}"
  exit 1
fi

if ! [[ "${max_file_size_bytes}" =~ ^[0-9]+$ ]] || [ "${max_file_size_bytes}" -le 0 ]; then
  echo "MAX_FILE_SIZE_BYTES must be a positive integer"
  exit 1
fi

file_size_bytes() {
  local file="$1"
  if stat -c '%s' "${file}" >/dev/null 2>&1; then
    stat -c '%s' "${file}"
    return
  fi
  stat -f '%z' "${file}"
}

human_size() {
  local bytes="$1"
  if command -v numfmt >/dev/null 2>&1; then
    numfmt --to=iec-i --suffix=B "${bytes}"
    return
  fi
  printf '%s bytes' "${bytes}"
}

echo "Removing IG output files larger than $(human_size "${max_file_size_bytes}") (${max_file_size_bytes} bytes) from ${output_dir}"

removed_any=false
while IFS= read -r oversized_file; do
  size_bytes="$(file_size_bytes "${oversized_file}")"
  echo "Removing oversized output file: ${oversized_file} ($(human_size "${size_bytes}"), ${size_bytes} bytes)"
  rm -f "${oversized_file}"
  removed_any=true
done < <(find "${output_dir}" -type f -size +"${max_file_size_bytes}"c | sort)

if [ "${removed_any}" = false ]; then
  echo "No IG output files larger than $(human_size "${max_file_size_bytes}") found in ${output_dir}"
fi
