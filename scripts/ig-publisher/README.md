# IG Publisher scripts

This folder contains helper scripts used by the GitHub Actions workflow in
`.github/workflows/ig-publisher.yml`. The scripts assume they run inside a
GitHub Actions job with the repository checked out.

## Scripts

### check-changes.sh

Checks whether `fsh-generated` or `input` changed for the current IG and sets
`has_changes` on `${GITHUB_OUTPUT}`. If no changes are found, it records an
existing published URL (or `NO_CHANGES`) in `${GITHUB_WORKSPACE}/.ig-urls-temp/urls.txt`.

**Inputs**
- `IG_PUBLISHER_DIR`: IG directory under `publisher-guides`
- `IG_NAME`: IG identifier used in URLs
- `FORCE_BUILD`: `true` to force builds even without detected changes

### publish-branch.sh

Publishes the IG output to the `gh-pages` branch under a branch-specific path.

**Inputs**
- `REPO`, `GITHUB_TOKEN`, `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`
- `IG_NAME`, `IG_PUBLISHER_DIR`

### announce-url.sh

Writes the published URL to the job summary and records it for the PR comment.

**Inputs**
- `IG_NAME`

### copy-artifacts.sh

Copies SUSHI-generated `fsh-generated` artifacts and expanded resources into
their per-IG directories. It also clears the target directories to avoid stale
files.

**Inputs**
- `ARTIFACTS_DIR` (optional): Defaults to `artifacts`

### commit-artifacts.sh

Stages and commits the generated artifacts to the current branch.

**Inputs**
- none (uses standard GitHub Actions env vars)

### update-pr-comment.js

Creates or replaces the PR comment that lists build artifacts from "Upload Build Results".

**Inputs**
- `BRANCH_NAME` (via env) or passed as `branch` when invoked from github-script
