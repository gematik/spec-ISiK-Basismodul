'use strict';

/**
 * Tests für die Vergleichslogik (PTDATA-2431).
 * Ausführen: node --test scripts/complieswith/compare-results.test.js
 */

const test = require('node:test');
const assert = require('node:assert/strict');

const {
  buildCompactResult,
  diffResults,
  environmentChanges,
  embedPersistedResult,
  extractPersistedResult,
  stripPersistedResult,
  renderDiffSection,
} = require('./compare-results');

const P = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient';
const D = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose';
const EU_PATIENT = 'http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core';
const EU_COND = 'http://hl7.eu/fhir/base/StructureDefinition/condition-eu-core';
const MII_COND = 'https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose';

function result(pairs, meta = {}) {
  return buildCompactResult({
    entries: pairs.map(([profile, comparedProfile]) => ({ profile, comparedProfile, details: ['x'] })),
    meta: { runId: 1, commit: 'abcdef1234567890', timestamp: '2026-10-29T10:00:00Z', ...meta },
  });
}

test('buildCompactResult: ein Paar je (Profil, Zielprofil), sortiert, ohne Details', () => {
  const r = result([[D, MII_COND], [D, EU_COND], [D, EU_COND]]);
  assert.deepEqual(r.pairs, [[D, EU_COND], [D, MII_COND]]);
  assert.equal(r.commit, 'abcdef1234567890');
  assert.equal(JSON.stringify(r).includes('details'), false);
});

test('diffResults: neu / behoben / unverändert nach Paar, Detailänderungen zählen nicht', () => {
  const reference = result([[D, EU_COND], [D, MII_COND]]);
  const current = result([[D, EU_COND], [P, EU_PATIENT]]);
  const diff = diffResults(current, reference);
  assert.deepEqual(diff.added, [{ profile: P, comparedProfile: EU_PATIENT }]);
  assert.deepEqual(diff.removed, [{ profile: D, comparedProfile: MII_COND }]);
  assert.deepEqual(diff.unchanged, [{ profile: D, comparedProfile: EU_COND }]);
});

test('diffResults: identische Ergebnisse ergeben nur unverändert', () => {
  const a = result([[D, EU_COND], [D, MII_COND]]);
  const b = result([[D, MII_COND], [D, EU_COND]]);
  const diff = diffResults(a, b);
  assert.equal(diff.added.length, 0);
  assert.equal(diff.removed.length, 0);
  assert.equal(diff.unchanged.length, 2);
});

test('Persistierung im Kommentar: embed/extract Roundtrip, Ersetzen statt Anhängen', () => {
  const r1 = result([[D, EU_COND]], { runId: 11 });
  const r2 = result([[D, EU_COND], [P, EU_PATIENT]], { runId: 12 });
  const body1 = embedPersistedResult('<!-- marker -->\n### Report\n', r1);
  assert.deepEqual(extractPersistedResult(body1), r1);

  const body2 = embedPersistedResult(body1, r2);
  assert.deepEqual(extractPersistedResult(body2), r2);
  assert.equal((body2.match(/complieswith-result:/g) || []).length, 1);
  assert.equal(stripPersistedResult(body2).includes('complieswith-result'), false);
  assert.ok(stripPersistedResult(body2).includes('### Report'));
});

test('extractPersistedResult: fehlender oder kaputter Block liefert null', () => {
  assert.equal(extractPersistedResult('### Report ohne Ergebnis'), null);
  assert.equal(extractPersistedResult('<!-- complieswith-result:%%%nicht-base64%%% -->'), null);
});

test('URLs mit "-->" beschädigen den HTML-Kommentar nicht', () => {
  const r = result([[D, 'http://example.org/weird-->profile']]);
  const body = embedPersistedResult('### Report', r);
  assert.deepEqual(extractPersistedResult(body), r);
});

test('environmentChanges meldet geänderten Validator und geänderte Dependency-Versionen', () => {
  const reference = result([], { validatorUrl: 'https://example.org/v1.jar', dependencies: { 'hl7.fhir.eu.eps': '0.1.0-ci', 'kbv.basis': '1.8.0' } });
  const current = result([], { validatorUrl: 'https://example.org/v2.jar', dependencies: { 'hl7.fhir.eu.eps': '0.2.0-ci', 'kbv.basis': '1.8.0' } });
  const changes = environmentChanges(current, reference);
  assert.equal(changes.length, 2);
  assert.ok(changes[0].includes('Validator'));
  assert.ok(changes[1].includes('hl7.fhir.eu.eps'));
  assert.deepEqual(environmentChanges(current, current), []);
  const withoutDeps = result([], { validatorUrl: 'https://example.org/v2.jar' });
  assert.deepEqual(environmentChanges(current, withoutDeps), [], 'Referenz ohne Dependency-Angaben darf keine Meldungen erzeugen');
});

test('renderDiffSection: mit Baseline und vorigem Lauf', () => {
  const base = result([[D, EU_COND]], { runId: 100, commit: '1111111aaaaaaa', runUrl: 'https://example.org/runs/100' });
  const previous = result([[D, EU_COND], [P, EU_PATIENT]], { runId: 101, commit: '2222222bbbbbbb' });
  const current = result([[D, EU_COND], [P, EU_PATIENT]], { runId: 102 });
  const md = renderDiffSection({ current, base, baseRef: 'main-stufe-6', previous, isPullRequest: true });
  assert.ok(md.includes('### Vergleich'));
  assert.ok(md.includes('Gegenüber Basis `main-stufe-6`'));
  assert.ok(md.includes('Commit `1111111`'));
  assert.ok(md.includes('[Lauf 100](https://example.org/runs/100)'));
  assert.ok(md.includes('- Neu: **1**'));
  assert.ok(md.includes(`${P} → ${EU_PATIENT}`));
  assert.ok(md.includes('Gegenüber vorigem Lauf dieses PRs'));
  assert.ok(md.includes('- Neu: **0**'));
});

test('renderDiffSection: fehlende Referenzen werden explizit benannt', () => {
  const current = result([[D, EU_COND]]);
  const md = renderDiffSection({ current, base: null, baseRef: 'main-stufe-6', previous: null, isPullRequest: true });
  assert.ok(md.includes('keine Baseline gefunden'));
  assert.ok(md.includes('erster Lauf, kein voriger Lauf'));
  const push = renderDiffSection({ current, base: null, baseRef: 'main-stufe-6', previous: null, isPullRequest: false });
  assert.equal(push.includes('vorigem Lauf dieses PRs'), false);
});
