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

tracked_diff_out=""
tracked_history_out=""
workspace_status_out=""

if [ -n "${diff_range}" ]; then
  echo "Comparing commit range: ${diff_range}"
  if tracked_diff_out="$(git diff --name-status "${diff_range}" -- "${FSH_GEN_RESOURCES_PATH}" "${FSH_GEN_MENU_PATH}" "${INPUT_PATH}" 2>/dev/null)"; then
    :
  else
    echo "Warning: could not diff commit range ${diff_range}"
    tracked_diff_out=""
  fi

  # Detect files that were touched by commits in the range, even if later reverted.
  if tracked_history_out="$(git log --name-status --pretty=format: "${diff_range}" -- "${FSH_GEN_RESOURCES_PATH}" "${FSH_GEN_MENU_PATH}" "${INPUT_PATH}" 2>/dev/null)"; then
    :
  else
    echo "Warning: could not inspect commit history for range ${diff_range}"
    tracked_history_out=""
  fi
else
  echo "No commit range available for tracked checks."
fi

# Always check workspace changes too (tracked + untracked) in checked paths.
workspace_status_out="$(git status --porcelain --untracked-files=all -- "${FSH_GEN_RESOURCES_PATH}" "${FSH_GEN_MENU_PATH}" "${INPUT_PATH}" 2>/dev/null || true)"

tracked_diff_out=$(echo "${tracked_diff_out}" | sed '/^[[:space:]]*$/d')
tracked_history_out=$(echo "${tracked_history_out}" | sed '/^[[:space:]]*$/d' | awk '!seen[$0]++')
workspace_status_out=$(echo "${workspace_status_out}" | sed '/^[[:space:]]*$/d')

if [ -n "${tracked_diff_out}" ]; then
  has_changes=true
  echo "Detected net tracked changes (git diff):"
  echo "${tracked_diff_out}" | head -20
  echo ""
fi

if [ -n "${tracked_history_out}" ]; then
  has_changes=true
  echo "Detected tracked files touched in commits (git log):"
  echo "${tracked_history_out}" | head -20
  echo ""
fi

if [ -n "${workspace_status_out}" ]; then
  has_changes=true
  echo "Detected workspace changes (git status, including untracked):"
  echo "${workspace_status_out}" | head -20
  echo ""
fi

if [ "$has_changes" = true ]; then
  echo "has_changes=true" >> "${GITHUB_OUTPUT}"
  exit 0
fi

echo "has_changes=false" >> "${GITHUB_OUTPUT}"
echo "No changes detected - skipping IG build"
