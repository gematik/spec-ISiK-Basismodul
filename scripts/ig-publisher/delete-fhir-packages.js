/*
*
* Copyright 2026 gematik GmbH
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
* *******
*
* For additional notes and disclaimer from gematik and in case of changes by gematik find details in the "Readme" file.
*/
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
