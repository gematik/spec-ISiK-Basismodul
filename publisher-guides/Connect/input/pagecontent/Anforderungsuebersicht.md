### Festlegungen und Anforderungsübersicht


#### Normative Festlegungen

Die normativen Festlegungen des Moduls ISiK Connect  sind im Wesentlichen der Seite zu den {{pagelink: ImplementationGuide/markdown/Conformance.md, text:Festlegungen für Connect}} zu entnehmen.

#### Anforderungsübersicht 

In dem nachfolgenden Abschnitt soll eine Übersicht zu Anforderungen im Implementierungsleitfaden bereitgehalten werden. Teilweise haben diese Anforderungen jedoch nur optionalen Charakter.

| ID | Anforderung | Verbindlichkeit
|--------|------|------
| ANF-CON-001  | {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/KompatibilitaetDerGematikSpezifikation.md, text:IHE IUA - Abschnitt 34.1.1.3 Resource Server}} | MUSS
| ANF-CON-002 | {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/KompatibilitaetDerGematikSpezifikation.md, text:IHE IUA - Abschnitt 3.103.2.1 Resource Server}} | SOLL
| ANF-CON-003  | {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/KompatibilitaetDerGematikSpezifikation.md, text:IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type}} | SOLL
| ANF-CON-004  | {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/KompatibilitaetDerGematikSpezifikation.md, text:IHE IUA - Abschnitt 3.71.4.1.2.2 Authorization Code grant type}} | MUSS
| ANF-CON-005  | {{pagelink:ImplementationGuide/markdown/ISiKAutorisierung.md, text:ISiK-Ressourcen-Server - Verarbeitung von Autorisierungen}} | MUSS
| ANF-CON-006  | {{pagelink:ImplementationGuide/markdown/ISiKAutorisierung.md, text:FHIR-Ressourcen-Server - Mindestunterstützung Compartment Definition}} | MUSS
| ANF-CON-007  | {{pagelink:ImplementationGuide/markdown/ISiKAutorisierung.md, text:FHIR-Ressourcen-Server - Bestätigung von Scopes}} | MUSS
| ANF-CON-008  | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt1RegistrierungClient.md, text:Autorisierungsserver - Client-Id Vergabe}} | MUSS 
| ANF-CON-009  | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt2ClientAutorisierung.md, text:EHR-Client-Start durch externen Kontextaufruf}} | MUSS
| ANF-CON-010 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt2ClientAutorisierung.md, text:SMART App Launch - EHR Launch Parameter}} | MUSS
| ANF-CON-011 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt2ClientAutorisierung.md, text:Autorisierungsendpunkte per HTTPS erreichbar}} | MUSS
| ANF-CON-012 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt2ClientAutorisierung.md, text:Standalone Launch - URL des FHIR-Endpunkts}} | MUSS
| ANF-CON-013 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt2ClientAutorisierung.md, text:Abfrage des `.well-known/smart-configuration` Dokuments}} | MUSS
| ANF-CON-014 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt2ClientAutorisierung.md, text:OAuth 2.0 Endpunkte im CapabilityStatement}} | MUSS
| ANF-CON-015 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt2ClientAutorisierung.md, text:Scopes for requesting identity data}} | MUSS
| ANF-CON-016 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt2ClientAutorisierung.md, text:Konfiguration der erlaubten Scopes pro Client}} | MUSS
| ANF-CON-017 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt4AustauschAutorisierungscodesZugangstoken.md, text:Confidential Clients - Authentifizierung am Token-Endpunkt}} | MUSS
| ANF-CON-018 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt4AustauschAutorisierungscodesZugangstoken.md, text:SMART App Launch - Obtain access token}} | MUSS
| ANF-CON-019 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt4AustauschAutorisierungscodesZugangstoken.md, text:Unterstützung verpflichtender SMART App Launch Details}} | MUSS
| ANF-CON-020 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt5FHIRRestInteraktion.md, text:Verarbeitung des Access Tokens - Validierungsschritte}} | MUSS
| ANF-CON-021 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt6RefreshToken.md, text:Begrenzte Gültigkeitsdauer des Access Tokens (RFC6819)}} | SOLL
| ANF-CON-022 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt6RefreshToken.md, text:Unterstützung von Refresh Tokens}} | SOLL
| ANF-CON-023 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt6RefreshToken.md, text:SMART App Launch - Refresh access token}} | MUSS
| ANF-CON-024 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt6RefreshToken.md, text:OAuth 2.0 Token Revocation (RFC7009)}} | MUSS
| ANF-CON-025 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt6RefreshToken.md, text:Sicherstellung der sofortigen Token-Invalidierung}} | MUSS
| ANF-CON-026 | {{pagelink:ImplementationGuide/markdown/Conformance.md, text:ISiK-Ressourcen-Server - Unterstützung von Scopes}} | MUSS
| ANF-CON-027 | {{pagelink:ImplementationGuide/markdown/Conformance.md, text:`.well-known`-Dokument über unterstützte Scopes}} | MUSS
| ANF-CON-028 | {{pagelink:ImplementationGuide/markdown/Conformance.md, text:ISiK-Funktionalitäten durch Reverse Proxy/API Gateway}} | KANN
| ANF-CON-029 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Verarbeitung von Autorisierungsinformationen}} | MUSS
| ANF-CON-030 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Keine Zugriffstoken ohne Kontextangabe akzeptieren}} | DÜRFEN NICHT
| ANF-CON-031 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Unterstützung der Kontexte "patient" und "encounter"}} | MUSS
| ANF-CON-032 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Durchsetzung von Autorisierungen gemäß Compartment Patient}} | MUSS
| ANF-CON-033 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Berechtigungen auf Ressourcentypen in der SMART Datei und Capabilities}} | MUSS
| ANF-CON-034 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Kategorien von SMART-on-FHIR-Berechtigungen auf Ressourcen}} | MUSS
| ANF-CON-035 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Autorisierungen ohne Compartment-Definition auf "user"- oder "system"-Level Scope}} | SOLL
| ANF-CON-036 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Verpflichtende Umsetzung der ISiK-Connect-Vorgaben}} | MUSS
| ANF-CON-037 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Berechtigungen im Scope in der Reihenfolge 'cruds' angeben}} | SOLL
| ANF-CON-038 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Wildcard-Scopes}} | MUSS
| ANF-CON-039 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Unterstützung von Suchparametern}} | MUSS
| ANF-CON-040 | {{pagelink:ImplementationGuide/markdown/SmartBackendServices/Schritt3AbrufAccessToken.md, text:exp-Parameter für Backend Service Tokens}} | DARF NICHT
| ANF-CON-041 | {{pagelink:ImplementationGuide/markdown/SmartBackendServices/Schritt3AbrufAccessToken.md, text:Validierung JWT Client Assertion}} | MUSS
| ANF-CON-042 | {{pagelink:ImplementationGuide/markdown/SmartBackendServices/Schritt3AbrufAccessToken.md, text:Patient- / User-level Backend Service}} | KÖNNEN/SOLL
| ANF-CON-043 | {{pagelink:ImplementationGuide/markdown/SmartBackendServices/Schritt3AbrufAccessToken.md, text:Zurückweisung Scopes Backend Service}} | MUSS
| ANF-CON-044 | {{pagelink:ImplementationGuide/markdown/SmartBackendServices/Schritt3AbrufAccessToken.md, text:Scope-Parameter Backend Service}} | MUSS
| ANF-CON-045 | {{pagelink:ImplementationGuide/markdown/ISiKundSMART/Schritt2ClientAutorisierung.md, text:Launch Scopes Access Token Response}} | MUSS
| ANF-CON-046 | {{pagelink: ImplementationGuide/markdown/Conformance/ConformanceSmartCapabilities.md, text:authorization_endpoint}} | MUSS
| ANF-CON-047 | {{pagelink: ImplementationGuide/markdown/Conformance/ConformanceSmartCapabilities.md, text:grant_types_supported}} | MUSS
| ANF-CON-048 | {{pagelink: ImplementationGuide/markdown/Conformance/ConformanceSmartCapabilities.md, text:refresh_token}} | MUSS
| ANF-CON-049 | {{pagelink: ImplementationGuide/markdown/Conformance/ConformanceSmartCapabilities.md, text:code_challenge_methods_supported}} | MUSS/DARF NICHT
| ANF-CON-050 | {{pagelink: ImplementationGuide/markdown/Conformance/ConformanceSmartCapabilities.md, text:scopes_supported}} | MUSS
| ANF-CON-051 | {{pagelink: ImplementationGuide/markdown/Conformance/ConformanceSmartCapabilities.md, text:capabilitites: permission-v2}} | MUSS
| ANF-CON-052 | {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:KEINE eigenen _CompartmentDefinitionen_}} | DÜRFEN NICHT
