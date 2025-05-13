/*
This script automates the certain quality assurance checks (derived from best practices) of FHIR profiles (StructureDefinition JSON files) for based on recommended best practices, such as:
- Ensuring that MustSupport elements have both 'short' and 'comment' descriptions.
- Ensuring that elements (at least in first level, e.g. Appointment.status) with constrained cardinality are set to must support as well.
- StructureDefinition.description is filled

Features
- The script differentiates between errors and warning_
  - The following is an error 
  - The following is warning only_
    - A missing "short" element 
    - A missing description
- Deklaration zu unterdrückender dezidierter Elemente bzw. von in Profilen über eine Konfig-Datei

    



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
 * - Vorhandensein von 'short' (Warning) UND 'comment' (Error)
 * - Vorhandensein von 'description' im Profil (Warning)
 */
function checkMustSupportDescriptions(profile, filePath) {
  const issues = {
    warnings: [],
    errors: []
  };

  // Prüfe, ob description vorhanden und nicht leer ist
  if (!profile.description || profile.description.trim() === '') {
    issues.warnings.push(`⚠️ ${filePath}: StructureDefinition.description ist nicht ausgefüllt`);
  }

  if (!profile.differential || !Array.isArray(profile.differential.element)) {
    issues.warnings.push(`⚠️ Profil ${filePath} hat keine Differential-Elemente.`);
    return issues;
  }

  const elements = profile.differential.element;

  for (const el of elements) {
    const pathParts = el.path.split('.');

    // Prüfen nur auf Elemente der 1. Ebene (ResourceName.xyz)
    if (pathParts.length === 2 && el.mustSupport) {
      if (!el.short || el.short.trim() === '') {
        issues.warnings.push(`⚠️ ${filePath}: Fehlendes short für MustSupport-Element '${el.path}'`);
      }
      if (!el.comment || el.comment.trim() === '') {
        issues.errors.push(`❌ ${filePath}: Fehlendes comment für MustSupport-Element '${el.path}'`);
      }
    }

    if (pathParts.length === 2) {
      if ((el.hasOwnProperty('min') || el.hasOwnProperty('max')) && !el.hasOwnProperty('mustSupport')) {
        if (el.max === '0') {
          if (el.hasOwnProperty('mustSupport')) {
            issues.errors.push(
              `❌ ${filePath}: Element '${el.path}' mit Kardinalität '0..0' sollte kein mustSupport-Attribut haben.`
            );
          }
        } else {
          const cardinality = (el.min !== undefined ? el.min : '0') + '..' + (el.max !== undefined ? el.max : '*');
          if (el.max && !isNaN(el.max)) {
            continue;
          } else {
            issues.errors.push(
              `❌ ${filePath}: Element '${el.path}' mit Kardinalität '${cardinality}' hat kein mustSupport-Attribut.`
            );
          }
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

// Anpassung der Hauptlogik für die neue Struktur
const jsonFiles = getAllJsonFiles(baseDir);

let allIssues = {
  warnings: [],
  errors: []
};

jsonFiles.forEach((filePath) => {
  try {
    const profile = JSON.parse(fs.readFileSync(filePath, 'utf-8'));

    if (profile.resourceType !== 'StructureDefinition') {
      return;
    }

    const issues = checkMustSupportDescriptions(profile, filePath);
    allIssues.warnings.push(...issues.warnings);
    allIssues.errors.push(...issues.errors);

  } catch (err) {
    log(`❗ Fehler beim Parsen von ${filePath}: ${err.message}`);
  }
});

// Ergebnis ausgeben und sauber beenden
if (allIssues.warnings.length > 0 || allIssues.errors.length > 0) {
  // Übersicht der Best Practice Verstöße pro Ressource
  const resourceIssueCount = {};
  
  [...allIssues.warnings, ...allIssues.errors].forEach(issue => {
    const match = issue.match(/([^\:]+):/);
    if (match) {
      const resourcePath = match[1].trim();
      if (!resourceIssueCount[resourcePath]) {
        resourceIssueCount[resourcePath] = { warnings: 0, errors: 0 };
      }
      if (issue.includes('⚠️')) {
        resourceIssueCount[resourcePath].warnings++;
      } else if (issue.includes('❌')) {
        resourceIssueCount[resourcePath].errors++;
      }
    }
  });

  log('\n🧾 Übersicht der Best Practice Verstöße pro Ressource:');
  Object.entries(resourceIssueCount).forEach(([resource, counts]) => {
    log(`  ${resource}: ${counts.errors} Fehler, ${counts.warnings} Warnungen`);
  });

  if (allIssues.errors.length > 0) {
    log('\n🚫 Fehler:');
    allIssues.errors.forEach(error => log(error));
  }

  if (allIssues.warnings.length > 0) {
    log('\n⚠️ Warnungen:');
    allIssues.warnings.forEach(warning => log(warning));
  }
} else {
  log('✅ Alle Prüfungen erfolgreich bestanden.');
}

log(`\n🔖 Log-Datei erstellt unter: ${logFilePath}`);
logStream.end(() => {
  // Exit mit Fehlercode nur bei Errors, nicht bei Warnings
  process.exit(allIssues.errors.length > 0 ? 1 : 0);
});
