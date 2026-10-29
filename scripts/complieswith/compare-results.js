'use strict';

/**
 * Vergleichslogik für CompliesWith-Ergebnisse (PTDATA-2431).
 *
 * Schlüssel ist das Paar (ISiK-Profil, Zielprofil). Je Paar: neu / behoben /
 * unverändert. Geänderte Detailzeilen bei gleichem Paar gelten als unverändert.
 *
 * Das Ergebnis eines Laufs wird als kompaktes JSON (Paare plus Metadaten) im
 * PR-Kommentar als HTML-Kommentar abgelegt, base64-kodiert, damit kein "-->"
 * aus Profil-URLs den HTML-Kommentar vorzeitig beendet.
 */

const RESULT_MARKER_START = '<!-- complieswith-result:';
const RESULT_MARKER_END = '-->';
const RESULT_VERSION = 1;

/**
 * @param {object} params
 * @param {Array<{profile: string, comparedProfile: string}>} params.entries
 * @param {object} params.meta runId, runUrl, commit, timestamp, validatorUrl, dependencies
 */
function buildCompactResult({ entries, meta }) {
  const pairs = [];
  const seen = new Set();
  for (const entry of Array.isArray(entries) ? entries : []) {
    const profile = String(entry.profile || '');
    const comparedProfile = String(entry.comparedProfile || '');
    const key = pairKey(profile, comparedProfile);
    if (seen.has(key)) {
      continue;
    }
    seen.add(key);
    pairs.push([profile, comparedProfile]);
  }
  pairs.sort((a, b) => pairKey(a[0], a[1]).localeCompare(pairKey(b[0], b[1]), 'de'));

  return {
    v: RESULT_VERSION,
    runId: meta.runId != null ? String(meta.runId) : '',
    runUrl: meta.runUrl || '',
    commit: meta.commit || '',
    timestamp: meta.timestamp || '',
    validatorUrl: meta.validatorUrl || '',
    dependencies: meta.dependencies && typeof meta.dependencies === 'object' ? meta.dependencies : {},
    pairs,
  };
}

/**
 * Baut ein kompaktes Ergebnis aus einer validation-details.json (z. B. Baseline-Artefakt).
 */
function compactResultFromDetails(details, meta) {
  return buildCompactResult({ entries: details && Array.isArray(details.entries) ? details.entries : [], meta });
}

function pairKey(profile, comparedProfile) {
  return `${profile}\u0000${comparedProfile}`;
}

function pairsToMap(result) {
  const map = new Map();
  for (const pair of result && Array.isArray(result.pairs) ? result.pairs : []) {
    if (!Array.isArray(pair) || pair.length < 2) {
      continue;
    }
    map.set(pairKey(pair[0], pair[1]), { profile: pair[0], comparedProfile: pair[1] });
  }
  return map;
}

/**
 * @returns {{added: Array, removed: Array, unchanged: Array}}
 *   added: Paare, die nur im aktuellen Ergebnis vorkommen (neue Fehler)
 *   removed: Paare, die nur in der Referenz vorkommen (behobene Fehler)
 */
function diffResults(current, reference) {
  const currentMap = pairsToMap(current);
  const referenceMap = pairsToMap(reference);
  const added = [];
  const removed = [];
  const unchanged = [];

  for (const [key, pair] of currentMap) {
    (referenceMap.has(key) ? unchanged : added).push(pair);
  }
  for (const [key, pair] of referenceMap) {
    if (!currentMap.has(key)) {
      removed.push(pair);
    }
  }

  const byKey = (a, b) => pairKey(a.profile, a.comparedProfile).localeCompare(pairKey(b.profile, b.comparedProfile), 'de');
  return { added: added.sort(byKey), removed: removed.sort(byKey), unchanged: unchanged.sort(byKey) };
}

/**
 * Hinweise, wenn sich Validator oder aufgelöste Dependency-Versionen gegenüber
 * der Referenz geändert haben (Ergebnisse können sich dann ohne Codeänderung verschieben).
 */
function environmentChanges(current, reference) {
  const changes = [];
  if (!current || !reference) {
    return changes;
  }
  if (current.validatorUrl && reference.validatorUrl && current.validatorUrl !== reference.validatorUrl) {
    changes.push(`Validator: \`${reference.validatorUrl}\` → \`${current.validatorUrl}\``);
  }
  const currentDeps = current.dependencies || {};
  const referenceDeps = reference.dependencies || {};
  if (Object.keys(referenceDeps).length === 0 || Object.keys(currentDeps).length === 0) {
    // Referenz oder aktueller Lauf ohne Dependency-Angaben (z. B. Artefakt vor PTDATA-2431):
    // kein Vergleich möglich, keine Scheinmeldungen.
    return changes;
  }
  const names = new Set([...Object.keys(currentDeps), ...Object.keys(referenceDeps)]);
  for (const name of [...names].sort()) {
    const before = referenceDeps[name];
    const after = currentDeps[name];
    if (before === undefined && after !== undefined) {
      changes.push(`Dependency \`${name}\`: neu (${after})`);
    } else if (before !== undefined && after === undefined) {
      changes.push(`Dependency \`${name}\`: entfernt (vorher ${before})`);
    } else if (before !== after) {
      changes.push(`Dependency \`${name}\`: ${before} → ${after}`);
    }
  }
  return changes;
}

function embedPersistedResult(body, result) {
  const encoded = Buffer.from(JSON.stringify(result), 'utf8').toString('base64');
  return `${stripPersistedResult(body).trimEnd()}\n\n${RESULT_MARKER_START}${encoded}${RESULT_MARKER_END}\n`;
}

function extractPersistedResult(body) {
  const text = String(body || '');
  const start = text.indexOf(RESULT_MARKER_START);
  if (start < 0) {
    return null;
  }
  const end = text.indexOf(RESULT_MARKER_END, start);
  if (end < 0) {
    return null;
  }
  const encoded = text.slice(start + RESULT_MARKER_START.length, end).trim();
  try {
    const parsed = JSON.parse(Buffer.from(encoded, 'base64').toString('utf8'));
    return parsed && Array.isArray(parsed.pairs) ? parsed : null;
  } catch {
    return null;
  }
}

function stripPersistedResult(body) {
  const text = String(body || '');
  const start = text.indexOf(RESULT_MARKER_START);
  if (start < 0) {
    return text;
  }
  const end = text.indexOf(RESULT_MARKER_END, start);
  if (end < 0) {
    return text;
  }
  return text.slice(0, start) + text.slice(end + RESULT_MARKER_END.length);
}

function shortCommit(sha) {
  return String(sha || '').slice(0, 7);
}

function describeReference(reference) {
  const parts = [];
  if (reference.commit) {
    parts.push(`Commit \`${shortCommit(reference.commit)}\``);
  }
  if (reference.runId) {
    parts.push(reference.runUrl ? `[Lauf ${reference.runId}](${reference.runUrl})` : `Lauf ${reference.runId}`);
  }
  if (reference.timestamp) {
    parts.push(`vom ${reference.timestamp.slice(0, 10)}`);
  }
  return parts.join(', ');
}

function renderPairList(pairs, limit = 100) {
  const lines = pairs.slice(0, limit).map((pair) => `  - ${pair.profile || 'Unbekanntes Profil'} → ${pair.comparedProfile}`);
  if (pairs.length > limit) {
    lines.push(`  - … und ${pairs.length - limit} weitere`);
  }
  return lines.join('\n');
}

/**
 * Rendert die Diff-Sektion (Markdown) für PR-Kommentar und Job Summary.
 * @param {object} params
 * @param {object} params.current kompaktes Ergebnis des aktuellen Laufs
 * @param {object|null} params.base kompaktes Ergebnis des Basisbranches (null = keine Baseline)
 * @param {string} params.baseRef Name des Basisbranches
 * @param {object|null} params.previous kompaktes Ergebnis des vorigen PR-Laufs (null = erster Lauf)
 * @param {boolean} params.isPullRequest
 */
function renderDiffSection({ current, base, baseRef, previous, isPullRequest }) {
  const lines = ['### Vergleich', ''];

  if (base) {
    const diff = diffResults(current, base);
    lines.push(`**Gegenüber Basis \`${baseRef}\`** (Referenz: ${describeReference(base)}):`);
    lines.push(`- Neu: **${diff.added.length}**`);
    if (diff.added.length > 0) {
      lines.push(renderPairList(diff.added));
    }
    lines.push(`- Behoben: **${diff.removed.length}**`);
    if (diff.removed.length > 0) {
      lines.push(renderPairList(diff.removed));
    }
    lines.push(`- Unverändert: ${diff.unchanged.length}`);
    const env = environmentChanges(current, base);
    if (env.length > 0) {
      lines.push('- :information_source: Werkzeugbasis gegenüber der Referenz geändert, Verschiebungen sind auch ohne Codeänderung möglich:');
      for (const change of env) {
        lines.push(`  - ${change}`);
      }
    }
  } else {
    lines.push(`**Gegenüber Basis \`${baseRef}\`:** keine Baseline gefunden (kein push-Lauf mit Artefakt auf \`${baseRef}\`). Vergleich nicht möglich; der Job wird deshalb nicht wegen CompliesWith-Fehlern rot.`);
  }
  lines.push('');

  if (isPullRequest) {
    if (previous) {
      const diff = diffResults(current, previous);
      lines.push(`**Gegenüber vorigem Lauf dieses PRs** (${describeReference(previous)}):`);
      lines.push(`- Neu: **${diff.added.length}**`);
      if (diff.added.length > 0) {
        lines.push(renderPairList(diff.added));
      }
      lines.push(`- Behoben: **${diff.removed.length}**`);
      if (diff.removed.length > 0) {
        lines.push(renderPairList(diff.removed));
      }
      lines.push(`- Unverändert: ${diff.unchanged.length}`);
      const env = environmentChanges(current, previous);
      if (env.length > 0) {
        lines.push('- :information_source: Werkzeugbasis gegenüber dem vorigen Lauf geändert:');
        for (const change of env) {
          lines.push(`  - ${change}`);
        }
      }
    } else {
      lines.push('**Gegenüber vorigem Lauf dieses PRs:** erster Lauf, kein voriger Lauf zum Vergleich.');
    }
    lines.push('');
  }

  return lines.join('\n');
}

module.exports = {
  RESULT_VERSION,
  buildCompactResult,
  compactResultFromDetails,
  diffResults,
  environmentChanges,
  embedPersistedResult,
  extractPersistedResult,
  stripPersistedResult,
  renderDiffSection,
  shortCommit,
};
