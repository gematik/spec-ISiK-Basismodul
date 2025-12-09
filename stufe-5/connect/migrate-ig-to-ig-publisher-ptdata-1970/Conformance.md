# Conformance - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Conformance**

## Conformance

# Connect Festlegungen

-------

### Normativ

-------

Die verbindlichen Vorgaben von ISiK-Connect betreffen in ISiK Connect ausschließlich Systeme in der Rolle eines ISiK-Ressourcenservers:

* Bestätigungsrelevante ISiK-Ressourcen-Server MÜSSEN die in **SMART on FHIR** definierten **Scopes** unterstützen. Diese **Scopes** legen Syntax und Semantik für die an den Client delegierten Zugriffsrechte auf FHIR-Ressourcen fest (). Für die Details, siehe .
* Bestätigungsrelevante ISiK-Ressourcen-Server MÜSSEN über ein ‘.well-known’-Dokument Informationen über die unterstützen Kontexte und **Scopes** bereitstellen (). Für die Details, siehe .

Einzelne oder alle der für die ISiK-Bestätigung umzusetzenden Funktionalitäten KÖNNEN durch einen dem ISiK-Ressourcen-Server vorgelagertes System wie z. B. einen **Reverse Proxy** oder ein **API Gateway** realisiert werden (). In diesem Fall ist das vorgeschaltete System aus Sicht von ISiK als Teil des ISiK-Ressourcenservers anzusehen, d. h. bestätigungsrelevant ist die Kombination aus dem vorgeschalteten System und dem die geschützten Ressourcen bereitstellenden System. Entsprechend ist der Begriff “ISiK-Ressourcen-Server” zu interpretieren.

