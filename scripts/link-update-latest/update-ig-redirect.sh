#!/usr/bin/env bash
# update-ig-redirect.sh
# Updates HTML redirect files in GCS latest/ subfolders for all ISiK IG modules
# to point to the latest semver-versioned folder.
#
# Usage: ./update-ig-redirect.sh [--version <VERSION>] [--realm <dev|qs|prod>] [--dry-run]
#
# Prerequisites: gcloud auth login, gsutil (Google Cloud SDK), bash (Linux/macOS/WSL)

set -euo pipefail

# ---------------------------------------------------------------------------
# Defaults
# ---------------------------------------------------------------------------
VERSION="latest"
REALM="dev"
DRY_RUN=false

# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --version)
      VERSION="$2"; shift 2 ;;
    --realm)
      REALM="$2"; shift 2 ;;
    --dry-run)
      DRY_RUN=true; shift ;;
    -h|--help)
      echo "Usage: $0 [--version <VERSION|latest>] [--realm <dev|qs|prod>] [--dry-run]"
      exit 0 ;;
    *)
      echo "[ERROR] Unknown argument: $1" >&2
      echo "Usage: $0 [--version <VERSION|latest>] [--realm <dev|qs|prod>] [--dry-run]" >&2
      exit 1 ;;
  esac
done

# ---------------------------------------------------------------------------
# Realm → bucket mapping
# ---------------------------------------------------------------------------
case "$REALM" in
  dev)  BUCKET="gematik_gemspec_fhir_dev-0" ;;
  qs)   BUCKET="gematik_gemspec_fhir_qs-0" ;;
  prod) BUCKET="gematik_gemspec_fhir_prod-0" ;;
  *)
    echo "[ERROR] Unknown realm '$REALM'. Must be one of: dev, qs, prod." >&2
    exit 1 ;;
esac

BASE_PATH="gs://${BUCKET}/ig/fhir/isik"

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
log_info()  { echo "[INFO]  $*"; }
log_warn()  { echo "[WARN]  $*" >&2; }
log_ok()    { echo "[OK]    $*"; }
log_step()  { echo "        → $*"; }

# Wraps a gsutil write command: executes it or echoes it when --dry-run.
gsutil_write() {
  if $DRY_RUN; then
    echo "[DRY-RUN] gsutil $*"
  else
    gsutil "$@"
  fi
}

# Semver-like filter: folder names starting with a digit (e.g. 6.0.0, 6.0.0-rc1)
is_version_folder() {
  [[ "$1" =~ ^[0-9]+\.[0-9]+ ]]
}

# Given a newline-separated list of semver-like strings on stdin, prints the highest one.
# Implements proper semver pre-release ordering:
#   - Compare base versions (X.Y.Z) first using sort -V
#   - Among candidates sharing the highest base, prefer the pure release (no suffix)
#   - Fall back to the highest pre-release if no pure release exists for that base
# Examples: 5.2.1 + 6.0.0-rc1 → 6.0.0-rc1  |  6.0.0-rc1 + 6.0.0 → 6.0.0
pick_latest_version() {
  local versions
  versions=$(cat)

  # Strip pre-release suffix to get the base version for each entry
  local highest_base
  highest_base=$(echo "$versions" | sed 's/-[^[:space:]]*//' | sort -V | tail -1)

  # Collect all versions whose base equals the highest base
  local candidates
  candidates=$(echo "$versions" | grep -E "^${highest_base}(-|$)")

  # If a pure release (exact base, no suffix) exists, use it
  if echo "$candidates" | grep -qx "${highest_base}"; then
    echo "${highest_base}"
  else
    # Otherwise pick the highest pre-release for this base
    echo "$candidates" | sort -V | tail -1
  fi
}


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
if $DRY_RUN; then
  log_info "Dry-run mode enabled – no files will be written to GCS."
fi
log_info "Realm:  $REALM  →  bucket: $BUCKET"
log_info "Base path: $BASE_PATH/"

# Discover module folders (e.g. basis/, dokumentenaustausch/, …)
log_info "Discovering ISiK modules under ${BASE_PATH}/ …"
MODULE_LIST=$(gsutil ls "${BASE_PATH}/" 2>/dev/null \
  | sed "s|${BASE_PATH}/||g" \
  | tr -d '/' \
  | grep -v '^$') || true

if [[ -z "$MODULE_LIST" ]]; then
  log_warn "No module folders found under ${BASE_PATH}/. Nothing to do."
  exit 0
fi

MODULE_COUNT=$(echo "$MODULE_LIST" | grep -c .)
log_ok "Found ${MODULE_COUNT} module folder(s): $(echo "$MODULE_LIST" | tr '\n' ' ')"

# ---------------------------------------------------------------------------
# Determine target version ONCE using 'basis' as the reference module.
# All ISiK modules are versioned in lock-step, so one lookup is sufficient.
# ---------------------------------------------------------------------------
REF_MODULE="basis"
if [[ "$VERSION" == "latest" ]]; then
  log_info "Detecting latest version from reference module: ${REF_MODULE} …"
  REF_PATH="${BASE_PATH}/${REF_MODULE}"
  VERSIONED=$(gsutil ls "${REF_PATH}/" 2>/dev/null \
    | sed "s|${REF_PATH}/||g" \
    | tr -d '/' \
    | grep -v '^$') || true

  VERSION_FOLDERS=$(echo "$VERSIONED" | while IFS= read -r F; do is_version_folder "$F" && echo "$F" || true; done || true)

  if [[ -z "$VERSION_FOLDERS" ]]; then
    log_warn "No versioned folders found in ${REF_MODULE}. Cannot determine latest version." >&2
    exit 1
  fi

  log_step "Versioned folders in ${REF_MODULE}: $(echo "$VERSION_FOLDERS" | tr '\n' ' ')"
  TARGET_VERSION=$(echo "$VERSION_FOLDERS" | pick_latest_version)
  log_ok "Latest version detected: ${TARGET_VERSION}"
else
  TARGET_VERSION="$VERSION"
  log_ok "Using explicit version: ${TARGET_VERSION}"
fi

TMPDIR_WORK=$(mktemp -d)
trap 'rm -rf "$TMPDIR_WORK"' EXIT

TOTAL_MODULES=0
TOTAL_FILES=0

while IFS= read -r MODULE; do
  [[ -z "$MODULE" ]] && continue

  MODULE_PATH="${BASE_PATH}/${MODULE}"
  TOTAL_MODULES=$((TOTAL_MODULES + 1))
  echo ""
  log_info "── Processing module: ${MODULE} ──"

  # ---- Check for latest/ subfolder ----
  LATEST_PATH="${MODULE_PATH}/latest"
  HTML_LIST=$(gsutil ls "${LATEST_PATH}/*.html" 2>/dev/null) || true

  if [[ -z "$HTML_LIST" ]]; then
    log_info "${MODULE}: no latest/ folder (or no HTML files found), skipping."
    continue
  fi

  HTML_COUNT=$(echo "$HTML_LIST" | grep -c .)
  log_step "Found ${HTML_COUNT} HTML file(s) in latest/: $(echo "$HTML_LIST" | xargs -I{} basename {} | tr '\n' ' ')"

  # ---- Update each HTML file ----
  FILE_COUNT=0
  while IFS= read -r GCS_FILE; do
    [[ -z "$GCS_FILE" ]] && continue

    FILENAME=$(basename "$GCS_FILE")
    TMP_FILE="${TMPDIR_WORK}/${MODULE}_${FILENAME}"

    if $DRY_RUN; then
      # In dry-run: skip download, just show what would change
      log_step "${FILENAME}: <current-version> → ${TARGET_VERSION}  [skipped download]"
      echo "[DRY-RUN] gsutil cp ${GCS_FILE} ${GCS_FILE}  (with version → ${TARGET_VERSION})"
    else
      # Download
      log_step "Downloading ${FILENAME} …"
      gsutil -q cp "$GCS_FILE" "$TMP_FILE"

      # Capture old version string for logging
      OLD_VERSION=$(grep -oE '\.\./[0-9][^/]*/' "$TMP_FILE" | head -1 | sed 's|^\.\./||; s|/$||' || echo "unknown")

      # Replace version string: matches ../<anything-starting-with-digit>/ in href/url values
      sed -i -E 's|\.\./[0-9][^/]*/|../'"${TARGET_VERSION}"'/|g' "$TMP_FILE"

      log_step "${FILENAME}: ${OLD_VERSION} → ${TARGET_VERSION}"

      # Upload
      gsutil -q cp "$TMP_FILE" "$GCS_FILE"
    fi

    FILE_COUNT=$((FILE_COUNT + 1))
    TOTAL_FILES=$((TOTAL_FILES + 1))
  done <<< "$HTML_LIST"

  log_ok "${MODULE}: updated ${FILE_COUNT} file(s) to version ${TARGET_VERSION}"

done <<< "$MODULE_LIST"

echo ""
log_info "─────────────────────────────────────────────────"
log_info "Done. Processed ${TOTAL_MODULES} module(s), updated ${TOTAL_FILES} file(s) total."
