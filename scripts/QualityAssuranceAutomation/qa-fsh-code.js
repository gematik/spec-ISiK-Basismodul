const fs = require('fs');
const path = require('path');

// 📂 Log-Verzeichnis vorbereiten
const logDir = './logs';
if (!fs.existsSync(logDir)) {
  fs.mkdirSync(logDir);
}

const timestamp = new Date().toISOString().replace(/[-:]/g, '').replace(/\..+/, '');
const logFilePath = path.join(logDir, `validation-${timestamp}.log`);
const logStream = fs.createWriteStream(logFilePath, { flags: 'a' });

function log(message) {
  console.log(message);
  logStream.write(message + '\n');
}

/**
 * Validiert ein FHIR-Profil (StructureDefinition-JSON) auf:
 * - MustSupport-Elemente auf Ebene 1
 * - Vorhandensein von 'short' UND 'comment'
 */
function checkMustSupportDescriptions(profile, filePath) {
  const issues = [];

  if (!profile.differential || !Array.isArray(profile.differential.element)) {
    issues.push(`⚠️ Profil ${filePath} hat keine Differential-Elemente.`);
    return issues;
  }

  const elements = profile.differential.element;

  for (const el of elements) {
    const pathParts = el.path.split('.');

    // Prüfen nur auf Elemente der 1. Ebene (ResourceName.xyz)
    if (pathParts.length === 2 && el.mustSupport) {
      const missingFields = [];

      if (!el.short || el.short.trim() === '') {
        missingFields.push('short');
      }
      if (!el.comment || el.comment.trim() === '') {
        missingFields.push('comment');
      }

      if (missingFields.length > 0) {
        issues.push(
          `❌ ${filePath}: Fehlende ${missingFields.join(' und ')} für MustSupport-Element '${el.path}'`
        );
      }
    }
  }

  return issues;
}

/**
 * Liest alle JSON-Dateien rekursiv aus einem Verzeichnis
 */
function getAllJsonFiles(dirPath, arrayOfFiles = []) {
  const files = fs.readdirSync(dirPath);

  files.forEach((file) => {
    const fullPath = path.join(dirPath, file);
    if (fs.statSync(fullPath).isDirectory()) {
      getAllJsonFiles(fullPath, arrayOfFiles);
    } else if (file.endsWith('.json')) {
      arrayOfFiles.push(fullPath);
    }
  });

  return arrayOfFiles;
}

// 🔍 Einstiegspunkt
const baseDir = '../../Resources/fsh-generated/resources';
log(`Starte Prüfung in: ${baseDir}`);

const jsonFiles = getAllJsonFiles(baseDir);
let allIssues = [];

jsonFiles.forEach((filePath) => {
  try {
    const profile = JSON.parse(fs.readFileSync(filePath, 'utf-8'));

    // Skip alles außer StructureDefinition
    if (profile.resourceType !== 'StructureDefinition') {
    // TODO print message that a file was skipped but not in log
      return;
    }

    const issues = checkMustSupportDescriptions(profile, filePath);
    allIssues.push(...issues);

  } catch (err) {
    log(`❗ Fehler beim Parsen von ${filePath}: ${err.message}`);
  }
});

// Ergebnis ausgeben und sauber beenden
if (allIssues.length > 0) {
  log('\n🚫 Validierungsfehler gefunden:\n' + allIssues.join('\n'));
} else {
  log('✅ Alle MustSupport-Elemente haben short UND comment.');
}

log(`\n🔖 Log-Datei erstellt unter: ${logFilePath}`);
logStream.end(() => {
  process.exit(allIssues.length > 0 ? 1 : 0);
});
