#!/usr/bin/env bash
set -euo pipefail

# Fix git ownership issues in container
git config --global --add safe.directory /__w/spec-ISiK-Basismodul/spec-ISiK-Basismodul || true
git config --global --add safe.directory "$(pwd)" || true

force_build="${FORCE_BUILD:-}"
if [ "${force_build}" = "true" ]; then
  echo "has_changes=true" >> "${GITHUB_OUTPUT}"
  echo "Force build enabled - proceeding with IG build regardless of changes"
  exit 0
fi

FSH_GEN_PATH="${IG_PUBLISHER_DIR}/fsh-generated"
INPUT_PATH="${IG_PUBLISHER_DIR}/input"
FSH_GEN_RESOURCES_PATH="${FSH_GEN_PATH}/resources"
FSH_GEN_MENU_PATH="${FSH_GEN_PATH}/includes/menu.xml"

echo "Checking for changes in:"
echo "  - ${FSH_GEN_RESOURCES_PATH}"
echo "  - ${FSH_GEN_MENU_PATH}"
echo "  - ${INPUT_PATH}"
echo ""

has_changes=false

status_out=""
if [ -d "${FSH_GEN_RESOURCES_PATH}" ]; then
  status_out="${status_out}"$'\n'"$(git status --porcelain "${FSH_GEN_RESOURCES_PATH}" 2>/dev/null || echo "")"
fi
if [ -f "${FSH_GEN_MENU_PATH}" ]; then
  status_out="${status_out}"$'\n'"$(git status --porcelain "${FSH_GEN_MENU_PATH}" 2>/dev/null || echo "")"
fi
if [ -d "${INPUT_PATH}" ]; then
  status_out="${status_out}"$'\n'"$(git status --porcelain "${INPUT_PATH}" 2>/dev/null || echo "")"
fi

status_out=$(echo "${status_out}" | sed '/^[[:space:]]*$/d')

if [ -n "$status_out" ]; then
  has_changes=true
  echo "Changes detected in checked paths:"
  echo "$status_out" | head -20
  echo ""
fi

if [ "$has_changes" = true ]; then
  echo "has_changes=true" >> "${GITHUB_OUTPUT}"
  exit 0
fi

echo "has_changes=false" >> "${GITHUB_OUTPUT}"
echo "No changes detected - skipping IG build"

mkdir -p "${GITHUB_WORKSPACE}/.ig-urls-temp"

if [ "${GITHUB_EVENT_NAME}" = "pull_request" ]; then
  branch_name="${GITHUB_HEAD_REF:-${GITHUB_REF_NAME}}"
  ig_name="${IG_NAME}"
  repo_owner="${GITHUB_REPOSITORY_OWNER}"
  repo_name="${GITHUB_REPOSITORY#*/}"
  potential_url="https://${repo_owner}.github.io/${repo_name}/${branch_name}/${ig_name}/"

  if curl --output /dev/null --silent --head --fail "${potential_url}index.html"; then
    echo "Found existing published IG at ${potential_url}"
    echo "${ig_name}|${potential_url}" >> "${GITHUB_WORKSPACE}/.ig-urls-temp/urls.txt"
  else
    echo "No previous publication found - marking as NO_CHANGES"
    echo "${ig_name}|NO_CHANGES" >> "${GITHUB_WORKSPACE}/.ig-urls-temp/urls.txt"
  fi
else
  echo "${IG_NAME}|NO_CHANGES" >> "${GITHUB_WORKSPACE}/.ig-urls-temp/urls.txt"
fi
