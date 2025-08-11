---
---

# Festlegungen

Diese Seite beschreibt die verbindlichen Festlegungen und Konventionen für die Verwendung dieses Implementation Guides.

## Allgemeine Festlegungen

### Namenskonventionen

**Profile:**
- Präfix: `test-` für alle Profile
- Verwendung von kebab-case für IDs
- Deutsche Bezeichnungen in Anzeigenamen

**Ressourcen-IDs:**
- Format: `example-{ressourcentyp}-{bezeichner}`
- Nur Kleinbuchstaben und Bindestriche
- Eindeutige Kennzeichnung innerhalb des Guides

### Datenqualität

**Pflichtfelder:**
- Alle als "required" markierten Elemente müssen implementiert werden
- Minimale Kardinalität muss eingehalten werden
- Terminologie-Bindungen sind verbindlich

**Kodierungen:**
- Verwendung der spezifizierten ValueSets
- Fallback auf FHIR-Kernsystem bei fehlenden Codes
- Dokumentation von Erweiterungen erforderlich

## Profile-spezifische Festlegungen

### Test Patient Profil

**Identifikatoren:**
- Mindestens ein Identifikator erforderlich
- Test-spezifische Systeme verwenden
- Format: numerisch oder alphanumerisch

**Namen:**
- Vollständiger Name erforderlich (given + family)
- Verwendung von official name use
- Unterstützung für mehrere Namen optional

**Demographische Daten:**
- Geschlecht ist Pflichtfeld
- Geburtsdatum empfohlen
- Adresse optional aber erwünscht

### Test CapabilityStatement

**Server-Anforderungen:**
- Unterstützung für Patient-Ressourcen
- Implementierung von CRUD-Operationen
- Search-Parameter gemäß FHIR-Standard

**Sicherheit:**
- HTTPS für produktive Umgebungen
- Authentifizierung nach lokalen Richtlinien
- Autorisierung auf Ressourcenebene

## Implementierungsrichtlinien

### Validierung
- Alle Ressourcen müssen gegen definierte Profile validiert werden
- Verwendung von FHIR-Validatoren empfohlen
- Kontinuierliche Validierung in CI/CD-Pipelines

### Fehlerbehandlung
- Strukturierte Fehlerantworten nach FHIR-Standard
- Aussagekräftige OperationOutcome-Ressourcen
- Logging von Validierungsfehlern

### Versionierung
- Semantische Versionierung für Implementation Guide
- Rückwärtskompatibilität für Minor-Versionen
- Breaking Changes nur in Major-Versionen
