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
  const detailsPath = path.resolve('validation-details.json');
  const rawLogPath = path.resolve('validation-raw.log');
  const runUrl = `https://github.com/${owner}/${repo}/actions/runs/${context.runId}`;

  if (!fs.existsSync(detailsPath)) {
    await upsertComment({
      github,
      owner,
      repo,
      issueNumber: pr.number,
      marker,
      body: `${marker}
### CompliesWith validation

Run: [${context.runId}](${runUrl})
Branch: \`${pr.head.ref}\`

Es wurde keine \`validation-details.json\` erzeugt. Bitte den Workflow-Run prüfen.
`,
      core,
    });
    return;
  }

  const report = JSON.parse(fs.readFileSync(detailsPath, 'utf8'));
  const targets = collectExpectedCompliesWithTargets('Resources');
  const entries = Array.isArray(report.entries) ? report.entries : [];
  const failedTargets = new Set(entries.map((entry) => entry.comparedProfile).filter(Boolean));

  let body = `${marker}
### CompliesWith validation

Run: [${context.runId}](${runUrl})
Branch: \`${pr.head.ref}\`

Rohlog: ${fs.existsSync(rawLogPath) ? 'vorhanden und als Artefakt hochgeladen.' : 'nicht im Workspace gefunden.'}
`;

  if (targets.length > 0) {
    body += '\n### CompliesWith Status\n\n';
    body += targets
      .map((target) => `- ${escapeInline(target)} ${failedTargets.has(target) ? '❌' : '✅'}`)
      .join('\n');
    body += '\n';
  }

  if (entries.length === 0) {
    body += '\nKeine CompliesWith-Fehler gefunden.\n';
    await upsertComment({ github, owner, repo, issueNumber: pr.number, marker, body, core });
    return;
  }

  const grouped = groupEntries(entries);
  body += `\n${entries.length} CompliesWith-Fehler gefunden.\n`;
  body += '\nSortierung: Profil -> verglichenes Profil.\n';

  for (const profile of Object.keys(grouped).sort(compareText)) {
    const comparedGroups = grouped[profile];
    const count = Object.values(comparedGroups).reduce((sum, list) => sum + list.length, 0);
    body += `\n<details>\n<summary><strong>${escapeInline(profile)}</strong> (${count})</summary>\n\n`;

    for (const comparedProfile of Object.keys(comparedGroups).sort(compareText)) {
      const issues = comparedGroups[comparedProfile];
      body += `#### Verglichen mit: ${escapeInline(comparedProfile)} (${issues.length})\n\n`;
      for (const issue of issues) {
        body += renderEntry(issue);
      }
      body += '\n';
    }

    body += '</details>\n';
  }

  await upsertComment({ github, owner, repo, issueNumber: pr.number, marker, body, core });
};

function groupEntries(entries) {
  const grouped = {};
  for (const entry of entries) {
    const profile = entry.profile || 'Unbekanntes Profil';
    const comparedProfile = entry.comparedProfile || 'Unbekanntes Zielprofil';
    grouped[profile] ??= {};
    grouped[profile][comparedProfile] ??= [];
    grouped[profile][comparedProfile].push(entry);
  }
  return grouped;
}

function renderEntry(entry) {
  const parts = [];
  if (entry.file) {
    parts.push(`Datei: \`${escapeInline(entry.file)}\``);
  }
  if (entry.messageId) {
    parts.push(`ID: \`${escapeInline(entry.messageId)}\``);
  }

  let text = `- ${escapeInline(entry.summary || 'CompliesWith-Fehler')}`;
  if (parts.length > 0) {
    text += ` (${parts.join(', ')})`;
  }
  text += '\n';

  for (const detail of Array.isArray(entry.details) ? entry.details : []) {
    text += `  - ${escapeInline(detail)}\n`;
  }

  return text;
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

function compareText(a, b) {
  return String(a || '').localeCompare(String(b || ''), 'de');
}

function escapeInline(value) {
  return String(value || '').replace(/`/g, '\\`');
}
