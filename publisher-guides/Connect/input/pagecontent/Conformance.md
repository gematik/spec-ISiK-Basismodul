### Connect Festlegungen

---
#### Normativ
---

Die verbindlichen Vorgaben von ISiK-Connect betreffen in ISiK Connect ausschließlich Systeme in der Rolle eines ISiK-Ressourcenservers:
* Bestätigungsrelevante ISiK-Ressourcen-Server MÜSSEN die in _SMART on FHIR_ definierten _Scopes_ unterstützen. Diese _Scopes_ legen Syntax und Semantik für die an den Client delegierten Zugriffsrechte auf FHIR-Ressourcen fest ({{pagelink:ImplementationGuide/markdown/Anforderungsuebersicht.md, text:ANF-CON-26}}). Für die Details, siehe {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceScopesKontexte.md, text:Conformance: Scopes und Kontexte}}.
* Bestätigungsrelevante ISiK-Ressourcen-Server MÜSSEN über ein '.well-known'-Dokument Informationen über die unterstützen Kontexte und _Scopes_ bereitstellen ({{pagelink:ImplementationGuide/markdown/Anforderungsuebersicht.md, text:ANF-CON-027}}).  Für die Details, siehe {{pagelink:ImplementationGuide/markdown/Conformance/ConformanceSmartCapabilities.md, text:Conformance: SMART Capabilities}}.

Einzelne oder alle der für die ISiK-Bestätigung umzusetzenden Funktionalitäten KÖNNEN durch einen dem ISiK-Ressourcen-Server vorgelagertes System wie z. B. einen _Reverse Proxy_ oder ein _API Gateway_ realisiert werden ({{pagelink:ImplementationGuide/markdown/Anforderungsuebersicht.md, text:ANF-CON-028}}). In diesem Fall ist das vorgeschaltete System aus Sicht von ISiK als Teil des ISiK-Ressourcenservers anzusehen, d. h. bestätigungsrelevant ist die Kombination aus dem vorgeschalteten System und dem die geschützten Ressourcen bereitstellenden System. Entsprechend ist der Begriff "ISiK-Ressourcen-Server" zu interpretieren.
