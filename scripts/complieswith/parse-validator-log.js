'use strict';

/**
 * Gemeinsamer Parser für das Rohlog des Java-Validators (CompliesWith-Lauf).
 *
 * Wird von run-java-validator.js (Erzeugung von validation-details.json) und
 * update-pr-comment.js (Fallback, falls die JSON-Datei fehlt oder leer ist)
 * verwendet, damit beide Stellen dieselben Einträge liefern.
 *
 * Ein Eintrag entspricht genau einer Meldung
 * "This profile does not comply with claimed profile '<Zielprofil>'" im Rohlog,
 * dedupliziert nach dem Paar (ISiK-Profil, Zielprofil).
 */

const fs = require('fs');
const path = require('path');

const COMPLIES_WITH_URL = 'http://hl7.org/fhir/StructureDefinition/structuredefinition-compliesWithProfile';
const COMPLIES_WITH_MESSAGE_ID = 'SD_EXTENSION_COMPLIES_WITH_ERROR';

const SECTION_HEADER_PATTERN = /--\s+.*\/([^/\s]+\.json)\s+-+$/;
const VALIDATE_LINE_PATTERN = /Validate\s+.*\/([^/\s]+\.json)\s*$/;
const COMPLIES_WITH_PATTERN = /Error @ StructureDefinition: This profile does not comply with claimed profile '([^']+)'(?:\s+because:.+?)?\s*\{(SD_EXTENSION_COMPLIES_WITH_ERROR)\}/;
// Jede Validator-Meldung beginnt (eingerückt) mit Severity und "@". Eine solche
// Zeile beendet die Detail-Sammlung des vorherigen Eintrags.
const MESSAGE_START_PATTERN = /^\s*(Error|Warning|Information|Fatal)\s+@/;

function stripAnsi(text) {
  return String(text || '').replace(/\u001b\[[0-9;]*[ -/]*[@-~]/g, '');
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

/**
 * Baut den Index "claimed profile -> [Metadaten der ISiK-Profile, die es deklarieren]".
 * @param {Array<{file: string, profile: string, claimedProfiles: string[]}>} metadataList
 */
function buildClaimIndex(metadataList) {
  const claimIndex = new Map();
  for (const metadata of metadataList) {
    for (const claimedProfile of metadata.claimedProfiles) {
      if (!claimIndex.has(claimedProfile)) {
        claimIndex.set(claimedProfile, []);
      }
      claimIndex.get(claimedProfile).push(metadata);
    }
  }
  return claimIndex;
}

function buildClaimIndexFromFiles(filePaths) {
  return buildClaimIndex(filePaths.map(readStructureDefinitionMetadata));
}

function buildClaimIndexFromDir(dir) {
  if (!fs.existsSync(dir)) {
    return new Map();
  }
  const metadataList = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (!entry.isFile() || !entry.name.endsWith('.json')) {
      continue;
    }
    try {
      metadataList.push(readStructureDefinitionMetadata(path.join(dir, entry.name)));
    } catch {
      // keine gültige JSON-Datei, ignorieren
    }
  }
  return buildClaimIndex(metadataList);
}

/**
 * Zählt die CompliesWith-Meldungen im Rohlog, unabhängig vom Parser.
 * Dient als Referenzwert: Die Anzahl der Einträge muss dieser Zahl entsprechen.
 */
function countCompliesWithMessages(content) {
  const lines = stripAnsi(content).replace(/\r\n/g, '\n').split('\n');
  return lines.filter((line) => COMPLIES_WITH_PATTERN.test(line)).length;
}

/**
 * Extrahiert je Paar (ISiK-Profil, Zielprofil) genau einen Eintrag aus dem Rohlog.
 * @param {string} content Rohlog (ANSI-Codes werden entfernt)
 * @param {Map} claimIndex siehe buildClaimIndex
 */
function parseCompliesWithEntries(content, claimIndex) {
  const lines = stripAnsi(content).replace(/\r\n/g, '\n').split('\n');
  const entries = [];
  const seen = new Set();
  let currentFile = '';

  for (let i = 0; i < lines.length; i += 1) {
    const line = lines[i];

    const sectionMatch = line.match(SECTION_HEADER_PATTERN);
    if (sectionMatch) {
      currentFile = sectionMatch[1].trim();
      continue;
    }
    const fileMatch = line.match(VALIDATE_LINE_PATTERN);
    if (fileMatch) {
      currentFile = fileMatch[1].trim();
      continue;
    }

    const match = line.match(COMPLIES_WITH_PATTERN);
    if (!match) {
      continue;
    }

    const comparedProfile = match[1].trim();
    const details = [];
    const source = resolveSourceMetadata({ comparedProfile, currentFile, claimIndex, details });

    let j = i + 1;
    while (j < lines.length) {
      const next = lines[j];
      if (!next.trim()) {
        j += 1;
        continue;
      }
      // Ende der Details: nächste Zeile ohne Einrückung (Sektionsende, Trennlinie)
      // oder nächste Validator-Meldung (auch bei gleicher Einrückung).
      if (/^\S/.test(next) || MESSAGE_START_PATTERN.test(next)) {
        break;
      }
      details.push(next.trim());
      j += 1;
    }
    i = j - 1;

    // Schlüssel: Quelldatei (aus Claim-Index oder Log-Sektion) + Zielprofil. Die
    // Log-Sektion hält Einträge auseinander, auch wenn das Quellprofil nicht
    // aufgelöst werden konnte.
    const key = `${source.file || currentFile || source.profile}\u0000${comparedProfile}`;
    if (seen.has(key)) {
      continue;
    }
    seen.add(key);

    entries.push({
      file: source.file,
      profile: source.profile,
      comparedProfile,
      messageId: match[2],
      summary: `Dieses Profil erfüllt das deklarierte Profil nicht: ${comparedProfile}`,
      details: details.length > 0 ? details : fallbackDetails(comparedProfile, source.claimedProfiles),
    });
  }

  return entries;
}

function resolveSourceMetadata({ comparedProfile, currentFile, claimIndex, details }) {
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

module.exports = {
  COMPLIES_WITH_URL,
  COMPLIES_WITH_MESSAGE_ID,
  stripAnsi,
  readStructureDefinitionMetadata,
  buildClaimIndex,
  buildClaimIndexFromFiles,
  buildClaimIndexFromDir,
  countCompliesWithMessages,
  parseCompliesWithEntries,
};
