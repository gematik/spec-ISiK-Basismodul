'use strict';

const fs = require('fs');

const workflow = fs.readFileSync('.github/workflows/main.yml', 'utf8').replace(/\r\n/g, '\n');
const marker = '\n      - name: Convert Validation Report\n';
const start = workflow.indexOf(marker);
if (start < 0) {
  throw new Error('Could not find "Convert Validation Report" step in .github/workflows/main.yml');
}

const section = workflow.slice(start);
const match = section.match(/\n\s{10}filters:\s\|\n((?:\s{12}.*\n?)*)/);
if (!match) {
  throw new Error('Could not extract validation filters from .github/workflows/main.yml');
}

const filters = match[1]
  .split('\n')
  .map((line) => line.replace(/^\s{12}/, ''))
  .join('\n')
  .trimEnd();

process.stdout.write('filters<<EOF\n');
process.stdout.write(`${filters}\n`);
process.stdout.write('EOF\n');
