---
topic: ImplementationGuide-markdown-ReleaseNotes
---
# Release Notes



Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

## Version 5.0.0

Datum: tbd.
* Nachbau der Profile `BackportSubscriptionNotificationR4` & `BackportSubscriptionStatusR4`, Hinzufügen der R4B CS & VS `SubscriptionNotificationType` https://github.com/gematik/spec-ISiK-Basismodul/pull/645
* Erweiterung der PatientMerge Subscription um den R5 Topic Subscription Mechanismus, um weitere Subscription UseCases zu supporten.
* Überführung der Subscription Profile in ein eigenes Modul "Subscription".
----
