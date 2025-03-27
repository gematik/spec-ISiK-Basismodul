| ID | Anforderung |
|--------|------|
| ANF-CON-001  | [IHE IUA - Abschnitt 34.1.1.3 Resource Server](UebergreifendeFestlegungen/KompatibilitaetDerGematikSpezifikation.md) |
| ANF-CON-002 | [IHE IUA - Abschnitt 3.103.2.1 Resource Server](UebergreifendeFestlegungen/KompatibilitaetDerGematikSpezifikation.md) |
| ANF-CON-003  | [IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type](UebergreifendeFestlegungen/KompatibilitaetDerGematikSpezifikation.md) |
| ANF-CON-004  | [IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type](UebergreifendeFestlegungen/KompatibilitaetDerGematikSpezifikation.md) |
| ANF-CON-005  | [ISiK-Ressourcenserver - Verarbeitung von Autorisierungen](ISiKAutorisierung.md) | // Das hier zu 6. machen
| ANF-CON-006  | [FHIR-Ressourcenserver - Mindestunterstützung Compartment Definition](ISiKAutorisierung.md) |
| ANF-CON-007  | [FHIR-Ressourcenserver - Bestätigung von Scopes](ISiKAutorisierung.md) |
| ANF-CON-008  | [Autorisierungsserver - Client-Id Vergabe](ISiKundSMART/Schritt1RegistrierungClient.md) |
| ANF-CON-009  | [EHR-Client-Start durch externen Kontextaufruf](ISiKundSMART/Schritt2ClientAutorisierung.md) |
| ANF-CON-010 | [SMART App Launch - EHR Launch Parameter](ISiKundSMART/Schritt2ClientAutorisierung.md) |
| ANF-CON-011 | [Autorisierungsendpunkte per HTTPS erreichbar](ISiKundSMART/Schritt2ClientAutorisierung.md) |
| ANF-CON-012 | [Standalone Launch - URL des FHIR-Endpunkts](ISiKundSMART/Schritt2ClientAutorisierung.md) |
| ANF-CON-013 | [Abfrage des `.well-known/smart-configuration` Dokuments](ISiKundSMART/Schritt2ClientAutorisierung.md) |
| ANF-CON-014 | [OAuth 2.0 Endpunkte im CapabilityStatement](ISiKundSMART/Schritt2ClientAutorisierung.md) |
| ANF-CON-015 | [Scopes for requesting identity data](ISiKundSMART/Schritt2ClientAutorisierung.md) |
| ANF-CON-016 | [Konfiguration der erlaubten Scopes pro Client](ISiKundSMART/Schritt2ClientAutorisierung.md) |
| ANF-CON-017 | [Confidential Clients - Authentifizierung am Token-Endpunkt](ISiKundSMART/Schritt4AustauschAutorisierungscodesZugangstoken.md) |
| ANF-CON-018 | [SMART App Launch - Obtain access token](ISiKundSMART/Schritt4AustauschAutorisierungscodesZugangstoken.md) |
| ANF-CON-019 | [Unterstützung verpflichtender SMART App Launch Details](ISiKundSMART/Schritt4AustauschAutorisierungscodesZugangstoken.md) |
| ANF-CON-020 | [Verarbeitung des Access Tokens - Validierungsschritte](ISiKundSMART/Schritt5FHIRRestInteraktion.md) |
| ANF-CON-021 | [Begrenzte Gültigkeitsdauer des Access Tokens (RFC6819)](ISiKundSMART/Schritt6RefreshToken.md) |
| ANF-CON-022 | [Unterstützung von Refresh Tokens](ISiKundSMART/Schritt6RefreshToken.md) |
| ANF-CON-023 | [SMART App Launch - Refresh access token](ISiKundSMART/Schritt6RefreshToken.md) |
| ANF-CON-024 | [OAuth 2.0 Token Revocation (RFC7009)](ISiKundSMART/Schritt6RefreshToken.md) |
| ANF-CON-025 | [Sicherstellung der sofortigen Token-Invalidierung](ISiKundSMART/Schritt6RefreshToken.md) |
| ANF-CON-026 | [ISiK-Ressourcenserver - Unterstützung von Scopes](Conformance.md) |
| ANF-CON-027 | [`.well-known`-Dokument über unterstützte Scopes](Conformance.md) |
| ANF-CON-028 | [ISiK-Funktionalitäten durch Reverse Proxy/API Gateway](Conformance.md) |
| ANF-CON-029 | [Verarbeitung von Autorisierungsinformationen](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-030 | [Keine Zugriffstoken ohne Kontextangabe akzeptieren](Conformance/ConformanceScopesKontexte.md) | 
| ANF-CON-031 | [Unterstützung der Kontexte "patient" und "encounter"](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-032 | [Durchsetzung von Autorisierungen gemäß Compartment Patient](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-033 | [Berechtigungen auf Ressourcentypen in der SMART Datei und Capabilities](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-034 | [Kategorien von SMART-on-FHIR-Berechtigungen auf Ressourcen](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-035 | [Autorisierungen ohne Compartment-Definition auf "user"- oder "system"-Level Scope](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-036 | [Verpflichtende Umsetzung der ISiK-Connect-Vorgaben](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-037 | [Berechtigungen im Scope in der Reihenfolge 'cruds' angeben](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-038 | [Wildcard-Scopes](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-039 | [Unterstützung von Suchparametern](Conformance/ConformanceScopesKontexte.md) |
| ANF-CON-040 | [exp-Parameter für Backend Service Tokens](SmartBackendServices/Schritt3AbrufAccessToken.md) |
| ANF-CON-041 | [Validierung JWT Client Assertion](SmartBackendServices/Schritt3AbrufAccessToken.md) |
| ANF-CON-042 | [Patient- / User-level Backend Service](SmartBackendServices/Schritt3AbrufAccessToken.md) |
| ANF-CON-043 | [Zurückweisung Scopes Backend Service](SmartBackendServices/Schritt3AbrufAccessToken.md) |
| ANF-CON-044 | [Scope-Parameter Backend Service](SmartBackendServices/Schritt3AbrufAccessToken.md) |