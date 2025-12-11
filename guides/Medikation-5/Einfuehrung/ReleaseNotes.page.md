# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

## Version 5.1.1

Datum: tbd

* `improve` Ressourcen Referenzen in den FSH Dateien wurden auf das Format
  `Reference(RessourcenNamen)` vereinheitlicht. Hierdurch wurden teilweise das Referenzziel
  angepasst (falls es keine Instanz der Zielinstanz gab). https://github.com/gematik/spec-ISiK-Basismodul/pull/929

----

## Version 5.1.0

Datum: 23.10.2025

* `documentation` Link zu Dosierungsbeispielen im IG
  Medikation https://github.com/gematik/spec-ISiK-Basismodul/pull/882
* `documentation` Erläuterung zur Nutzung von MedicationRequest.status für die Umsetzung asynchroner Prüfung im empfangenden System  https://github.com/gematik/spec-ISiK-Basismodul/pull/807

* `documentation` Erläuterung für die Umsetzung der Pausierung einer Medikation https://github.com/gematik/spec-ISiK-Basismodul/pull/803
* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799
* `documentation` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802
* `documentation` Dokumentation der Suchparameter (Beispiele) in CpS überführt. Darüber hinaus wurden einige Suchparameter, aus Stufe 3 in Stufe 5 übernommen https://github.com/gematik/spec-ISiK-Basismodul/pull/809


## Version 5.1.1

Datum: 11.12.2025

Im Rahmen dieser Technical Correction wurden keine Änderungen an diesem Implementation Guide vorgenommen. Daher sind keine Anpassungen durch Implementierende erforderlich, und die Rückwärtskompatibilität zum zuletzt veröffentlichten Package bleibt uneingeschränkt erhalten.

## Version 5.0.0

Datum: 26.06.2025

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

## Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* `improve` Öffnung der Kardinalität für ATC und PZN Kodierung, sodass nun eine Mehrfachkordierung möglich ist. https://github.com/gematik/spec-ISiK-Basismodul/pull/737
* `improve` MedicationRequest.dosageInstruction.timing.repeat.bounds[x]:boundsRange - Der Datentyp
  boundsRange wurde als Must-Support entfernt, da er in der praktischen Verordnung medizinischer
  Therapien nur in sehr seltenen Spezialfällen Anwendung
  findet. https://github.com/gematik/spec-ISiK-Basismodul/pull/728
* `improve` Das Element MedicationAdministration.request im Profil ISiKMedikationsVerabreichung
  wurde als eingeschränktes Must-Support gekennzeichnet, da die Angabe der zugrunde liegenden
  Verordnung fachlich relevant ist, aber nicht in allen Systemen strukturell abbildbar. https://github.com/gematik/spec-ISiK-Basismodul/pull/734
* `improve` Verbesserung der Beschreibung des ISiKMedicationList-Profils: klarere Abgrenzung zur
  ePA/eMP und präzisere Darstellung der enthaltenen Informationen
  (MedicationStatements). https://github.com/gematik/spec-ISiK-Basismodul/pull/733
* `improve` ISiKMedikationsVerordnung: Kommentar zu priorPrescription hinzugefügt und Definitionen
  in den Kommentaren beider Elemente (priorPrescription und extension.medicationRequestReplaces)
  sprachlich und fachlich überarbeitet. https://github.com/gematik/spec-ISiK-Basismodul/pull/736
* `improve` ValueSet für Medikament-Kodierung übernommen aus ePA-Medication statt SNOMED-all 

---

## Version 5.0.0-rc (Kommentierung)

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025

* `improve` Überarbeitung von Akteuren und Rollen, dabei Procedure-Interaktionen für Akteur im Kontext von AMTS eingeführt und List-Interaktionen sowie Interaktionen auf ISiKSchwangerschaftErwarteterEntbindungstermin für AMTS eingeführt + Refactoring Rollen https://github.com/gematik/spec-ISiK-Basismodul/pull/597

---

## Version: 4.0.3 

Datum: 08.04.2025

* `documentation` Migration des IG auf die neue IG Struktur basierend auf FQL Templates, die für ISiK-Basis erstellt wurden https://github.com/gematik/spec-ISiK-Medikation/pull/171

----

## Version: 4.0.2 

Datum: 06.03.2025

* `improve` Klarstellung zu übergreifenden Festlegungen https://github.com/gematik/spec-ISiK-Medikation/pull/168
* `fix` broken package 

----

## Version: 4.0.1

Datum: 26.02.2025

* `improve` Möglicher Breaking Change für Clients: Änderung (Schwächung) der MS-Definition für .reasonCode und reasonReference für MedicationAdministration und MedicationStatement https://github.com/gematik/spec-ISiK-Medikation/pull/140
* `improve` Klärung zur Nutzung der Zeit-Elemente in ISiKMedikationsInformation -und ISiKMedikationsVerabreichung https://github.com/gematik/spec-ISiK-Medikation/pull/154
  * Zum Hintergrund der Entscheidungsfindung beachte [öffentliche Fragestellung und Diskussion](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BMED.5D.20Administration.2FVerabreichung.20-.20Date.20or.20Timestamp). 
* `improve` Klarstellung zum Umgang mit Freitext-Dosierungsinformationen für empfangende Systeme https://github.com/gematik/spec-ISiK-Medikation/pull/155
* `fix` Korrektur der Description & Status des MedicationQuantity Profils https://github.com/gematik/spec-ISiK-Medikation/pull/141
* `documentation` Dokumentation für MS-Flags https://github.com/gematik/spec-ISiK-Medikation/pull/139
* `improve` Formulierungsänderung zur Nutzung von Profilen aus der Basis https://github.com/gematik/spec-ISiK-Medikation/pull/158
* `improve` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist. Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind. https://github.com/gematik/spec-ISiK-Medikation/pull/156/files 
* `improve` MS für ISiKMedikationsVerordnung.reasonReference & reasonCode hinzugefügt, um diese Elemente über alle Medication-Ressourcen hinweg zu vereinheitlichen https://github.com/gematik/spec-ISiK-Medikation/pull/161
* `improve` Möglicher Breaking Change für Clients: Änderung (Schwächung) der MS-Definition für .reasonCode und reasonReference für MedicationAdministration und MedicationStatement https://github.com/gematik/spec-ISiK-Medikation/pull/140
* `fix` Capability Statement Korrektur des Suchparameter-Typs und weitere Fixes für Beispiele  https://github.com/gematik/spec-ISiK-Medikation/pull/148
* `fix` Korrektur der Description & Status des MedicationQuantity Profils https://github.com/gematik/spec-ISiK-Medikation/pull/141
* `improve` Formulierungsänderung zur Nutzung von Profilen aus der Basis https://github.com/gematik/spec-ISiK-Medikation/pull/158
* `documentation` Dokumentation für MS-Flags https://github.com/gematik/spec-ISiK-Medikation/pull/139
* `improve` Hinweis zur Kontextherstellung https://github.com/gematik/spec-ISiK-Medikation/pull/167 

----

## Version: 4.0.0

Datum: 15.10.2024

* Aktive Version ohne weitere Änderungen

----

## Version: 4.0.0-rc2

Datum: 26.06.2024

- Entfernen von MS von .id der Ressourcen https://github.com/gematik/spec-ISiK-Medikation/pull/122
- Klärung Dosis-Rate Quantity und Ratio (Beispiele, Must-Support)  https://github.com/gematik/spec-ISiK-Medikation/pull/124/files
- Entfernen von MS von .id der Ressourcen https://github.com/gematik/spec-ISiK-Medikation/pull/122
- Entfernen der WG14 Kodierung, Hinzufügen eines SimpleQuantity Profiles, Update der Abhängigkeit auf IPS 1.1.0, Hinzufügen eines SCT Slices zu Medikationsoprofilen, bei Medication.amount (Ratios) numerator und denominator auf 1..1 https://github.com/gematik/spec-ISiK-Medikation/pull/123
- Entfernen von MS von MedicationStatement.partOf https://github.com/gematik/spec-ISiK-Medikation/pull/126

---
**Release Candidate zur Kommentierung**

Version: 4.0.0-rc

Datum: 04.04.2024

* 10 neue Beispiele und Prosa zu Rezepturen, Verordnung, Verabreichung, Abgabezyklus, Darreichungsformen und nicht-trivialen Kombinationen
* `improve` Neue Übergreifender Use Case AMTS, inklusive mini-IG und Auszügen aus IOP-Arbeitskreis. Dieser Übergreifende USe Case nutzt auch (insbesondere) weitere neue Profile aus der Basis und dem Support-Modul Labor
  * Diagnose aus Basis (ISiKAllergieUnvertraeglichkeit, chr. Krankheit wie Parkinson, usw.)
  * Observation aus Basis (Schwangerschaft, AlkoholAbusus usw.)
  * Observation aus Labor oder Vital (SerumKreatinin, GFR, Blutbild, Gewicht usw.)
* `improve` Neues Profil ISiKAMTSBewertung
* `improve` Neues Extensions: 
  * MedikationsArt in Form von Akut & Dauer
  * Selbstmedikation   
  * Behandlungsziel   
  * Replaces als Ersatz-Verordnung
  * AcceptedRisk im Zuge einer AMTS-Bewertung
* Erweiterung um Use Case Diagramm, Ressourcen Diagramm und Informationsmodell
* Erweiterung um Use Case Zusammenhänge von verketteten Suchparametern

----
## Version: 3.0.1

Datum: 08.01.2024

* workflow improvement regarding image rendering and display
* `improve` Update dependency with Basis:  https://github.com/gematik/spec-ISiK-Medikation/pull/102/commits/039654b03d5b159ed258c35b48c37cd2db3e4a81
* `improve` sentence on ISIKBasis Ressource usage by @f-peverali in https://github.com/gematik/spec-ISiK-Medikation/pull/103
----
## Version: 3.0.0

Datum: 01.07.2023

* Mit dem Release der Stufe 3.0.0 wird werden die unten gelisteten Änderungen normativ festgesetzt - im Wesentlichen ein Update auf die Dependency des ISiK Basismoduls 3.0.0.

----
## Version: 3.0.0-rc2

Datum: 30.05.2023

* `improve` Update der Dependency auf das aktuelle ISiK Basismoduls (3.0.0-rc3)

----
## Version: 3.0.0-rc

Datum: 11.04.2023

* Ausschließlich update der Dependency Packages für ISiK Basismodul und MII-Package

----
## Version: 2.0.2

Datum: 31.01.2023

- Update Basismodul Dependency -> 2.0.4
- weitere Änderungen an Implementierungsleitfaden (informativ)
----
## Version: 2.0.1

Datum: 31.10.2022

- Update Basismodul Dependency -> 2.0.2
----
## Version: 2.0.0

Datum: 30.06.2022

- Initialer Release

----
## Version: 2.0.0-ballot

Datum: 08.04.2022

* Initiale Ballotierungsversion für ISiK Stufe 2
