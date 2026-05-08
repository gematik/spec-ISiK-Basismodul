#!/usr/bin/env bash
# Wrapper for FHIR CapabilityStatement Expander (capability_statement_expander.py)
#
# Usage:
#   expand.sh --input-dir <dir> --output-dir <dir> --urls <json-array-or-url> [OPTIONS]
#
# Options:
#   --input-dir <path>          Input directory containing FHIR JSON files (required)
#   --output-dir <path>         Output directory for expanded resources (required)
#   --urls <urls>               Canonical URL(s) to expand: single URL or JSON array (required)
#                               Examples:
#                                 "https://example.com/CapabilityStatement/Server"
#                                 '["https://example.com/CS1","https://example.com/CS2"]'
#   --expectation-filter <lvl>  Filter imports by expectation: SHALL, SHOULD, or MAY
#                               SHALL=only SHALL; SHOULD=SHALL+SHOULD; MAY=all except SHOULD-NOT
#   --verbose                   Enable verbose/debug logging
#   --no-clean                  Keep existing output directory contents before expansion
#
# Environment variable alternative (for CI):
#   CS_INPUT_DIR, CS_OUTPUT_DIR, CS_URLS, CS_EXPECTATION_FILTER, CS_VERBOSE, CS_NO_CLEAN

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON_SCRIPT="${SCRIPT_DIR}/capability_statement_expander.py"

# ── Defaults ────────────────────────────────────────────────────────────────
INPUT_DIR="${CS_INPUT_DIR:-}"
OUTPUT_DIR="${CS_OUTPUT_DIR:-}"
URLS="${CS_URLS:-}"
EXPECTATION_FILTER="${CS_EXPECTATION_FILTER:-}"
VERBOSE="${CS_VERBOSE:-false}"
NO_CLEAN="${CS_NO_CLEAN:-false}"

# ── Argument parsing ─────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --input-dir)        INPUT_DIR="$2";          shift 2 ;;
    --output-dir)       OUTPUT_DIR="$2";         shift 2 ;;
    --urls)             URLS="$2";               shift 2 ;;
    --expectation-filter) EXPECTATION_FILTER="$2"; shift 2 ;;
    --verbose)          VERBOSE="true";          shift ;;
    --no-clean)         NO_CLEAN="true";         shift ;;
    -h|--help)
      sed -n '/^# Usage/,/^[^#]/{ /^[^#]/d; s/^# \{0,1\}//; p }' "$0"
      exit 0 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

# ── Validation ───────────────────────────────────────────────────────────────
missing=()
[[ -z "$INPUT_DIR"  ]] && missing+=(--input-dir)
[[ -z "$OUTPUT_DIR" ]] && missing+=(--output-dir)
[[ -z "$URLS"       ]] && missing+=(--urls)

if [[ ${#missing[@]} -gt 0 ]]; then
  echo "Error: missing required argument(s): ${missing[*]}" >&2
  echo "Run with --help for usage." >&2
  exit 1
fi

if [[ ! -d "$INPUT_DIR" ]]; then
  echo "Error: input directory not found: $INPUT_DIR" >&2
  exit 1
fi

if [[ ! -f "$PYTHON_SCRIPT" ]]; then
  echo "Error: expander script not found: $PYTHON_SCRIPT" >&2
  exit 1
fi

# ── Build Python args ────────────────────────────────────────────────────────
mkdir -p "$OUTPUT_DIR"

# Write URLs to a temp file to avoid "Argument list too long"
CS_URLS_FILE=$(mktemp)
trap 'rm -f "$CS_URLS_FILE"' EXIT
printf '%s' "$URLS" > "$CS_URLS_FILE"

PYTHON_ARGS=("$INPUT_DIR" "$OUTPUT_DIR" "@${CS_URLS_FILE}")

[[ "$VERBOSE" == "true" || "${ACTIONS_STEP_DEBUG:-}" == "true" ]] && PYTHON_ARGS+=(--verbose)
[[ "$NO_CLEAN" == "true" ]] && PYTHON_ARGS+=(--no-clean)
[[ -n "$EXPECTATION_FILTER" ]] && PYTHON_ARGS+=(--expectation-filter "$EXPECTATION_FILTER")

# ── Run ──────────────────────────────────────────────────────────────────────
echo "Running FHIR CapabilityStatement Expander..."
echo "  Input:  $INPUT_DIR"
echo "  Output: $OUTPUT_DIR"
[[ -n "$EXPECTATION_FILTER" ]] && echo "  Filter: $EXPECTATION_FILTER"

python3 "$PYTHON_SCRIPT" "${PYTHON_ARGS[@]}"
