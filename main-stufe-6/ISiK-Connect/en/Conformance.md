# Connect Festlegungen - ISiK Connect Implementierungsleitfaden v6.0.0

ISiK Connect Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Connect Festlegungen**

## Connect Festlegungen

### Normativ

Die verbindlichen Vorgaben von ISiK-Connect betreffen in ISiK Connect ausschließlich Systeme in der Rolle eines ISiK-Ressourcenservers:

* Bestätigungsrelevante ISiK-Ressourcen-Server MÜSSEN die in **SMART on FHIR** definierten **Scopes** unterstützen. Diese **Scopes** legen Syntax und Semantik für die an den Client delegierten Zugriffsrechte auf FHIR-Ressourcen fest ([ANF-CON-26](Anforderungsuebersicht.md)). Für die Details, siehe [Conformance: Scopes und Kontexte](ConformanceScopesKontexte.md).
* Bestätigungsrelevante ISiK-Ressourcen-Server MÜSSEN über ein '.well-known'-Dokument Informationen über die unterstützen Kontexte und **Scopes** bereitstellen ([ANF-CON-027](Anforderungsuebersicht.md)). Für die Details, siehe [Conformance: SMART Capabilities](ConformanceSmartCapabilities.md).

Einzelne oder alle der für die ISiK-Bestätigung umzusetzenden Funktionalitäten KÖNNEN durch einen dem ISiK-Ressourcen-Server vorgelagertes System wie z. B. einen **Reverse Proxy** oder ein **API Gateway** realisiert werden ([ANF-CON-028](Anforderungsuebersicht.md)). In diesem Fall ist das vorgeschaltete System aus Sicht von ISiK als Teil des ISiK-Ressourcenservers anzusehen, d. h. bestätigungsrelevant ist die Kombination aus dem vorgeschalteten System und dem die geschützten Ressourcen bereitstellenden System. Entsprechend ist der Begriff "ISiK-Ressourcen-Server" zu interpretieren.

