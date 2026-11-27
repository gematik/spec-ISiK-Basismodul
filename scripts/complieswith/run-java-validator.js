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
const { spawnSync } = require('child_process');
const {
  stripAnsi,
  buildClaimIndexFromFiles,
  countCompliesWithMessages,
  parseCompliesWithEntries,
} = require('./parse-validator-log');

const EXCLUDED_PACKAGES = new Set([
  'bfarm.terminologien.icd10gm',
  'bfarm.terminologien.ops',
]);

function main() {
  const root = process.cwd();
  const validatorJar = requiredEnv('VALIDATOR_JAR');
  const validationDir = path.resolve(root, process.env.VALIDATION_DIR || 'Resources/fsh-generated/complieswith-validation');
  const resolutionContextDir = path.resolve(root, process.env.RESOLUTION_CONTEXT_DIR || 'Resources/fsh-generated/resources');
  const advisorFile = path.resolve(root, process.env.ADVISOR_FILE || 'validator/advisor.json');
  const rawLogPath = path.resolve(root, process.env.RAW_LOG_PATH || 'validation-raw.log');
  const detailsPath = path.resolve(root, process.env.DETAILS_JSON_PATH || 'validation-details.json');
  const htmlOutputPath = process.env.HTML_OUTPUT_PATH ? path.resolve(root, process.env.HTML_OUTPUT_PATH) : null;

  const packageJson = JSON.parse(fs.readFileSync(path.resolve(root, 'package.json'), 'utf8'));
  const fhirVersion = getFhirVersion(packageJson);
  const dependencies = buildDependencyArgs(packageJson);
  const localIgArgs = ['-ig', validationDir, '-ig', resolutionContextDir];
  const baseArgs = [
    '-jar',
    validatorJar,
    '-version',
    fhirVersion,
    '-allow-example-urls',
    'true',
    '-verbose',
    '-language',
    'de',
    '-jurisdiction',
    'de',
    '-display-issues-are-warnings',
    '-advisor-file',
    advisorFile,
    '-resolution-context',
    `file:${resolutionContextDir}/`,
    ...(htmlOutputPath ? ['-html-output', htmlOutputPath] : []),
    ...dependencies,
    ...localIgArgs,
  ];

  const files = fs.readdirSync(validationDir)
    .filter((name) => name.endsWith('.json'))
    .sort((a, b) => a.localeCompare(b, 'de'));

  if (files.length === 0) {
    throw new Error(`No validation targets found in ${validationDir}`);
  }

  const filePaths = files.map((fileName) => path.join(validationDir, fileName));
  const claimIndex = buildClaimIndexFromFiles(filePaths);

  const result = spawnSync('java', [...baseArgs, ...filePaths], {
    cwd: root,
    encoding: 'utf8',
    maxBuffer: 1024 * 1024 * 200,
  });

  const stdout = result.stdout || '';
  const stderr = result.stderr || '';
  const combined = [stdout, stderr].filter(Boolean).join(stdout && stderr ? '\n' : '');
  const normalized = stripAnsi(combined);
  const fatalExecutionError = Boolean(result.error || looksLikeFatalExecutionError(combined));
  const entries = parseCompliesWithEntries(normalized, claimIndex);
  const messageCount = countCompliesWithMessages(normalized);

  fs.writeFileSync(rawLogPath, `${combined.trimEnd()}\n`);
  fs.writeFileSync(detailsPath, `${JSON.stringify({
    fhirVersion,
    generatedAt: new Date().toISOString(),
    fatalExecutionError,
    messageCount,
    entries,
  }, null, 2)}\n`);

  process.stdout.write(`Validated ${files.length} file(s) in one Java validator run.\n`);
  process.stdout.write(`Found ${entries.length} CompliesWith error(s) (${messageCount} message(s) in raw log).\n`);
  if (entries.length !== messageCount) {
    process.stdout.write(`::warning title=CompliesWith::Anzahl der Einträge (${entries.length}) weicht von der Anzahl der CompliesWith-Meldungen im Rohlog (${messageCount}) ab.\n`);
  }

  if (fatalExecutionError) {
    process.exitCode = 2;
    return;
  }

  if (entries.length > 0) {
    process.exitCode = 1;
  }
}

function requiredEnv(name) {
  const value = process.env[name];
  if (!value) {
    throw new Error(`Missing required environment variable ${name}`);
  }
  return value;
}

function getFhirVersion(packageJson) {
  const versions = Array.isArray(packageJson && packageJson.fhirVersions) ? packageJson.fhirVersions : [];
  const version = versions.find((item) => typeof item === 'string' && item.trim());
  if (!version) {
    throw new Error('package.json does not contain a usable fhirVersions entry.');
  }
  return version.trim();
}

function buildDependencyArgs(packageJson) {
  const merged = {
    ...(packageJson.dependencies || {}),
    ...(packageJson.devDependencies || {}),
  };
  const corePackage = getCorePackageForVersion(getFhirVersion(packageJson));
  const args = [];

  for (const [pkg, version] of Object.entries(merged).sort((a, b) => a[0].localeCompare(b[0], 'de'))) {
    if (!pkg || !version || pkg === corePackage || EXCLUDED_PACKAGES.has(pkg)) {
      continue;
    }
    args.push('-ig', `${pkg}#${version}`);
  }

  return args;
}

function getCorePackageForVersion(version) {
  switch (version) {
    case '3.0.2':
      return 'hl7.fhir.r3.core';
    case '4.0.1':
      return 'hl7.fhir.r4.core';
    case '4.1.0':
      return 'hl7.fhir.r4b.core';
    case '4.6.0':
    case '5.0.0':
      return 'hl7.fhir.r5.core';
    default:
      return '';
  }
}

function looksLikeFatalExecutionError(content) {
  const text = stripAnsi(String(content || ''));
  return [
    'Error: Unable to access jarfile',
    'Could not find or load main class',
    'Exception in thread "main"',
    'No such file or directory',
    'Unable to resolve package id',
  ].some((pattern) => text.includes(pattern));
}

main();
