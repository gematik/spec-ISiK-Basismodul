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

const sourceDir = path.resolve('Resources/fsh-generated/resources');
const targetDir = path.resolve('Resources/fsh-generated/complieswith-validation');
const compliesWithUrl = 'http://hl7.org/fhir/StructureDefinition/structuredefinition-compliesWithProfile';

if (!fs.existsSync(sourceDir)) {
  throw new Error(`Source directory not found: ${sourceDir}`);
}

fs.rmSync(targetDir, { recursive: true, force: true });
fs.mkdirSync(targetDir, { recursive: true });

const selected = [];

for (const entry of fs.readdirSync(sourceDir, { withFileTypes: true })) {
  if (!entry.isFile() || !entry.name.endsWith('.json')) {
    continue;
  }

  const sourcePath = path.join(sourceDir, entry.name);
  let resource;
  try {
    resource = JSON.parse(fs.readFileSync(sourcePath, 'utf8'));
  } catch (error) {
    console.warn(`Skipping non-JSON or unreadable file: ${entry.name} (${error.message})`);
    continue;
  }

  if (resource.resourceType !== 'StructureDefinition') {
    continue;
  }

  const hasCompliesWith = Array.isArray(resource.extension)
    && resource.extension.some((extension) => extension && extension.url === compliesWithUrl);

  if (!hasCompliesWith) {
    continue;
  }

  const targetPath = path.join(targetDir, entry.name);
  fs.copyFileSync(sourcePath, targetPath);
  selected.push(entry.name);
}

console.log(`Selected ${selected.length} StructureDefinition resource(s) with compliesWith extension.`);
for (const fileName of selected.sort()) {
  console.log(`- ${fileName}`);
}

if (selected.length === 0) {
  throw new Error('No StructureDefinition resources with compliesWith extension found.');
}
