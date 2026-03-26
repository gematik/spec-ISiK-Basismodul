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

const fs = require('fs');
const path = require('path');

module.exports = async function run({ github, context, core }) {
  const pr = context.payload && context.payload.pull_request;
  if (!pr) {
    core.info('No pull_request context found; skipping PR comment.');
    return;
  }

  const marker = '<!-- complieswith-validation-report -->';
  const { owner, repo } = context.repo;
  const validationPath = 'validation.json';
  const validationHtmlPath = 'validation.html';

  if (!fs.existsSync(validationPath)) {
    await upsertComment({
      github,
      owner,
      repo,
      issueNumber: pr.number,
      marker,
      body: `${marker}
### CompliesWith validation

Es wurde keine \`validation.json\` erzeugt. Bitte den Workflow-Run prüfen.
`,
      core,
    });
    return;
  }

  const bundle = JSON.parse(fs.readFileSync(validationPath, 'utf8'));
  const issues = collectIssues(bundle)
    .filter((issue) => isError(issue.severity))
    .filter((issue) => !matchesConfiguredFilter(issue, process.env.VALIDATION_FILTERS || ''));

  const grouped = groupIssues(issues);
  const runUrl = `https://github.com/${owner}/${repo}/actions/runs/${context.runId}`;
  const htmlArtifactLine = fs.existsSync(validationHtmlPath)
    ? `HTML-Report wurde als Workflow-Artefakt erzeugt.`
    : `Kein \`validation.html\` im Workspace gefunden.`;
  const compliesWithTargets = collectExpectedCompliesWithTargets('Resources');
  const compliesWithStatus = buildCompliesWithStatus({ bundle, issues, targets: compliesWithTargets });

  let body = `${marker}
### CompliesWith validation

Run: [${context.runId}](${runUrl})
Branch: \`${pr.head.ref}\`

${htmlArtifactLine}
`;

  if (issues.length === 0) {
    body += '\nKeine ungefilterten Fehler gefunden.\n';
    await upsertComment({ github, owner, repo, issueNumber: pr.number, marker, body, core });
    return;
  }

  body += `\n${issues.length} Fehler gefunden.\n`;
  body += '\nSortierung: Profil -> verglichenes Profil.\n';
  if (compliesWithStatus) {
    body += `\n### CompliesWith Status\n\n${compliesWithStatus}\n`;
  }

  for (const profileName of Object.keys(grouped).sort(compareText)) {
    const comparedGroups = grouped[profileName];
    const profileIssues = Object.values(comparedGroups).reduce((sum, list) => sum + list.length, 0);
    const profileEntries = Object.values(comparedGroups).flat();
    if (isPureCompliesWithProfile(profileEntries)) {
      continue;
    }

    body += `\n<details>\n<summary><strong>${escapeInline(profileName)}</strong> (${profileIssues})</summary>\n\n`;

    for (const comparedName of Object.keys(comparedGroups).sort(compareText)) {
      const entries = comparedGroups[comparedName];
      body += `#### Verglichen mit: ${escapeInline(comparedName)} (${entries.length})\n\n`;
      for (const issue of entries.slice(0, 25)) {
        body += renderIssue(issue);
      }
      if (entries.length > 25) {
        body += `- ... ${entries.length - 25} weitere Fehler in dieser Gruppe\n`;
      }
      body += '\n';
    }

    body += '</details>\n';
  }

  await upsertComment({ github, owner, repo, issueNumber: pr.number, marker, body, core });
};

function collectIssues(node, results = []) {
  if (Array.isArray(node)) {
    for (const item of node) {
      collectIssues(item, results);
    }
    return results;
  }

  if (!node || typeof node !== 'object') {
    return results;
  }

  if (looksLikeIssue(node)) {
    results.push(normalizeIssue(node));
  }

  for (const value of Object.values(node)) {
    collectIssues(value, results);
  }

  return dedupeIssues(results);
}

function looksLikeIssue(node) {
  return (
    typeof node.severity === 'string' &&
    (
      typeof node.message === 'string' ||
      typeof node.text === 'string' ||
      typeof node.diagnostics === 'string' ||
      (node.details && typeof node.details.text === 'string')
    )
  );
}

function normalizeIssue(issue) {
  const extensionMap = getExtensionValueMap(issue.extension);
  const location = firstNonEmpty(
    issue.location,
    issue.expression,
    issue.path
  );
  const file = firstNonEmpty(
    issue.file,
    issue.filename,
    extensionMap['http://hl7.org/fhir/StructureDefinition/operationoutcome-file'],
    findFileName(issue),
    findFileName(location)
  );
  const message = firstNonEmpty(
    issue.message,
    issue.text,
    issue.diagnostics,
    issue.details && issue.details.text
  );
  const messageId = firstNonEmpty(
    issue.messageId,
    issue.msgId,
    issue.id,
    extensionMap['http://hl7.org/fhir/StructureDefinition/operationoutcome-message-id'],
    extractMessageId(message)
  );

  const profile = firstNonEmpty(
    issue.profile,
    issue.sourceProfile,
    extensionMap['http://hl7.org/fhir/StructureDefinition/operationoutcome-issue-context'],
    extractProfile(message, [
      /defined in the profile\s+([A-Za-z0-9:/|._-]+)/i,
      /defined in\s+([A-Za-z0-9:/|._-]+)/i,
      /conforms to profile\s+([A-Za-z0-9:/|._-]+)/i,
      /profile\s+'([^']+)'/i,
      /profile\s+"([^"]+)"/i,
      /profile\s+([A-Za-z0-9:/|._-]+)/i,
    ]),
    file,
    'Unbekanntes Profil'
  );

  const comparedProfile = firstNonEmpty(
    issue.comparedProfile,
    issue.targetProfile,
    issue.referenceProfile,
    extractProfile(message, [
      /against profile\s+'([^']+)'/i,
      /against profile\s+"([^"]+)"/i,
      /from profile\s+'([^']+)'/i,
      /from profile\s+"([^"]+)"/i,
      /profile comparison.*?:\s*([^,;]+)/i,
    ]),
    extractComparedProfileFromValidationMessage(message),
    'Allgemein'
  );

  return {
    severity: String(issue.severity || ''),
    file: stringifySingle(file),
    location: stringifySingle(location),
    message: stringifySingle(message),
    messageId: stringifySingle(messageId),
    profile: stringifySingle(profile),
    comparedProfile: stringifySingle(comparedProfile),
  };
}

function dedupeIssues(issues) {
  const seen = new Set();
  const unique = [];
  for (const issue of issues) {
    const key = [
      issue.severity,
      issue.file,
      issue.location,
      issue.messageId,
      issue.message,
    ].join('|');
    if (!seen.has(key)) {
      seen.add(key);
      unique.push(issue);
    }
  }
  return unique;
}

function isError(severity) {
  return ['error', 'fatal'].includes(String(severity || '').toLowerCase());
}

function matchesConfiguredFilter(issue, rawFilters) {
  const filters = parseFilters(rawFilters);
  return filters.some((filter) => matchesFilter(issue, filter));
}

function parseFilters(rawFilters) {
  return String(rawFilters || '')
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter((line) => line && !line.startsWith('#'))
    .map((line) => {
      const [file = '', messageId = '', details = '', location = ''] = line.split('|');
      return { file, messageId, details, location };
    });
}

function matchesFilter(issue, filter) {
  return (
    wildcardMatch(issue.file, filter.file) &&
    wildcardMatch(issue.messageId, filter.messageId) &&
    wildcardMatch(issue.message, filter.details) &&
    wildcardMatch(issue.location, filter.location)
  );
}

function wildcardMatch(value, pattern) {
  if (!pattern) {
    return true;
  }
  const escaped = pattern.replace(/[.+^${}()|[\]\\]/g, '\\$&').replace(/\*/g, '.*');
  return new RegExp(`^${escaped}$`, 'i').test(String(value || ''));
}

function groupIssues(issues) {
  const grouped = {};
  for (const issue of issues) {
    grouped[issue.profile] ??= {};
    grouped[issue.profile][issue.comparedProfile] ??= [];
    grouped[issue.profile][issue.comparedProfile].push(issue);
  }
  return grouped;
}

function renderIssue(issue) {
  const parts = [];
  if (issue.file) {
    parts.push(`Datei: \`${escapeInline(issue.file)}\``);
  }
  if (issue.location) {
    parts.push(`Pfad: \`${escapeInline(issue.location)}\``);
  }
  if (issue.messageId) {
    parts.push(`ID: \`${escapeInline(issue.messageId)}\``);
  }

  let line = `- ${escapeInline(issue.message)}`;
  if (parts.length > 0) {
    line += ` (${parts.join(', ')})`;
  }
  return `${line}\n`;
}

async function upsertComment({ github, owner, repo, issueNumber, marker, body, core }) {
  const { data: comments } = await github.rest.issues.listComments({
    owner,
    repo,
    issue_number: issueNumber,
    per_page: 100,
  });

  const existing = comments.find(
    (comment) => typeof comment.body === 'string' && comment.body.includes(marker)
  );

  if (existing) {
    await github.rest.issues.updateComment({
      owner,
      repo,
      comment_id: existing.id,
      body,
    });
    core.info(`Updated PR comment #${existing.id} on PR #${issueNumber}`);
    return;
  }

  await github.rest.issues.createComment({
    owner,
    repo,
    issue_number: issueNumber,
    body,
  });
  core.info(`Created PR comment on PR #${issueNumber}`);
}

function firstNonEmpty(...values) {
  for (const value of values) {
    if (Array.isArray(value) && value.length > 0) {
      const first = stringifySingle(value[0]);
      if (first) {
        return first;
      }
    }
    const normalized = stringifySingle(value);
    if (normalized) {
      return normalized;
    }
  }
  return '';
}

function stringifySingle(value) {
  if (value === null || value === undefined) {
    return '';
  }
  if (typeof value === 'string') {
    return value.trim();
  }
  if (typeof value === 'number' || typeof value === 'boolean') {
    return String(value);
  }
  return '';
}

function findFileName(value) {
  const text = stringifySingle(value);
  if (!text) {
    return '';
  }
  const match = text.match(/([A-Za-z0-9_.-]+\.(json|xml|ttl))/i);
  return match ? match[1] : '';
}

function extractMessageId(message) {
  const text = stringifySingle(message);
  if (!text) {
    return '';
  }
  const match = text.match(/\b([A-Z][A-Za-z0-9]+(?:_[A-Za-z0-9]+)+)\b/);
  return match ? match[1] : '';
}

function extractProfile(message, patterns) {
  const text = stringifySingle(message);
  for (const pattern of patterns) {
    const match = text.match(pattern);
    if (match && match[1]) {
      return match[1].trim();
    }
  }
  return '';
}

function extractComparedProfileFromValidationMessage(message) {
  const text = stringifySingle(message);
  const canonicalMatches = [...text.matchAll(/https?:\/\/[^\s)'",]+/g)].map((match) => match[0]);
  if (canonicalMatches.length >= 2) {
    return canonicalMatches[1];
  }
  if (canonicalMatches.length === 1) {
    return canonicalMatches[0];
  }
  return '';
}

function compareText(a, b) {
  return a.localeCompare(b, 'de');
}

function escapeInline(value) {
  return String(value || '').replace(/`/g, '\\`');
}

function collectExpectedCompliesWithTargets(rootDir) {
  const targets = new Set();
  if (!fs.existsSync(rootDir)) {
    return [];
  }

  walkFiles(rootDir, (filePath) => {
    if (!filePath.endsWith('.fsh')) {
      return;
    }
    const content = fs.readFileSync(filePath, 'utf8');
    for (const match of content.matchAll(/^\s*(?:\/\/\s*)?\*\s+insert\s+CompliesWith\(([^)]+)\)\s*$/gm)) {
      const canonical = (match[1] || '').trim();
      if (canonical) {
        targets.add(canonical);
      }
    }
  });

  return [...targets].sort(compareText);
}

function walkFiles(dir, visit) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      walkFiles(fullPath, visit);
    } else if (entry.isFile()) {
      visit(fullPath);
    }
  }
}

function buildCompliesWithStatus({ bundle, issues, targets }) {
  if (!Array.isArray(targets) || targets.length === 0) {
    return '';
  }

  const fileIssues = buildIssuesByFile(bundle);
  const failedIssues = [];
  for (const [file, candidates] of fileIssues.entries()) {
    for (const candidate of candidates) {
      if (candidate.messageId === 'SD_EXTENSION_COMPLIES_WITH_ERROR' && (candidate.comparedProfile || candidate.profile)) {
        failedIssues.push({ ...candidate, file });
      }
    }
  }
  const failed = new Set(
    failedIssues.map((issue) => issue.comparedProfile || issue.profile)
  );
  const additionalDetails = collectCompliesWithAdditionalDetails(fileIssues, failedIssues);

  return targets
    .map((target) => {
      const lines = [`- ${escapeInline(target)} ${failed.has(target) ? '❌' : '✅'}`];
      for (const detail of additionalDetails.get(target) || []) {
        lines.push(`  - ${escapeInline(detail)}`);
      }
      return lines.join('\n');
    })
    .join('\n');
}

function isPureCompliesWithProfile(entries) {
  return entries.every((issue) => issue.messageId === 'SD_EXTENSION_COMPLIES_WITH_ERROR');
}

function collectCompliesWithAdditionalDetails(fileIssues, failedIssues) {
  const detailsByTarget = new Map();

  for (const issue of failedIssues) {
    const target = issue.comparedProfile || issue.profile;
    if (!target || !issue.file) {
      continue;
    }

    const candidates = (fileIssues.get(issue.file) || [])
      .filter((candidate) => candidate.messageId !== 'SD_EXTENSION_COMPLIES_WITH_ERROR')
      .filter((candidate) => !isNoiseIssue(candidate))
      .map(formatAdditionalDetail);

    const unique = [...new Set(candidates)].slice(0, 5);
    if (unique.length > 0) {
      detailsByTarget.set(target, unique);
    }
  }

  return detailsByTarget;
}

function buildIssuesByFile(bundle) {
  const byFile = new Map();
  const entries = Array.isArray(bundle && bundle.entry) ? bundle.entry : [];

  for (const entry of entries) {
    const resource = entry && entry.resource;
    if (!resource || resource.resourceType !== 'OperationOutcome') {
      continue;
    }

    const file = getOperationOutcomeFile(resource);
    if (!file) {
      continue;
    }

    const issues = Array.isArray(resource.issue) ? resource.issue : [];
    for (const rawIssue of issues) {
      const normalized = normalizeIssue(rawIssue);
      if (!byFile.has(file)) {
        byFile.set(file, []);
      }
      byFile.get(file).push({
        ...normalized,
        file,
      });
    }
  }

  return byFile;
}

function getOperationOutcomeFile(resource) {
  const extensions = Array.isArray(resource && resource.extension) ? resource.extension : [];
  for (const extension of extensions) {
    if (
      extension &&
      extension.url === 'http://hl7.org/fhir/StructureDefinition/operationoutcome-file' &&
      typeof extension.valueString === 'string'
    ) {
      return extension.valueString.trim();
    }
  }
  return '';
}

function isNoiseIssue(issue) {
  const noisyIds = new Set([
    'VALIDATION_VAL_PROFILE_SIGNPOST',
    'VALIDATION_VAL_PROFILE_SIGNPOST_META',
    'VALIDATION_VAL_PROFILE_SIGNPOST_OBS',
    'VALUESET_CODE_CONCEPT_HINT',
    'MSG_DRAFT',
    'NO_VALID_DISPLAY_FOUND_NONE_FOR_LANG_OK',
  ]);

  if (noisyIds.has(issue.messageId)) {
    return true;
  }

  return false;
}

function formatAdditionalDetail(issue) {
  const parts = [];
  if (issue.location) {
    parts.push(`Pfad: ${issue.location}`);
  }
  if (issue.messageId) {
    parts.push(`ID: ${issue.messageId}`);
  }

  if (parts.length === 0) {
    return issue.message;
  }

  return `${issue.message} (${parts.join(', ')})`;
}

function getExtensionValueMap(extensions) {
  const values = {};
  if (!Array.isArray(extensions)) {
    return values;
  }

  for (const extension of extensions) {
    if (!extension || typeof extension !== 'object' || !extension.url) {
      continue;
    }

    for (const [key, value] of Object.entries(extension)) {
      if (key.startsWith('value')) {
        const normalized = stringifySingle(value);
        if (normalized) {
          values[extension.url] = normalized;
          break;
        }
      }
    }
  }

  return values;
}
