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
range_source=""
show_all_changes="${SHOW_ALL_CHANGES:-false}"

head_sha="${DIFF_HEAD_SHA:-HEAD}"
if ! git rev-parse --verify "${head_sha}^{commit}" >/dev/null 2>&1; then
  echo "Warning: DIFF_HEAD_SHA is not available locally (${head_sha}). Falling back to HEAD."
  head_sha="HEAD"
fi

if [ -n "${LAST_SUCCESS_SHA:-}" ]; then
  if git rev-parse --verify "${LAST_SUCCESS_SHA}^{commit}" >/dev/null 2>&1 && \
    git merge-base --is-ancestor "${LAST_SUCCESS_SHA}" "${head_sha}" >/dev/null 2>&1; then
    diff_range="${LAST_SUCCESS_SHA}...${head_sha}"
    range_source="last successful run"
  else
    echo "Warning: LAST_SUCCESS_SHA is not usable (${LAST_SUCCESS_SHA}); falling back to last commit."
  fi
fi

if [ -z "${diff_range}" ] && git rev-parse --verify "${head_sha}^" >/dev/null 2>&1; then
  diff_range="${head_sha}^...${head_sha}"
  range_source="last commit"
fi

tracked_diff_out=""
tracked_history_out=""
workspace_status_out=""

if [ -n "${diff_range}" ]; then
  echo "Comparing commit range (${range_source}): ${diff_range}"
  if ! git rev-list -1 "${diff_range}" >/dev/null 2>&1; then
    echo "Warning: invalid commit range (${diff_range}). Forcing build to avoid missing changes."
    echo "has_changes=true" >> "${GITHUB_OUTPUT}"
    exit 0
  fi
  echo "Commits in range: $(git rev-list --count "${diff_range}" 2>/dev/null || echo unknown)"

  if tracked_diff_out="$(git diff --name-status "${diff_range}" -- "${FSH_GEN_RESOURCES_PATH}" "${FSH_GEN_MENU_PATH}" "${INPUT_PATH}" 2>/dev/null)"; then
    :
  else
    echo "Warning: could not diff commit range ${diff_range}"
    tracked_diff_out=""
  fi

  # Detect files that were touched by commits in the range, even if later reverted.
  if tracked_history_out="$(git log --full-history --name-status --pretty=format: "${diff_range}" -- "${FSH_GEN_RESOURCES_PATH}" "${FSH_GEN_MENU_PATH}" "${INPUT_PATH}" 2>/dev/null)"; then
    :
  else
    echo "Warning: could not inspect commit history for range ${diff_range}"
    tracked_history_out=""
  fi
else
  echo "No commit range available for tracked checks. Forcing build to avoid missing changes."
  echo "has_changes=true" >> "${GITHUB_OUTPUT}"
  exit 0
fi

# Always check workspace changes too (tracked + untracked) in checked paths.
workspace_status_out="$(git status --porcelain --untracked-files=all -- "${FSH_GEN_RESOURCES_PATH}" "${FSH_GEN_MENU_PATH}" "${INPUT_PATH}" 2>/dev/null || true)"

tracked_diff_out=$(echo "${tracked_diff_out}" | sed '/^[[:space:]]*$/d')
tracked_history_out=$(echo "${tracked_history_out}" | sed '/^[[:space:]]*$/d' | awk '!seen[$0]++')
workspace_status_out=$(echo "${workspace_status_out}" | sed '/^[[:space:]]*$/d')

print_changes_block() {
  local heading="$1"
  local content="$2"
  local max_lines=20

  if [ -z "${content}" ]; then
    return
  fi

  local total_lines
  total_lines=$(printf '%s\n' "${content}" | wc -l | awk '{print $1}')

  echo "${heading}"
  if [ "${show_all_changes}" = "true" ] || [ "${total_lines}" -le "${max_lines}" ]; then
    printf '%s\n' "${content}"
  else
    sed -n "1,${max_lines}p" <<< "${content}"
    echo "... (${total_lines} total lines, showing first ${max_lines}; set SHOW_ALL_CHANGES=true for full output)"
  fi
  echo ""
}

if [ -n "${tracked_diff_out}" ]; then
  has_changes=true
  print_changes_block "Detected net tracked changes (git diff):" "${tracked_diff_out}"
fi

if [ -n "${tracked_history_out}" ]; then
  has_changes=true
  print_changes_block "Detected tracked files touched in commits (git log):" "${tracked_history_out}"
fi

if [ -n "${workspace_status_out}" ]; then
  has_changes=true
  print_changes_block "Detected workspace changes (git status, including untracked):" "${workspace_status_out}"
fi

if [ "$has_changes" = true ]; then
  echo "has_changes=true" >> "${GITHUB_OUTPUT}"
  exit 0
fi

echo "has_changes=false" >> "${GITHUB_OUTPUT}"
echo "No changes detected - skipping IG build"
