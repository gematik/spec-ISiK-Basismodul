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
