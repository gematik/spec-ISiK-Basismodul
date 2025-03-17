---
topic: Akteure
---

# Akteure

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>

**Diskussion**: Dieser Abschnitt fasst einen laufenden Arbeitsstand zu einem Akteurs-Konzept in ISiK zusammen, sodass die hier getroffenen Festlegungen nicht als zusätzliche normative Festlegung (MUSS) zu verstehen sind. Vielmehr werden getroffene normative Festlegungen (MUSS), die im Kontext des [CapabilityStatements des Vitalparameter Implementierungsleitfadens](https://simplifier.net/guide/isik-vitalparameter-v4/ImplementationGuide-markdown-CapabilityStatement?version=current) geführt werden, hier als 'Akteure' dargestellt und damit zur Umsetzung des ICU-Normalstation-Workflows definitorisch (informativ) präzisiert.
<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>


Zur Umsetzung des vorliegenden Workflows MÜSSEN Systeme folgende Akteure implementieren (schematische Darstellung - eine technische Detaillierung mit normativer Geltung wird im CapabilityStatement getroffen). 
Eine 'Transaction' bezeichnet eine schematische Interaktion, die die jeweiligen Akteure erfüllen MÜSSEN (M) oder KÖNNEN (O):

## Autorisierungsserver
Rolle: Der Autorisierungsserver ist verantwortlich für die Authentifizierung und Autorisierung von SMART-Clients, die auf FHIR-Ressourcen zugreifen möchten. Er stellt sicher, dass nur berechtigte Anwendungen und Benutzer Zugriff auf sensible Gesundheitsdaten erhalten.

Interaktionen: READ, SEARCH

## SMART-Client
Rolle: Ein SMART-Client ist eine Anwendung, die auf FHIR-Ressourcen zugreift, um Gesundheitsdaten zu lesen oder zu schreiben. Dies kann beispielsweise eine mobile Gesundheits-App oder ein klinisches Entscheidungshilfesystem sein.

# Festlegung zur Implementierung der Akteure

Die Implementierung der Akteure ist optional, da der Zustand des Implementation Guides nicht normativ ist.
