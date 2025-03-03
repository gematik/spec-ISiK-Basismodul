# ISiK-Konformität

Die Vorgaben von ISiK-Sicherheit betreffen in ISiK Stufe 3 ausschließlich Systeme in der Rolle eines ISiK-Ressourcenservers:
* Bestätigungsrelevante ISiK-Ressourcenserver MÜSSEN ausgewählte der in _SMART on FHIR_ definierten _Scopes_ unterstützen. Diese _Scopes_ legen Syntax und Semantik für die an den Client delegierten Zugriffsrechte auf FHIR-Ressourcen fest.
* Bestätigungsrelevante ISiK-Ressourcenserver MÜSSEN über ein '.well-known'-Dokument Informationen über die unterstützen Kontexte und _Scopes_ bereitstellen. 

Einzelne oder alle der für die ISiK-Bestätigung umzusetzenden Funktionalitäten KÖNNEN durch einen dem ISiK-Ressourcenserver vorgelagertes System wie z. B. einen _Reverse Proxy_ oder ein _API Gateway_ realisiert werden. In diesem Fall ist das vorgeschaltete System aus Sicht von ISiK als Teil des ISiK-Ressourcenservers anzusehen, d. h. bestätigungsrelevant ist die Kombination aus dem vorgeschalteten System und dem die geschützten Ressourcen bereitstellenden System. Entsprechend ist in den nachfolgenden, normativen Abschnitten der Begriff "ISiK-Ressourcenserver" zu interpretieren.
