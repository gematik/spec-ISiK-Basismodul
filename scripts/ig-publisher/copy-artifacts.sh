#!/usr/bin/env bash
# Copyright 2026, gematik GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# *******
#
# For additional notes and disclaimer from gematik and in case of changes
# by gematik, find details in the "Readme" file.

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

  if [ -f "${group_dir}/ig-dir.txt" ]; then
    copy_from_artifact "${group_dir}" "${dest_dir}"
    return 0
  fi

  local found=false
  while IFS= read -r ig_dir_file; do
    found=true
    copy_from_artifact "$(dirname "${ig_dir_file}")" "${dest_dir}"
  done < <(find "${group_dir}" -mindepth 2 -maxdepth 2 -name ig-dir.txt)

  if [ "${found}" = false ]; then
    echo "No artifacts found in ${group_dir}"
    return 1
  fi
}

copy_from_artifact_group "${artifacts_dir}/sushi-generated-ig" "fsh-generated"
copy_from_artifact_group "${artifacts_dir}/expanded-resources" "input/resources"
copy_from_artifact_group "${artifacts_dir}/input-includes" "input/includes"
copy_from_artifact_group "${artifacts_dir}/input-pagecontent" "input/pagecontent"
