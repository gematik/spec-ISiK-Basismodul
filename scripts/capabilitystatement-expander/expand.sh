#!/usr/bin/env bash
# Wrapper for FHIR CapabilityStatement Expander (capability_statement_expander.py)
#
# Usage:
#   expand.sh --input-dir <dir> --output-dir <dir> --urls <json-array-or-url> [OPTIONS]
#   expand.sh --workflow-file <yml> --ig-name <name> [OPTIONS]
#
# Options:
#   --input-dir <path>          Input directory containing FHIR JSON files
#   --output-dir <path>         Output directory for expanded resources
#   --urls <urls>               Canonical URL(s): single URL or JSON array
#                               Examples:
#                                 "https://example.com/CapabilityStatement/Server"
#                                 '["https://example.com/CS1","https://example.com/CS2"]'
#   --workflow-file <path>      GitHub Actions workflow YAML to read IG config from
#   --ig-name <name>            IG name in the workflow matrix (e.g. ISiK-Basis)
#                               When --workflow-file + --ig-name are given, input-dir,
#                               output-dir, urls and expectation-filter are derived
#                               automatically; explicit flags still override those defaults.
#   --expectation-filter <lvl>  Filter imports by expectation: SHALL, SHOULD, or MAY
#                               SHALL=only SHALL; SHOULD=SHALL+SHOULD; MAY=all except SHOULD-NOT
#   --verbose                   Enable verbose/debug logging
#   --no-clean                  Keep existing output directory contents before expansion
#
# Environment variable alternative (for CI):
#   CS_INPUT_DIR, CS_OUTPUT_DIR, CS_URLS, CS_WORKFLOW_FILE, CS_IG_NAME,
#   CS_EXPECTATION_FILTER, CS_VERBOSE, CS_NO_CLEAN

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON_SCRIPT="${SCRIPT_DIR}/capability_statement_expander.py"

# ── Defaults ────────────────────────────────────────────────────────────────
INPUT_DIR="${CS_INPUT_DIR:-}"
OUTPUT_DIR="${CS_OUTPUT_DIR:-}"
URLS="${CS_URLS:-}"
WORKFLOW_FILE="${CS_WORKFLOW_FILE:-}"
IG_NAME="${CS_IG_NAME:-}"
EXPECTATION_FILTER="${CS_EXPECTATION_FILTER:-}"
VERBOSE="${CS_VERBOSE:-false}"
NO_CLEAN="${CS_NO_CLEAN:-false}"

# ── Argument parsing ─────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --input-dir)          INPUT_DIR="$2";          shift 2 ;;
    --output-dir)         OUTPUT_DIR="$2";         shift 2 ;;
    --urls)               URLS="$2";               shift 2 ;;
    --workflow-file)      WORKFLOW_FILE="$2";      shift 2 ;;
    --ig-name)            IG_NAME="$2";            shift 2 ;;
    --expectation-filter) EXPECTATION_FILTER="$2"; shift 2 ;;
    --verbose)            VERBOSE="true";          shift ;;
    --no-clean)           NO_CLEAN="true";         shift ;;
    -h|--help)
      sed -n '/^# Usage/,/^[^#]/{ /^[^#]/d; s/^# \{0,1\}//; p }' "$0"
      exit 0 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

# ── Temp file cleanup ────────────────────────────────────────────────────────
CS_URLS_FILE=""
EXTRACT_SCRIPT=""
cleanup() {
  [[ -n "${CS_URLS_FILE:-}"   ]] && rm -f "$CS_URLS_FILE"
  [[ -n "${EXTRACT_SCRIPT:-}" ]] && rm -f "$EXTRACT_SCRIPT"
  return 0
}
trap cleanup EXIT

# ── Workflow YAML extraction ─────────────────────────────────────────────────
if [[ -n "$WORKFLOW_FILE" && -n "$IG_NAME" ]]; then
  if [[ ! -f "$WORKFLOW_FILE" ]]; then
    echo "Error: workflow file not found: $WORKFLOW_FILE" >&2
    exit 1
  fi

  EXTRACT_SCRIPT=$(mktemp)
  cat > "$EXTRACT_SCRIPT" << 'PYEOF'
import sys, json
try:
    import yaml
except ImportError:
    print("PyYAML is required. Install with: pip install pyyaml", file=sys.stderr)
    sys.exit(2)
wf_file, ig_name = sys.argv[1], sys.argv[2]
try:
    with open(wf_file, encoding='utf-8') as f:
        wf = yaml.safe_load(f)
except OSError as e:
    print(f"Cannot read workflow file: {e}", file=sys.stderr)
    sys.exit(1)
build_job = wf.get('jobs', {}).get('build', {})
job_env   = build_job.get('env', {})
sushi_dir = str(job_env.get('SUSHI_INPUT_DIR', 'Resources'))
entries   = build_job.get('strategy', {}).get('matrix', {}).get('include', [])
entry     = next((e for e in entries if str(e.get('ig_name', '')) == ig_name), None)
if entry is None:
    names = sorted(str(e.get('ig_name', '')) for e in entries if e.get('ig_name'))
    print(f"IG '{ig_name}' not found. Available: {', '.join(names)}", file=sys.stderr)
    sys.exit(1)
urls = entry.get('capability_statement_urls') or []
if not urls:
    print(f"IG '{ig_name}' has no capability_statement_urls defined", file=sys.stderr)
    sys.exit(1)
ig_dir = str(entry.get('ig_dir', ''))
if not ig_dir:
    print(f"IG '{ig_name}' has no ig_dir defined", file=sys.stderr)
    sys.exit(1)
print(json.dumps({
    'input_dir':          f"{sushi_dir}/fsh-generated",
    'output_dir':         f"{ig_dir}/input/resources",
    'urls':               json.dumps(urls),
    'expectation_filter': str(entry.get('import_cps_filter') or ''),
}))
PYEOF

  WF_CONFIG=$(python3 "$EXTRACT_SCRIPT" "$WORKFLOW_FILE" "$IG_NAME") || exit $?

  _jget() { printf '%s' "$WF_CONFIG" | python3 -c "import json,sys; print(json.load(sys.stdin).get('$1',''))"; }
  [[ -z "$INPUT_DIR" ]]          && INPUT_DIR=$(_jget input_dir)
  [[ -z "$OUTPUT_DIR" ]]         && OUTPUT_DIR=$(_jget output_dir)
  [[ -z "$URLS" ]]               && URLS=$(_jget urls)
  [[ -z "$EXPECTATION_FILTER" ]] && EXPECTATION_FILTER=$(_jget expectation_filter)

elif [[ -n "$WORKFLOW_FILE" || -n "$IG_NAME" ]]; then
  echo "Error: --workflow-file and --ig-name must be used together." >&2
  exit 1
fi

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
