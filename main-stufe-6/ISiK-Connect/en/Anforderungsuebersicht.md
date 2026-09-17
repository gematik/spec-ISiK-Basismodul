# Anforderungsübersicht - ISiK Connect Implementierungsleitfaden v6.0.0

ISiK Connect Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Anforderungsübersicht**

## Anforderungsübersicht

### Normative Festlegungen

Die normativen Festlegungen des Moduls ISiK Connect sind im Wesentlichen der Seite zu den [Festlegungen für Connect](Conformance.md) zu entnehmen.

### Anforderungsübersicht

In dem nachfolgenden Abschnitt soll eine Übersicht zu Anforderungen im Implementierungsleitfaden bereitgehalten werden. Teilweise haben diese Anforderungen jedoch nur optionalen Charakter.

| | | |
| :--- | :--- | :--- |
| ANF-CON-001 | [IHE IUA - Abschnitt 34.1.1.3 Resource Server](KompatibilitaetDerGematikSpezifikation.md) | MUSS |
| ANF-CON-002 | [IHE IUA - Abschnitt 3.103.2.1 Resource Server](KompatibilitaetDerGematikSpezifikation.md) | SOLL |
| ANF-CON-003 | [IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type](KompatibilitaetDerGematikSpezifikation.md) | SOLL |
| ANF-CON-004 | [IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type](KompatibilitaetDerGematikSpezifikation.md) | MUSS |
| ANF-CON-005 | [ISiK-Ressourcen-Server - Verarbeitung von Autorisierungen](ISiKAutorisierung.md) | MUSS |
| ANF-CON-006 | [FHIR-Ressourcen-Server - Mindestunterstützung Compartment Definition](ISiKAutorisierung.md) | MUSS |
| ANF-CON-007 | [FHIR-Ressourcen-Server - Bestätigung von Scopes](ISiKAutorisierung.md) | MUSS |
| ANF-CON-008 | [Autorisierungsserver - Client-Id Vergabe](ISiKundSMART.md) | MUSS |
| ANF-CON-009 | [EHR-Client-Start durch externen Kontextaufruf](ISiKundSMART.md) | MUSS |
| ANF-CON-010 | [SMART App Launch - EHR Launch Parameter](ISiKundSMART.md) | MUSS |
| ANF-CON-011 | [Autorisierungsendpunkte per HTTPS erreichbar](ISiKundSMART.md) | MUSS |
| ANF-CON-012 | [Standalone Launch - URL des FHIR-Endpunkts](ISiKundSMART.md) | MUSS |
| ANF-CON-013 | [Abfrage des `.well-known/smart-configuration` Dokuments](ISiKundSMART.md) | MUSS |
| ANF-CON-014 | [OAuth 2.0 Endpunkte im CapabilityStatement](ISiKundSMART.md) | MUSS |
| ANF-CON-015 | [Scopes for requesting identity data](ISiKundSMART.md) | MUSS |
| ANF-CON-016 | [Konfiguration der erlaubten Scopes pro Client](ISiKundSMART.md) | MUSS |
| ANF-CON-017 | [Confidential Clients - Authentifizierung am Token-Endpunkt](ISiKundSMART.md) | MUSS |
| ANF-CON-018 | [SMART App Launch - Obtain access token](ISiKundSMART.md) | MUSS |
| ANF-CON-019 | [Unterstützung verpflichtender SMART App Launch Details](ISiKundSMART.md) | MUSS |
| ANF-CON-020 | [Verarbeitung des Access Tokens - Validierungsschritte](ISiKundSMART.md) | MUSS |
| ANF-CON-021 | [Begrenzte Gültigkeitsdauer des Access Tokens (RFC6819)](ISiKundSMART.md) | SOLL |
| ANF-CON-022 | [Unterstützung von Refresh Tokens](Schritt6RefreshToken.md) | SOLL |
| ANF-CON-023 | [SMART App Launch - Refresh access token](ISiKundSMART.md) | MUSS |
| ANF-CON-024 | [OAuth 2.0 Token Revocation (RFC7009)](ISiKundSMART.md) | MUSS |
| ANF-CON-025 | [Sicherstellung der sofortigen Token-Invalidierung](ISiKundSMART.md) | MUSS |
| ANF-CON-026 | [ISiK-Ressourcen-Server - Unterstützung von Scopes](Conformance.md) | MUSS |
| ANF-CON-027 | [`.well-known`-Dokument über unterstützte Scopes](Conformance.md) | MUSS |
| ANF-CON-028 | [ISiK-Funktionalitäten durch Reverse Proxy/API Gateway](Conformance.md) | KANN |
| ANF-CON-029 | [Verarbeitung von Autorisierungsinformationen](ConformanceScopesKontexte.md) | MUSS |
| ANF-CON-030 | [Keine Zugriffstoken ohne Kontextangabe akzeptieren](ConformanceScopesKontexte.md) | DÜRFEN NICHT |
| ANF-CON-031 | [Unterstützung der Kontexte "patient" und "encounter"](ConformanceScopesKontexte.md) | MUSS |
| ANF-CON-032 | [Durchsetzung von Autorisierungen gemäß Compartment Patient](ConformanceScopesKontexte.md) | MUSS |
| ANF-CON-033 | [Berechtigungen auf Ressourcentypen in der SMART Datei und Capabilities](ConformanceScopesKontexte.md) | MUSS |
| ANF-CON-034 | [Kategorien von SMART-on-FHIR-Berechtigungen auf Ressourcen](ConformanceScopesKontexte.md) | MUSS |
| ANF-CON-035 | [Autorisierungen ohne Compartment-Definition auf "user"- oder "system"-Level Scope](ConformanceScopesKontexte.md) | SOLL |
| ANF-CON-036 | [Verpflichtende Umsetzung der ISiK-Connect-Vorgaben](ConformanceScopesKontexte.md) | MUSS |
| ANF-CON-037 | [Berechtigungen im Scope in der Reihenfolge 'cruds' angeben](ConformanceScopesKontexte.md) | SOLL |
| ANF-CON-038 | [Wildcard-Scopes](ConformanceScopesKontexte.md) | MUSS |
| ANF-CON-039 | [Unterstützung von Suchparametern](ConformanceScopesKontexte.md) | MUSS |
| ANF-CON-040 | [exp-Parameter für Backend Service Tokens](BackendServices.md) | DARF NICHT |
| ANF-CON-041 | [Validierung JWT Client Assertion](BackendServices.md) | MUSS |
| ANF-CON-042 | [Patient- / User-level Backend Service](BackendServices.md) | KÖNNEN/SOLL |
| ANF-CON-043 | [Zurückweisung Scopes Backend Service](BackendServices.md) | MUSS |
| ANF-CON-044 | [Scope-Parameter Backend Service](BackendServices.md) | MUSS |
| ANF-CON-045 | [Launch Scopes Access Token Response](BackendServices.md) | MUSS |
| ANF-CON-046 | [authorization_endpoint](ConformanceSmartCapabilities.md) | MUSS |
| ANF-CON-047 | [grant_types_supported](ConformanceSmartCapabilities.md) | MUSS |
| ANF-CON-048 | [refresh_token](ConformanceSmartCapabilities.md) | MUSS |
| ANF-CON-049 | [code_challenge_methods_supported](ConformanceSmartCapabilities.md) | MUSS/DARF NICHT |
| ANF-CON-050 | [scopes_supported](ConformanceSmartCapabilities.md) | MUSS |
| ANF-CON-051 | [capabilitites: permission-v2](ConformanceSmartCapabilities.md) | MUSS |
| ANF-CON-052 | [KEINE eigenen **CompartmentDefinitionen**](ConformanceScopesKontexte.md) | DÜRFEN NICHT |

