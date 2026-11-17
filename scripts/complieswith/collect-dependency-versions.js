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

/**
 * Ermittelt die tatsächlich aufgelösten Versionen der CompliesWith-Pakete aus
 * dem FHIR-Package-Cache (PTDATA-2431, Hinweis bei geänderter Werkzeugbasis).
 *
 * Für "#current"-Pakete steht im Cache die konkrete Build-Version samt Datum,
 * sodass Verschiebungen ohne Codeänderung im PR-Kommentar erkennbar werden.
 *
 * Env:
 *   COMPLIESWITH_DEPENDENCIES  Zeilen "name#version" (wie im Workflow)
 *   FHIR_PACKAGE_CACHE         optional, Standard ~/.fhir/packages
 *   OUTPUT_PATH                optional, Standard dependency-versions.json
 */

const fs = require('fs');
const os = require('os');
const path = require('path');

function main() {
  const raw = process.env.COMPLIESWITH_DEPENDENCIES || '';
  const cacheDir = process.env.FHIR_PACKAGE_CACHE || path.join(os.homedir(), '.fhir', 'packages');
  const outputPath = path.resolve(process.cwd(), process.env.OUTPUT_PATH || 'dependency-versions.json');

  const requested = raw
    .split('\n')
    .map((line) => line.trim())
    .filter((line) => line && line.includes('#'));

  const resolved = {};
  for (const spec of requested) {
    const [name, version] = spec.split('#');
    resolved[name] = resolvePackageVersion(cacheDir, name, version);
  }

  fs.writeFileSync(outputPath, `${JSON.stringify(resolved, null, 2)}\n`);
  for (const [name, version] of Object.entries(resolved)) {
    process.stdout.write(`${name}: ${version}\n`);
  }
}

function resolvePackageVersion(cacheDir, name, requestedVersion) {
  const packageJsonPath = path.join(cacheDir, `${name}#${requestedVersion}`, 'package', 'package.json');
  if (!fs.existsSync(packageJsonPath)) {
    return `${requestedVersion} (nicht im Cache)`;
  }
  try {
    const pkg = JSON.parse(fs.readFileSync(packageJsonPath, 'utf8'));
    const version = pkg.version || requestedVersion;
    const isFloating = /^(current|dev)$/i.test(requestedVersion);
    if (isFloating) {
      return pkg.date ? `${version} (${pkg.date})` : version;
    }
    return version;
  } catch {
    return `${requestedVersion} (package.json nicht lesbar)`;
  }
}

main();
