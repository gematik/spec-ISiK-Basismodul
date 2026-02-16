'use strict';

module.exports = async function run({ github, context, core, branch }) {
  const { owner, repo } = context.repo;
  const pr = context.payload && context.payload.pull_request;
  const targetBranch = branch || (pr && pr.head && pr.head.ref) || process.env.BRANCH_NAME;
  const marker = '<!-- ig-build-artifacts -->';

  if (!pr) {
    core.info('No pull_request context found; skipping PR comment.');
    return;
  }

  const runId = context.runId;
  const runUrl = `https://github.com/${owner}/${repo}/actions/runs/${runId}`;
  let artifacts = [];
  try {
    const response = await github.rest.actions.listWorkflowRunArtifacts({
      owner,
      repo,
      run_id: runId,
      per_page: 100,
    });
    artifacts = response.data.artifacts || [];
  } catch (error) {
    core.warning(`Failed to list workflow run artifacts: ${error.message}`);
  }

  const buildArtifacts = artifacts.filter((artifact) => artifact.name.startsWith('fhir-ig-'));

  const { data: comments } = await github.rest.issues.listComments({
    owner,
    repo,
    issue_number: pr.number,
    per_page: 100,
  });

  const existingComments = comments.filter(
    (c) => typeof c.body === 'string' && c.body.includes(marker)
  );

  const previousArtifacts = extractPreviousArtifacts(existingComments);

  if (buildArtifacts.length === 0) {
    if (Object.keys(previousArtifacts).length > 0) {
      core.info('No new build artifacts; keeping existing PR comment unchanged.');
      return;
    }

    let body = `${marker}\n### Build artifacts\n\n`;
    body += `Run: [${runId}](${runUrl})\n`;
    if (targetBranch) {
      body += `Branch: \`${targetBranch}\`\n`;
    }
    body += '\n';
    body += 'No build artifacts found for this PR yet.\n';

    for (const existing of existingComments) {
      await github.rest.issues.deleteComment({
        owner,
        repo,
        comment_id: existing.id,
      });
      core.info(`Deleted old PR comment #${existing.id} on PR #${pr.number}`);
    }

    await github.rest.issues.createComment({
      owner,
      repo,
      issue_number: pr.number,
      body,
    });
    core.info(`Created new PR comment without artifacts on PR #${pr.number}`);
    return;
  }

  const mergedArtifacts = { ...previousArtifacts };
  for (const artifact of buildArtifacts) {
    const sizeBytes = Number.isFinite(artifact.size_in_bytes) ? artifact.size_in_bytes : 0;
    const sizeLabel = formatBytes(sizeBytes);
    const artifactUrl = buildArtifactUrl({
      owner,
      repo,
      runId,
      artifactId: artifact.id,
    });
    mergedArtifacts[artifact.name] = `- **${artifact.name}** (${sizeLabel}) - ${artifactUrl}`;
  }

  const sortedNames = Object.keys(mergedArtifacts).sort();
  const updatedNames = buildArtifacts.map((artifact) => artifact.name).sort();

  let body = `${marker}\n### Build artifacts\n\n`;
  body += `Run: [${runId}](${runUrl})\n`;
  if (targetBranch) {
    body += `Branch: \`${targetBranch}\`\n`;
  }
  body += '\n';
  body += 'Updated in this run:\n';
  for (const name of updatedNames) {
    body += `- **${name}**\n`;
  }
  body += '\n';
  body += 'Download Build IGs:\n';
  for (const name of sortedNames) {
    body += `${mergedArtifacts[name]}\n`;
  }

  for (const existing of existingComments) {
    await github.rest.issues.deleteComment({
      owner,
      repo,
      comment_id: existing.id,
    });
    core.info(`Deleted old PR comment #${existing.id} on PR #${pr.number}`);
  }

  await github.rest.issues.createComment({
    owner,
    repo,
    issue_number: pr.number,
    body,
  });
  core.info(`Created new PR comment with ${buildArtifacts.length} build artifact(s) on PR #${pr.number}`);
};

function formatBytes(bytes) {
  if (!bytes) {
    return '0 B';
  }
  const units = ['B', 'KB', 'MB', 'GB'];
  let value = bytes;
  let unitIndex = 0;
  while (value >= 1024 && unitIndex < units.length - 1) {
    value /= 1024;
    unitIndex += 1;
  }
  const digits = value >= 10 || unitIndex === 0 ? 0 : 1;
  return `${value.toFixed(digits)} ${units[unitIndex]}`;
}

function extractPreviousArtifacts(existingComments) {
  const artifacts = {};
  for (const comment of existingComments) {
    const body = comment.body || '';
    for (const line of body.split('\n')) {
      if (line.startsWith('- **') && line.includes(' - http')) {
        const name = extractArtifactName(line);
        if (name) {
          artifacts[name] = line;
        }
      }
    }
  }
  return artifacts;
}

function extractArtifactName(line) {
  const match = line.match(/^\-\s\*\*([^*]+)\*\*/);
  return match ? match[1].trim() : null;
}

function buildArtifactUrl({ owner, repo, runId, artifactId }) {
  if (!artifactId) {
    return `https://github.com/${owner}/${repo}/actions/runs/${runId}`;
  }
  return `https://github.com/${owner}/${repo}/actions/runs/${runId}/artifacts/${artifactId}`;
}
