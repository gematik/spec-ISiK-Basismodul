# run-sushi-with-zts

Composite action wrapping gematik's reference `sushi-wrap.sh`
([gematik/zts-api-client-examples](https://github.com/gematik/zts-api-client-examples/tree/main/sushi-wrap))
so FHIR packages only available via the BfArM Zentraler Terminologieserver
(ZTS) — e.g. `kbv.all.terminology.allergyintolerance` — are downloaded into
the local FHIR package cache before SUSHI runs. See PTDATA-2315.

Used by `ig-publisher.yml` and `complieswith-export.yml` in place of a plain
`sushi`/`npx fsh-sushi` invocation.

## Inputs

| Input | Required | Default | Description |
|---|---|---|---|
| `dir` | yes | — | Directory containing the `sushi-config.yaml` to resolve dependencies for (SUSHI runs there) |
| `accepted-download-conditions` | yes | — | Comma-separated list of accepted ZTS download conditions (see setup below) |
| `sushi-command` | no | `sushi .` | Override for setups without a global `sushi` binary, e.g. `npx fsh-sushi . -s` |
| `sushi-wrap-url` | no | current PTDATA-2340 fork branch | Raw URL of `sushi-wrap.sh` |

## One-time setup: `ZTS_ACCEPTED_DOWNLOAD_CONDITIONS`

The list of accepted ZTS download conditions is not hardcoded in the workflow —
it must be configured as a repository (or organization) Actions **variable**:

1. Go to **Settings → Secrets and variables → Actions → Variables** in the repository.
2. Add a repository variable named `ZTS_ACCEPTED_DOWNLOAD_CONDITIONS`.
3. Set its value to the comma-separated list of accepted download conditions, e.g.:
   ```
   kbv.all.terminology.allergyintolerance
   ```
   Add more entries (comma-separated) as additional ZTS-only packages become needed.
4. Review the applicable download conditions on the [BfArM terminology website](https://terminologien.bfarm.de) before accepting them.

Until this variable is created, editors/linters may flag
`${{ vars.ZTS_ACCEPTED_DOWNLOAD_CONDITIONS }}` in the calling workflows with a
"Context access might be invalid" warning — this is expected and harmless; it
just means GitHub doesn't know about the variable yet.

## Notes

- `jq`, `yq` (mikefarah/yq), and `uuidgen` (needed internally by
  `sushi-wrap.sh`) are installed automatically via `apt-get`/`apk` if not
  already present; `sudo` is used automatically when not running as root
  (e.g. plain GitHub-hosted runners, as opposed to the IG Publisher container).
- `sushi-wrap-url` currently points at the
  [feature/improve-sushi-wrap-PTDATA-2340](https://github.com/gematik/zts-api-client-examples/tree/feature/improve-sushi-wrap-PTDATA-2340)
  branch of a pending upstream PR (env-var overrides for
  `ACCEPTED_DOWNLOAD_CONDITIONS`/`SUSHI_COMMAND`, plus a package-cache-dir bug
  fix). Switch the default back to the upstream `main` branch once that PR is
  merged.
