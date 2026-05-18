'use strict';

/**
 * Lokaler Test-Lauf für den complieswith-export Workflow.
 *
 * Repliziert alle Schritte aus .github/workflows/complieswith-export.yml
 * (außer dem PR-Kommentar). Modifizierte Dateien werden vorher gesichert
 * und danach automatisch wiederhergestellt.
 *
 * Verwendung:
 *   node scripts/complieswith/run-local.js [--keep]
 *
 * Optionen:
 *   --keep   Dateien nach dem Lauf NICHT wiederherstellen
 *            (package.json, sushi-config.yaml, FSH-Dateien bleiben modifiziert)
 */

const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');

const ROOT = process.cwd();
const KEEP = process.argv.includes('--keep');

const JAR_PATH = path.resolve(ROOT, 'scripts/complieswith/org.hl7.fhir.validation.cli-6.9.8-SNAPSHOT.jar');

const COMPLIESWITH_DEPENDENCIES = [
  'hl7.fhir.eu.eps#current',
  'hl7.fhir.eu.hdr#current',
  'hl7.fhir.eu.base#current',
  'hl7.fhir.eu.laboratory#current',
  'hl7.fhir.eu.mpd#current',
  'de.medizininformatikinitiative.kerndatensatz.base#2026.0.0',
  'kbv.basis#1.8.0',
  'de.gevko.emdaf#1.3.0',
].join('\n');

// ── Hilfsfunktionen ──────────────────────────────────────────────────────────

const RESET = '\x1b[0m';
const BOLD = '\x1b[1m';
const GREEN = '\x1b[32m';
const YELLOW = '\x1b[33m';
const RED = '\x1b[31m';
const CYAN = '\x1b[36m';
const DIM = '\x1b[2m';

function header(text) {
  process.stdout.write(`\n${BOLD}${CYAN}▶ ${text}${RESET}\n`);
}

function success(text) {
  process.stdout.write(`${GREEN}✔ ${text}${RESET}\n`);
}

function warn(text) {
  process.stdout.write(`${YELLOW}⚠ ${text}${RESET}\n`);
}

function fail(text) {
  process.stderr.write(`${RED}✖ ${text}${RESET}\n`);
}

function dim(text) {
  process.stdout.write(`${DIM}${text}${RESET}\n`);
}

function run(cmd, args, opts = {}) {
  const result = spawnSync(cmd, args, {
    cwd: ROOT,
    encoding: 'utf8',
    stdio: 'inherit',
    shell: process.platform === 'win32',
    ...opts,
  });
  if (result.error) {
    throw new Error(`Failed to start "${cmd}": ${result.error.message}`);
  }
  return result.status ?? 0;
}

function runNode(scriptRelPath, extraEnv = {}) {
  const scriptPath = path.resolve(ROOT, scriptRelPath);
  const result = spawnSync(process.execPath, [scriptPath], {
    cwd: ROOT,
    encoding: 'utf8',
    stdio: 'inherit',
    env: { ...process.env, ...extraEnv },
  });
  if (result.error) {
    throw new Error(`Failed to start node "${scriptRelPath}": ${result.error.message}`);
  }
  return result.status ?? 0;
}

// ── Backup-/Restore-Logik ────────────────────────────────────────────────────

function backupFiles(filePaths) {
  const backups = new Map();
  for (const filePath of filePaths) {
    const abs = path.resolve(ROOT, filePath);
    if (fs.existsSync(abs)) {
      backups.set(abs, fs.readFileSync(abs));
    }
  }
  return backups;
}

function walkFsh(dir, results = []) {
  if (!fs.existsSync(dir)) return results;
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      walkFsh(full, results);
    } else if (entry.isFile() && full.endsWith('.fsh')) {
      results.push(full);
    }
  }
  return results;
}

function findFshFilesWithCommentedInserts() {
  return walkFsh(path.resolve(ROOT, 'Resources')).filter((f) => {
    const content = fs.readFileSync(f, 'utf8');
    return /^\s*\/\/ \* insert CompliesWith\(/m.test(content);
  });
}

function restoreFiles(backups) {
  for (const [abs, content] of backups) {
    fs.writeFileSync(abs, content);
  }
}

// ── Hauptprogramm ────────────────────────────────────────────────────────────

function main() {
  process.stdout.write(`\n${BOLD}CompliesWith Export – lokaler Testlauf${RESET}\n`);
  dim(`Arbeitsverzeichnis: ${ROOT}`);
  dim(`JAR:               ${JAR_PATH}`);
  if (KEEP) warn('--keep aktiv: Dateien werden nach dem Lauf NICHT wiederhergestellt.');

  // Voraussetzungen prüfen
  header('Voraussetzungen prüfen');
  if (!fs.existsSync(JAR_PATH)) {
    fail(`Java-Validator JAR nicht gefunden: ${JAR_PATH}`);
    process.exit(1);
  }
  success('JAR vorhanden');

  const javaCheck = spawnSync('java', ['-version'], { encoding: 'utf8', stdio: 'pipe' });
  if (javaCheck.error || (javaCheck.status !== 0 && !javaCheck.stderr)) {
    fail('Java ist nicht im PATH verfügbar.');
    process.exit(1);
  }
  success('Java verfügbar');

  // Dateien sichern
  header('Dateien sichern');
  const fshFilesWithInserts = findFshFilesWithCommentedInserts();
  const filesToBackup = [
    'package.json',
    'Resources/sushi-config.yaml',
    ...fshFilesWithInserts,
  ];
  const backups = backupFiles(filesToBackup);
  success(`${backups.size} Datei(en) gesichert`);
  for (const f of backups.keys()) {
    dim(`  ${path.relative(ROOT, f)}`);
  }

  let exitCode = 0;

  try {
    // Schritt 1: CompliesWith-Abhängigkeiten hinzufügen
    header('Schritt 1/5: CompliesWith-Abhängigkeiten hinzufügen');
    const step1 = runNode('scripts/complieswith/add-dependencies.js', {
      COMPLIESWITH_DEPENDENCIES,
    });
    if (step1 !== 0) throw new Error(`add-dependencies.js beendet mit Code ${step1}`);
    success('Abhängigkeiten hinzugefügt');

    // Schritt 2: Kommentierte CompliesWith-Inserts aktivieren
    header('Schritt 2/5: Kommentierte CompliesWith-Inserts aktivieren');
    const step2 = runNode('scripts/complieswith/uncomment-inserts.js');
    if (step2 !== 0) throw new Error(`uncomment-inserts.js beendet mit Code ${step2}`);
    success('Inserts aktiviert');

    // Schritt 3: SUSHI ausführen
    header('Schritt 3/5: SUSHI ausführen');
    const step3 = run('npx', ['fsh-sushi', 'Resources/', '-s']);
    if (step3 !== 0) throw new Error(`fsh-sushi beendet mit Code ${step3}`);
    success('SUSHI erfolgreich');

    // Schritt 4: Validierungsziele filtern
    header('Schritt 4/5: Validierungsziele filtern');
    const step4 = runNode('scripts/complieswith/filter-validation-targets.js');
    if (step4 !== 0) throw new Error(`filter-validation-targets.js beendet mit Code ${step4}`);
    success('Validierungsziele gefiltert');

    // Schritt 5: Java-Validator ausführen
    header('Schritt 5/5: Java-Validator ausführen');
    const step5 = runNode('scripts/complieswith/run-java-validator.js', {
      VALIDATOR_JAR: JAR_PATH,
      VALIDATION_DIR: 'Resources/fsh-generated/complieswith-validation',
      RESOLUTION_CONTEXT_DIR: 'Resources/fsh-generated/resources',
      ADVISOR_FILE: 'validator/advisor.json',
      RAW_LOG_PATH: 'validation-raw.log',
      DETAILS_JSON_PATH: 'validation-details.json',
    });

    if (step5 === 0) {
      success('Keine CompliesWith-Fehler gefunden');
    } else if (step5 === 1) {
      warn('CompliesWith-Fehler gefunden – siehe validation-details.json');
      exitCode = 1;
    } else {
      fail(`Java-Validator abgebrochen mit Code ${step5} – siehe validation-raw.log`);
      exitCode = step5;
    }
  } catch (error) {
    fail(error.message);
    exitCode = 1;
  } finally {
    if (!KEEP) {
      header('Dateien wiederherstellen');
      restoreFiles(backups);
      success(`${backups.size} Datei(en) wiederhergestellt`);
    }
  }

  // Ergebnis
  const outputFiles = ['validation-details.json', 'validation-raw.log']
    .map((f) => path.resolve(ROOT, f))
    .filter((f) => fs.existsSync(f));

  if (outputFiles.length > 0) {
    process.stdout.write(`\n${BOLD}Ausgabedateien:${RESET}\n`);
    for (const f of outputFiles) {
      dim(`  ${path.relative(ROOT, f)}`);
    }
  }

  process.stdout.write('\n');
  if (exitCode === 0) {
    success('Lauf abgeschlossen – kein Fehler.');
  } else {
    fail('Lauf abgeschlossen – Fehler gefunden.');
  }
  process.stdout.write('\n');
  process.exitCode = exitCode;
}

main();
