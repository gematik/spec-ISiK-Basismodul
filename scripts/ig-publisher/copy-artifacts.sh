#!/usr/bin/env bash
set -euo pipefail

artifacts_dir="${ARTIFACTS_DIR:-artifacts}"

echo "Artifacts directory: ${artifacts_dir}"
if [ ! -d "${artifacts_dir}" ]; then
  echo "Artifacts directory does not exist."
  exit 1
fi

copy_from_artifact() {
  local source_dir="$1"
  local dest_dir="$2"

  if [ ! -d "${source_dir}" ]; then
    echo "Missing artifact directory: ${source_dir}"
    return 1
  fi

  local ig_dir_file="${source_dir}/ig-dir.txt"
  if [ ! -f "${ig_dir_file}" ]; then
    echo "Missing ig-dir.txt in ${source_dir}"
    return 1
  fi

  local ig_path
  ig_path=$(cat "${ig_dir_file}")

  if [ -z "${ig_path}" ]; then
    echo "Empty ig-dir.txt in ${source_dir}"
    return 1
  fi

  rm -f "${ig_dir_file}" || true

  echo "Copying ${source_dir} to ${ig_path}/${dest_dir}/"
  mkdir -p "${ig_path}/${dest_dir}"
  rm -rf "${ig_path:?}/${dest_dir}/"* || true
  cp -r "${source_dir}/"* "${ig_path}/${dest_dir}/" || true
}

copy_from_artifact_group() {
  local group_dir="$1"
  local dest_dir="$2"

  if [ ! -d "${group_dir}" ]; then
    echo "Missing artifact group directory: ${group_dir}"
    return 1
  fi

  local found=false
  for dir in "${group_dir}"/*; do
    [ -d "${dir}" ] || continue
    found=true
    copy_from_artifact "${dir}" "${dest_dir}"
  done

  if [ "${found}" = false ]; then
    echo "No artifacts found in ${group_dir}"
    return 1
  fi
}

copy_from_artifact_group "${artifacts_dir}/sushi-generated-ig" "fsh-generated"
copy_from_artifact_group "${artifacts_dir}/expanded-resources" "input/resources"
copy_from_artifact_group "${artifacts_dir}/input-includes" "input/includes"
copy_from_artifact_group "${artifacts_dir}/input-pagecontent" "input/pagecontent"
