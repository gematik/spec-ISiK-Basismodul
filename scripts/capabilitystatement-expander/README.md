# FHIR CapabilityStatement Expander

Recursively expands FHIR CapabilityStatements by resolving all `imports` and collecting all referenced resources. Perfect for FHIR Implementation Guide development and distribution.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![FHIR R4](https://img.shields.io/badge/FHIR-R4-green.svg)](https://hl7.org/fhir/R4/)

## ✨ Features

- 🔄 **Recursive Import Resolution**: Automatically resolves all `imports` and `instantiates` references
- 🏷️ **Canonical URL Support**: Uses FHIR-compliant canonical URLs for resource identification  
- 🧩 **Complete Resource Extraction**: Automatically collects:
  - ✅ StructureDefinitions (profiles)
  - ✅ ValueSets and CodeSystems (including from StructureDefinition bindings)
  - ✅ SearchParameters and OperationDefinitions
  - ✅ Examples and other referenced resources
- 📋 **Smart Example Detection**: Finds examples via `meta.profile` references to collected profiles
- 🧹 **Import Cleanup**: Removes `imports`/`_imports` from the final expanded CapabilityStatement
- 🔍 **Iterative Analysis**: Multi-layered analysis for nested dependencies
- 📊 **Detailed Logging**: Complete traceability of the expansion process

## 🚀 Usage in GitHub Actions

The expander runs directly as a `bash` step — Python 3 must be available on the runner (included in the IG publisher container image used by this project).

### Simple Usage (Single CapabilityStatement)

```yaml
jobs:
  expand:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    
    - name: Expand CapabilityStatement
      shell: bash
      run: |
        bash scripts/capabilitystatement-expander/expand.sh \
          --input-dir  './fhir-resources' \
          --output-dir './expanded-resources' \
          --urls       'https://example.org/fhir/CapabilityStatement/MyCapability'
        
    - name: Upload Results
      uses: actions/upload-artifact@v4
      with:
        name: expanded-fhir-resources
        path: './expanded-resources'
```

### Expanding Multiple CapabilityStatements

```yaml
    - name: Expand Multiple CapabilityStatements
      shell: bash
      run: |
        bash scripts/capabilitystatement-expander/expand.sh \
          --input-dir  './fhir-resources' \
          --output-dir './expanded-resources' \
          --urls       '["https://example.org/fhir/CapabilityStatement/ServerCapability",
                         "https://example.org/fhir/CapabilityStatement/ClientCapability"]'
```

### Using Matrix Strategy for Multiple CapabilityStatements

Use `toJSON()` to convert a YAML list from the matrix into a JSON array:

```yaml
jobs:
  expand:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        include:
          - ig_name: MyIG
            capability_statement_urls:
              - https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasis
              - https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementSubscription
            import_cps_filter: SHOULD   # optional
    steps:
    - uses: actions/checkout@v4
    
    - name: Expand CapabilityStatement
      if: ${{ toJSON(matrix.capability_statement_urls) != 'null' }}
      shell: bash
      env:
        CS_URLS:               ${{ toJSON(matrix.capability_statement_urls) }}
        CS_EXPECTATION_FILTER: ${{ matrix.import_cps_filter }}
      run: |
        bash scripts/capabilitystatement-expander/expand.sh \
          --input-dir  './Resources/fsh-generated/resources' \
          --output-dir './publisher-input/resources' \
          --urls       "${CS_URLS}" \
          ${CS_EXPECTATION_FILTER:+--expectation-filter "${CS_EXPECTATION_FILTER}"}
```

> **Why `toJSON()`?**  
> GitHub Actions passes YAML lists as newline-separated strings. `toJSON()` serialises them as a proper JSON array (`["url1","url2"]`), which the expander can parse correctly.

### 🔍 Verbose Logging

Enable detailed logging to troubleshoot expansion issues:

```yaml
    - name: Debug Expansion Process
      shell: bash
      run: |
        bash scripts/capabilitystatement-expander/expand.sh \
          --input-dir  './resources' \
          --output-dir './output' \
          --urls       'https://example.org/fhir/CapabilityStatement/MyCS' \
          --verbose
```

**With `--verbose` you get:**
- 📋 Detailed file processing information
- 🔍 Step-by-step import resolution
- 📊 Resource collection statistics  
- 🧩 Profile and example discovery details
- ⚠️ Warning messages for missing resources

### 🤖 Auto-Enable Verbose with GitHub Debug Mode

**Bonus Feature:** Verbose logging is automatically enabled when you activate GitHub Actions debug logging!

```yaml
    # No need to pass --verbose when using GitHub debug mode
    - name: Expand CapabilityStatement (with auto-verbose)
      shell: bash
      run: |
        bash scripts/capabilitystatement-expander/expand.sh \
          --input-dir  './resources' \
          --output-dir './output' \
          --urls       'https://example.org/fhir/CapabilityStatement/MyCS'
          # --verbose automatically enabled when ACTIONS_STEP_DEBUG=true
```

**To activate both debug modes:**
1. 🔧 **Repository Settings** → Actions → General → "Enable debug logging"
2. 🚀 **Run workflow** → Both GitHub Actions debug + FHIR verbose logging active automatically!

## 💻 Local Execution (for Development)

### Via Workflow YAML (empfohlen für lokale Entwicklung)

Wenn das Repository bereits eine GitHub Actions Workflow-Datei mit der IG-Matrix enthält (wie `.github/workflows/ig-publisher.yml`), können `input-dir`, `output-dir`, `urls` und `expectation-filter` automatisch daraus abgeleitet werden — einfach IG-Namen angeben:

**Linux / macOS / WSL:**
```bash
bash scripts/capabilitystatement-expander/expand.sh \
  --workflow-file .github/workflows/ig-publisher.yml \
  --ig-name ISiK-Basis
```

**Windows PowerShell:**
```powershell
.\scripts\capabilitystatement-expander\expand.ps1 `
  -WorkflowFile .\.github\workflows\ig-publisher.yml `
  -IGName ISiK-Basis
```

Einzelne Parameter können nach wie vor explizit überschrieben werden, z. B. um ein anderes Output-Verzeichnis zu nutzen:

```bash
bash scripts/capabilitystatement-expander/expand.sh \
  --workflow-file .github/workflows/ig-publisher.yml \
  --ig-name       ISiK-Basis \
  --output-dir    /tmp/my-output \
  --verbose
```

> **Hinweis:** Der Workflow-Modus benötigt PyYAML (`pip install pyyaml`).

---

### Via `expand.sh` (Linux / macOS / WSL)

```bash
bash scripts/capabilitystatement-expander/expand.sh \
  --input-dir  ./fhir-resources \
  --output-dir ./output \
  --urls       "http://example.org/CapabilityStatement/MyCapabilityStatement" \
  --verbose
```

**Multiple CapabilityStatements:**
```bash
bash scripts/capabilitystatement-expander/expand.sh \
  --input-dir  ./fhir-resources \
  --output-dir ./output \
  --urls       '["http://example.org/CapabilityStatement/CS1", "http://example.org/CapabilityStatement/CS2"]' \
  --verbose
```

### Via `expand.ps1` (Windows PowerShell)

```powershell
.\scripts\capabilitystatement-expander\expand.ps1 `
  -InputDir  .\fhir-resources `
  -OutputDir .\output `
  -Urls      "http://example.org/CapabilityStatement/MyCapabilityStatement" `
  -Verbose
```

**Multiple CapabilityStatements:**
```powershell
.\scripts\capabilitystatement-expander\expand.ps1 `
  -InputDir  .\fhir-resources `
  -OutputDir .\output `
  -Urls      '["http://example.org/CapabilityStatement/CS1","http://example.org/CapabilityStatement/CS2"]'
```

> **Execution policy:** If PowerShell blocks the script, run once with:
> `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned`

All options can also be set via environment variables: `CS_INPUT_DIR`, `CS_OUTPUT_DIR`, `CS_URLS`, `CS_WORKFLOW_FILE`, `CS_IG_NAME`, `CS_EXPECTATION_FILTER`, `CS_VERBOSE`, `CS_NO_CLEAN`.

### Options

| Option (`expand.sh` / `expand.ps1`) | Description | Required |
|---|---|---|
| `--input-dir` / `-InputDir` | Directory with FHIR JSON files | ✅ (or via `--workflow-file`) |
| `--output-dir` / `-OutputDir` | Target directory for expanded resources | ✅ (or via `--workflow-file`) |
| `--urls` / `-Urls` | Canonical URL(s) to expand: single URL or JSON array | ✅ (or via `--workflow-file`) |
| `--workflow-file` / `-WorkflowFile` | GitHub Actions workflow YAML to read IG config from | ❌ |
| `--ig-name` / `-IGName` | IG name in the workflow matrix (requires `--workflow-file`) | ❌ |
| `--expectation-filter` / `-ExpectationFilter` | `SHALL` / `SHOULD` / `MAY` — imports all entries at that level and above | ❌ |
| `--verbose` / `-Verbose` | Enable verbose/debug logging | ❌ |
| `--no-clean` / `-NoClean` | Keep existing files in output directory | ❌ |

### Via Python directly

```bash
python3 scripts/capabilitystatement-expander/capability_statement_expander.py \
  ./fhir-resources ./output \
  '["http://example.org/CapabilityStatement/CS1", "http://example.org/CapabilityStatement/CS2"]' \
  --verbose
```

## 🧪 Tests

```bash
python3 scripts/capabilitystatement-expander/test_expander.py
```

## 📁 Directory Structure

### Input Directory
```
input/
├── CapabilityStatement-MyCS.json
├── CapabilityStatement-ImportedCS.json
├── profiles/
│   ├── Patient-Profile.json
│   └── Observation-Profile.json
├── examples/
│   ├── Patient-Example.json
│   └── Observation-Example.json
└── terminology/
    ├── ValueSet-Codes.json
    └── CodeSystem-MySystem.json
```

### Output Directory (after expansion)
```
output/
├── CapabilityStatement-example-base-capability-expanded.json  # ✨ Expanded CapabilityStatement  
├── StructureDefinition-PatientProfile.json                    # 🏗️ Patient profile
├── StructureDefinition-ObservationProfile.json                # 🏗️ Observation profile  
├── ValueSet-PatientStatus.json                                # 📋 Patient status values
├── SearchParameter-Patient-identifier.json                    # 🔍 Patient identifier search
├── CapabilityStatement-example-base-capability.json           # 📄 Original CapabilityStatement
├── CapabilityStatement-imported-capability.json               # 📥 Imported CapabilityStatement
├── Patient-example-1.json                                     # 👤 Example detected via meta.profile
└── Observation-example-1.json                                 # 📊 Example detected via meta.profile
```

**📝 Note:** The expanded CapabilityStatement has:
- **File name**: Original ID + `-expanded` suffix (e.g., `CapabilityStatement-MyCS-expanded.json`)
- **Resource ID**: Original ID + `-expanded` suffix (e.g., `"id": "MyCS-expanded"`)
- **Canonical URL**: Original URL + `-expanded` suffix (e.g., `"url": "https://example.org/CS-expanded"`)
- **Name & Title**: Original + `Expanded` suffix (e.g., `"name": "MyCSExpanded"`)
- **No imports**: All `imports` and `_imports` fields are removed after expansion

## 🔧 How It Works

The expander performs the following steps:

1. **Initial Analysis**: Loads the base CapabilityStatement and analyzes its structure
2. **Import Resolution**: Recursively resolves all `imports` and `instantiates` references
   - Supports multi-level imports (CS1 → CS2 → CS3, CS4)
   - Respects expectation filters (SHALL/SHOULD/MAY)
3. **Profile Collection**: Extracts all StructureDefinition references from `supportedProfile` fields
4. **Binding Analysis**: Analyzes StructureDefinitions for ValueSet and CodeSystem bindings
5. **Dependency Resolution**: Follows references in SearchParameters and OperationDefinitions
6. **Example Detection**: Searches for Examples via `meta.profile` references to collected profiles
7. **Iterative Processing**: Repeats analysis until no new resources are found
8. **Final Assembly**: Creates expanded CapabilityStatement with modified metadata:
   - Canonical URL: `{original-url}-expanded` (e.g., `https://example.org/CS-expanded`)
   - Resource ID: `{original-id}-expanded`
   - Name/Title: `{original}Expanded` / `{original} (Expanded)`
   - Removes all `imports` and `_imports` fields
9. **Resource Copy**: Copies all referenced resources (profiles, ValueSets, examples, etc.)

### 🎯 Smart Example Detection

The expander includes intelligent example detection that:
- Scans all resources in the directory structure
- Identifies resources with `meta.profile` references
- Matches these references against collected `supportedProfile` URLs
- Automatically includes matching examples in the expanded output

For example, if your CapabilityStatement references:
```json
"supportedProfile": [
  "http://example.org/StructureDefinition/PatientProfile"
]
```

And you have an example like:
```json
{
  "resourceType": "Patient",
  "meta": {
    "profile": ["http://example.org/StructureDefinition/PatientProfile"]
  }
}
```

The example will be automatically detected and included in the expanded package.

## 🔧 FHIR CapabilityStatement Import Mechanism

The script supports the following import mechanisms from the FHIR standard:

### `imports`
```json
{
  "resourceType": "CapabilityStatement",
  "imports": [
    "http://example.org/CapabilityStatement/BaseCapability",
    "CapabilityStatement/AnotherCapability"
  ]
}
```

### `instantiates`
```json
{
  "resourceType": "CapabilityStatement", 
  "instantiates": [
    "http://hl7.org/fhir/CapabilityStatement/base"
  ]
}
```

## 🎯 Use Cases

- **🏥 Implementation Guide Development**: Automatically collect all dependencies
- **📦 FHIR Package Creation**: Complete resource collections for distribution
- **✅ Validation**: Verify completeness of CapabilityStatements
- **🔄 CI/CD**: Automated processing in GitHub Actions workflows

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.
