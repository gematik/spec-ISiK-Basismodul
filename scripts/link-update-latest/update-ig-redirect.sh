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

  # ---- Determine target version ----
  if [[ "$VERSION" == "latest" ]]; then
    log_step "Listing versioned folders in ${MODULE_PATH}/ …"
    # List sub-folders, keep only semver-looking ones, sort with version sort, take last
    VERSIONED=$(gsutil ls "${MODULE_PATH}/" 2>/dev/null \
      | sed "s|${MODULE_PATH}/||g" \
      | tr -d '/' \
      | grep -v '^$') || true

    VERSION_FOLDERS=$(echo "$VERSIONED" | while IFS= read -r F; do is_version_folder "$F" && echo "$F" || true; done || true)

    if [[ -z "$VERSION_FOLDERS" ]]; then
      log_warn "${MODULE}: no versioned folder found, skipping."
      continue
    fi

    log_step "Versioned folders found: $(echo "$VERSION_FOLDERS" | tr '\n' ' ')"

    TARGET_VERSION=""
    while IFS= read -r FOLDER; do
      TARGET_VERSION="$FOLDER"
    done < <(echo "$VERSION_FOLDERS" | sort -V)

    log_step "Latest version (semver): ${TARGET_VERSION}"
  else
    TARGET_VERSION="$VERSION"
    log_step "Using explicit version: ${TARGET_VERSION}"
  fi

  # ---- Check for latest/ subfolder ----
  LATEST_PATH="${MODULE_PATH}/latest"
  log_step "Checking for latest/ folder: ${LATEST_PATH}/ …"
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

    # Download
    log_step "Downloading ${FILENAME} …"
    gsutil cp "$GCS_FILE" "$TMP_FILE" -q

    # Capture old version string for logging
    OLD_VERSION=$(grep -oE '\.\./[0-9][^/]*/' "$TMP_FILE" | head -1 | tr -d '../' | tr -d '/' || echo "unknown")

    # Replace version string: matches ../<anything-starting-with-digit>/ in href/url values
    sed -i -E 's|\.\./[0-9][^/]*/|../'"${TARGET_VERSION}"'/|g' "$TMP_FILE"

    log_step "${FILENAME}: ${OLD_VERSION} → ${TARGET_VERSION}"

    # Upload (or echo in dry-run)
    gsutil_write cp "$TMP_FILE" "$GCS_FILE"

    FILE_COUNT=$((FILE_COUNT + 1))
    TOTAL_FILES=$((TOTAL_FILES + 1))
  done <<< "$HTML_LIST"

  log_ok "${MODULE}: updated ${FILE_COUNT} file(s) to version ${TARGET_VERSION}"

done <<< "$MODULE_LIST"

echo ""
log_info "─────────────────────────────────────────────────"
log_info "Done. Processed ${TOTAL_MODULES} module(s), updated ${TOTAL_FILES} file(s) total."
