---
topic: ImplementationGuide-markdown-ReleaseNotes
---
# Release Notes



Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.


Die Tags werden folgendermaßen verwedent:

- 'documentation': um zu Kennzeichnen, dass hier nur etwas an der Dokumentation geändert oder hinzufügen wurde, das sich nicht auf normative Aspekte auswirkt.
- 'improve'  um Änderungen und neue Aspekte hinsichtlich normativer Inhalte per TC umzusetzen, die aber keine Fehler beheben.
- 'fix' sollte nur verwendet werden für Behebung von **Fehlern** an den (potentiell) normativen Inhalten der Spec (Anforderungen + Profile + CpS); Typo fixes werden nicht in die Releasenotes aufgenommen.


## Version 5.0.1


Datum: XX.XX.2025

* `improve` Festlegungen für Verwendung von `Encounter.location.location.identifier` konkretisiert. https://github.com/gematik/spec-ISiK-Basismodul/pull/827
* `improve` Allgemeine Hinweise zum Umgang mit fehlenden Daten und Austausch von Informationen im ISiK-Kontext ohne Patienten-Informationen hinzugefügt
* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet.
* `improve` Klarstellung, dass eine Versichertennummer_PKV neben einem KVNR-Identifier existieren kann. https://github.com/gematik/spec-ISiK-Basismodul/pull/814
* `improve` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802
* `improve` Klarstellung für Einschränkung des Patterns auf Encounter.location.status https://github.com/gematik/spec-ISiK-Basismodul/pull/826 


## Version 5.0.0

Datum: 26.06.2025
* `improve` Update Deutsche Basisprofile auf Version v1.5.4. Siehe Release Notes dort für weitere Details: https://simplifier.net/packages/de.basisprofil.r4/1.5.4 - https://github.com/gematik/spec-ISiK-Basismodul/pull/780
* `improve` Hinzufügen der Definition von DKG und KIG der 'Bestätigungsrelevanten Systeme' für ISiK Stufe 5 https://github.com/gematik/spec-ISiK-Basismodul/pull/784
* `improve` Darstellung des Bundle-Profils im IG https://github.com/gematik/spec-ISiK-Basismodul/pull/768

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

## Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* `improve` Anpassung der Anforderungen zum Serververhalten bei CREATE-Interaktionen: Nicht ISiK-konforme Ressourcen müssen nicht länger pauschal abgelehnt werden. https://github.com/gematik/spec-ISiK-Basismodul/pull/748
* `improve` Anpassung der Anforderungen zum Servererhalten bei READ-Interaktionen: Bereitgestellte Instanzen müssen nicht länger pauschal ISiK-konform sein. https://github.com/gematik/spec-ISiK-Basismodul/pull/748
* `improve` Schwächung der Anforderung zur Rückgabe von HTTPS-Status-Codes https://github.com/gematik/spec-ISiK-Basismodul/pull/748
* `fix` affectsState-Attribut der $update-Operation auf `true` gesetzt, in Folge dessen das Beispiel für den Aufruf auf die Verwendung von HTTP POST statt HTTP GET korrigiert. 
* `fix` Typo in Canonical des Codesystems und Valuesets UnterbrechungReha korrigiert https://github.com/gematik/spec-ISiK-Basismodul/pull/726 
* `improve` Dem ISiK Bericht Bundle wurden zwei neue Slices hinzugefügt, welche Patient (verpflichtend) und Encounter (optional) hinzufügen, um die Nutzung des Bundle besser darzustellen https://github.com/gematik/spec-ISiK-Basismodul/pull/738 
* `improve` Entfernen des LOINC-Patterns für genauere Kodierung im Profil ISiKBerichtSubSystem (Composition) und Update der Slices einschließlich detaillierte Beschreibung für .type https://github.com/gematik/spec-ISiK-Basismodul/pull/749
* `improve` Update UebergreifendeFestlegungen Methodik https://github.com/gematik/spec-ISiK-Basismodul/pull/708


## Version 5.0.0-rc1

Datum: 13.05.2025

* `fix` Fix Pattern auf Composition.category https://github.com/gematik/spec-ISiK-Basismodul/pull/693
* `improve` Erläuternde Seite für das neue Akteur und Rollen Konzept https://github.com/gematik/spec-ISiK-Basismodul/pull/701
* `improve` Entfernen des Abschnitts "Verpflichtende Suchparameter", da diese Information bereits im CapabilityStatement enthalten ist https://github.com/gematik/spec-ISiK-Basismodul/pull/709
* `fix` Fix fehlender Deklaration der Encounter-Ressource in CapabilityStatement LeistungserbringerRolle https://github.com/gematik/spec-ISiK-Basismodul/pull/713

## Version 5.0.0-rc (Kommentierung)

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025

* `improve` Auslagern der Subscription Profile und UseCases in ein eigenes Modul
  Subscription https://github.com/gematik/spec-ISiK-Basismodul/pull/645
* `improve` Klarstellung zum Zweck des Account Profils https://github.com/gematik/spec-ISiK-Basismodul/pull/632
* `improve` Coverage-Profil zur Abbildung sonstiger Kostenträger hinzugefügt: https://github.com/gematik/spec-ISiK-Basismodul/pull/602
* `improve` Hinweise zur Abbildung des Aufnahmegrunds im Encounter hinzugefügt: https://github.com/gematik/spec-ISiK-Basismodul/pull/647
* `improve` Encounter aus dem Modul Terminplanung als Profil entfernt und in das Basismodul übertragen, dafür Capability Statement erweitert um entsprechende Rolle https://github.com/gematik/spec-ISiK-Basismodul/pull/604
* `fix` Fix Pattern auf Composition.type https://github.com/gematik/spec-ISiK-Basismodul/pull/598
* `fix` Fix Pattern auf patternCoding.system für AlphaID + Beispiel AlphaID hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/556
* `improve` Hinweis zur Repräsentation einer PKV-VersichertenId hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/587

----

## Version 4.0.3
* `fix` broken package

----

## Version 4.0.2
* `fix` Anpassung Kardinalität von "ExtensionAbrechnungsart" unter Account.coverage https://github.com/gematik/spec-ISiK-Basismodul/pull/526
* `fix` SearchParameter “contains” existiert nicht in FHIR R4, Suchparameter wird entfernt  https://github.com/gematik/spec-ISiK-Basismodul/pull/529
* `fix` Korrektur eines Beispiels für eine GET-Abfrage zum Suchparameter 'near' https://github.com/gematik/spec-ISiK-Basismodul/pull/533
* `improve` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist. https://github.com/gematik/spec-ISiK-Basismodul/pull/515
* `fix` Der Name, Id und Canonical des ISiKPatientMergeSubscription Profils wurde an das ISiK Namingschema angepasst.  https://github.com/gematik/spec-ISiK-Basismodul/pull/539
* `improve` Schärfung von Kommentaren von MS-Feldern für das Datenobjekt ‘Practitioner’ https://github.com/gematik/spec-ISiK-Basismodul/pull/541
* `fix` Der Name, Id und Canonical des ISiKPatientMergeSubscription Profils wurde an das ISiK Namingschema angepasst. https://github.com/gematik/spec-ISiK-Basismodul/pull/539
* `improve` Generalisierter Abschnitt zur Herstellung des Patienten- und Encounter-Kontextes hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/542
* `improve` Beispiele hinzugefügt für Patient, Condition, Encounter https://github.com/gematik/spec-ISiK-Basismodul/pull/520 
* `improve` Groß- und kleinschreibung bei ISiK-eigenen CodeSystemen deaktiviert https://github.com/gematik/spec-ISiK-Basismodul/pull/532/files
* `fix` Korrektur eines Beispiels für eine GET-Abfrage zum Suchparameter 'near' https://github.com/gematik/spec-ISiK-Basismodul/pull/533
* `fix` Procedure-code existiert nicht, verwende clinical-code https://github.com/gematik/spec-ISiK-Basismodul/pull/531
* `improve` Update Basisprofile-De Version auf 1.5.2 https://github.com/gematik/spec-ISiK-Basismodul/pull/549


----

## Version 4.0.1

Datum: 25.11.2024

* `improve` Refactoring des ImplementationGuides
* `fix` Procedure.code zu Pflichfeld gemacht https://github.com/gematik/spec-ISiK-Basismodul/issues/454
* `fix` Condition.onset harmonisiert mit KBV-Profil und mit Condition.abatement https://github.com/gematik/spec-ISiK-Basismodul/issues/454
* `improve` Vereinheitlichung des Umgangs mit ressourcenübergreifenden Suchparametern 
https://github.com/gematik/spec-ISiK-Basismodul/issues/438
* `fix` Anpassung der include/revinclude Anforderungen in den übergreifenden Festelegungen und dem CapabilityStatement
* `fix` CodeSystem-Ressource wird im CapabilityStatement nun korrekt angezeigt
https://github.com/gematik/spec-ISiK-Basismodul/issues/436
* `fix` CapabilityStatement *near* SearchParameter type & ResourceType Organization spelling, removed custom backport Extension - switched to the official backport mechanism, fixed Bindings to CodeSystems    https://github.com/gematik/spec-ISiK-Basismodul/commit/ae706142832e2059046ce978c4b0dc472c2375e6
* `improve` Hinweis zur Handhabung von leeren Elementen und einem :not-Modifier hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/473 obsoleter PR, dafür umgesetzt hier: https://github.com/gematik/spec-ISiK-Basismodul/commit/e63cc68d311057f7b30b5b405c5533bef41e9d68
* `fix` Dependency zum R5 backporting IG auf das R4 only  package angepasst https://github.com/gematik/spec-ISiK-Basismodul/pull/479
* `improve` Formulierung zur Verwendung des Versorgungsstellenkontaktes https://github.com/gematik/spec-ISiK-Basismodul/pull/488
* `improve` Beispiel Station hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/546/files
* `improve` Harmonisierung von Encounter.type und Account.type https://github.com/gematik/spec-ISiK-Basismodul/pull/441
* `improve` Änderung der Kardinalität von Composition.type.text auf 1..1 https://github.com/gematik/spec-ISiK-Basismodul/pull/441

## Version: 4.0.0

Datum: 30.8.2024

* `improve` Neudefinition der bestätigungsrelevanten Systeme https://github.com/gematik/spec-ISiK-Basismodul/pull/426
* `improve` Überarbeitung des Abschnitts zu Suchparametern mit Änderung der Anforderungen https://github.com/gematik/spec-ISiK-Basismodul/pull/411
* `improve` Überarbeitung der Must Support Definition: https://github.com/gematik/spec-ISiK-Basismodul/pull/412
* `improve` Hinzufügen von MS und weitere Anpassung von Encounter.location, um Abbildung von Standort-Historie zu ermöglichen: https://github.com/gematik/spec-ISiK-Basismodul/pull/407
* `improve` Added MS for Account.coverage.priority https://github.com/gematik/spec-ISiK-Basismodul/pull/405 and https://github.com/gematik/spec-ISiK-Basismodul/pull/406 
* `improve` Erläuterung zur Handhabung von Mime-Types im Fall der Rückgabe von Binaries in ihrer nativen Form hinzugefügt: https://github.com/gematik/spec-ISiK-Basismodul/pull/380
* `improve` Hinzufügen von MS für Coverage.subscriber.reference für Gesetzlich- und Privatversicherte https://github.com/gematik/spec-ISiK-Basismodul/pull/408
* `improve` Hinzufügen von Use Case Beschreibungen (nicht normativ) https://github.com/gematik/spec-ISiK-Basismodul/pull/399
* `improve` Hinzufügen einer Referenz zwischen Observation-Seiten und Profildarstellung
* `improve` Entfernen der MS-Flag für .id, da irreführend https://github.com/gematik/spec-ISiK-Basismodul/pull/414
* `fix` Fix Beispiel DorisResultat für patient-merge https://github.com/gematik/spec-ISiK-Basismodul/pull/415
* `improve` Anforderung zu Procedure.Encounter hinzu https://github.com/gematik/spec-ISiK-Basismodul/pull/419
* `improve` Änderung der MS-Definition für Patient.active https://github.com/gematik/spec-ISiK-Basismodul/pull/421
* `improve` Definition für MS bei Condition.clinicalStatus geschwächt https://github.com/gematik/spec-ISiK-Basismodul/pull/422
* `improve` SnomedCT Coding.version muss auf die German Edition zeigen https://github.com/gematik/spec-ISiK-Basismodul/pull/417
* `improve` ISiKAngehoeriger hinzufügen von MS auf .relation & .telecom, entfernen der gender extension https://github.com/gematik/spec-ISiK-Basismodul/pull/417
* `improve` ISiKDiagnose hinzufügen von MS auf .bodySite incl. SnomedCT Slice zur Kodierung https://github.com/gematik/spec-ISiK-Basismodul/pull/417
* `improve` ISiKOrganisation identifier:TelematikId hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/417
* `improve` Harmonisierung mit Anforderung mit Kontakt/Fall-Seite https://github.com/gematik/spec-ISiK-Basismodul/pull/424
* `improve` Definition für MS bei Condition.clinicalStatus geschwächt https://github.com/gematik/spec-ISiK-Basismodul/pull/422 und https://github.com/gematik/spec-ISiK-Basismodul/pull/423
* `improve` Hinzufügen von ValueSets zur Harmonisierung der Organisation mit den Anpassungen im Modul Terminplanung https://github.com/gematik/spec-ISiK-Basismodul/pull/418
* `fix` Fix des ValueSets für SNOMED-CT-Diagnosen (entspricht TC 3.0.5) https://github.com/gematik/spec-ISiK-Basismodul/pull/398 


----

## Version: 4.0.0-rc2

Datum: 4.4.2024

* `improve` Neues Feature: Patient merge Notification; Hinzufügen MustSupport für Patient.link & patient-merge Subscription(Topic) https://github.com/gematik/spec-ISiK-Basismodul/pull/359
* `improve` Neue Profile für Standort und Organisation https://github.com/gematik/spec-ISiK-Basismodul/pull/358 
* `improve` Neue Profile für Allergien https://github.com/gematik/spec-ISiK-Basismodul/pull/369
* `improve` Neue Profile für Lebenszustände - Schwangerschaftsstatus , SS-ET, Raucher & Alkoholabususstatus by @patrick-werner in https://github.com/gematik/spec-ISiK-Basismodul/pull/378
  * Hinzugefügt Lebenszustand markdown descriptions  by @patrick-werner in https://github.com/gematik/spec-ISiK-Basismodul/pull/379
* `improve` Feature Ptdata 827 reha entlassung by @alexzautke in https://github.com/gematik/spec-ISiK-Basismodul/pull/393
* `improve` Update Deutsche Basisprofile v1.5.0 by @alexzautke in https://github.com/gematik/spec-ISiK-Basismodul/pull/372
* `improve` Verwende IdentifierAbrechnungsnummer aus den Deutschen Basisprofilen by @alexzautke in https://github.com/gematik/spec-ISiK-Basismodul/pull/381
* `improve` Abkündigen der Slices zu VersichertenId-GKV und ersetzen mit generischer Versicherten-ID : https://github.com/gematik/spec-ISiK-Basismodul/pull/382/files
* `fix` Fix /canonical to new format by @patrick-werner in https://github.com/gematik/spec-ISiK-Basismodul/pull/383
* `improve` Feature /ptdata 821 account abrechnungsart by @alexzautke in https://github.com/gematik/spec-ISiK-Basismodul/pull/386
* `improve` Feature /ptdata 671 // MS für coding.version  by @patrick-werner in https://github.com/gematik/spec-ISiK-Basismodul/pull/390
* `improve` Feature added Allergyintollerance to CapStatement by @patrick-werner in https://github.com/gematik/spec-ISiK-Basismodul/pull/385
* `improve` Lockerung der Anforderung für den Suchparameter "context-type-value" definiert für ISiKValueSet zu "KANN"

----

## Version: 3.0.5

Diese Technical Correction entfällt für Stufe 4, da die Änderungen direkt in Stufe 4 eingebracht sind.

----

## Version: 3.0.4

Datum: 1.3.2024

* `improve` Entfernen der Festlegungen zum .identifier in ISiKVersicherungsverhaeltnisGesetzlich: https://github.com/gematik/spec-ISiK-Basismodul/pull/362
* `fix` Korrektur der Anforderung zur Encounter-Kontaktebene: https://github.com/gematik/spec-ISiK-Basismodul/pull/363
* `improve` Hinweis zur Nutzung des Suchparameter "context-type-value" hinzugefügt: https://github.com/gematik/spec-ISiK-Basismodul/pull/367
* `improve` Änderung der Anforderung zu KANN für Profil ISIKKatalog: https://github.com/gematik/spec-ISiK-Basismodul/pull/367
* `improve` Lockerung für Extension Kardinalität in Account zu ..* und hinzufügen einer Beschreibung: https://github.com/gematik/spec-ISiK-Basismodul/pull/366


----
## Version: 3.0.3

Datum: 15.01.2024

* `improve` Anpassung und Harmonisierung der Anforderungen zu HTTP-Responses: update HTTP response requirement #308 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/354

**Full Changelog**: https://github.com/gematik/spec-ISiK-Basismodul/compare/v.3.0.2...v.3.0.3

----
## Version: 3.0.2

Datum: 09.01.2024

* `improve` Hinzufügen optionaler Suchparameter für RelatedPerson: Add new optional SearchParameter for RelatedPerson.address - Feature /anfisk 146 search related person by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/346

**Full Changelog**: https://github.com/gematik/spec-ISiK-Basismodul/compare/v.3.0.1...v.3.0.2

----
## Version: 3.0.1

Datum: 05.12.2023

* `improve` Obsoleter SNOMED Code ersetzt: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/d72f3a08a41b999074b4f33db299d5d71cd04be9
* `improve` Hinweis zur Nutzung der ISIKBinary-Ressource hinzugefügt: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/7dc3026686856efd3e61660a37f1e15955d45a11
* `fix` Invariante zur Strassenanschrift modifiziert - `fix` invariant context #330: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/345d776f3b75442e391d8787c71a051628050b9e
  * hier auch Constraint bezüglich ISiKAngehoeriger aus Strassenanschrift entfernt
* `improve` Anforderungen im CapabilityStatement zum Account entsprechend der textuellen Anforderungen angepasst: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/ac4d2c730bb94dd50cc4f5deea8c2b1344329d2c
* `improve` Neue (klärende) Anforderung zum Versorgungsstellenkontakt: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/d7005923c4596f8a646468f20e1f9975f2489bef 
* `improve` Öffnung der Festlegung einer Coverage-ID - `fix` identifier slices + add MS beneficiary + rm MS kvid: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/bd66cca38397b987581bece3d2e9f508813ff765
* `improve` Zielstellung zur Interoperabilität der Profile angepasst: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/3130973de182a078208f181a64ff1cfd8783493a


**Full Changelog**: https://github.com/gematik/spec-ISiK-Basismodul/compare/v.3.0.0...v.3.0.1

----
## Version: 3.0.0

Datum: 01.07.2023

* `improve` Mit dem Release der Stufe 3.0.0 werden die unten gelisteten Änderungen normativ festgesetzt.

----
## Version: 3.0.0-rc3

Datum: 30.05.2023

* `improve` Allgemein Vorgaben zur Herkunftsausweisung/Provenance (meta.tag) gelockert
  * provenance constraints by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/263
* `improve` ISiKCapabilityStatementBasisServer Read Shall für Composition entfernt
  * capability for Composition #259 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/260
* `improve` ISiKAbrechnungsfall   * Änderung des Kodierungs-Pattern, Value Set hinzugefügt und Beispiel angepasst
    * Enhancement /account identifier by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/238
    * Update /identifier Abrechnungsnummer vs by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/269
  * Änderung der falschen Kardinalität
    * cardinality #258 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/262
  * Nur der Patient als Subject zugelassen
    * Update /account.subject only patient #251 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/265
* `improve` ISiK Prozedur: MS für SNOMED-Codierung
  * MS for SNOMED by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/239
* `improve` ISiKVersicherungsverhaeltnisSelbstzahler Organisation als zahlende Instanz hinzugefügt
  * organization as payor by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/236
* `improve` ISiK KontaktGesundheitseinrichtung: Suchparameter für Encounter.date start/end aus R5 übernommen
  * feat Encounter.date start/end SearchParameters backported from R5, e… by @patrick-werner in https://github.com/gematik/spec-ISiK-Basismodul/pull/242
* `improve` ISiKBerichtSubSysteme References generisch statt ISiK-spezifisch
  * Reference - Kommentierung Stufe 3 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/256

----
## Version: 3.0.0-rc2

Datum: 03.04.2023

* `improve` KontaktGesundheitseinrichtung SearchParameter aus FHIR-R5 für Encounter.period als Custom SearchParameter eingeführt, um die effektive Suche auf Encounter ohne abgeschlossene "period" zu ermöglichen
  * feat Encounter.date start/end SearchParameters backported from R5, e… by @patrick-werner in <https://github.com/gematik/spec-ISiK-Basismodul/pull/242>

----
## Version: 3.0.0-rc1

Datum: 31.03.2023

* `improve` ISiKAbrechnungsfall Identifier-Pattern und Kodierung ersetzt durch Anpassung an das Basisprofil DE Pre-Release
  * Enhancement /account identifier by @f-peverali in <https://github.com/gematik/spec-ISiK-Basismodul/pull/238>
* `improve` ISiKProzedur SNOMED-Kodierung auf Must Support gesetzt
  * MS for SNOMED by @f-peverali in <https://github.com/gematik/spec-ISiK-Basismodul/pull/239>
* `improve` ISiKVersicherungsverhaeltnisSelbstzahler Organisation als möglicher 'payor' hinzugefügt (es gibt auch Konstellationen, in denen die Zahlung direkt über die PKV erfolgt)
  * organization as payor by @f-peverali in <https://github.com/gematik/spec-ISiK-Basismodul/pull/236>

----
## Version: 2.0.5

Datum: 24.03.2023

- Änderungen am IG
  - Hinweis Inkompatibilität zu KBV Basisprofile bei Patient.Adress.country
  - `improve` Einschränkung der Umsetzungspflicht für Suchparameter vom Typ "Token" auf Datentypen "code", "Coding" oder "CodeableConcept"
- ISiKBerichtBundle   - Slicing -Korrektur - betrifft Validierung und erfordert keine Anpassung von Seiten der Implementierung 
- ISiKPatient (Beispiel - erfordert keine Anpassung von Seiten der Implementierung)
  - Fixed identifier-Slicing of Type VersichertenId-GKV

----
## Version: 2.0.4

Datum: 31.01.2023

- ISiKVersicherungsverhaeltnisGesetzlich   - `Reference` auf Kernspezifikation-Profil RelatedPerson statt ISiKAngehoeriger (entspricht allgemeinem Design-Prinzip)
  - `Coverage.beneficiary.identifier` URL in `patternidentifier.system` ersetzt
- weitere Änderungen an Implementierungsleitfaeden (informativ)

----
## Version: 2.0.3

Datum: 21.12.2022

- CapabilityStatemtent   - Composition und Bundle-Parameter hinzugefügt
- ISiKBerichtSubsystem   - `encounter` auf FHIR-Core gesetzt
- ISiKBerichtBundle   - Beispiele hinzugefügt
- Weitere geringfügige Änderungen am Implementierungsleitfaden



----
## Version: 2.0.2

Datum: 31.10.2022

- Bericht für Subsysteme
  - `id` ist nun 0..1
- Kontakt   - `id` ist nun 0..1
- Patient   - `id` ist nun 0..1
  - Der Identifier `Versichertennummer-GKV` wurde zu `VersichertenId-GKV`
- Prozedur   - `id` ist nun 0..1
- Versicherungeverhältnis Gesetzlich
  - `id` ist nun 0..1
  - `type.coding` ist nun Must Support
  - `VersicherungsArtDeBasis` ist nun Must Support
- `improve` Invarianten wurden verbessert

----
## Version: 2.0.1

Datum: 30.09.2022

* ISiKPatient   * .address.Strassenanschrift.extension:Stadtteil, .type, .status nun Must Support
* ISiKPersonImGesundheitsberuf   * .address.Strassenanschrift.extension:Stadtteil, nun Must Support
* ISiKAngehöriger   * .address.Strassenanschrift.extension:Stadtteil, nun Must Support
* ISiKAbrechnungsfall   * .identifier.system im Example nun https://test.krankenhaus.de/fhir/sid/besuchsnummer
* ISiKKontaktGesundheitseinrichtung   * .identifier.system im Example nun https://test.krankenhaus.de/fhir/sid/besuchsnummer
* ISiKVersicherungsverhaeltnisGesetzlich   * .type ist nun Must Support
* ISiKVersicherungsverhaeltnisSelbstzahler   * .type und .status ist nun Must Support

----
## Version: 2.0.0

Datum: 30.06.2022

* `fix` Allgemein     * Alle Conformance Ressourcen enthalten den Prefix "https://gematik.de/fhir/isik/v2/Basismodul/" in ihrer Canonical URL
    * Erweiterung des Abschnittes "Verpflichtende Suchparameter (Alle Datenobjekte)" durch _tag, , _count, _include, _revinclude
    * Best Practice Empfehlungen für Standard-Suchfilter hinzugefügt
    * Verpflichtung type-Modifier auf Referenzen hinzugefügt
    * Aufhebung der Einschränkung von Chaining und Reverse Chaining auf die Referenzen "patient", "subject" und "encounter"
    * Anpassung der Vorgaben für den "Self"-Link als Antwort auf eine Suchanfrage.
* `improve` Neue Profile hinzugefügt:
    * ISiKAbrechnungsfall     * ISiKBerichtBundle     * ISiKBinary     * ISiKCodeSystem     * ISiKValueSet * ISiKAngehöriger     * Target Profil Einschränkung auf ISiKPatient in RelatedPerson.patient aufgehoben
* `improve` ISiKBerichtSubsystem     * Must -Support Flags hinzugefügt
* ISiKDiagnose     * Beschreibung von "isik-con1"-Constraint korrigiert
    * Must Support Flag für Extension "related" hinzugefügt
* ISiKPatient     * Umbenennung Slice von "Patient.identifier:Versichertennummer-GKV in "Patient.identifier:VersichertenId-GKV"
* `improve` ISiKPersonImGesundheitsberuf     * Element "Practitioner.identifier:TelematikId" hinzugefügt (must-support)
* `improve` ISiKVersicherungsverhaeltnisGesetzlich     * Must -Support Flag auf "Coverage.payor.identifier.type" hinzugefügt
* `improve` ISiKKontaktGesundheitseinrichtung     * Constraints ISiK-enc-2 bis ISiK-enc-8 hinzugefügt
    * Extensions plannedStartDate, plannedEndDate und Wahlleistung hinzugefügt
    * Änderung Kardinalität von Element "Encounter.identifier:Aufnahmenummer.type" auf 1..1
    * Änderung Kardinalität von Element "Encounter.type:Kontaktebene" auf 1..1
    * Element "Encounter.serviceType.coding:ErweiterterFachabteilungsschluessel" hinzugefügt
    * Änderung Kardinalität von "Encounter.period" von 1..1 auf 0..1
    * Element "Encounter.diagnosis.use.coding:Diagnosetyp" und "Encounter.diagnosis.use.coding:DiagnosesubTyp" hinzugefügt
    * Must -Support Flag auf Element "Encounter.account" hinzugefügt
    * Änderung der Binding-Strength des Elementes "Encounter.hospitalization.admitSource" von "preferred" auf "extensible"
    * Extensible ValueSet zu Element "Encounter.location.physicalType" hinzugefügt
    * Anstelle von "Encounter.location.location.display" ist nun "Encounter.serviceProvider.identifier" zu verwenden
    * Must -Support-Flag entfernt auf Element "Encounter.partOf"

----
## Version: 2.0.0-ballot

Datum: 08.04.2022

* Initiale Ballotierungsversion für ISiK Stufe 2
----
