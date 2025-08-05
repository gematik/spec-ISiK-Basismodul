# GitHub Actions Workflows Documentation

This directory contains GitHub Actions workflows that automate various aspects of the ISiK (Informationstechnische Systeme in Krankenhäusern) project including validation, quality assurance, dependency management, and diagram generation.

## main.yml

### Purpose/Functionality
This is the primary CI/CD workflow that handles FHIR validation and resource generation. The workflow:
- Validates FHIR resources using Firely Terminal pipeline
- Compiles FSH (FHIR Shorthand) files to FHIR JSON/XML resources using SUSHI
- Performs Java-based FHIR validation with custom validation rules
- Uploads validation artifacts (HTML and JSON reports)
- Converts validation results to Markdown format
- Validates resource status consistency
- Auto-commits generated FHIR resources back to the repository


### Hints for Using the Workflow
- Triggers on push to paths: `Resources/**` and `.github/workflows/**` (excluding main branches)
- Triggers on pull requests to main branches
- Can be manually triggered via workflow_dispatch
- Requires secrets: `SIMPLIFIER_USERNAME`, `SIMPLIFIER_PASSWORD`, `WORKFLOW_PERMISSION_GITHUB`
- Uses advisor configuration from `validator/advisor.json`
- Validation results are available as downloadable artifacts
- Supports terminology validation via BfArM services
- Auto-commits generated resources with specific commit message format

## fhir-quality-control.yml

### Purpose/Functionality
Runs comprehensive FHIR quality control checks using the Node.js quality assurance script. This workflow validates FHIR StructureDefinition files against best practices and generates detailed quality reports.

### Hints for Using the Workflow
- Manual trigger only (workflow_dispatch)
- Requires Node.js 18.19.0
- Runs the `qa-fhir.js` script from `scripts/QualityAssuranceAutomation/`
- Uploads validation logs as artifacts
- Check the uploaded log files for detailed quality assessment results
- Review suppression configuration if needed to customize quality checks


## link-check.yml

### Purpose/Functionality
Validates all external and internal links within the repository documentation to ensure they are accessible and not broken. Uses the Lychee link checker with caching for performance optimization.


### Hints for Using the Workflow
- Manual trigger only (workflow_dispatch)
- Excludes paths: `ImplementationGuide/style` and `Material` directories
- Uses caching to improve performance on subsequent runs
- Configured with retry logic (max 5 retries with 10-second wait time)
- Limited concurrency (max 2) to avoid overwhelming target servers
- Workflow fails if broken links are detected
- Check the action logs for details about which links are broken

## RenderAllDiagrams.yml

### Purpose/Functionality
Automatically renders diagrams from source files into SVG format for use in documentation. Supports multiple diagram types including PlantUML (.puml), Draw.io (.drawio), and BPMN (.bpmn) files.


### Hints for Using the Workflow
- Triggers on push to diagram source files in `**/Material/images/src/**/*` paths
- Manual trigger available via workflow_dispatch
- Requires Java 21 for PlantUML rendering
- Installs PlantUML, Graphviz, and Draw.io export tools automatically
- Processes files from `Material/images/src/` and outputs to `Material/images/diagrams/`
- Auto-commits rendered SVG files with specific commit message
- Cleans target directory before generating new diagrams
- Supports batch processing of multiple diagram types

## TC-version-update.yml

### Purpose/Functionality
Automatically updates version numbers across the project when working on TC (Test Case) branches. This workflow detects TC branch pushes and runs the release publishing script to update version information consistently across all relevant files.

### Hints for Using the Workflow
- Triggers automatically on push to branches named `TC-*` or `TC_*`
- Requires Python 3.10 and PyYAML package
- Runs the `release_publish.py` script with branch detection
- Auto-commits version updates with GitHub Actions Bot identity
- Ensure the `config.yaml` file is properly configured for version update patterns
- Review the script output to confirm all intended files were updated

## ToolUpdate.yml

### Purpose/Functionality
Automatically maintains up-to-date dependencies by checking for new releases of Firely Terminal and SUSHI tools daily. Creates pull requests when updates are available to keep the CI/CD pipeline current with the latest tool versions.

### Hints for Using the Workflow
- Runs daily at 00:00 UTC via scheduled cron job
- Manual trigger available via workflow_dispatch
- Checks GitHub releases for FirelyTeam/firely-terminal-pipeline and FHIR/sushi
- Only creates PRs when updates are actually needed
- Requires `WORKFLOW_PERMISSION_GITHUB` secret for PR creation
- Targets `main-stufe-5` branch for updates
- Creates feature branches with descriptive names including version numbers
- Review and test the generated PRs before merging to ensure compatibility
- PRs include detailed information about version changes

## Workflow Dependencies and Integration

### Secrets Required
- `SIMPLIFIER_USERNAME`: Username for Simplifier.net authentication
- `SIMPLIFIER_PASSWORD`: Password for Simplifier.net authentication  
- `WORKFLOW_PERMISSION_GITHUB`: GitHub token with permissions for PR creation and workflow execution

### Artifact Management
- Validation results are stored as downloadable artifacts with 1-day retention
- Quality control logs are preserved as artifacts for analysis
- Use the GitHub Actions interface to download and review artifacts

### Branch Protection and Integration
- Main workflows respect branch protection rules
- Auto-commits use consistent bot identity for tracking
- Pull request workflows provide validation before merging
- Feature branch workflows support development iterations

### Monitoring and Troubleshooting
- Check action logs for detailed execution information
- Review artifact outputs for validation and quality results
- Monitor dependency update PRs for potential compatibility issues
- Use manual triggers for testing workflow changes before automation kicks in
