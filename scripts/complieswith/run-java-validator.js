'use strict';

const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');

const COMPLIES_WITH_URL = 'http://hl7.org/fhir/StructureDefinition/structuredefinition-compliesWithProfile';
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
    '-language',
    'de',
    '-jurisdiction',
    'de',
    '-display-issues-are-warnings',
    '-advisor-file',
    advisorFile,
    '-resolution-context',
    `file:${resolutionContextDir}/`,
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
  const metadataByFile = new Map();
  const claimIndex = buildClaimIndex(filePaths, metadataByFile);

  const result = spawnSync('java', [...baseArgs, ...filePaths], {
    cwd: root,
    encoding: 'utf8',
    maxBuffer: 1024 * 1024 * 200,
  });

  const stdout = result.stdout || '';
  const stderr = result.stderr || '';
  const combined = [stdout, stderr].filter(Boolean).join(stdout && stderr ? '\n' : '');
  const fatalExecutionError = Boolean(result.error || looksLikeFatalExecutionError(combined));
  const entries = extractCompliesWithEntries({
    content: combined,
    claimIndex,
  });

  fs.writeFileSync(rawLogPath, `${combined.trimEnd()}\n`);
  fs.writeFileSync(detailsPath, `${JSON.stringify({
    fhirVersion,
    generatedAt: new Date().toISOString(),
    entries,
  }, null, 2)}\n`);

  process.stdout.write(`Validated ${files.length} file(s) in one Java validator run.\n`);
  process.stdout.write(`Found ${entries.length} CompliesWith error(s).\n`);

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

function readStructureDefinitionMetadata(filePath) {
  const resource = JSON.parse(fs.readFileSync(filePath, 'utf8'));
  const extensions = Array.isArray(resource.extension) ? resource.extension : [];
  const claimedProfiles = extensions
    .filter((extension) => extension && extension.url === COMPLIES_WITH_URL)
    .map((extension) => extension.valueCanonical || extension.valueUri || extension.valueUrl || '')
    .filter(Boolean);

  return {
    file: path.basename(filePath),
    profile: resource.url || resource.name || path.basename(filePath),
    claimedProfiles,
  };
}

function buildClaimIndex(filePaths, metadataByFile) {
  const claimIndex = new Map();

  for (const filePath of filePaths) {
    const metadata = readStructureDefinitionMetadata(filePath);
    metadataByFile.set(metadata.file, metadata);
    for (const claimedProfile of metadata.claimedProfiles) {
      if (!claimIndex.has(claimedProfile)) {
        claimIndex.set(claimedProfile, []);
      }
      claimIndex.get(claimedProfile).push(metadata);
    }
  }

  return claimIndex;
}

function extractCompliesWithEntries({ content, claimIndex }) {
  const lines = String(content || '').replace(/\r\n/g, '\n').split('\n');
  const entries = [];
  let currentFile = '';

  for (let i = 0; i < lines.length; i += 1) {
    const line = stripAnsi(lines[i]);
    const fileMatch = line.match(/Validate\s+.*\/([^/\s]+\.json)\s*$/);
    if (fileMatch) {
      currentFile = fileMatch[1].trim();
      continue;
    }

    const match = line.match(/Error @ StructureDefinition: This profile does not comply with claimed profile '([^']+)' \{(SD_EXTENSION_COMPLIES_WITH_ERROR)\}/);
    if (!match) {
      continue;
    }

    const comparedProfile = match[1].trim();
    const details = [];
    const source = resolveSourceMetadata({ comparedProfile, currentFile, claimIndex, details });
    let j = i + 1;
    while (j < lines.length) {
      const next = stripAnsi(lines[j]);
      if (!next.trim()) {
        j += 1;
        continue;
      }
      if (/^\S/.test(next)) {
        break;
      }
      details.push(next.trim());
      j += 1;
    }

    entries.push({
      file: source.file,
      profile: source.profile,
      comparedProfile,
      messageId: match[2],
      summary: `Dieses Profil erfüllt das deklarierte Profil nicht: ${comparedProfile}`,
      details: details.length > 0 ? details : fallbackDetails(comparedProfile, source.claimedProfiles),
    });

    i = j - 1;
  }

  return entries;
}

function resolveSourceMetadata(comparedProfile, claimIndex, details) {
  if (typeof comparedProfile === 'object' && comparedProfile !== null) {
    return resolveSourceMetadataFromContext(comparedProfile);
  }
  return resolveSourceMetadataFromContext({ comparedProfile, currentFile: '', claimIndex, details });
}

function resolveSourceMetadataFromContext({ comparedProfile, currentFile, claimIndex, details }) {
  const candidates = claimIndex.get(comparedProfile) || [];
  if (currentFile) {
    const exact = candidates.find((candidate) => candidate.file === currentFile);
    if (exact) {
      return exact;
    }
  }
  if (candidates.length === 1) {
    return candidates[0];
  }
  if (candidates.length > 1) {
    details.push(`Zuordnung nicht eindeutig: ${candidates.length} Profile deklarieren dieses claimed profile.`);
  } else {
    details.push('Quellprofil konnte aus dem Sammellog nicht eindeutig zugeordnet werden.');
  }

  return {
    file: '',
    profile: 'Unbekanntes Profil',
    claimedProfiles: [],
  };
}

function fallbackDetails(comparedProfile, claimedProfiles) {
  if (claimedProfiles.includes(comparedProfile)) {
    return ['Keine zusätzlichen Detailzeilen im Validator-Log gefunden.'];
  }
  return ['Das Zielprofil wurde im Validator-Log gefunden, konnte aber nicht sicher den deklarierten Claims dieser Datei zugeordnet werden.'];
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

function stripAnsi(text) {
  return String(text || '').replace(/\u001b\[[0-9;]*m/g, '');
}

main();
