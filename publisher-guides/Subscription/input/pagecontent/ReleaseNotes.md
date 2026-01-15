---
topic: ImplementationGuide-markdown-ReleaseNotes
---
# Release Notes



Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

## Version 6.0.0-rc

Datum: tbd.



----

## Version 5.1.1

Datum: 17.12.2025

Im Rahmen dieser Technical Correction wurden keine Änderungen an diesem Implementation Guide vorgenommen. Daher sind keine Anpassungen durch Implementierende erforderlich, und die Rückwärtskompatibilität zum zuletzt veröffentlichten Package bleibt uneingeschränkt erhalten.

## Version 5.1.0

Datum: 23.10.2025

* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799
* `documentation` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802
* `documentation` Dokumentation der Suchparameter (Beispiele) in CpS überführt. Darüber hinaus wurden einige Suchparameter, aus Stufe 3 in Stufe 5 übernommen https://github.com/gematik/spec-ISiK-Basismodul/pull/809

----

## Version 5.0.0

Datum: 26.06.2025

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

## Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* Keine weiteren Änderungen

## Version 5.0.0-rc (Kommentierung)

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025

* `improve` Nachbau der Profile `BackportSubscriptionNotificationR4` & `BackportSubscriptionStatusR4`, Hinzufügen der R4B CS & VS `SubscriptionNotificationType` https://github.com/gematik/spec-ISiK-Basismodul/pull/645
* Erweiterung der PatientMerge Subscription um den R5 Topic Subscription Mechanismus, um weitere Subscription UseCases zu supporten.
* Überführung der Subscription Profile in ein eigenes Modul "Subscription".
----
