---
---

# CapabilityStatements

Diese Seite beschreibt die CapabilityStatements, die die erwarteten Fähigkeiten von FHIR-Servern für dieses Implementation Guide definieren.

## Überblick

CapabilityStatements dokumentieren die FHIR-Funktionalitäten, die ein Server implementieren muss, um mit diesem Implementation Guide konform zu sein.

## Test FHIR Server CapabilityStatement

### Beschreibung

**Canonical URL:** `http://example.org/fhir/test/CapabilityStatement/TestCapabilityStatement`

**Zweck:** Ein Test-CapabilityStatement für Validierungszwecke

#### CapabilityStatement Details

[Test FHIR Server Capability Statement](CapabilityStatement-TestCapabilityStatement.html)

### Server-Fähigkeiten

#### Allgemeine Eigenschaften

- **FHIR Version:** 4.0.1
- **Format:** JSON, XML
- **Patch Format:** JSON Patch, XML Patch
- **Implementation Guide:** Test Implementation Guide v1.0.0

#### Ressourcen-Unterstützung

##### Patient Ressource

**Unterstützte Operationen:**

- `read` - Lesen einzelner Patient-Ressourcen
- `vread` - Lesen spezifischer Versionen
- `update` - Aktualisierung bestehender Patienten
- `patch` - Partielle Aktualisierung
- `delete` - Löschen von Patient-Ressourcen
- `create` - Erstellen neuer Patienten
- `search-type` - Suche nach Patienten

**Unterstützte Profile:**

- [Test Patient Profile](StructureDefinition-test-patient.html)

**Search Parameter:**

- `_id` - Logische ID der Ressource
- `identifier` - Eindeutige Identifikatoren
- `name` - Vollständiger oder partieller Name
- `family` - Familienname
- `given` - Vorname
- `gender` - Geschlecht
- `birthdate` - Geburtsdatum

#### Sicherheit

**Sicherheitsmaßnahmen:**

- HTTPS wird für alle Kommunikation empfohlen
- Authentifizierung nach lokalen Richtlinien
- Autorisierung auf Ressourcenebene
- Audit-Logging für alle Zugriffe

#### Compliance

**Konformitätsanforderungen:**

- Server müssen alle definierten Must Support Elemente unterstützen
- Validierung gegen die Profile ist erforderlich
- Fehlerbehandlung nach FHIR-Standard
- Unterstützung für OperationOutcome bei Fehlern

### Implementierungshinweise

#### Empfohlene Implementierung

- Verwendung von FHIR-Bibliotheken für Standard-Operationen
- Implementierung von umfassender Fehlerbehandlung
- Performance-Optimierung für Such-Operationen
- Bereitstellung aussagekräftiger Fehlermeldungen

#### Test und Validierung

- Verwendung von FHIR-Testwerkzeugen
- Kontinuierliche Validierung gegen Profile
- Monitoring der Server-Performance
- Regelmäßige Sicherheitsüberprüfungen
