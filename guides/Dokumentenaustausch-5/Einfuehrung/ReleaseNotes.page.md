---
topic: ImplementationGuide-markdown-ReleaseNotes
---
# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

Offene Punkte und bekannte Probleme siehe [GitHub Issues](https://github.com/gematik/ISiK-Dokumentenaustausch/issues?q=is%3Aissue+is%3Aopen+label%3A%22offene+Punkte+Ballot%22)

## Version 5.1.0

Datum: 23.10.2025

* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799
* `documentation` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802

----

## Version 5.0.0

Datum: 26.06.2025

* `fix` Anpassung der Displaywerte in den DocumenReference-Examples von „mimeType Sufficient“ zu „Format aus MIME Type ableitbar“ https://github.com/gematik/spec-ISiK-Basismodul/pull/765
* `documentation` Hinweise auf erläuternde Inhalten auf den MHD Seiten integriert https://github.com/gematik/spec-ISiK-Basismodul/pull/770 

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

## Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* `improve` Neuer verbindlicher Suchparameter `identifier` für DocumentReference hinzugefügt, auf Basis von [Community-Feedback](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.5D.20masterIdentifier.20als.20OID.3F)
* `improve` Anforderung gelockert zur Herstellung des Patienten-Kontextes und Ausschluss von logischen Referenzen im ISiK-kontext entfernt https://github.com/gematik/spec-ISiK-Basismodul/pull/718 > #MOCK-Change zu prüfen - ggf. Lockerung (hinsichtlich logischer Referenzen) - Ticket https://service.gematik.de/browse/PTDATA-1916
* `improve` Must-Support auf Bundle.entry, da darunterliegende Elemente ebenfalls als Must-Support gekennzeichnet sind https://github.com/gematik/spec-ISiK-Basismodul/pull/725
* `improve` Einschränkenden Kardinalität auf DocumentReference.custodian wurde aufgehoben, da Custodian in MHD mit der neuesten Version ebenfalls zulässig ist https://github.com/gematik/spec-ISiK-Basismodul/pull/725 
* `improve` Optimierung der Verständlichkeit des Abschnittes "2:3.68.4.1.2 Message Semantics" https://github.com/gematik/spec-ISiK-Basismodul/pull/739
* `improve` Update Anforderungen zu Herstellung von Patient- und Encounterkontext https://github.com/gematik/spec-ISiK-Basismodul/pull/756/files


----

## Version 5.0.0-rc1
Datum: 13.05.2025

* `improve` Dependency auf IHE-MHD-Package entfernt, da dieses nicht für die Validierung
  erforderlich ist und mehrere umfangreiche indirekte Dependencies enthält, die für dieses Modul
  nicht benötigt werden
* `improve` Für die menschenlesbare Bezeichnung des Dokuments ist das Element
  `content.attachment.title` zu verwenden. Die bisherige Nutzung von `DocumentReference.description`
  entfällt zugunsten einer besseren Angleichung an MHD und die ePA-Spezifikation. Implementierungen
  sollten daher den Titel des Dokuments ausschließlich in `content.attachment.title`
  angeben. https://github.com/gematik/spec-ISiK-Basismodul/pull/686 #MOCK-Change zu prüfen _> ggf. guter Fall für Demo zu abwärtskompatibler Lösung (Stufe 3 und 5). - Ticket https://service.gematik.de/browse/PTDATA-1917 
    * content .attachment.title` wurde auf 1..1 MS gesetzt, um die Verwendung zu erzwingen.
    * DocumentReference .description` wurde auf 0..1 MS gesetzt, und kann weiterhin verwendet werden,
      um inhaltliche Hinweise zum Dokument, eine knappe Zusammenfassung oder ergänzende Kommentare
      bereitzustellen.


## Version 5.0.0-rc (Kommentierung)

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025

* `improve` Löschen von vorläufigen Dokumenten durch update des docStatus auf `entered-in-error` mittels `$updateMetadata` hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/582 #MOCK-Change zu prüfen 
* `improve` Ergänzung einer weiteren experimentellen Methode der Herstellung von Patientenkontext mittels Logical Reference https://github.com/gematik/spec-ISiK-Basismodul/pull/582 #MOCK-Change zu prüfen -> ticket https://service.gematik.de/browse/PTDATA-1916
    * Im Zuge dessen Lockerung der Kardinalität von `DocumentReference.subject.reference` auf 0..1, um diese Methode zu ermöglichen #MOCK-Change zu prüfen 

* `fix` Entfernung des fixed values "urn:ietf:rfc:3986" auf DocumentReference.masterIdentifier.system, um auch Identifier der Form root+extension zu ermöglichen, siehe
https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.9-fhir-data-types
https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.5D.20masterIdentifier.20als.20OID.3F

----

## Version: 4.0.2

Datum: 19.3.2025

* `improve` 'revert' 'improve' Patient-/Encounter-Interaktionen hinzugefügt - https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/233/commits/105c1cffdf91ccb5e51dc7adf5e8a238019fd7d4

----

## Version: 4.0.1

Datum: 24.01.2025

* `documentation` Übertragung der Dokumentation in die FHIR-Resourcen, Refactoring des ImplementationGuides https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/211
* `fix` Update der der dependency de.ihe-d.terminology von 3.0.0 -> 3.0.1 https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/212 - Begründung de.ihe-d.terminology#3.0.0 war defekt: ValueSets in XML abgelegt. Inhaltlich keine Änderung
* `fix` Fehlende Kennzeichnung von MS-Elementen im Bundle-Profil
https://github.com/gematik/spec-ISiK-Dokumentenaustausch/issues/210
* `fix` Binary-URL zeigt noch auf Basis V3
https://github.com/gematik/spec-ISiK-Dokumentenaustausch/issues/206
* `fix` Operations hängen im CapabilityStatement am falschen Branch
https://github.com/gematik/spec-ISiK-Dokumentenaustausch/issues/206
* `fix` Falscher Satz über keine notwendige Verbindlichkeit entfernt und Formulierung verbessert https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/213
* `improve` Link zum GitHub Archiv des Moduls wurde in der README ergänzt https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/209
* `improve` Update der validation pipeline Versionen https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/214
* `fix` Beispiel für Dokumentensurchergebnisse wurde gefixt https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/217
* `fix` OPD-0 Warnung in OperationUpdateMetadata https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/218
* `fix` Hinzufügen der Wildcard dependency für die Basismodul dependency https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/221



----

## Version: 4.0.0

Datum: 09.09.2024

* `fix` IHEXDStypeCode Canonical-URL (entspricht TC 3.0.3) https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/198
* `improve` patternCoding by @f-peverali (entspricht TC 3.0.3) https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/198
* `fix` Fix der XDS Slices für .type und .category (entspricht TC 3.0.3) https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/198

----

## Version: 4.0.0-rc

Datum: 03.04.2024

* `improve` Dependency hinzugefügt zu IHE-Package zwecks Auflösung von ValueSets https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/181
* Erweiterung um Use Case Diagramm, Resourcen Diagramm und Informationsmodell
* Erweiterung um Use Case Zusammenhänge von verketteten Suchparametern


----

## Version: 3.0.3

Diese Technical Correction entfällt für Stufe 4, da die Änderungen direkt in Stufe 4 (4.0.0-rc2) eingebracht sind.

----

## Version: 3.0.2

Datum: 27.03.2024

* `documentation` Hinweis hinzugefügt wie aus einer UUID eine OID generiert werden kann #172 by @alexzautke in https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/172
* `documentation` Hinweis zum Umgang mit Dokumentenupdates hinzugefügt
  * `fix` Fix /versionierung von dokumenten #177 by @alexzautke in https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/177
* `documentation` Hinweis zur base64-Kodierung von FHIR-nativen Dokumenten hinzugefügt
  * `improve` Hinweis zur Kodierung von FHIR Bundles hinzugefügt #178 by @alexzautke in https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/178
* `improve` Hinweis zur Verwendung des ‘UNK’-Codes im KDL-Mapping hinzugefügt (#179): https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/179
* `improve` Klarstellung , dass keine Vorgaben für "Managing Return Content" bestehen by @alexzautke in https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/183
* Beispiel Encounter geändert zu Abteilungskontakt (kohärent mit Basis): https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/184/files
* `improve` Update Basis dependency to 3.0.4

**Full Changelog**: https://github.com/gematik/spec-ISiK-Dokumentenaustausch/compare/v3.0.1...v.3.0.2

----

## Version: 3.0.1

Datum: 05.01.2024

* `improve` Update Dependency zu Basismodul (Technical Correction 3.0.1)
* Nutzung der ISiKBinary präzisiert und im CapabilityStatement entsprechend korrigiert: add CpS statement and reference regarding ISIK binary PTDATA-605 by @f-peverali in https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/157
* Anforderungen zur Nutzung der Ressourcen aus ISIK Basismodul präzisiert: Feature/ptdata 773 anforderungen anpassen basis ressourcen by @f-peverali in https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/163
* rm all interaction on Encounter + Patient  in CpS by @f-peverali in https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/165


----

## Version: 3.0.0

Datum: 01.07.2023

* Mit dem Release der Stufe 3.0.0 werden die unten gelisteten Änderungen normativ festgesetzt.

----

## Version: 3.0.0-rc4

Datum: 31.05.2023

* Dokumentenmetadaten (DocumentReference): Kardinalität korrigiert zur Harmonisierung mit MHD
  * `improve` cardinality #139 by @f-peverali in https://github.com/gematik/spec-ISiK-Dokumentenaustausch/pull/143

## Version: 3.0.0-rc3

Datum: 04.04.2023

* `improve` Update der Dependency auf Basismodul 3.0.0-rc2

---

## Version: 3.0.0-rc2

Datum: 31.01.2023
- Status -Korrektur: "draft"
- Dependency update auf ISiK Basis-Version 2.0.4
- weitere Änderungen an Implementierungsleitfaden (informativ)
---

## Version: 3.0.0-rc1

Datum: 04.01.2023
- Interaktion Dokumentenbereitstellung: Ersetzen der Operation $submit-document mit IHE ITI-105
- Interaktion Metadaten erzeugen: Ersetzen der Operation $generate-metadata mit IHE ITI-106
- Profil ISiKDokumentenMetadaten:
  - Kardinalität von DocumentReference.content.attachment.data und .url gelockert, um ITI-105 bedienen zu können
  - Kommentare zu Inkompatibilitäten angepasst auf die Änderungen in IHE MHD Version 4.2.0
- Akteure und Interaktionen: Anpassung der Dokumentation and die IHE Nomenklaturen
- Update MHD Dependency -> 4.2.0
- Update KDL Dependency -> 2022.1.2
- Beispieldaten an Änderungen in den Interaktionen angepasst
----

## Version: 2.0.1

Datum: 31.10.2022

- Update Basismodul Dependency -> 2.0.2

----

## Version: 2.0.0

Datum: 30.06.2022

- Initialer Release

----
