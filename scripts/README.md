# Scripts Documentation

This directory contains various automation scripts for the ISiK (Informationstechnische Systeme in Krankenhäusern) project. These scripts help with quality assurance, release management, and documentation maintenance.

## Check_rendering_in_markdown.py

### Purpose/Functionality
This script performs quality assurance checks on Markdown documentation by validating references within the repository. It searches for specific reference patterns (`{{render:...}}`, `{{pagelink:...}}`, `{{page:...}}`, `{{link:...}}`) in Markdown files and verifies that:
- Referenced files exist in the repository
- JSON files contain matching IDs
- Markdown files have corresponding topic frontmatter
- Special handling for CapabilityStatements and .page.md references

### Hints for Using the Script
- Run from the repository root directory
- The script automatically searches all Markdown files in the `/guides` directory and subdirectories
- Results are logged in a Markdown table format showing errors with source, type, reference, and error cause
- The script is cross-platform compatible and handles different path separators
- Use this before releases to ensure documentation integrity

## Extract_requirements.py

### Purpose/Functionality
This script automatically extracts requirement identifiers (ANF-CON-XXX patterns) from Markdown files and generates a requirements table. It scans the `ImplementationGuide/markdown` directory, finds all unique requirement IDs, and creates a Markdown table with pagelinks for navigation.

### Hints for Using the Script
- Run from the repository root directory
- Excludes `Anforderungsuebersicht.md` from scanning to avoid circular references
- Output is saved to `requirements_table.md` in the root directory
- The generated table uses pagelink references for easy navigation within the documentation
- Ensures unique requirements per file to avoid duplicates

## Release_publish.py

### Purpose/Functionality
This script automates the release process by updating version numbers and dates across multiple files in the repository. It uses configuration from `config.yaml` to determine which files to update and what patterns to match for version and date replacements.

### Hints for Using the Script
- Requires `config.yaml` configuration file in the same directory
- Automatically detects the current git branch to determine version information
- Supports TC- and TC_ branch name prefixes for version extraction
- Updates files like `package.json`, `sushi-config.yaml`, `ruleset.fsh`, and various Markdown files
- Use with caution as it modifies multiple files simultaneously
- Test on a separate branch before applying to main release branches

## Update-compile-and-validation-tools.py

### Purpose/Functionality
This script automatically updates the GitHub Actions workflow configuration with the latest versions of Firely Terminal and SUSHI tools. It fetches the latest release versions from their respective GitHub repositories and updates the `main.yml` workflow file.

### Hints for Using the Script
- Requires internet connection to access GitHub API
- Updates `.github/workflows/main.yml` with latest tool versions
- Run periodically to keep build tools current
- Check that the updated versions are compatible with your project before committing changes
- The script will print the versions it updates to

## config.yaml

### Purpose/Functionality
Configuration file for the `release_publish.py` script. Defines file patterns, regex expressions, and format specifications for version and date updates across different file types.

### Hints for Using the Script
- Not executable - this is a configuration file
- Modify this file to add new files or change update patterns for releases
- Supports version and date replacement with custom regex patterns
- Each file can have multiple replacement rules with different patterns
- Date formats can be customized per rule (e.g., '%Y-%m-%d', '%d.%m.%Y')

## Highlight duplicates

### Purpose/Functionality
This script identifies and highlights duplicate ANF-CON requirement tags in Markdown files. It's specifically designed for the ISiK Connect Implementation Guide to ensure requirement identifiers are unique.

### Hints for Using the Script
- Written in Python despite the filename lacking extension
- Processes `ImplementationGuide/markdown/Anforderungsuebersicht.md` by default
- Creates a highlighted output file where duplicates are marked with `==tag==` formatting
- Run before publishing to ensure requirement tag uniqueness
- Reports found duplicates to console and creates an output file for review

## QualityAssuranceAutomation/

### Purpose/Functionality
This directory contains advanced quality assurance tools for FHIR profiles and resources:
- **qa-fhir.js**: Validates FHIR StructureDefinition JSON files against best practices
- **suppression.config.json**: Configuration for suppressing specific quality checks
- **README-QS.md**: Documentation for quality assurance features

### Hints for Using the Script
- The main script is `qa-fhir.js` (Node.js required)
- Checks for MustSupport elements having proper documentation
- Validates cardinality constraints and descriptions
- Supports suppression of specific profiles or elements via configuration
- Differentiates between errors and warnings
- Can be integrated with FHIR validator rules for automated checks
- Review suppression configuration carefully to avoid missing important issues

## Output-rendering_check

### Purpose/Functionality
Directory containing output files and logs from the rendering check processes, specifically from the `check_rendering_in_markdown.py` script.

### Hints for Using the Script
- This is an output directory, not an executable script
- Contains logs and results from markdown rendering validation
- Check `rendering_check_log.md` for detailed validation results
- Review regularly during development to catch documentation issues early
- Clean periodically to avoid accumulation of old log files
