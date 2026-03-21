---
topic: ReleaseNotes
---

### Version 6.0.0-rc

* `improve` Das pattern auf `Patient` im subjectType von FormularDefinition wurde entfernt, damit auch weitere Use Cases mit dem Modul umsetzbar sind. Die Anforderungen und Einschränkungen, die in diesem IG für ISiK-Formulare definiert sind, beziehen sich trotzdem weiterhin auf Formulare mit subjectType `Patient`.

* `improve` Das Akteursmodell wurde um zwei neue optionale Akteure erweitert: `FormularDatenExtraktor` und `FormularDatenVorbeleger`. Diese eigenständigen Akteure können Teilfunktionen (Extraktion bzw. Vorbelegung) aus dem FormularRenderer auslagern. Dies ermöglicht schlankere Renderer-Implementierungen, insbesondere im mobilen Umfeld oder für Szenarien ohne direkten Leistungserbringer-Infrastrukturzugriff (z.B. TI-Messenger).

* `improve` Neues Beispielszenario für den TI-Messenger (TI-M) hinzugefügt: Die Seite Beispielszenarien beschreibt, wie das Formularmodul  im Kontext des TI-Messengers genutzt werden kann, inklusive Verlagerung von Vorbelegung und Extraktion in den "TI-M Pro Client".

* `improve` Neue Anforderung an den FormularRenderer: Bei der Rückübermittlung SOLL ein menschenlesbares Narrative erzeugt werden, das alle ausgefüllten Formularinhalte darstellt. Das Narrative kann entweder als `QuestionnaireResponse.text` oder als Bestandteil des Document-Bundles gemäß ISiK-Dokumentenaustausch übermittelt werden. Dies sichert Anzeigefähigkeit in Primärsystemen ohne FHIR-Formular-Unterstützung.

* `improve` Die Interaktion FormularDatenRückübermittlung wurde durch ein neues Profil `FormularDatenRueckuebermittlungBundle` konkretisiert. Das Bundle enthält neben Composition, Patient und Encounter nun zusätzlich die FormularDefinition (optional), die FormularDaten (verpflichtend) sowie ggf. extrahierte FHIR-Ressourcen (FormularDatenExtrakt). Primärsysteme müssen die strukturierten Anteile in der aktuellen Stufe noch nicht übernehmen, sollten das Bundle jedoch vollständig persistieren.

* `improve` Neue Festlegungen zur Versionierung von Formulardefinitionen: FormularDefinitionen SOLLTEN nach dem SemVer-Verfahren versioniert werden. Major-, Minor- und Patch-Inkremente sind mit klarer Semantik bezüglich Rückwärtskompatibilität definiert.

* `improve` Der Abschnitt zur MDR-Relevanz von Formularen (Best Practice) wurde inhaltlich überarbeitet und präzisiert: Es wird erklärt, unter welchen Bedingungen eine anzeigende oder berechnende Software unter die EU-Medizinprodukteverordnung fällt. Die zugehörige Extension wurde umbenannt (`ISiKMDRRelevanzFormularExtension` → `ISiKMpFormularExtension`) und als Modifier-Extension modelliert.

* `improve` Neue Seite mit expliziten Implementierungsanforderungen (SHALL/SHOULD/MAY) für Akteure, die nicht über CapabilityStatements abgebildet werden: FormularLauncher (Fremdaufruf-Parameter), FormularDefinitionsErsteller (Gültigkeitsprüfung generierter Questionnaires) und FormularRenderer (Stand-Alone-Launch, Rendering, Vorbelegung).

* `improve` Performance und Paging-Anforderungen in den übergreifenden Festlegungen eingebracht (gilt für alle Module) https://github.com/gematik/spec-ISiK-Basismodul/pull/1068

* `fix` Schwächung der Verpflichtung zur Umsetzung des Suchparameters '_tag' von `SHALL` zu `MAY` - amalog zu TC 5.1.2 https://github.com/gematik/spec-ISiK-Basismodul/pull/1040

* `improve` Verpflichtende Einführung des Suchparameters `_lastUpdated`  https://github.com/gematik/spec-ISiK-Basismodul/pull/1053

* `improve` Implicit Rules auf 0..0 beschränkt https://github.com/gematik/spec-ISiK-Basismodul/pull/1075


### Version 5.1.1

Datum: 17.12.2025

* `documentation` Fehlende Comments und shorts für Must-Support Elemente hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/918

### Version 5.1.0

Datum: 23.10.2025

* `improve` enableWhen-Element mit MS versehen, wurde initial vergessen aber in Beispielen und Beschreibungen genannt https://github.com/gematik/spec-ISiK-Basismodul/pull/896

* `documentation` Satz zur Nutzung der Labor-Profile verschoben in den korrekten IG (ICU) - https://github.com/gematik/spec-ISiK-Basismodul/pull/867
* `improve` Separierung, Vervollständigung und Dokumentation von Beispiel-Questionnaires
* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799
* `documentation` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802


### Version 5.0.0

Datum: 26.06.2025

- `improve` Fehlende Begründungen und Kommentare zu Pflichtfeldern hinzugefügt  https://github.com/gematik/spec-ISiK-Basismodul/pull/746
- `improve` Beschreibung der MDR-Relevant Extension wurde hinzugefügt und ausführlicher gestaltet https://github.com/gematik/spec-ISiK-Basismodul/pull/744
- `improve` Hinweis auf Umgang mit verschiedenen Sprachversionen https://github.com/gematik/spec-ISiK-Basismodul/pull/747/

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

### Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

- `improve` Anpassung des Satzes zur Verwendung von Observation Profilen in item.definition https://github.com/gematik/spec-ISiK-Basismodul/pull/740
- `improve` MS-Flag auf Questionnaire.item.code hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/740
- `improve` Questionnaire.version wird 1..1 und Angabe der Version des Questionnaires ist bei Referenzierung verpflichtend anzugeben. Zusätzlich wird der Umgang mit Versionen im SemVer Format textuell erläutert. https://github.com/gematik/spec-ISiK-Basismodul/pull/74

### Version 5.0.0-rc

Datum: 09.04.2025

- Initialer Release
