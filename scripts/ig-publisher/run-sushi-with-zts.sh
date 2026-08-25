#!/usr/bin/env bash
# Runs SUSHI via gematik's sushi-wrap.sh reference implementation so that
# FHIR packages only available on the BfArM ZTS (e.g. kbv.all.terminology.*)
# are downloaded into the local package cache before SUSHI resolves dependencies.
# See: https://github.com/gematik/zts-api-client-examples/tree/main/sushi-wrap
set -euo pipefail

SUSHI_DIR="${1:?Usage: run-sushi-with-zts.sh <dir-containing-sushi-config.yaml>}"

: "${SUSHI_WRAP_URL:?SUSHI_WRAP_URL must be set (raw URL to sushi-wrap.sh)}"
: "${ACCEPTED_DOWNLOAD_CONDITIONS:?ACCEPTED_DOWNLOAD_CONDITIONS must be set (comma-separated ZTS download conditions)}"

wrap_script="$(mktemp)"
trap 'rm -f "${wrap_script}"' EXIT
curl -sSL "${SUSHI_WRAP_URL}" -o "${wrap_script}"

# The reference script hardcodes a placeholder condition list as a plain
# assignment, so it must be patched in place rather than passed via env.
sed -i "s|^ACCEPTED_DOWNLOAD_CONDITIONS=.*|ACCEPTED_DOWNLOAD_CONDITIONS=\"${ACCEPTED_DOWNLOAD_CONDITIONS}\"|" "${wrap_script}"
chmod +x "${wrap_script}"

# sushi-wrap.sh always reads ./sushi-config.yaml and runs "sushi ." in the cwd.
cd "${SUSHI_DIR}"
"${wrap_script}"
