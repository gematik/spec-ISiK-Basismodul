// Meta-/Panel-Profil: Pupillary Examination (Organizer)
// - Zweck: Bündelt die einzelnen Pupillenbefunde (hasMember)
// - Keine eigene Mess-/Befundaussage im value[x]
// - Semantische Annotation über SNOMED + LOINC im Observation.code

Profile: MII_PR_ICU_Untersuchung_Pupillenbefund
Parent: Observation
Id: mii-pr-icu-untersuchung-pupillenbefund
Title: "MII PR ICU Untersuchung Pupillenbefund"
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-untersuchung-pupillenbefund"
* ^status = #draft

* id MS
* meta MS
* identifier MS
* status 1..1 MS

* category 1..* MS
* category.coding.system = $observation-category
* category.coding.code = #exam
* category.coding.display = "Exam"

* code 1..1 MS
* hasMember 1..* MS

* value[x] 0..0 MS
* dataAbsentReason 0..0 MS

// Observation.code = Panel-Semantik (SNOMED + LOINC)
// - SNOMED: 247010007 |Pupil finding (finding)|
// - LOINC:  80310-6   |Pupil assessment panel|

* code.coding 2..* MS

* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #closed
* code.coding contains
    Snomed 1..1 MS and
    Loinc  1..1 MS

* code.coding[Snomed].system = $sct (exactly)
* code.coding[Snomed].code = #247010007 (exactly)
* code.coding[Snomed].display = "Pupil finding (finding)"

* code.coding[Loinc].system = $loinc (exactly)
* code.coding[Loinc].code = #80310-6 (exactly)
* code.coding[Loinc].display = "Pupil assessment panel"

// ------------------------------------------------------------
// hasMember: Referenzen auf die Einzelbefunde
// (keine Interpretation hier; nur die vier Bausteine)
// ------------------------------------------------------------

// Erwartete Members (Guidance):
// - MII_PR_ICU_Untersuchung_Pupillenlichtreaktion (mind. 2 Instanzen: links & rechts)
// - MII_PR_ICU_Untersuchung_Pupillengroesse
// - MII_PR_ICU_Untersuchung_Pupillenform
// - MII_PR_ICU_Untersuchung_Pupillensymmetrie

* hasMember 9..9 MS

* hasMember ^slicing.discriminator.type = #profile
* hasMember ^slicing.discriminator.path = "resolve()"
* hasMember ^slicing.rules = #closed

* hasMember contains
    PupillenlichtreaktionDirekt 2..2 MS and
    PupillenlichtreaktionIndirekt 2..2 MS and
    Pupillengroesse 2..2 MS and
    Pupillenform 2..2 MS and
    Pupillensymmetrie 1..1 MS

// --- Light Reaction (per eye) ---
* hasMember[PupillenlichtreaktionDirekt] only Reference(MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt)
* hasMember[PupillenlichtreaktionDirekt] ^short = "Mitgliedsbeobachtung: direkte Pupillenlichtreaktion pro Auge (2 Instanzen: links/rechts)."
* hasMember[PupillenlichtreaktionIndirekt] only Reference(MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Indirekt)
* hasMember[PupillenlichtreaktionIndirekt] ^short = "Mitgliedsbeobachtung: indirekte Pupillenlichtreaktion pro Auge (2 Instanzen: links/rechts)."

// --- Pupillary Size ---
* hasMember[Pupillengroesse] only Reference(MII_PR_ICU_Untersuchung_Pupillengroesse)
* hasMember[Pupillengroesse] ^short = "Mitgliedsbeobachtung: Pupillengroesse (beide Pupillen)."

// --- Pupil Shape ---
* hasMember[Pupillenform] only Reference(MII_PR_ICU_Untersuchung_Pupillenform)
* hasMember[Pupillenform] ^short = "Mitgliedsbeobachtung: Pupillenform/Regularitaet (beide Pupillen)."

// --- Pupillary Symmetry ---
* hasMember[Pupillensymmetrie] only Reference(MII_PR_ICU_Untersuchung_Pupillensymmetrie)
* hasMember[Pupillensymmetrie] ^short = "Mitgliedsbeobachtung: Pupillensymmetrie (isokor/anisokor)."
* hasMember ^short = "Referenzen auf die Mitgliedsbeobachtungen der Pupillenuntersuchung."
* hasMember ^comment = "Dieses Panel bündelt die Einzelbefunde zur Pupillenuntersuchung via hasMember. Erwartet werden genau 9 Members: direkte und indirekte Lichtreaktion (je 2, links/rechts), Pupillengroesse (2), Pupillenform (2) und Pupillensymmetrie (1). Keine zusätzliche Interpretation im Panel selbst."