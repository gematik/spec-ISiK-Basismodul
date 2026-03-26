'use strict';

const fs = require('fs');
const path = require('path');

const run = require('./update-pr-comment.js');

async function main() {
  const workspaceValidation = path.resolve(process.cwd(), 'validation.json');
  const localValidation = path.resolve(__dirname, 'validation.json');
  const outputPath = path.resolve(__dirname, 'debug-comment-output.md');
  const workflowPath = path.resolve(process.cwd(), '.github/workflows/main.yml');

  const validationSource = fs.existsSync(workspaceValidation) ? workspaceValidation : localValidation;
  if (!fs.existsSync(validationSource)) {
    throw new Error(`No validation.json found. Checked ${workspaceValidation} and ${localValidation}`);
  }

  if (validationSource !== workspaceValidation) {
    fs.copyFileSync(validationSource, workspaceValidation);
  }

  process.env.VALIDATION_FILTERS = readValidationFilters(workflowPath);

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

function readValidationFilters(workflowPath) {
  if (!fs.existsSync(workflowPath)) {
    return '';
  }

  const content = fs.readFileSync(workflowPath, 'utf8').replace(/\r\n/g, '\n');
  const marker = '\n      - name: Convert Validation Report\n';
  const start = content.indexOf(marker);
  if (start < 0) {
    return '';
  }

  const section = content.slice(start);
  const match = section.match(/\n\s{10}filters:\s\|\n((?:\s{12}.*\n?)*)/);

  if (!match) {
    return '';
  }

  return match[1]
    .split('\n')
    .map((line) => line.replace(/^\s{12}/, ''))
    .join('\n')
    .trim();
}

main().catch((error) => {
  process.stderr.write(`${error.stack || error.message}\n`);
  process.exitCode = 1;
});
