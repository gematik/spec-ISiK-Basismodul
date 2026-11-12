'use strict';

/**
 * Test für den CompliesWith-Parser (PTDATA-2430, AC 1 und AC 4).
 *
 * Fixture: Ausschnitt eines echten Rohlogs (Lauf 40784252460) mit vier Sektionen:
 *   ISiKAllergieUnvertraeglichkeit  2 Verstöße
 *   ISiKDiagnose                    5 Verstöße
 *   ISiKImplantat                   0 Verstöße
 *   ISiKKontaktGesundheitseinrichtung 2 Verstöße
 *
 * Ausführen: node --test scripts/complieswith/parse-validator-log.test.js
 */

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('fs');
const path = require('path');

const {
  buildClaimIndex,
  countCompliesWithMessages,
  parseCompliesWithEntries,
} = require('./parse-validator-log');

const FIXTURE_DIR = path.join(__dirname, 'fixtures');
const rawLog = fs.readFileSync(path.join(FIXTURE_DIR, 'validation-raw.multi-violation.log'), 'utf8');
const metadataList = JSON.parse(fs.readFileSync(path.join(FIXTURE_DIR, 'claim-index.multi-violation.json'), 'utf8'));
const claimIndex = buildClaimIndex(metadataList);

const EXPECTED_PAIRS = {
  'StructureDefinition-ISiKAllergieUnvertraeglichkeit.json': [
    'https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance',
    'https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance',
  ],
  'StructureDefinition-ISiKDiagnose.json': [
    'http://hl7.eu/fhir/base/StructureDefinition/condition-eu-core',
    'http://hl7.eu/fhir/eps/StructureDefinition/condition-obl-eu-eps',
    'http://hl7.eu/fhir/hdr/StructureDefinition/condition-obl-eu-hdr',
    'https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose',
    'https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Condition_Diagnosis',
  ],
  'StructureDefinition-ISiKKontaktGesundheitseinrichtung.json': [
    'http://hl7.eu/fhir/hdr/StructureDefinition/encounter-eu-hdr',
    'https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung',
  ],
};
const EXPECTED_MESSAGE_COUNT = Object.values(EXPECTED_PAIRS).reduce((sum, list) => sum + list.length, 0);

test('Anzahl der Einträge entspricht der Anzahl der "does not comply"-Meldungen im Rohlog', () => {
  const entries = parseCompliesWithEntries(rawLog, claimIndex);
  assert.equal(countCompliesWithMessages(rawLog), EXPECTED_MESSAGE_COUNT);
  assert.equal(entries.length, EXPECTED_MESSAGE_COUNT);
});

test('je Paar (ISiK-Profil, Zielprofil) genau ein Eintrag, alle verletzten Zielprofile erfasst', () => {
  const entries = parseCompliesWithEntries(rawLog, claimIndex);
  const keys = entries.map((entry) => `${entry.file}::${entry.comparedProfile}`);
  assert.equal(new Set(keys).size, keys.length, 'doppelte Paare gefunden');

  for (const [file, comparedProfiles] of Object.entries(EXPECTED_PAIRS)) {
    const actual = entries.filter((entry) => entry.file === file).map((entry) => entry.comparedProfile).sort();
    assert.deepEqual(actual, [...comparedProfiles].sort(), `Zielprofile für ${file}`);
  }
  assert.equal(entries.filter((entry) => entry.file === 'StructureDefinition-ISiKImplantat.json').length, 0);
  assert.ok(entries.every((entry) => entry.profile !== 'Unbekanntes Profil'), 'Quellprofil nicht aufgelöst');
});

test('Details enthalten nur die slice-Zeilen des eigenen Eintrags, keine Folge-Meldungen', () => {
  const entries = parseCompliesWithEntries(rawLog, claimIndex);
  for (const entry of entries) {
    assert.ok(entry.details.length > 0, `keine Details für ${entry.comparedProfile}`);
    for (const detail of entry.details) {
      assert.ok(/^slice (error|warn):/.test(detail), `unerwartete Detailzeile: ${detail}`);
      assert.ok(!/^(Error|Warning|Information) @/.test(detail), `Validator-Meldung in Details: ${detail}`);
    }
  }
  const diagnoseEuCore = entries.find(
    (entry) => entry.comparedProfile === 'http://hl7.eu/fhir/base/StructureDefinition/condition-eu-core'
  );
  assert.equal(diagnoseEuCore.details.length, 3);
});

test('Einträge werden nach (ISiK-Profil, Zielprofil) dedupliziert', () => {
  const entries = parseCompliesWithEntries(`${rawLog}\n${rawLog}`, claimIndex);
  assert.equal(entries.length, EXPECTED_MESSAGE_COUNT);
});

test('ohne Claim-Index bleibt die Anzahl erhalten, Quellprofil wird als unbekannt markiert', () => {
  const entries = parseCompliesWithEntries(rawLog, new Map());
  assert.equal(entries.length, EXPECTED_MESSAGE_COUNT);
  assert.ok(entries.every((entry) => entry.profile === 'Unbekanntes Profil'));
});

test('gleiches Zielprofil in verschiedenen Sektionen bleibt auch ohne Claim-Index getrennt', () => {
  const target = 'https://example.org/StructureDefinition/claimed';
  const section = (file) => [
    `-- /work/complieswith-validation/${file} ---------`,
    '*FAILURE*: 1 errors, 0 warnings, 0 notes',
    `  Error @ StructureDefinition: This profile does not comply with claimed profile '${target}' because: x {SD_EXTENSION_COMPLIES_WITH_ERROR}`,
    '    slice error: x',
    '---------',
  ].join('\n');
  const log = `${section('StructureDefinition-A.json')}\n\n${section('StructureDefinition-B.json')}\n`;
  assert.equal(parseCompliesWithEntries(log, new Map()).length, 2);
});
