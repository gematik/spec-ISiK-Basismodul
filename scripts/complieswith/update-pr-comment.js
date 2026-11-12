'use strict';

/**
 * Report-Step des CompliesWith-Workflows.
 *
 * - liest validation-details.json (Fallback: Rohlog) und baut den Report
 * - vergleicht mit der Baseline des Base-Branches (Artefakt, siehe find-baseline-run.js)
 *   und mit dem vorigen Lauf desselben PRs (JSON im bestehenden PR-Kommentar)
 * - schreibt die Job Summary, bei pull_request zusätzlich den PR-Kommentar
 *   (Diff-Sektion vor der vollständigen Liste, kompaktes Ergebnis als HTML-Kommentar)
 * - schreibt complieswith-result.json (kompaktes Ergebnis, wird als Artefakt hochgeladen)
 * - setzt Outputs für den Fail-Step: infra_error, has_baseline, new_errors_vs_base, error_count
 *
 * Env: VALIDATOR_OUTCOME, VALIDATOR_URL, BASE_REF, BASELINE_FOUND, BASELINE_RUN_ID,
 *      BASELINE_RUN_URL, BASELINE_HEAD_SHA, BASELINE_CREATED_AT, BASELINE_DIR
 */

const fs = require('fs');
const path = require('path');
const { buildClaimIndexFromDir, parseCompliesWithEntries } = require('./parse-validator-log');
const {
  buildCompactResult,
  compactResultFromDetails,
  diffResults,
  embedPersistedResult,
  extractPersistedResult,
  renderDiffSection,
} = require('./compare-results');

const MARKER = '<!-- complieswith-validation-report -->';
const RESULT_FILE = 'complieswith-result.json';
const DEPENDENCY_VERSIONS_FILE = 'dependency-versions.json';

module.exports = async function run({ github, context, core }) {
  const pr = context.payload && context.payload.pull_request;
  const isPullRequest = Boolean(pr);
  const { owner, repo } = context.repo;
  const runUrl = `https://github.com/${owner}/${repo}/actions/runs/${context.runId}`;
  const baseRef = isPullRequest ? pr.base.ref : (process.env.BASE_REF || '');
  const branch = isPullRequest ? pr.head.ref : (context.ref || '').replace(/^refs\/heads\//, '');
  const commit = isPullRequest ? pr.head.sha : context.sha;

  const detailsPath = path.resolve('validation-details.json');
  const rawLogPath = path.resolve('validation-raw.log');
  const claimIndex = buildClaimIndexFromDir('Resources/fsh-generated/complieswith-validation');

  let report = { entries: [] };
  if (fs.existsSync(detailsPath)) {
    report = JSON.parse(fs.readFileSync(detailsPath, 'utf8'));
  }
  let entries = Array.isArray(report.entries) ? report.entries : [];
  if (entries.length === 0 && fs.existsSync(rawLogPath)) {
    entries = parseCompliesWithEntries(fs.readFileSync(rawLogPath, 'utf8'), claimIndex);
  }

  const validatorFailed = process.env.VALIDATOR_OUTCOME === 'failure';
  const noOutputs = !fs.existsSync(rawLogPath) && !fs.existsSync(detailsPath);
  const infraError = noOutputs || (validatorFailed && (report.fatalExecutionError === true || entries.length === 0));

  const current = buildCompactResult({
    entries,
    meta: {
      runId: context.runId,
      runUrl,
      commit,
      timestamp: new Date().toISOString(),
      validatorUrl: process.env.VALIDATOR_URL || '',
      dependencies: readJsonIfExists(path.resolve(DEPENDENCY_VERSIONS_FILE)) || {},
    },
  });
  fs.writeFileSync(path.resolve(RESULT_FILE), `${JSON.stringify(current, null, 2)}\n`);

  const base = loadBaseline();
  let existing = null;
  let previous = null;
  if (isPullRequest) {
    existing = await findExistingComment({ github, owner, repo, issueNumber: pr.number, marker: MARKER });
    previous = existing ? extractPersistedResult(existing.body) : null;
  }

  const newVsBase = base ? diffResults(current, base).added.length : 0;
  core.setOutput('infra_error', String(infraError));
  core.setOutput('has_baseline', String(Boolean(base)));
  core.setOutput('new_errors_vs_base', String(newVsBase));
  core.setOutput('error_count', String(entries.length));

  const targets = collectExpectedCompliesWithTargets('Resources');
  const failedTargets = new Set(entries.map((entry) => entry.comparedProfile).filter(Boolean));

  let header = `### CompliesWith validation

Run: [${context.runId}](${runUrl})
Branch: \`${branch}\`${isPullRequest ? ` → \`${baseRef}\`` : ''}
Commit: \`${String(commit).slice(0, 7)}\`
`;

  if (noOutputs) {
    header += '\nEs wurde weder eine auswertbare `validation-details.json` noch ein `validation-raw.log` gefunden. Bitte den Workflow-Run prüfen.\n';
    await writeSummary(core, header);
    if (isPullRequest) {
      await upsertComment({ github, owner, repo, issueNumber: pr.number, existing, body: `${MARKER}\n${header}`, core });
    }
    return;
  }

  header += `Rohlog: ${fs.existsSync(rawLogPath) ? 'vorhanden und als Artefakt hochgeladen.' : 'nicht im Workspace gefunden.'}\n`;

  let statusSection = '';
  if (targets.length > 0) {
    statusSection += '\n### CompliesWith Status\n\n';
    statusSection += targets
      .map((target) => `- ${escapeInline(target)} ${infraError ? '❔' : failedTargets.has(target) ? '❌' : '✅'}`)
      .join('\n');
    statusSection += '\n';
  }

  if (infraError) {
    const text = `${header}\n:warning: Der Validator-Lauf ist fehlgeschlagen, es konnten keine CompliesWith-Fehler ausgewertet werden. Das Ergebnis ist nicht aussagekräftig – bitte den Workflow-Run prüfen. Der Job wird rot (Infrastrukturfehler).\n${statusSection}`;
    await writeSummary(core, text);
    if (isPullRequest) {
      await upsertComment({ github, owner, repo, issueNumber: pr.number, existing, body: `${MARKER}\n${text}`, core });
    }
    return;
  }

  const resultLine = entries.length === 0
    ? '\n**Keine CompliesWith-Fehler gefunden.**\n'
    : `\n**${entries.length} CompliesWith-Fehler gefunden**${base ? `, davon **${newVsBase} neu** gegenüber \`${baseRef}\`` : ''}.\n`;
  const gateLine = isPullRequest
    ? '\nDer Job wird nur rot, wenn gegenüber der Basis neue CompliesWith-Fehler hinzugekommen sind, oder bei Infrastrukturfehlern.\n'
    : '\nReferenzlauf auf dem Hauptbranch: Das Ergebnis dient als Baseline für den Vergleich in PR-Kommentaren. Der Job wird nur bei Infrastrukturfehlern rot.\n';
  const diffSection = isPullRequest
    ? `\n${renderDiffSection({ current, base, baseRef, previous, isPullRequest })}`
    : '';

  await writeSummary(core, `${header}${resultLine}${gateLine}${diffSection}${statusSection}`);

  if (!isPullRequest) {
    core.info('No pull_request context; job summary written, no PR comment.');
    return;
  }

  let body = `${MARKER}\n${header}${resultLine}${gateLine}${diffSection}${statusSection}`;

  if (entries.length > 0) {
    const grouped = groupEntries(entries);
    body += '\n### Vollständige Fehlerliste\n';
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
  }

  body = embedPersistedResult(body, current);
  await upsertComment({ github, owner, repo, issueNumber: pr.number, existing, body, core });
};

function loadBaseline() {
  if (process.env.BASELINE_FOUND !== 'true') {
    return null;
  }
  const dir = path.resolve(process.env.BASELINE_DIR || 'baseline');
  const meta = {
    runId: process.env.BASELINE_RUN_ID || '',
    runUrl: process.env.BASELINE_RUN_URL || '',
    commit: process.env.BASELINE_HEAD_SHA || '',
    timestamp: process.env.BASELINE_CREATED_AT || '',
  };
  // Bevorzugt das kompakte Ergebnis (enthält Validator-URL und Dependency-Versionen),
  // sonst validation-details.json (Artefakte vor PTDATA-2431).
  const compact = readJsonIfExists(path.join(dir, RESULT_FILE));
  if (compact && Array.isArray(compact.pairs)) {
    return { ...compact, ...Object.fromEntries(Object.entries(meta).filter(([, value]) => value)) };
  }
  const details = readJsonIfExists(path.join(dir, 'validation-details.json'));
  if (details && Array.isArray(details.entries)) {
    return compactResultFromDetails(details, meta);
  }
  return null;
}

function readJsonIfExists(filePath) {
  if (!fs.existsSync(filePath)) {
    return null;
  }
  try {
    return JSON.parse(fs.readFileSync(filePath, 'utf8'));
  } catch {
    return null;
  }
}

async function writeSummary(core, markdown) {
  if (core && core.summary && typeof core.summary.addRaw === 'function') {
    await core.summary.addRaw(markdown, true).write();
  }
}

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

async function findExistingComment({ github, owner, repo, issueNumber, marker }) {
  const comments = await github.paginate(github.rest.issues.listComments, {
    owner,
    repo,
    issue_number: issueNumber,
    per_page: 100,
  });
  return comments.find((comment) => typeof comment.body === 'string' && comment.body.includes(marker)) || null;
}

async function upsertComment({ github, owner, repo, issueNumber, existing, body, core }) {
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
