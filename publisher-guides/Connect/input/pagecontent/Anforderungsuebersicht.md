
### Normative Festlegungen

Die normativen Festlegungen des Moduls ISiK Connect  sind im Wesentlichen der Seite zu den [Festlegungen für Connect](Conformance.html) zu entnehmen.

### Anforderungsübersicht 

In dem nachfolgenden Abschnitt soll eine Übersicht zu Anforderungen im Implementierungsleitfaden bereitgehalten werden. Teilweise haben diese Anforderungen jedoch nur optionalen Charakter.

| ID | Anforderung | Verbindlichkeit
|--------|------|------
| ANF-CON-001  | [IHE IUA - Abschnitt 34.1.1.3 Resource Server](KompatibilitaetDerGematikSpezifikation.html) | MUSS
| ANF-CON-002 | [IHE IUA - Abschnitt 3.103.2.1 Resource Server](KompatibilitaetDerGematikSpezifikation.html) | SOLL
| ANF-CON-003  | [IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type](KompatibilitaetDerGematikSpezifikation.html) | SOLL
| ANF-CON-004  | [IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type](KompatibilitaetDerGematikSpezifikation.html) | MUSS
| ANF-CON-005  | [ISiK-Ressourcen-Server - Verarbeitung von Autorisierungen](ISiKAutorisierung.html) | MUSS
| ANF-CON-006  | [FHIR-Ressourcen-Server - Mindestunterstützung Compartment Definition](ISiKAutorisierung.html) | MUSS
| ANF-CON-007  | [FHIR-Ressourcen-Server - Bestätigung von Scopes](ISiKAutorisierung.html) | MUSS
| ANF-CON-008  | [Autorisierungsserver - Client-Id Vergabe](ISiKundSMART.html) | MUSS 
| ANF-CON-009  | [EHR-Client-Start durch externen Kontextaufruf](ISiKundSMART.html) | MUSS
| ANF-CON-010 | [SMART App Launch - EHR Launch Parameter](ISiKundSMART.html) | MUSS
| ANF-CON-011 | [Autorisierungsendpunkte per HTTPS erreichbar](ISiKundSMART.html) | MUSS
| ANF-CON-012 | [Standalone Launch - URL des FHIR-Endpunkts](ISiKundSMART.html) | MUSS
| ANF-CON-013 | [Abfrage des `.well-known/smart-configuration` Dokuments](ISiKundSMART.html) | MUSS
| ANF-CON-014 | [OAuth 2.0 Endpunkte im CapabilityStatement](ISiKundSMART.html) | MUSS
| ANF-CON-015 | [Scopes for requesting identity data](ISiKundSMART.html) | MUSS
| ANF-CON-016 | [Konfiguration der erlaubten Scopes pro Client](ISiKundSMART.html) | MUSS
| ANF-CON-017 | [Confidential Clients - Authentifizierung am Token-Endpunkt](ISiKundSMART.html) | MUSS
| ANF-CON-018 | [SMART App Launch - Obtain access token](ISiKundSMART.html) | MUSS
| ANF-CON-019 | [Unterstützung verpflichtender SMART App Launch Details](ISiKundSMART.html) | MUSS
| ANF-CON-020 | [Verarbeitung des Access Tokens - Validierungsschritte](ISiKundSMART.html) | MUSS
| ANF-CON-021 | [Begrenzte Gültigkeitsdauer des Access Tokens (RFC6819)](ISiKundSMART.html) | SOLL
| ANF-CON-022 | [Unterstützung von Refresh Tokens](Schritt6RefreshToken.html) | SOLL
| ANF-CON-023 | [SMART App Launch - Refresh access token](ISiKundSMART.html) | MUSS
| ANF-CON-024 | [OAuth 2.0 Token Revocation (RFC7009)](ISiKundSMART.html) | MUSS
| ANF-CON-025 | [Sicherstellung der sofortigen Token-Invalidierung](ISiKundSMART.html) | MUSS
| ANF-CON-026 | [ISiK-Ressourcen-Server - Unterstützung von Scopes](Conformance.html) | MUSS
| ANF-CON-027 | [`.well-known`-Dokument über unterstützte Scopes](Conformance.html) | MUSS
| ANF-CON-028 | [ISiK-Funktionalitäten durch Reverse Proxy/API Gateway](Conformance.html) | KANN
| ANF-CON-029 | [Verarbeitung von Autorisierungsinformationen](ConformanceScopesKontexte.html) | MUSS
| ANF-CON-030 | [Keine Zugriffstoken ohne Kontextangabe akzeptieren](ConformanceScopesKontexte.html) | DÜRFEN NICHT
| ANF-CON-031 | [Unterstützung der Kontexte "patient" und "encounter"](ConformanceScopesKontexte.html) | MUSS
| ANF-CON-032 | [Durchsetzung von Autorisierungen gemäß Compartment Patient](ConformanceScopesKontexte.html) | MUSS
| ANF-CON-033 | [Berechtigungen auf Ressourcentypen in der SMART Datei und Capabilities](ConformanceScopesKontexte.html) | MUSS
| ANF-CON-034 | [Kategorien von SMART-on-FHIR-Berechtigungen auf Ressourcen](ConformanceScopesKontexte.html) | MUSS
| ANF-CON-035 | [Autorisierungen ohne Compartment-Definition auf "user"- oder "system"-Level Scope](ConformanceScopesKontexte.html) | SOLL
| ANF-CON-036 | [Verpflichtende Umsetzung der ISiK-Connect-Vorgaben](ConformanceScopesKontexte.html) | MUSS
| ANF-CON-037 | [Berechtigungen im Scope in der Reihenfolge 'cruds' angeben](ConformanceScopesKontexte.html) | SOLL
| ANF-CON-038 | [Wildcard-Scopes](ConformanceScopesKontexte.html) | MUSS
| ANF-CON-039 | [Unterstützung von Suchparametern](ConformanceScopesKontexte.html) | MUSS
| ANF-CON-040 | [exp-Parameter für Backend Service Tokens](BackendServices.html) | DARF NICHT
| ANF-CON-041 | [Validierung JWT Client Assertion](BackendServices.html) | MUSS
| ANF-CON-042 | [Patient- / User-level Backend Service](BackendServices.html) | KÖNNEN/SOLL
| ANF-CON-043 | [Zurückweisung Scopes Backend Service](BackendServices.html) | MUSS
| ANF-CON-044 | [Scope-Parameter Backend Service](BackendServices.html) | MUSS
| ANF-CON-045 | [Launch Scopes Access Token Response](BackendServices.html) | MUSS
| ANF-CON-046 | [authorization_endpoint](ConformanceSmartCapabilities.html) | MUSS
| ANF-CON-047 | [grant_types_supported](ConformanceSmartCapabilities.html) | MUSS
| ANF-CON-048 | [refresh_token](ConformanceSmartCapabilities.html) | MUSS
| ANF-CON-049 | [code_challenge_methods_supported](ConformanceSmartCapabilities.html) | MUSS/DARF NICHT
| ANF-CON-050 | [scopes_supported](ConformanceSmartCapabilities.html) | MUSS
| ANF-CON-051 | [capabilitites: permission-v2](ConformanceSmartCapabilities.html) | MUSS
| ANF-CON-052 | [KEINE eigenen _CompartmentDefinitionen_](ConformanceScopesKontexte.html) | DÜRFEN NICHT
