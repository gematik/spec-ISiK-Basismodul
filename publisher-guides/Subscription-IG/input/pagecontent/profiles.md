---
---

# Profile

Diese Seite beschreibt alle FHIR-Profile, die in diesem Implementation Guide definiert sind.

## Überblick

Die Profile in diesem IG definieren Einschränkungen und Erweiterungen für FHIR-Basisressourcen, um spezifische Anwendungsfälle zu unterstützen.

## Patient Profile

### Test Patient Profil

**Canonical URL:** `http://example.org/fhir/test/StructureDefinition/test-patient`

**Beschreibung:** Ein einfaches Test-Patient-Profil für Validierungszwecke.

**Basis:** Patient (FHIR R4)

#### Profil-Details

[Test Patient Profile](StructureDefinition-test-patient.html)

#### Einschränkungen

- **Identifikator:** Mindestens ein Identifikator ist erforderlich
- **Name:** Vollständiger Name (Vor- und Nachname) ist Pflicht
- **Geschlecht:** Muss angegeben werden
- **Geburtsdatum:** Empfohlen für vollständige demografische Daten

#### Verwendungszweck

Dieses Profil wird verwendet für:

- Validierung der IG-Entwicklungsumgebung
- Testzwecke in Entwicklungs- und Staging-Umgebungen  
- Beispielimplementierungen für FHIR-Clients
- Schulungs- und Demonstrationszwecke

#### Beispiele

[Beispiel Test Patient](Patient-example-test-patient.html)

#### Implementierungshinweise

**Must Support Elemente:**
- `Patient.identifier`
- `Patient.name`
- `Patient.gender`

**Terminologie:**
- Geschlecht: Verwendung von `http://hl7.org/fhir/administrative-gender`
- Name Use: Verwendung von `http://hl7.org/fhir/name-use`

**Validierung:**
- Alle Implementierungen müssen gegen dieses Profil validiert werden
- Verwendung von FHIR-Validatoren empfohlen
