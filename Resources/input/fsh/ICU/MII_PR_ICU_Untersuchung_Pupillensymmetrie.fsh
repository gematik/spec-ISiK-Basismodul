// ============================================================
// Profil: Pupillen-Symmetrie (Isokor / Anisokor)
// - Eine Observation (Interpretation) für beide Pupillen
// - valueCodeableConcept: isokor oder anisokor
// - Wenn anisokor: bodySite MUSS gesetzt sein (größere Pupille)
// - Wenn isokor: bodySite DARF NICHT gesetzt sein
// - Lateralisierung über bodySite = Pupille (links/rechts) via MII_VS_ICU_PupilBodySiteLR
// - value[x] xor dataAbsentReason (Grundregel)
// ============================================================

Profile: MII_PR_ICU_Untersuchung_Pupillensymmetrie
Parent: Observation
Id: mii-pr-icu-untersuchung-pupillensymmetrie
Title: "MII PR ICU Untersuchung Pupillensymmetrie"
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-untersuchung-pupillensymmetrie"
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
* valueCodeableConcept 0..1 MS
* dataAbsentReason 0..1 MS
* bodySite 1..1 MS

* code.coding 1..1 MS
* code.coding.system = $sct (exactly)
* code.coding.code = #301942005 (exactly)
* code.coding.display = "Finding of proportion of pupil (finding)"

* bodySite.coding 1..1 MS
* bodySite.coding.system = $sct (exactly)
* bodySite.coding.code = #67019001 (exactly)
* bodySite.coding.display = "Structure of pupil of both eyes (body structure)"

* obeys obs-value-or-dataAbsentReason
* value[x] 0..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from MII_VS_ICU_Code_Observation_Pupillensymmetrie (required)
* valueCodeableConcept.coding ^slicing.discriminator.type = #pattern
* valueCodeableConcept.coding ^slicing.discriminator.path = "$this"
* valueCodeableConcept.coding ^slicing.ordered = false
* valueCodeableConcept.coding ^slicing.rules = #closed