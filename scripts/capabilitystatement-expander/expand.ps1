#Requires -Version 5.1
<#
.SYNOPSIS
    Wrapper for FHIR CapabilityStatement Expander (capability_statement_expander.py)

.DESCRIPTION
    Expands FHIR CapabilityStatements by resolving all imports and collecting
    all referenced profiles, examples, and terminology resources.

    Can derive all settings automatically from a GitHub Actions workflow YAML
    when -WorkflowFile and -IGName are provided together.

.PARAMETER InputDir
    Input directory containing FHIR JSON files.
    Alternatively set via environment variable CS_INPUT_DIR.
    Derived automatically when -WorkflowFile and -IGName are used.

.PARAMETER OutputDir
    Output directory for expanded resources.
    Alternatively set via environment variable CS_OUTPUT_DIR.
    Derived automatically when -WorkflowFile and -IGName are used.

.PARAMETER Urls
    Canonical URL(s) to expand: single URL or JSON array.
    Alternatively set via environment variable CS_URLS.
    Derived automatically when -WorkflowFile and -IGName are used.
    Examples:
      "https://example.com/CapabilityStatement/Server"
      '["https://example.com/CS1","https://example.com/CS2"]'

.PARAMETER WorkflowFile
    Path to a GitHub Actions workflow YAML that contains the IG matrix.
    Must be combined with -IGName. input-dir, output-dir, urls and
    expectation-filter are then derived automatically; explicit flags
    still override those defaults.
    Alternatively set via environment variable CS_WORKFLOW_FILE.

.PARAMETER IGName
    Name of the IG as defined in the workflow matrix (e.g. ISiK-Basis).
    Must be combined with -WorkflowFile.
    Alternatively set via environment variable CS_IG_NAME.

.PARAMETER ExpectationFilter
    Filter imports by expectation: SHALL, SHOULD, or MAY.
    SHALL=only SHALL; SHOULD=SHALL+SHOULD; MAY=all except SHOULD-NOT.
    Alternatively set via environment variable CS_EXPECTATION_FILTER.

.PARAMETER NoClean
    Keep existing output directory contents before expansion.
    Alternatively set CS_NO_CLEAN=true.

.EXAMPLE
    .\expand.ps1 -InputDir .\fhir-resources -OutputDir .\output `
        -Urls "https://example.org/CapabilityStatement/MyCS"

.EXAMPLE
    .\expand.ps1 `
        -WorkflowFile .\.github\workflows\ig-publisher.yml `
        -IGName ISiK-Basis

.EXAMPLE
    .\expand.ps1 `
        -WorkflowFile .\.github\workflows\ig-publisher.yml `
        -IGName ISiK-Formular `
        -Verbose

.NOTES
    Requires Python 3 with PyYAML (pip install pyyaml) when -WorkflowFile is used.
    Environment variable alternatives: CS_INPUT_DIR, CS_OUTPUT_DIR, CS_URLS,
    CS_WORKFLOW_FILE, CS_IG_NAME, CS_EXPECTATION_FILTER, CS_VERBOSE, CS_NO_CLEAN.
#>

[CmdletBinding()]
param(
    [string] $InputDir,
    [string] $OutputDir,
    [string] $Urls,
    [string] $WorkflowFile,
    [string] $IGName,
    [string] $ExpectationFilter,
    [switch] $NoClean
)

$ErrorActionPreference = 'Stop'

$ScriptDir    = $PSScriptRoot
$PythonScript = Join-Path $ScriptDir 'capability_statement_expander.py'
$IsWindowsHost = ($env:OS -eq 'Windows_NT')

# ── Defaults from environment variables ──────────────────────────────────────
if (-not $InputDir)          { $InputDir          = $env:CS_INPUT_DIR }
if (-not $OutputDir)         { $OutputDir         = $env:CS_OUTPUT_DIR }
if (-not $Urls)              { $Urls              = $env:CS_URLS }
if (-not $WorkflowFile)      { $WorkflowFile      = $env:CS_WORKFLOW_FILE }
if (-not $IGName)            { $IGName            = $env:CS_IG_NAME }
if (-not $ExpectationFilter) { $ExpectationFilter = $env:CS_EXPECTATION_FILTER }
if (-not $NoClean -and $env:CS_NO_CLEAN -eq 'true') { $NoClean = $true }

# -Verbose sets $VerbosePreference to 'Continue'; also honour env vars for CI
$isVerbose = ($VerbosePreference -ne [System.Management.Automation.ActionPreference]::SilentlyContinue) `
          -or ($env:CS_VERBOSE -eq 'true') `
          -or ($env:ACTIONS_STEP_DEBUG -eq 'true')

# ── Detect Python executable ─────────────────────────────────────────────────
function Get-WorkingPythonLauncher {
    param(
        [bool] $IsWindowsHost
    )

    $candidates = @()

    if ($IsWindowsHost) {
        $candidates += [pscustomobject]@{ Exe = 'py';      Prefix = @('-3') }
    }

    $candidates += [pscustomobject]@{ Exe = 'python3'; Prefix = @() }
    $candidates += [pscustomobject]@{ Exe = 'python';  Prefix = @() }

    if (-not $IsWindowsHost) {
        $candidates += [pscustomobject]@{ Exe = 'py'; Prefix = @('-3') }
    }

    foreach ($candidate in $candidates) {
        if (-not (Get-Command $candidate.Exe -ErrorAction SilentlyContinue)) {
            continue
        }

        $probeArgs = @()
        $probeArgs += $candidate.Prefix
        $probeArgs += '--version'

        try {
            & $candidate.Exe @probeArgs *> $null
        } catch {
            continue
        }

        if ($LASTEXITCODE -eq 0) {
            return $candidate
        }
    }

    return $null
}

$pythonLauncher = Get-WorkingPythonLauncher -IsWindowsHost:$IsWindowsHost

if (-not $pythonLauncher) {
    Write-Host 'Error: Python 3 not found. Install Python 3 or use the py launcher and ensure it is available on PATH.' -ForegroundColor Red
    exit 1
}

$pythonExe = $pythonLauncher.Exe
$pythonArgsPrefix = $pythonLauncher.Prefix

# ── Temp file tracking ───────────────────────────────────────────────────────
$extractTempFile = $null
$urlsTempFile    = $null

try {
    # ── Workflow YAML extraction ──────────────────────────────────────────────
    if ($WorkflowFile -and $IGName) {
        if (-not (Test-Path -LiteralPath $WorkflowFile -PathType Leaf)) {
            Write-Host "Error: workflow file not found: $WorkflowFile" -ForegroundColor Red
            exit 1
        }

        # Embedded Python extraction script (single-quoted: no PS variable expansion)
        $extractPyCode = @'
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
'@

        $extractTempFile = [System.IO.Path]::GetTempFileName()
        [System.IO.File]::WriteAllText($extractTempFile, $extractPyCode, [System.Text.UTF8Encoding]::new($false))

        $wfJson = & $pythonExe @pythonArgsPrefix $extractTempFile $WorkflowFile $IGName
        if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

        $wfConfig = $wfJson | ConvertFrom-Json

        # Apply extracted values only where not already explicitly set
        if (-not $InputDir)          { $InputDir          = $wfConfig.input_dir }
        if (-not $OutputDir)         { $OutputDir         = $wfConfig.output_dir }
        if (-not $Urls)              { $Urls              = $wfConfig.urls }
        if (-not $ExpectationFilter) { $ExpectationFilter = $wfConfig.expectation_filter }

    } elseif ($WorkflowFile -or $IGName) {
        Write-Host 'Error: -WorkflowFile and -IGName must be used together.' -ForegroundColor Red
        exit 1
    }

    # ── Validation ────────────────────────────────────────────────────────────
    $missing = @()
    if (-not $InputDir)  { $missing += '-InputDir' }
    if (-not $OutputDir) { $missing += '-OutputDir' }
    if (-not $Urls)      { $missing += '-Urls' }

    if ($missing.Count -gt 0) {
        Write-Host "Error: missing required parameter(s): $($missing -join ', ')" -ForegroundColor Red
        Write-Host "Run 'Get-Help $($MyInvocation.MyCommand.Path)' for usage." -ForegroundColor Red
        exit 1
    }

    if (-not (Test-Path -LiteralPath $InputDir -PathType Container)) {
        Write-Host "Error: input directory not found: $InputDir" -ForegroundColor Red
        exit 1
    }

    if (-not (Test-Path -LiteralPath $PythonScript -PathType Leaf)) {
        Write-Host "Error: expander script not found: $PythonScript" -ForegroundColor Red
        exit 1
    }

    # ── Build Python args ─────────────────────────────────────────────────────
    $null = New-Item -ItemType Directory -Path $OutputDir -Force

    # Write URLs to a temp file to avoid command-line length limits
    $urlsTempFile = [System.IO.Path]::GetTempFileName()
    [System.IO.File]::WriteAllText($urlsTempFile, $Urls, [System.Text.UTF8Encoding]::new($false))

    $pythonArgs = [System.Collections.Generic.List[string]]::new()
    $pythonArgs.AddRange([string[]]@($InputDir, $OutputDir, "@$urlsTempFile"))

    if ($isVerbose)         { $pythonArgs.Add('--verbose') }
    if ($NoClean)           { $pythonArgs.Add('--no-clean') }
    if ($ExpectationFilter) { $pythonArgs.AddRange([string[]]@('--expectation-filter', $ExpectationFilter)) }

    # ── Run ───────────────────────────────────────────────────────────────────
    Write-Host 'Running FHIR CapabilityStatement Expander...'
    Write-Host "  Input:  $InputDir"
    Write-Host "  Output: $OutputDir"
    if ($ExpectationFilter) { Write-Host "  Filter: $ExpectationFilter" }

    & $pythonExe @pythonArgsPrefix $PythonScript @pythonArgs
    exit $LASTEXITCODE

} finally {
    if ($extractTempFile) { Remove-Item -LiteralPath $extractTempFile -ErrorAction SilentlyContinue }
    if ($urlsTempFile)    { Remove-Item -LiteralPath $urlsTempFile    -ErrorAction SilentlyContinue }
}
