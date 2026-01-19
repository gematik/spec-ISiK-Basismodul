# FHIR IG Deployment Guide

This guide explains how to deploy the FHIR Implementation Guide using the gematik fhir-scripts tooling.

## Prerequisites

- Docker installed on your system 
  - alternatively install locally with pipx (see https://github.com/gematik/fhir-scripts?tab=readme-ov-file#python-script)
- Access to Google Cloud Storage buckets
- Google Cloud credentials configured (if deploying to production)

## Quick Start

### 1. Build the Docker Image

```bash
# Build from latest release - here hard-coded v. 0.22.0
docker build -t fhir-scripts https://github.com/gematik/fhir-scripts.git#v0.22.0:docker/devcontainer
```

### 2. Configure Deployment Settings

Edit [fhirscripts.config.yaml](fhirscripts.config.yaml) and update the bucket names:

```yaml
deploy:
  env:
    dev: "your-dev-bucket-name"    # e.g., gematik_gemspec_fhir_dev-0
    prod: "your-prod-bucket-name"  # Your production bucket
  path: "ig/fhir" # also "ig/fhir/isik" 
```

### 3. Run Deployment

#### Option A: Using Docker Run (Manual)

```bash
# Start interactive container
docker run -it --rm \
  -v "$(pwd):/workspace" \
  -w /workspace \
  fhir-scripts bash

# Inside container:
fhirscripts deploy dev --ig-output ./stufe-5/organspendedetektion/feature-init-draft-PTDATA-1927
```

## Troubleshooting

### Error: deploy configuration missing

Make sure `fhirscripts.config.yaml` exists and contains the `deploy` section.

### Error: Environment 'xxx' not defined in config

Check that your environment name matches one defined in `fhirscripts.config.yaml` under `deploy.env`.

### Error: Built IG not found

Verify the `--ig-output` path points to a directory containing `ImplementationGuide*.json`.

### Error: '_io.TextIOWrapper' object has no attribute 'strip'

This is a known issue in v0.22.0. Try rebuilding from main:

```bash
docker build --no-cache -t fhir-scripts https://github.com/gematik/fhir-scripts.git#main:docker/devcontainer
```

## Resources

- [fhir-scripts Repository](https://github.com/gematik/fhir-scripts)
- [fhir-scripts Documentation](https://github.com/gematik/fhir-scripts/blob/main/README.md)
- [Google Cloud Storage Documentation](https://cloud.google.com/storage/docs)

## Support

For issues with fhir-scripts, create an issue at:
https://github.com/gematik/fhir-scripts/issues
