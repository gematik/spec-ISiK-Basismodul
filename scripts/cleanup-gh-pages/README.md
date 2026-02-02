# Cleanup gh-pages

Removes branch-specific directories on the `gh-pages` branch when the
corresponding Git branch no longer exists. The script scans for
`.branch-name` markers and deletes whole branch directories.

## Usage

Run inside a checked out `gh-pages` branch.

```bash
bash scripts/cleanup-gh-pages/cleanup.sh
```

### Dry-run

Set `CLEANUP_DRY_RUN=1` to only log what would be removed.

```bash
CLEANUP_DRY_RUN=1 bash scripts/cleanup-gh-pages/cleanup.sh
```

## Workflow integration

The GitHub Actions workflow `cleanup-gh-pages.yml` calls this script
and exposes a manual `workflow_dispatch` input to enable dry-run mode.
