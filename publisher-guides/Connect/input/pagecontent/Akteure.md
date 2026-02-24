---
topic: Akteure
---

<div style="display: flex; align-items: stretch; gap: 1rem;">
	<img src="Betriebskoordination_Gruen_gematik.svg" style="width: 20%; max-width: 20%; height: auto; max-height: 75px; object-fit: contain; align-self: stretch;" />
	<p style="margin: 0;"><strong>Diskussion:</strong> Dieser Abschnitt fasst einen laufenden Arbeitsstand zu einem Akteurs-Konzept in ISiK zusammen, sodass die hier getroffenen Festlegungen nicht als zusätzliche normative Festlegung (MUSS) zu verstehen sind.</p>
</div>

### Autorisierungs-Server
Der Autorisierungs-Server ist verantwortlich für die Authentifizierung und Autorisierung von SMART-Clients, die auf FHIR-Ressourcen zugreifen möchten. Er stellt sicher, dass nur berechtigte Anwendungen und Benutzer Zugriff auf sensible Gesundheitsdaten erhalten.

### ISiK-Ressourcen-Server
Der Akteur ISiK-Ressourcen-Server stellt die ISiK-spezifischen FHIR-Ressourcen bereit und ermöglicht autorisierten Clients den Zugriff auf Gesundheitsdaten gemäß den ISiK-Connect-Spezifikationen.

Für den Ressourcen-Server gelten die Festlegungen im Abschnitt [ISiK-Konformität](Conformance.html).

### Electronic Health Record (EHR)
Ein Electronic Health Record (EHR) bündelt einen Ressourcen-Server, Autorisierungs-Server und SMART App Launcher (und ggf. weitere Systeme).

Im Sinne von _Smart on FHIR_ ist der EHR das primäre Zielsystem für den Client.

### App-Launcher
Ein App-Launcher interagiert zwischen Autorisierungs-Server und ISiK-Ressourcen-Server und bietet einem Client einen Anwendungskontext. Der Kontext kann ein Patient oder Behandlungsfall aus dem EHR sein.


### Client
Ein Client ist eine Anwendung, die auf FHIR-Ressourcen zugreift, um Gesundheitsdaten zu lesen oder zu schreiben. Dies kann beispielsweise eine mobile Gesundheits-App oder ein klinisches Entscheidungshilfesystem sein.
