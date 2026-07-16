# publication-request generator

Generates a `publication-request.json` for an IG and writes it into the IG's
`output/` directory.

## Background

`publication-request.json` is the input file consumed by the official HL7 FHIR
publication ("go-publish") process — the step that maintains the version history
(`package-list.json`) on the canonical publication infrastructure. The IG
Publisher's normal build (`igpublisher -ig ig.ini`, i.e. `_genonce`) neither
requires nor produces this file. This script derives it generically per IG so it
can be shipped alongside the rendered IG output.

## Derivation logic

Values are read from the SUSHI-generated `ImplementationGuide-*.json`
(`<ig-dir>/fsh-generated/resources/`) and derived as follows:

| Field        | Source / rule                                                                   |
| ------------ | ------------------------------------------------------------------------------- |
| `package-id` | `ImplementationGuide.packageId`                                                 |
| `version`    | `ImplementationGuide.version`                                                   |
| `path`       | `<canonical>/<package-id>/<version>` (canonical = `IG.url` without `/ImplementationGuide/<id>`) |
| `sequence`   | `Stufe <major(version)>`                                                         |
| `mode`       | pre-release version (contains `-`, e.g. `6.0.0-rc1`) → `working`, otherwise `milestone` |
| `status`     | `ImplementationGuide.status` mapped: `draft`→`draft`, `active`→`trial-use`, `retired`→`retired` |
| `descmd`/`desc` | `"<title>, Version <version> (<sequence>)."`                                 |
| `changes`    | constant `changes.html`                                                         |

Any field can be overridden per IG via [`config.json`](./config.json).

## Manual usage

Requires the IG's `fsh-generated` resources to exist (run SUSHI first).

```bash
# Write <ig-dir>/output/publication-request.json
node scripts/publication-request/generate.js --ig-dir publisher-guides/Basis

# Preview without writing
node scripts/publication-request/generate.js --ig-dir publisher-guides/Basis --dry-run
```

### Options

| Option            | Description                                                                 |
| ----------------- | --------------------------------------------------------------------------- |
| `--ig-dir <dir>`  | IG directory under `publisher-guides` (required unless `--ig` is given)     |
| `--ig <file>`     | Explicit path to an `ImplementationGuide-*.json` (overrides auto-detection) |
| `--out <file>`    | Output path (default: `<ig-dir>/output/publication-request.json`)           |
| `--config <file>` | Override config (default: `scripts/publication-request/config.json`)        |
| `--dry-run`       | Print the result to stdout instead of writing a file                        |

## Per-IG overrides

Edit [`config.json`](./config.json). Entries are keyed by `package-id` (or IG
`id`); any listed field wins over the derived value:

```json
{
  "overrides": {
    "basis": {
      "status": "trial-use",
      "descmd": "Custom release description for this version."
    }
  }
}
```

## Pipeline integration

`.github/workflows/ig-publisher.yml` runs this script per IG in the `build` job
(step "Generate publication-request.json"), after the IG Publisher build and
before the output is uploaded — so the file is included in the artifacts that
get published to `gh-pages`.
