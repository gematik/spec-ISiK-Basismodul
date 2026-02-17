'use strict';

module.exports = async function run({ github, context, core }) {
  const { owner, repo } = context.repo;
  const runId = context.runId;

  const response = await github.rest.actions.listWorkflowRunArtifacts({
    owner,
    repo,
    run_id: runId,
    per_page: 100,
  });

  const artifacts = response.data.artifacts || [];
  const toDelete = artifacts.filter((artifact) => artifact.name === 'fhir-packages');

  if (toDelete.length === 0) {
    core.info('No fhir-packages artifact found to delete.');
    return;
  }

  for (const artifact of toDelete) {
    await github.rest.actions.deleteArtifact({
      owner,
      repo,
      artifact_id: artifact.id,
    });
    core.info(`Deleted artifact ${artifact.id} (${artifact.name}).`);
  }
};
