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
  const branch =
    (context.payload.pull_request &&
      context.payload.pull_request.head &&
      context.payload.pull_request.head.ref) ||
    (context.ref || '').replace('refs/heads/', '');
  const currentHeadSha =
    (context.payload.pull_request &&
      context.payload.pull_request.head &&
      context.payload.pull_request.head.sha) ||
    context.sha;

  if (!branch) {
    core.info('Could not determine branch name. Skipping last-success lookup.');
    return;
  }

  const workflowId = 'ig-publisher.yml';
  let lastSuccessSha = '';

  try {
    for (let page = 1; page <= 5 && !lastSuccessSha; page += 1) {
      const response = await github.rest.actions.listWorkflowRuns({
        owner,
        repo,
        workflow_id: workflowId,
        branch,
        status: 'completed',
        per_page: 100,
        page,
      });

      const runs = response.data.workflow_runs || [];
      for (const runInfo of runs) {
        if (runInfo.id === context.runId) {
          continue;
        }
        if (runInfo.conclusion !== 'success') {
          continue;
        }
        if (!runInfo.head_sha || runInfo.head_sha === currentHeadSha) {
          continue;
        }
        lastSuccessSha = runInfo.head_sha;
        break;
      }

      if (runs.length < 100) {
        break;
      }
    }
  } catch (error) {
    core.warning(`Failed to resolve previous successful head SHA: ${error.message}`);
  }

  if (lastSuccessSha) {
    core.setOutput('last_success_sha', lastSuccessSha);
    core.info(`Resolved LAST_SUCCESS_SHA=${lastSuccessSha}`);
  } else {
    core.info('No previous successful run SHA found for this branch.');
  }
};
