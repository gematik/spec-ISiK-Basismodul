#!/usr/bin/env bash
# Pipeline step for `fhirscripts build pipeline` (runs from the IG directory).
# Copies the shared files from scripts/common-files/config.json into the IG,
# using the existing repo-root based script.

set -euo pipefail

# copy-config-files.sh uses `grep -P`, which needs a UTF-8 locale (Git Bash defaults to none).
export LC_ALL=C.UTF-8

IG_DIR_ABS="$(pwd)"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

export IG_PUBLISHER_DIR="${IG_DIR_ABS#"${REPO_ROOT}/"}"
export IG_NAME="${IG_NAME:-$(basename "${IG_DIR_ABS}")}"

cd "${REPO_ROOT}"
bash scripts/common-files/copy-config-files.sh
