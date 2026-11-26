# Release Notes - ISiK Subscription Implementierungsleitfaden v6.0.0

ISiK Subscription Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Release Notes**

## Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

### Version 6.0.0

Datum: 01.07.2026

* `improve` Update der Dependency auf die neue Basisprofile-DE version 1.6.0 für alle Module [https://github.com/gematik/spec-ISiK-Basismodul/pull/1272](https://github.com/gematik/spec-ISiK-Basismodul/pull/1272)

Mit Inkrafttreten der Stufe 6 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich. **Hinweis:** Dies ändert nichts daran, dass das Subscription-Moul in Stufe 6 als Ganzes nicht normativ bindend ist.

### Version 6.0.0-rc1 (Benehmensherstellung)

Datum: 10.06.2026

* `improve` Hinweis zu bekanntem Dependency-Problem im Subscription-Backport-Package inklusive Workaround ergänzt auf Startseite ergänzt. [https://github.com/gematik/spec-ISiK-Basismodul/pull/1237](https://github.com/gematik/spec-ISiK-Basismodul/pull/1237)
* `improve` QA-Verbesserungen: IG-Publisher-Parameter hinzugefügt, ignoreWarnings.txt eingeführt, Umstellung auf deutsche Display-Validierung [https://github.com/gematik/spec-ISiK-Basismodul/pull/1190](https://github.com/gematik/spec-ISiK-Basismodul/pull/1190)
* `fix` Erweiterung der ISiK eigenen Codesysteme um die Information zur Sprache [https://github.com/gematik/spec-ISiK-Basismodul/pull/1214](https://github.com/gematik/spec-ISiK-Basismodul/pull/1214)

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

### Version 6.0.0-rc

Datum: 02.04.2026

* `improve` Performance und Paging-Anforderungen in den übergreifenden Festlegungen eingebracht (gilt für alle Module) [https://github.com/gematik/spec-ISiK-Basismodul/pull/1068](https://github.com/gematik/spec-ISiK-Basismodul/pull/1068)
* `improve` Verpflichtende Einführung des Suchparameters `_lastUpdated` [https://github.com/gematik/spec-ISiK-Basismodul/pull/1053](https://github.com/gematik/spec-ISiK-Basismodul/pull/1053)
* `improve` Implicit Rules auf 0..0 beschränkt [https://github.com/gematik/spec-ISiK-Basismodul/pull/1075](https://github.com/gematik/spec-ISiK-Basismodul/pull/1075)
* `improve` Hinzufügen von zwei weiteren Subscription Topics zur Abbildung von aktualisierten bzw. abgesagten Terminen [https://github.com/gematik/spec-ISiK-Basismodul/pull/1087](https://github.com/gematik/spec-ISiK-Basismodul/pull/1087)
* `improve` Subscription-Modul für Stufe 6 normativ erweitert [https://github.com/gematik/spec-ISiK-Basismodul/pull/1114/](https://github.com/gematik/spec-ISiK-Basismodul/pull/1114/) 
* Verpflichtende Unterstützung von ISiK-konformen FHIR Subscriptions für den Subscription Server-Akteur (normativer Status von KANN auf MUSS angehoben)
* Payload in Notifications auf `id-only` beschränkt — Ressourcendaten werden nicht übertragen (Pull-Prinzip)
* Vollständiger Subscription-Workflow dokumentiert: Topic Discovery, Subscription-Anlage, Handshake/Aktivierung, Notifications, Heartbeat, `$status`, `$events`, Recovery und Fehlerhandling
* Sicherheitsanforderungen festgelegt: Write-Only-Semantik für `channel.header`, kein PHI-Payload in Notifications
* Heartbeat-Pflicht normativ dokumentiert (`heartbeatPeriod`)
* CapabilityStatement-Extension `capabilitystatement-subscriptiontopic-canonical` verpflichtend mit allen ISiK-Topics (inkl. generischem Topic)
* Topic-Definitionen für alle SubscriptionTopics präzisiert (Trigger-Semantik je Code)
 
* `improve` Guidance und Examples für Encounter-Merge- und Patient-Merge-Topic ergänzt https://github.com/gematik/spec-ISiK-Basismodul/pull/1203

-------

### Version 5.1.1

Datum: 17.12.2025

Im Rahmen dieser Technical Correction wurden keine Änderungen an diesem Implementation Guide vorgenommen. Daher sind keine Anpassungen durch Implementierende erforderlich, und die Rückwärtskompatibilität zum zuletzt veröffentlichten Package bleibt uneingeschränkt erhalten.

### Version 5.1.0

Datum: 23.10.2025

* `improve` id-Elemente sind in **allen** Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. [https://github.com/gematik/spec-ISiK-Basismodul/pull/799](https://github.com/gematik/spec-ISiK-Basismodul/pull/799)
* `documentation` Rendering der im Modul verwendeten ValueSets [https://github.com/gematik/spec-ISiK-Basismodul/pull/802](https://github.com/gematik/spec-ISiK-Basismodul/pull/802)
* `documentation` Dokumentation der Suchparameter (Beispiele) in CpS überführt. Darüber hinaus wurden einige Suchparameter, aus Stufe 3 in Stufe 5 übernommen [https://github.com/gematik/spec-ISiK-Basismodul/pull/809](https://github.com/gematik/spec-ISiK-Basismodul/pull/809)

-------

### Version 5.0.0

Datum: 26.06.2025

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

### Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* Keine weiteren Änderungen

### Version 5.0.0-rc (Kommentierung)

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025

* `improve` Nachbau der Profile `BackportSubscriptionNotificationR4` & `BackportSubscriptionStatusR4`, Hinzufügen der R4B CS & VS `SubscriptionNotificationType` [https://github.com/gematik/spec-ISiK-Basismodul/pull/645](https://github.com/gematik/spec-ISiK-Basismodul/pull/645)
* Erweiterung der PatientMerge Subscription um den R5 Topic Subscription Mechanismus, um weitere Subscription UseCases zu supporten.
* Überführung der Subscription Profile in ein eigenes Modul "Subscription".

-------

