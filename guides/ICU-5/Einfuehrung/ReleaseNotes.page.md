---
topic: ImplementationGuide-markdown-ReleaseNotes
---
# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

Im Fall von prozessorientierten Implementierungsleitfäden beginnt die Versionierung gemäß Semver des Implementierungsleitfadens gemäß des Major Releases im Zuge dessen der Implementierungsleitfaden entstanden ist (X.0.0).
Darüber hinaus wird die Versionierung unabhängig von allen anderen Modulen und Packages gehandhabt. Für den Implementierungsleitfaden "ISiK ICU-Normalstation Workflow" wird zum Beispiel die initiale Version 4.0.0 gewählt, da der IG im Zuge der Stufe 4 entwickelt wurde.

## Version 5.1.1-rc

Datum: 11.12.2025

* `documentation` Dokumentation Profilen zwecks Kennzeichnung der Ableitung der Profile hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/870
* `documentation` Refactoring und Vervollständigung zur Dokumentation der Herstellung eines Patienten- und Ecounter-Kontextes
* `documentation` Satz zur Nutzung der Labor-Profile verschoben in den korrekten IG (ICU) - https://github.com/gematik/spec-ISiK-Basismodul/pull/867
* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799
* `add` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802
* `add` Minimal- und Maximalbeispiele für alle Vitalaparameter Profile wurden hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/866

----

## Version 5.0.0

Datum: 26.06.2025

* `improved` Klarstellung zur Mindestmenge an zu implementierenden Profilen für bestätigungsrelevante Systeme auf Grundlage von Akteuren und Rollen in ISiK https://github.com/gematik/spec-ISiK-Basismodul/pull/766

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

## Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* Keine weiteren Änderungen

## Version 5.0.0-rc

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025



## Version 4.0.1

Datum: 26.2.2025

* `improved` Ausarbeitung des Workflows als eigenständiger ImplementationGuide, u.a. Anpassung der Akteurs-Namen und CapabilityStatements


Die Profile befinden sich im [Package 4.0.1 Vitalparameter](https://simplifier.net/feeds/public/packages/de.gematik.isik-vitalparameter/4.0.1).

---

## Version 4.0.0

Datum: 25.2.2025

* `improved` Refactoring des Workflows als eigenständiger ImplementationGuide