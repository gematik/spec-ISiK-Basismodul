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
diff_range=""

if [ -n "${DIFF_BASE_SHA:-}" ] && [ -n "${DIFF_HEAD_SHA:-}" ]; then
  diff_range="${DIFF_BASE_SHA}...${DIFF_HEAD_SHA}"
elif [ -n "${DIFF_BASE_SHA:-}" ]; then
  diff_range="${DIFF_BASE_SHA}...HEAD"
elif [ "${GITHUB_EVENT_NAME:-}" = "pull_request" ] && [ -n "${GITHUB_BASE_REF:-}" ]; then
  # Fallback for PRs when explicit SHAs are not provided.
  diff_range="origin/${GITHUB_BASE_REF}...HEAD"
elif git rev-parse --verify HEAD^ >/dev/null 2>&1; then
  # Fallback for pushes/manual runs with at least two commits checked out.
  diff_range="HEAD^...HEAD"
fi

status_out=""
workspace_status_out=""

if [ -n "${diff_range}" ]; then
  echo "Comparing commit range: ${diff_range}"
  status_out="$(git diff --name-status "${diff_range}" -- "${FSH_GEN_RESOURCES_PATH}" "${FSH_GEN_MENU_PATH}" "${INPUT_PATH}" 2>/dev/null || true)"
else
  echo "No commit range available for tracked diff."
fi

# Always check workspace changes too (tracked + untracked) in checked paths.
if [ -d "${FSH_GEN_RESOURCES_PATH}" ]; then
  workspace_status_out="${workspace_status_out}"$'\n'"$(git status --porcelain --untracked-files=all "${FSH_GEN_RESOURCES_PATH}" 2>/dev/null || echo "")"
fi
if [ -f "${FSH_GEN_MENU_PATH}" ]; then
  workspace_status_out="${workspace_status_out}"$'\n'"$(git status --porcelain --untracked-files=all "${FSH_GEN_MENU_PATH}" 2>/dev/null || echo "")"
fi
if [ -d "${INPUT_PATH}" ]; then
  workspace_status_out="${workspace_status_out}"$'\n'"$(git status --porcelain --untracked-files=all "${INPUT_PATH}" 2>/dev/null || echo "")"
fi

status_out="${status_out}"$'\n'"${workspace_status_out}"
status_out=$(echo "${status_out}" | sed '/^[[:space:]]*$/d' | awk '!seen[$0]++')

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
