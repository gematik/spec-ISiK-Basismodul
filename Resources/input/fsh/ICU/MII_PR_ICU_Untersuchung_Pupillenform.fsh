// ============================================================
// Profil: Pupillenform / Regularität
// - Eine Observation für beide Pupillen
// - Zwei Komponenten: links / rechts
// - Lateralisierung über component.bodySite = Pupille (links/rechts)
// - Ergebnis kategorial (regelmäßig / unregelmäßig)
// - value[x] xor dataAbsentReason je Komponente
// ============================================================

Profile: MII_PR_ICU_Untersuchung_Pupillenform
Parent: Observation
Id: mii-pr-icu-untersuchung-pupillenform
Title: "MII PR ICU Untersuchung Pupillenform"
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-untersuchung-pupillenform"
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
* code.coding 1..1 MS
* code.coding.system = $sct (exactly)
* code.coding.code = #363954009 (exactly)
* code.coding.display = "Pupil shape"

* bodySite 1..1 MS
* bodySite from MII_VS_ICU_BodySite_Observation_Pupillenbefund (required)
* dataAbsentReason 0..1 MS

* obeys obs-value-or-dataAbsentReason
* value[x] 0..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept.coding ^slicing.discriminator.type = #pattern
* valueCodeableConcept.coding ^slicing.discriminator.path = "$this"
* valueCodeableConcept.coding ^slicing.rules = #closed
* valueCodeableConcept.coding contains Loinc 1..1 MS
* valueCodeableConcept.coding[Loinc] from MII_VS_ICU_Code_Observation_Pupillenform_LOINC (required)