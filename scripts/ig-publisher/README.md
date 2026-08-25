# IG Publisher scripts

This folder contains helper scripts used by the GitHub Actions workflow in
`.github/workflows/ig-publisher.yml`. The scripts assume they run inside a
GitHub Actions job with the repository checked out.

## Scripts

### check-changes.sh

Checks whether `fsh-generated`, `input`, or shared/local SUSHI config changed for the current IG and sets
`has_changes` on `${GITHUB_OUTPUT}`. It evaluates:
- net tracked changes in the commit range (`git diff`)
- tracked files touched by commits in the range (`git log`)
- workspace changes including untracked files (`git status`)
If `LAST_SUCCESS_SHA` is unavailable or invalid, it falls back to the last commit (`HEAD^...HEAD`).

**Inputs**
- `IG_PUBLISHER_DIR`: IG directory under `publisher-guides`
- `FORCE_BUILD`: `true` to force builds even without detected changes
- `SHOW_ALL_CHANGES`: `true` to print full change lists instead of truncating to 20 lines per block
- `LAST_SUCCESS_SHA`: Head SHA from the previous successful workflow run on the same branch
- `DIFF_HEAD_SHA`: Head commit SHA for diff detection (for PRs: `pull_request.head.sha`)

### publish-branch.sh

Publishes the IG output to the `gh-pages` branch under a branch-specific path.

**Inputs**
- `REPO`, `GITHUB_TOKEN`, `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`
- `PUBLISH_OUTPUT_DIR` (optional): Defaults to `publish-output`

### remove-oversized-output-files.sh

Removes files larger than the configured size limit from an IG output directory
before artifact upload/publish to avoid oversized files in `gh-pages`.

**Inputs**
- `OUTPUT_DIR`: Required path to the IG output directory to clean
- `MAX_FILE_SIZE_BYTES` (optional): Defaults to `52428800` (50 MiB)

### copy-artifacts.sh

Copies SUSHI-generated `fsh-generated` artifacts and expanded resources into
their per-IG directories. It also clears the target directories to avoid stale
files.

**Inputs**
- `ARTIFACTS_DIR` (optional): Defaults to `artifacts`

### sync-sushi-dependencies.sh

Copies the `dependencies:` block from `Resources/sushi-config.yaml` into one or
more IG-local `publisher-guides/*/sushi-config.yaml` files.

**Inputs**
- arg 1: shared source config path
- args 2..n (optional): target config files; if omitted, all IG-local configs are synced

### commit-artifacts.sh

Stages and commits the generated artifacts to the current branch.

**Inputs**
- none (uses standard GitHub Actions env vars)

### update-pr-comment.js

Creates or replaces the PR comment that lists build artifacts from "Upload Build Results".

**Inputs**
- `BRANCH_NAME` (via env) or passed as `branch` when invoked from github-script

### delete-fhir-packages.js

Deletes the temporary `fhir-packages` artifact after the workflow run.

### resolve-last-success-sha.js

Resolves the previous successful workflow run head SHA on the current branch and
exposes it as `last_success_sha` output for later change detection.

### run-sushi-with-zts.sh

Downloads gematik's reference `sushi-wrap.sh` from a raw GitHub URL, patches its
hardcoded `ACCEPTED_DOWNLOAD_CONDITIONS` placeholder with the configured value,
then runs it in the given directory. `sushi-wrap.sh` fetches FHIR packages that
are only available via the BfArM Zentraler Terminologieserver (ZTS) — e.g.
`kbv.all.terminology.allergyintolerance` — into the local FHIR package cache
before invoking SUSHI (`sushi .`) there. See
[gematik/zts-api-client-examples](https://github.com/gematik/zts-api-client-examples/tree/main/sushi-wrap).

**Usage**
```bash
bash scripts/ig-publisher/run-sushi-with-zts.sh <dir-containing-sushi-config.yaml>
```

**Inputs**
- arg 1: directory containing the `sushi-config.yaml` to resolve dependencies for (SUSHI runs there, i.e. `sushi .`)
- `SUSHI_WRAP_URL`: raw URL of `sushi-wrap.sh` (set once as a workflow-level `env` in `ig-publisher.yml`)
- `ACCEPTED_DOWNLOAD_CONDITIONS`: comma-separated list of accepted ZTS download conditions (see below)

**One-time setup: `ZTS_ACCEPTED_DOWNLOAD_CONDITIONS`**

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
`${{ vars.ZTS_ACCEPTED_DOWNLOAD_CONDITIONS }}` in `ig-publisher.yml` with a
"Context access might be invalid" warning — this is expected and harmless; it
just means GitHub doesn't know about the variable yet. The script itself fails
fast with a clear error if the variable is missing or empty at runtime.

**Notes**
- Requires `curl` in the job's container image; `jq`, `yq` (mikefarah/yq), and
  `uuidgen` (needed internally by `sushi-wrap.sh`) are installed automatically
  via `apt-get`/`apk` if not already present.
- `sushi-wrap.sh` is fetched fresh on every run instead of vendored into this
  repo, so upstream fixes from gematik apply automatically.
