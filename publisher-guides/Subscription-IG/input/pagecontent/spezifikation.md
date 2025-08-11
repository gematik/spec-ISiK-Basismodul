---
---

# Spezifikation

Diese Seite beschreibt die technischen Spezifikationen des Test Implementation Guides.

## Überblick

Das Test Implementation Guide definiert FHIR-Profile und -Ressourcen für Testzwecke in einer lokalen Entwicklungsumgebung.

## Technische Basis

### FHIR Version
- **Basis:** FHIR R4.0.1
- **Canonical URL:** `http://example.org/fhir/test`
- **Version:** 1.0.0

### Abhängigkeiten

Das Implementation Guide basiert auf folgenden FHIR-Paketen:

- `hl7.fhir.r4.core#4.0.1` - FHIR R4 Kernspezifikation
- `hl7.terminology.r4#6.5.0` - HL7 Terminologie
- `hl7.fhir.uv.extensions.r4#5.2.0` - Universelle Erweiterungen

## Architekturprinzipien

### Design-Prinzipien
1. **Einfachheit:** Minimale, aber vollständige Implementierung
2. **Testbarkeit:** Fokus auf Validierung der IG-Entwicklungsumgebung
3. **Erweiterbarkeit:** Basis für komplexere IGs

### Profilierungsstrategie
- Verwendung von FHIR Shorthand (FSH) für Profildefinitionen
- Automatische Generierung von JSON/XML-Repräsentationen
- Umfassende Dokumentation und Beispiele

## Compliance und Standards

### Validierung
- Alle Profile werden gegen FHIR R4 Kernspezifikation validiert
- Terminologie-Validierung über HL7 Terminology Server
- Strukturelle Validierung durch IG Publisher

### Konformität
- Implementierungen müssen die definierten Profile einhalten
- CapabilityStatements definieren erwartete Server-Funktionalitäten
