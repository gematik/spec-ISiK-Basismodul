/*
This script automates certain quality assurance checks (derived from best practices) of FHIR profiles (StructureDefinition JSON files) for based on recommended best practices, such as:
- Ensuring that MustSupport elements have both 'short' and 'comment' descriptions.
- Ensuring that elements (at least in first level, e.g. Appointment.status) with constrained cardinality are set to must support as well.
- StructureDefinition.description is filled

Features
- The script differentiates between errors and warning_
  - The following is an error 
  - The following is warning only_
    - A missing "short" element 
    - A missing description
- Deklaration zu unterdrückender Profilen über eine Konfig-Datei; die Profile werden dann nicht geprüft, aber explizit in der Log-Datei als unterdrückte Elemente ausgegeben
  - Die Datei heißt 'suppression.config.json' und liegt im gleichen Verzeichnis wie das Skript; Profilnamen werden gelistet
  - unterdrücken einzelner, dezidierter Elemente von Ressourcen
    

*/

const fs = require('fs');
const path = require('path');
const { exit } = require('process');

// === Suppression Config Feature ===
// Load suppression config if present. The config file should be named 'suppression.config.json' and placed in the same directory as this script.

const suppressionConfigPath = path.join(__dirname, 'suppression.config.json');
let suppressionConfig = {
  suppressProfiles: [],
  suppressElements: {}
};
if (fs.existsSync(suppressionConfigPath)) {
  try {
    suppressionConfig = JSON.parse(fs.readFileSync(suppressionConfigPath, 'utf-8'));
  } catch (e) {
    console.error(`⚠️ Fehler beim Laden der suppression.config.json: ${e.message}`);
    exit(1);
  }
}

const suppressedProfilesMap = new Map();
(suppressionConfig.suppressProfiles || []).forEach(obj => {
  if (typeof obj === 'string') {
    suppressedProfilesMap.set(obj, undefined);
  } else if (obj && obj.profile) {
    suppressedProfilesMap.set(obj.profile, obj.comment);
  }
});
const suppressedElementsMap = suppressionConfig.suppressElements || {};

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
 * 
 * Berücksichtigt unterdrückte Elemente (Suppression).
 */
function checkMustSupportDescriptions(profile, filePath, suppressedElementPaths = []) {
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
    let elementToBeEvaluated = false;
    
    const pathParts = el.id.split('.');

    if( pathParts.length === 2) {
      console.log(pathParts)
      // Für slices und Extensions auf oberster Ebene
      if( pathParts[1].includes(':')) {
        let lastPathPart = pathParts[1].split(':');
        el.path +=  ':' + lastPathPart[1];
      }
      
      elementToBeEvaluated = true;
      if(pathParts[1] == "extension") {
        elementToBeEvaluated = false; // Extension-Element auf oberster Ebene nicht prüfen
      }
    }  

    // Suppression: skip suppressed elements for this file
    if (suppressedElementPaths.includes(el.id || el.path)) {
      elementToBeEvaluated = false;
      continue;
    }

    if (elementToBeEvaluated) {
      // Wenn Element auf Kardinalität 0..0 gesetzt ist, darf kein mustSupport-Attribut vorhanden sein
      if (el.max === '0') {
        if (el.hasOwnProperty('mustSupport')) {
          issues.errors.push(
            `❌ ${filePath}: Element '${el.path}' mit Kardinalität '0..0' sollte kein mustSupport-Attribut haben.`
          );
        }
      }
      // Wenn Kardinalität angepasst wurde, muss ein MustSupport-Attribut vorhanden sein
      else if ((el.hasOwnProperty('min') || el.hasOwnProperty('max')) && !el.hasOwnProperty('mustSupport')) {
        issues.errors.push(
          `❌ ${filePath}: Element '${el.path}' mit Kardinalität '${(el.min === undefined)? "": el.min}..${(el.max ===undefined )?"":el.max}' hat kein mustSupport-Attribut.`
        );
      }
    }

        // Prüfen nur auf Elemente der 1. Ebene (ResourceName.xyz)
    if (elementToBeEvaluated && el.mustSupport) {
      if (!el.short || el.short.trim() === '') {
        issues.warnings.push(`⚠️ ${filePath}: Fehlendes short für MustSupport-Element '${el.path}'`);
      }
      if (!el.comment || el.comment.trim() === '') {
        issues.errors.push(`❌ ${filePath}: Fehlendes comment für MustSupport-Element '${el.path}'`);
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

let suppressedProfilesFound = [];
let suppressedElementsFound = {};

jsonFiles.forEach((filePath) => {
  const fileName = path.basename(filePath);
  // Suppression: skip suppressed profiles
  if (suppressedProfilesMap.has(fileName)) {
    suppressedProfilesFound.push({ profile: fileName, comment: suppressedProfilesMap.get(fileName) });
    return;
  }

  try {
    const profile = JSON.parse(fs.readFileSync(filePath, 'utf-8'));

    if (profile.resourceType !== 'StructureDefinition') {
      return;
    }

    // Suppression: get suppressed elements for this profile, if any
    const suppressedElementPaths = suppressedElementsMap[fileName] || [];
    if (suppressedElementPaths.length > 0) {
      if (!suppressedElementsFound[fileName]) suppressedElementsFound[fileName] = [];
      suppressedElementsFound[fileName].push(...suppressedElementPaths);
    }

    const issues = checkMustSupportDescriptions(profile, filePath, suppressedElementPaths);
    allIssues.warnings.push(...issues.warnings);
    allIssues.errors.push(...issues.errors);

  } catch (err) {
    log(`❗ Fehler beim Parsen von ${filePath}: ${err.message}`);
  }
});

// Ergebnis ausgeben und sauber beenden

// Log suppressed profiles and elements
if (suppressedProfilesFound.length > 0) {
  log('\n🚫 Unterdrückte Profile (nicht geprüft):');
  suppressedProfilesFound.forEach(p => {
    if (p.comment) {
      log(`  - ${p.profile}  // ${p.comment}`);
    } else {
      log(`  - ${p.profile}`);
    }
  });
}
if (Object.keys(suppressedElementsFound).length > 0) {
  log('\n🚫 Unterdrückte Elemente (nicht geprüft):');
  Object.entries(suppressedElementsFound).forEach(([profile, elements]) => {
    log(`  - ${profile}:`);
    elements.forEach(el => {
      if (typeof el === 'object' && el.element) {
        if (el.comment) {
          log(`      * ${el.element}  // ${el.comment}`);
        } else {
          log(`      * ${el.element}`);
        }
      } else {
        log(`      * ${el}`);
      }
    });
  });
}

if (allIssues.warnings.length > 0 || allIssues.errors.length > 0) {
  // Übersicht der Best Practice Verstöße pro Ressource
  const resourceIssueCount = {};

  // Zähle Fehler pro Ressource und gib jede Ressource nur einmal aus
  //opt TODO - WARNINGS ausgeben
  allIssues.errors.forEach(issue => {
    const match = issue.match(/([^\:]+):/);
    if (match) {
      const resourcePath = match[1].trim();
      if (!resourceIssueCount[resourcePath]) {
        resourceIssueCount[resourcePath] = { errors: 0 };
      }
      resourceIssueCount[resourcePath].errors++;
    }
  });

  log('\n🧾 Übersicht der Best Practice Fehler pro Ressource:');
  Object.entries(resourceIssueCount).forEach(([resource, counts]) => {
    // Wenn Fehler existieren, Fehler-Symbol, sonst OK
    let symbol;
    if (counts.errors > 0) {
      symbol = '❌';
    } else {
      symbol = '✅';
    }
    log(`  ${symbol} ${resource}: ${counts.errors} Fehler`);
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

module.exports = {
  checkMustSupportDescriptions,
  // ggf. weitere Funktionen
};