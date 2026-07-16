#!/usr/bin/env bash
set -euo pipefail

shared_config="${1:-Resources/sushi-config.yaml}"
shift || true

if [ ! -f "${shared_config}" ]; then
  echo "Shared sushi config not found: ${shared_config}" >&2
  exit 1
fi

if [ "$#" -gt 0 ]; then
  target_files=("$@")
else
  mapfile -t target_files < <(find publisher-guides -mindepth 2 -maxdepth 2 -name "sushi-config.yaml" | sort)
fi

if [ "${#target_files[@]}" -eq 0 ]; then
  echo "No target sushi-config.yaml files found." >&2
  exit 1
fi

deps_block="$(awk '
  BEGIN { in_block = 0 }
  /^dependencies:[[:space:]]*$/ { in_block = 1 }
  in_block {
    if ($0 !~ /^dependencies:[[:space:]]*$/ && $0 ~ /^[^[:space:]#][^:]*:/) {
      exit
    }
    print
  }
' "${shared_config}")"

if [ -z "${deps_block}" ]; then
  echo "No dependencies block found in ${shared_config}" >&2
  exit 1
fi

deps_file="$(mktemp)"
printf '%s\n' "${deps_block}" > "${deps_file}"
trap 'rm -f "${deps_file}"' EXIT

sync_target() {
  local target_file="$1"

  if [ ! -f "${target_file}" ]; then
    echo "Target sushi config not found: ${target_file}" >&2
    exit 1
  fi

  local tmp_file
  tmp_file="$(mktemp)"

  if ! awk -v deps_file="${deps_file}" '
    BEGIN {
      deps_count = 0
      while ((getline line < deps_file) > 0) {
        deps_lines[++deps_count] = line
      }
      close(deps_file)
      in_block = 0
      replaced = 0
    }
    /^dependencies:[[:space:]]*$/ && !replaced {
      for (i = 1; i <= deps_count; i++) {
        print deps_lines[i]
      }
      print ""
      in_block = 1
      replaced = 1
      next
    }
    in_block {
      if ($0 ~ /^[^[:space:]#][^:]*:/) {
        in_block = 0
        print
      }
      next
    }
    { print }
    END {
      if (!replaced) {
        exit 2
      }
    }
  ' "${target_file}" > "${tmp_file}"; then
    rm -f "${tmp_file}"
    echo "Failed to replace dependencies in ${target_file}" >&2
    exit 1
  fi

  if cmp -s "${target_file}" "${tmp_file}"; then
    rm -f "${tmp_file}"
    echo "Dependencies already in sync: ${target_file}"
    return 0
  fi

  mv "${tmp_file}" "${target_file}"
  echo "Updated dependencies: ${target_file}"
}

for target_file in "${target_files[@]}"; do
  sync_target "${target_file}"
done
