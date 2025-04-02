| ID | Anforderung |
|--------|------|
| ANF-CON-001 | [IHE IUA - Abschnitt 34.1.1.3 Resource Server](markdown-UebergreifendeFestlegungen-KompatibilitaetDerGematikSpezifikation) |
| ANF-CON-002 | [IHE IUA - Abschnitt 3.103.2.1 Resource Server](markdown-UebergreifendeFestlegungen-KompatibilitaetDerGematikSpezifikation) |
| ANF-CON-003 | [IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type](markdown-UebergreifendeFestlegungen-KompatibilitaetDerGematikSpezifikation) |
| ANF-CON-004 | [IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type](markdown-UebergreifendeFestlegungen-KompatibilitaetDerGematikSpezifikation) |
| ANF-CON-005 | [ISiK-Ressourcenserver - Verarbeitung von Autorisierungen](ImplementationGuide-markdown-ISiKAutorisierung) | // Das hier zu 6. machen
| ANF-CON-006 | [FHIR-Ressourcenserver - Mindestunterstützung Compartment Definition](ImplementationGuide-markdown-ISiKAutorisierung) |
| ANF-CON-007 | [FHIR-Ressourcenserver - Bestätigung von Scopes](ImplementationGuide-markdown-ISiKAutorisierung) |
| ANF-CON-008 | [Autorisierungsserver - Client-Id Vergabe](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt1RegistrierungClient) |
| ANF-CON-009 | [EHR-Client-Start durch externen Kontextaufruf](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt2ClientAutorisierung) |
| ANF-CON-010 | [SMART App Launch - EHR Launch Parameter](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt2ClientAutorisierung) |
| ANF-CON-011 | [Autorisierungsendpunkte per HTTPS erreichbar](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt2ClientAutorisierung) |
| ANF-CON-012 | [Standalone Launch - URL des FHIR-Endpunkts](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt2ClientAutorisierung) |
| ANF-CON-013 | [Abfrage des `.well-known/smart-configuration` Dokuments](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt2ClientAutorisierung) |
| ANF-CON-014 | [OAuth 2.0 Endpunkte im CapabilityStatement](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt2ClientAutorisierung) |
| ANF-CON-015 | [Scopes for requesting identity data](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt2ClientAutorisierung) |
| ANF-CON-016 | [Konfiguration der erlaubten Scopes pro Client](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt2ClientAutorisierung) |
| ANF-CON-017 | [Confidential Clients - Authentifizierung am Token-Endpunkt](ImplementationGuide-markdown-ISiKundSMART#markdown-ISiKundSMART-Schritt4AustauschAutorisierungscodesZugangstoken) |
| ANF-CON-018 | [SMART App Launch - Obtain access token](ImplementationGuide-markdown-ISiKundSMART#markdown-ISiKundSMART-Schritt4AustauschAutorisierungscodesZugangstoken) |
| ANF-CON-019 | [Unterstützung verpflichtender SMART App Launch Details](ImplementationGuide-markdown-ISiKundSMART#markdown-ISiKundSMART-Schritt4AustauschAutorisierungscodesZugangstoken) |
| ANF-CON-020 | [Verarbeitung des Access Tokens - Validierungsschritte](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt5FHIRRestInteraktion) |
| ANF-CON-021 | [Begrenzte Gültigkeitsdauer des Access Tokens (RFC6819)](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt6RefreshToken) |
| ANF-CON-022 | [Unterstützung von Refresh Tokens](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt6RefreshToken) |
| ANF-CON-023 | [SMART App Launch - Refresh access token](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt6RefreshToken) |
| ANF-CON-024 | [OAuth 2.0 Token Revocation (RFC7009)](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt6RefreshToken) |
| ANF-CON-025 | [Sicherstellung der sofortigen Token-Invalidierung](ImplementationGuide-markdown-ISiKundSMART#ImplementationGuide-markdown-ISiKundSMART-Schritt6RefreshToken) |
| ANF-CON-026 | [ISiK-Ressourcenserver - Unterstützung von Scopes](ImplementationGuide-markdown-Conformance) |
| ANF-CON-027 | [`.well-known`-Dokument über unterstützte Scopes](ImplementationGuide-markdown-Conformance) |
| ANF-CON-028 | [ISiK-Funktionalitäten durch Reverse Proxy/API Gateway](ImplementationGuide-markdown-Conformance) |
| ANF-CON-029 | [Verarbeitung von Autorisierungsinformationen](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-030 | [Keine Zugriffstoken ohne Kontextangabe akzeptieren](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) | 
| ANF-CON-031 | [Unterstützung der Kontexte "patient" und "encounter"](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-032 | [Durchsetzung von Autorisierungen gemäß Compartment Patient](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-033 | [Berechtigungen auf Ressourcentypen in der SMART Datei und Capabilities](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-034 | [Kategorien von SMART-on-FHIR-Berechtigungen auf Ressourcen](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-035 | [Autorisierungen ohne Compartment-Definition auf "user"- oder "system"-Level Scope](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-036 | [Verpflichtende Umsetzung der ISiK-Connect-Vorgaben](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-037 | [Berechtigungen im Scope in der Reihenfolge 'cruds' angeben](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-038 | [Wildcard-Scopes](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-039 | [Unterstützung von Suchparametern](ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte) |
| ANF-CON-040 | [exp-Parameter für Backend Service Tokens](ImplementationGuide-markdown-BackendServices#ImplementationGuide-markdown-SmartBackendServices-Schritt3AbrufAccessToken) |
| ANF-CON-041 | [Validierung JWT Client Assertion](ImplementationGuide-markdown-BackendServices#ImplementationGuide-markdown-SmartBackendServices-Schritt3AbrufAccessToken) |
| ANF-CON-042 | [Patient- / User-level Backend Service](ImplementationGuide-markdown-BackendServices#ImplementationGuide-markdown-SmartBackendServices-Schritt3AbrufAccessToken) |
| ANF-CON-043 | [Zurückweisung Scopes Backend Service](ImplementationGuide-markdown-BackendServices#ImplementationGuide-markdown-SmartBackendServices-Schritt3AbrufAccessToken) |
| ANF-CON-044 | [Scope-Parameter Backend Service](ImplementationGuide-markdown-BackendServices#ImplementationGuide-markdown-SmartBackendServices-Schritt3AbrufAccessToken) |
| ANF-CON-045 | [Launch Scopes Access Token Response](ImplementationGuide-markdown-BackendServices#ImplementationGuide-markdown-SmartBackendServices-Schritt3AbrufAccessToken) |