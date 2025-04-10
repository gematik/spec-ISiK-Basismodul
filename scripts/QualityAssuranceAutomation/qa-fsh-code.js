const fs = require('fs');
const path = require('path');

/**
 * Validiert ein FHIR-Profil (StructureDefinition-JSON) auf:
 * - MustSupport-Elemente auf Ebene 1
 * - Vorhandensein von 'short' UND 'comment'
 */
function checkMustSupportDescriptions(profile) {
  const issues = [];

  if (!profile.snapshot || !Array.isArray(profile.snapshot.element)) {
    issues.push(`Profil ${profile.url || profile.id} hat keine Snapshot-Elemente.`);
    return issues;
  }

  const elements = profile.snapshot.element;

  for (const el of elements) {
    const pathParts = el.path.split('.');
    
    // Nur Ebene-1 Elemente (z. B. Patient.name)
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
          `Fehlende ${missingFields.join(' und ')} für MustSupport-Element: ${el.path}`
        );
      }
    }
  }

  return issues;
}

// Beispielhafter Aufruf mit lokalem JSON
const filePath = 'output/StructureDefinition-my-profile.json';
const profile = JSON.parse(fs.readFileSync(filePath, 'utf-8'));

const result = checkMustSupportDescriptions(profile);

if (result.length > 0) {
  console.error('Validierungsfehler gefunden:\n' + result.join('\n'));
  process.exit(1);
} else {
  console.log('✅ Alle MustSupport-Elemente auf Ebene 1 haben short UND comment.');
}
 