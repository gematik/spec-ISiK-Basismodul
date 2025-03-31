---
topic: Akteure
---

# Akteure

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>

**Diskussion**: Dieser Abschnitt fasst einen laufenden Arbeitsstand zu einem Akteurs-Konzept in ISiK zusammen, sodass die hier getroffenen Festlegungen nicht als zusätzliche normative Festlegung (MUSS) zu verstehen sind. 
<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>

## Autorisierungs-Server
Rolle: Der Autorisierungs-Server ist verantwortlich für die Authentifizierung und Autorisierung von SMART-Clients, die auf FHIR-Ressourcen zugreifen möchten. Er stellt sicher, dass nur berechtigte Anwendungen und Benutzer Zugriff auf sensible Gesundheitsdaten erhalten.

## Ressourcen-Server
Rolle: Der ISiK Ressourcenserver stellt die ISiK-spezifischen FHIR-Ressourcen bereit und ermöglicht autorisierten Clients den Zugriff auf Gesundheitsdaten gemäß den ISiK-Connect-Spezifikationen.

## Client
Rolle: Ein Client ist eine Anwendung, die auf FHIR-Ressourcen zugreift, um Gesundheitsdaten zu lesen oder zu schreiben. Dies kann beispielsweise eine mobile Gesundheits-App oder ein klinisches Entscheidungshilfesystem sein.

# Festlegung zur Implementierung der Akteure

Die Implementierung der Akteure ist optional, da der Implementation Guides nicht normativ ist.
