/*
This script automates the certain quality assurance checks (derived from best practices) of FHIR profiles (StructureDefinition JSON files) for based on recommended best practices, such as:
- Ensuring that MustSupport elements have both 'short' and 'comment' descriptions.
- Ensuring that elements (at least in first level, e.g. Appointment.status) with constrained cardinality are set to must support as well.

- #TODO StructureDefinition.description is filled

*/

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

   
    if (pathParts.length === 2) { // ggf. ausweiten auf weitere Ebenen #TODO
      // Wenn eine Kardinalität gesetzt ist, dann muss das Element auch als mustSupport markiert sein; Prüfen nur auf Elemente der 1. Ebene (ResourceName.xyz)
      if ((el.hasOwnProperty('min') || el.hasOwnProperty('max')) && !el.hasOwnProperty('mustSupport')) 
        // Ausnahme: Wenn max = 0, dann soll auch kein MustSupport Flag gesetzt sein 
        if (el.max === '0') {
          if (el.hasOwnProperty('mustSupport')) {
            issues.push(
              `❌ ${filePath}: Element '${el.path}' mit Kardinalität '0..0' sollte kein mustSupport-Attribut haben.`
            );
          }
        }
        else {
        const cardinality = (el.min !== undefined ? el.min : '0') + '..' + (el.max !== undefined ? el.max : '*');
          // Ausnahme: wenn nur max numerisch gesetzt, dann muss kein MustSupport gesetzt werden
          if (el.max && !isNaN(el.max)) {
          continue; // Skip if only max is set numerically
          }
          else {          
          issues.push(
            `❌ ${filePath}: Element '${el.path}' mit Kardinalität '${cardinality}' hat kein mustSupport-Attribut.`
          );
          }
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
