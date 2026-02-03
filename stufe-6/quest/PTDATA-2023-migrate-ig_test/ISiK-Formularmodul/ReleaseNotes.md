# Release Notes - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Release Notes**

## Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.4

### Version 5.1.1

Datum: 17.12.2025

* `documentation` Fehlende Comments und shorts für Must-Support Elemente hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/918

### Version 5.1.0

Datum: 23.10.2025

* `improve` enableWhen-Element mit MS versehen, wurde initial vergessen aber in Beispielen und Beschreibungen genannt https://github.com/gematik/spec-ISiK-Basismodul/pull/896
* `documentation` Satz zur Nutzung der Labor-Profile verschoben in den korrekten IG (ICU) - https://github.com/gematik/spec-ISiK-Basismodul/pull/867
* `improve` Separierung, Vervollständigung und Dokumentation von Beispiel-Questionnaires
* `improve` id-Elemente sind in **allen** Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799
* `documentation` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802

### Version 5.0.0

Datum: 26.06.2025

* `improve` Fehlende Begründungen und Kommentare zu Pflichtfeldern hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/746
* `improve` Beschreibung der MDR-Relevant Extension wurde hinzugefügt und ausführlicher gestaltet https://github.com/gematik/spec-ISiK-Basismodul/pull/744
* `improve` Hinweis auf Umgang mit verschiedenen Sprachversionen https://github.com/gematik/spec-ISiK-Basismodul/pull/747/

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

### Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* `improve` Anpassung des Satzes zur Verwendung von Observation Profilen in item.definition https://github.com/gematik/spec-ISiK-Basismodul/pull/740
* `improve` MS-Flag auf Questionnaire.item.code hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/740
* `improve` Questionnaire.version wird 1..1 und Angabe der Version des Questionnaires ist bei Referenzierung verpflichtend anzugeben. Zusätzlich wird der Umgang mit Versionen im SemVer Format textuell erläutert. https://github.com/gematik/spec-ISiK-Basismodul/pull/74

### Version 5.0.0-rc

Datum: 09.04.2025

* Initialer Release

