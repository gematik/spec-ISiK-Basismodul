---
topic: ImplementationGuide-markdown-ReleaseNotes
---

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

### Version 6.0.0-rc

Datum: tbd.

* `improve` Performance und Paging-Anforderungen in den übergreifenden Festlegungen eingebracht (gilt für alle Module) https://github.com/gematik/spec-ISiK-Basismodul/pull/1068
* `improve` Verpflichtende Einführung des Suchparameters `_lastUpdated`  https://github.com/gematik/spec-ISiK-Basismodul/pull/1053
* `improve` Implicit Rules auf 0..0 beschränkt https://github.com/gematik/spec-ISiK-Basismodul/pull/1075
* `improve` Hinzufügen von zwei weiteren Subscription Topics zur Abbildung von aktualisierten bzw. abgesagten Terminen https://github.com/gematik/spec-ISiK-Basismodul/pull/1087
* `change` Verpflichtende Unterstützung von ISiK-konformen FHIR Subscriptions für den Subscription Server Akteur (normativer Status von KANN auf MUSS angehoben)
* `change` Payload in Subscription-Notifications beschränkt auf `id-only` — Ressourcendaten werden nicht in Notifications übertragen (Pull-Prinzip)
* `improve` Vollständiger Subscription-Workflow dokumentiert: Topic Discovery, Subscription-Anlage, Handshake/Aktivierung, Notifications, Heartbeat, `$status`, `$events`, Recovery und Fehlerhandling
* `improve` Sicherheitsanforderungen für Subscriptions festgelegt: Write-Only-Semantik für `channel.header`, kein Payload in Notifications
* `improve` Heartbeat-Pflicht für Subscription Server normativ dokumentiert (`heartbeatPeriod`)
* `improve` CapabilityStatement-Extension `capabilitystatement-subscriptiontopic-canonical` verpflichtend im Subscription Server Akteur mit Kern-Topics (patient-merge, encounter-merge, account-merge, appointment-update, appointment-cancel)
* `improve` Topic-Definitionen für Kern-SubscriptionTopics präzisiert (Trigger-Semantik je Code)

----

### Version 5.1.1

Datum: 17.12.2025

Im Rahmen dieser Technical Correction wurden keine Änderungen an diesem Implementation Guide vorgenommen. Daher sind keine Anpassungen durch Implementierende erforderlich, und die Rückwärtskompatibilität zum zuletzt veröffentlichten Package bleibt uneingeschränkt erhalten.

### Version 5.1.0

Datum: 23.10.2025

* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799
* `documentation` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802
* `documentation` Dokumentation der Suchparameter (Beispiele) in CpS überführt. Darüber hinaus wurden einige Suchparameter, aus Stufe 3 in Stufe 5 übernommen https://github.com/gematik/spec-ISiK-Basismodul/pull/809

----

### Version 5.0.0

Datum: 26.06.2025

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

### Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* Keine weiteren Änderungen

### Version 5.0.0-rc (Kommentierung)

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025

* `improve` Nachbau der Profile `BackportSubscriptionNotificationR4` & `BackportSubscriptionStatusR4`, Hinzufügen der R4B CS & VS `SubscriptionNotificationType` https://github.com/gematik/spec-ISiK-Basismodul/pull/645
* Erweiterung der PatientMerge Subscription um den R5 Topic Subscription Mechanismus, um weitere Subscription UseCases zu supporten.
* Überführung der Subscription Profile in ein eigenes Modul "Subscription".
----
