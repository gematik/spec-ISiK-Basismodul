#!/usr/bin/env bash
# Pipeline step for `fhirscripts build pipeline` (runs from the IG directory, after SUSHI).
# Creates the flattened "<id>-expanded" CapabilityStatement(s) from the IG-local
# fsh-generated/resources and puts only those into input/resources. All other
# resources already come from the IG-local SUSHI run.
#
# Usage: expand-capabilitystatements.sh <canonical-url> [<canonical-url> ...]
#   EXPECTATION_FILTER=SHALL|SHOULD|MAY may be set to filter imports.

set -euo pipefail

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <canonical-url> [<canonical-url> ...]" >&2
  exit 1
fi

IG_DIR_ABS="$(pwd)"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

# expand.sh calls python3; on Windows that name often is only the Store alias.
if ! python3 --version >/dev/null 2>&1; then
  PYTHON_BIN="$(command -v python || true)"
  if [ -z "${PYTHON_BIN}" ] || ! "${PYTHON_BIN}" --version >/dev/null 2>&1; then
    PYTHON_BIN="$(uv python find)"
  fi
  mkdir -p "${TMP_DIR}/bin"
  printf '#!/usr/bin/env bash\nexec "%s" "$@"\n' "${PYTHON_BIN}" > "${TMP_DIR}/bin/python3"
  chmod +x "${TMP_DIR}/bin/python3"
  export PATH="${TMP_DIR}/bin:${PATH}"
fi

URLS_JSON="$(printf '"%s",' "$@")"
URLS_JSON="[${URLS_JSON%,}]"

bash "${REPO_ROOT}/scripts/capabilitystatement-expander/expand.sh" \
  --input-dir "${IG_DIR_ABS}/fsh-generated/resources" \
  --output-dir "${TMP_DIR}/expanded" \
  --urls "${URLS_JSON}" \
  ${EXPECTATION_FILTER:+--expectation-filter "${EXPECTATION_FILTER}"}

mkdir -p "${IG_DIR_ABS}/input/resources"
find "${IG_DIR_ABS}/input/resources" -maxdepth 1 -name 'CapabilityStatement-*-expanded.json' -delete
copied=0
for f in "${TMP_DIR}"/expanded/CapabilityStatement-*-expanded.json; do
  [ -e "$f" ] || continue
  cp "$f" "${IG_DIR_ABS}/input/resources/"
  echo "Copied $(basename "$f")"
  copied=$((copied + 1))
done

if [ "${copied}" -eq 0 ]; then
  echo "No expanded CapabilityStatement produced" >&2
  exit 1
fi
