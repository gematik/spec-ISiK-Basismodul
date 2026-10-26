/*
*
* Copyright 2026, gematik GmbH
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
* For additional notes and disclaimer from gematik and in case of changes
* by gematik, find details in the "Readme" file.
*/

'use strict';

const fs = require('fs');
const path = require('path');

const run = require('./update-pr-comment.js');

async function main() {
  const workspaceValidation = path.resolve(process.cwd(), 'validation-details.json');
  const localValidation = path.resolve(__dirname, 'validation-details.json');
  const outputPath = path.resolve(__dirname, 'debug-comment-output.md');

  const validationSource = fs.existsSync(workspaceValidation) ? workspaceValidation : localValidation;
  if (!fs.existsSync(validationSource)) {
    throw new Error(`No validation-details.json found. Checked ${workspaceValidation} and ${localValidation}`);
  }

  if (validationSource !== workspaceValidation) {
    fs.copyFileSync(validationSource, workspaceValidation);
  }

  let capturedBody = '';

  const github = {
    rest: {
      issues: {
        async listComments() {
          return { data: [] };
        },
        async createComment({ body }) {
          capturedBody = body;
          return { data: { id: 1, body } };
        },
        async updateComment({ body }) {
          capturedBody = body;
          return { data: { id: 1, body } };
        },
      },
    },
  };

  const context = {
    repo: {
      owner: 'gematik',
      repo: 'spec-ISiK-Basismodul-2',
    },
    payload: {
      pull_request: {
        number: 123,
        head: {
          ref: 'debug/complieswith-local-test',
        },
      },
    },
    runId: 999999999,
  };

  const core = {
    info(message) {
      process.stdout.write(`[info] ${message}\n`);
    },
    warning(message) {
      process.stdout.write(`[warn] ${message}\n`);
    },
  };

  await run({ github, context, core });

  if (!capturedBody) {
    throw new Error('No PR comment body was captured.');
  }

  fs.writeFileSync(outputPath, capturedBody);
  process.stdout.write(`Saved rendered PR comment to ${outputPath}\n`);
}

main().catch((error) => {
  process.stderr.write(`${error.stack || error.message}\n`);
  process.exitCode = 1;
});
