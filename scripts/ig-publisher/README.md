# IG Publisher scripts

This folder contains helper scripts used by the GitHub Actions workflow in
`.github/workflows/ig-publisher.yml`. The scripts assume they run inside a
GitHub Actions job with the repository checked out.

## Scripts

### check-changes.sh

Checks whether `fsh-generated` or `input` changed for the current IG and sets
`has_changes` on `${GITHUB_OUTPUT}`. It evaluates:
- net tracked changes in the commit range (`git diff`)
- tracked files touched by commits in the range (`git log`)
- workspace changes including untracked files (`git status`)
If `LAST_SUCCESS_SHA` is unavailable or invalid, it falls back to the last commit (`HEAD^...HEAD`).

**Inputs**
- `IG_PUBLISHER_DIR`: IG directory under `publisher-guides`
- `FORCE_BUILD`: `true` to force builds even without detected changes
- `LAST_SUCCESS_SHA`: Head SHA from the previous successful workflow run on the same branch
- `DIFF_HEAD_SHA`: Head commit SHA for diff detection (for PRs: `pull_request.head.sha`)

### publish-branch.sh

Publishes the IG output to the `gh-pages` branch under a branch-specific path.

**Inputs**
- `REPO`, `GITHUB_TOKEN`, `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`
- `PUBLISH_OUTPUT_DIR` (optional): Defaults to `publish-output`

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

### delete-fhir-packages.js

Deletes the temporary `fhir-packages` artifact after the workflow run.

### resolve-last-success-sha.js

Resolves the previous successful workflow run head SHA on the current branch and
exposes it as `last_success_sha` output for later change detection.
