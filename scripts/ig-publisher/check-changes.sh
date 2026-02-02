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

echo "Checking for changes in:"
echo "  - ${FSH_GEN_PATH}"
echo "  - ${INPUT_PATH}"
echo ""

has_changes=false

if [ "${GITHUB_EVENT_NAME}" = "pull_request" ]; then
  base_ref="origin/${GITHUB_BASE_REF}"
  diff_out=$(git diff --name-only "${base_ref}...HEAD" -- "${FSH_GEN_PATH}" "${INPUT_PATH}" 2>/dev/null || echo "")

  if [ -n "$diff_out" ]; then
    has_changes=true
    echo "Changes detected in ${FSH_GEN_PATH} or ${INPUT_PATH} (PR diff against ${base_ref}):"
    echo "$diff_out" | head -20
    echo ""
  fi
elif [ "${GITHUB_EVENT_NAME}" = "push" ]; then
  before_sha=$(
    python - <<'PY'
import json
import os

event_path = os.environ.get("GITHUB_EVENT_PATH", "")
if not event_path:
    print("")
else:
    with open(event_path, "r", encoding="utf-8") as handle:
        event = json.load(handle)
    print(event.get("before", "") or "")
PY
  )
  if [ -z "${before_sha}" ] || [ "${before_sha}" = "0000000000000000000000000000000000000000" ]; then
    before_sha=$(git rev-parse HEAD^ 2>/dev/null || echo "")
  fi
  diff_out=$(git diff --name-only "${before_sha}" "${GITHUB_SHA}" -- "${FSH_GEN_PATH}" "${INPUT_PATH}" 2>/dev/null || echo "")

  if [ -n "$diff_out" ]; then
    has_changes=true
    echo "Changes detected in ${FSH_GEN_PATH} or ${INPUT_PATH} (push diff ${before_sha}..${GITHUB_SHA}):"
    echo "$diff_out" | head -20
    echo ""
  fi
else
  for check_path in "${FSH_GEN_PATH}" "${INPUT_PATH}"; do
    if [ -d "$check_path" ]; then
      status_out=$(git status --porcelain "$check_path" 2>/dev/null || echo "")

      if [ -n "$status_out" ]; then
        has_changes=true
        echo "Changes detected in ${check_path}:"
        echo "$status_out" | head -20
        echo ""
      fi
    fi
  done
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
