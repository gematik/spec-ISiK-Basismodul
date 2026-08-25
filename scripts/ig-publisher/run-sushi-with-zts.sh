#!/usr/bin/env bash
# Runs SUSHI via gematik's sushi-wrap.sh reference implementation so that
# FHIR packages only available on the BfArM ZTS (e.g. kbv.all.terminology.*)
# are downloaded into the local package cache before SUSHI resolves dependencies.
# See: https://github.com/gematik/zts-api-client-examples/tree/main/sushi-wrap
set -euo pipefail

SUSHI_DIR="${1:?Usage: run-sushi-with-zts.sh <dir-containing-sushi-config.yaml>}"

: "${SUSHI_WRAP_URL:?SUSHI_WRAP_URL must be set (raw URL to sushi-wrap.sh)}"
: "${ACCEPTED_DOWNLOAD_CONDITIONS:?ACCEPTED_DOWNLOAD_CONDITIONS must be set (comma-separated ZTS download conditions)}"

YQ_VERSION="v4.53.6"
# Only used when the caller's SUSHI isn't a global "sushi" binary (e.g. npx fsh-sushi).
SUSHI_COMMAND="${SUSHI_COMMAND:-sushi .}"

# Root inside the IG Publisher container, but plain GitHub-hosted runners need sudo.
as_root() { if [ "$(id -u)" -eq 0 ]; then "$@"; else sudo "$@"; fi; }

# The job's environment ships neither jq, yq (mikefarah/yq) nor uuidgen
# (util-linux), all required by sushi-wrap.sh; install if missing.
if ! command -v jq >/dev/null 2>&1 || ! command -v uuidgen >/dev/null 2>&1; then
  if command -v apt-get >/dev/null 2>&1; then
    as_root apt-get update -qq && as_root apt-get install -y -qq jq uuid-runtime >/dev/null
  elif command -v apk >/dev/null 2>&1; then
    as_root apk add --no-cache jq util-linux >/dev/null
  else
    echo "Cannot install jq/uuidgen: no supported package manager found" >&2
    exit 1
  fi
fi
if ! command -v yq >/dev/null 2>&1; then
  curl -sSL "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" -o /tmp/yq
  chmod +x /tmp/yq
  as_root mv /tmp/yq /usr/local/bin/yq
fi

wrap_script="$(mktemp)"
trap 'rm -f "${wrap_script}"' EXIT
curl -sSL "${SUSHI_WRAP_URL}" -o "${wrap_script}"

# The reference script hardcodes a placeholder condition list as a plain
# assignment, so it must be patched in place rather than passed via env.
sed -i "s|^ACCEPTED_DOWNLOAD_CONDITIONS=.*|ACCEPTED_DOWNLOAD_CONDITIONS=\"${ACCEPTED_DOWNLOAD_CONDITIONS}\"|" "${wrap_script}"
sed -i "s|^sushi \.\$|${SUSHI_COMMAND}|" "${wrap_script}"
chmod +x "${wrap_script}"

# sushi-wrap.sh's FHIR_HOME defaults to ~/.fhir and its "mv" into
# $FHIR_HOME/packages fails silently if that dir doesn't exist yet
# (e.g. on a fresh runner not preloaded with a package cache).
mkdir -p "${HOME}/.fhir/packages"

# sushi-wrap.sh always reads ./sushi-config.yaml and runs SUSHI in the cwd.
cd "${SUSHI_DIR}"
"${wrap_script}"
