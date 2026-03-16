// ============================================================
// Profil: Pupillengröße (kategorial)
// - Eine Observation für beide Pupillen
// - Zwei Komponenten:
//   * Pupillengröße links
//   * Pupillengröße rechts
// - Kategorial: eng / mittel / weit
// - Lateralisierung über bodySite = Pupille
// - value[x] xor dataAbsentReason je Komponente
// ============================================================

Profile: MII_PR_ICU_Untersuchung_Pupillengroesse
Parent: Observation
Id: mii-pr-icu-untersuchung-pupillengroesse
Title: "MII PR ICU Untersuchung Pupillengroesse"
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-untersuchung-pupillengroesse"
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
* code.coding.code = #363953003 (exactly)
* code.coding.display = "Size of pupil"

* bodySite 1..1 MS
* bodySite from MII_VS_ICU_BodySite_Observation_Pupillenbefund (required)
* dataAbsentReason 0..1 MS

* obeys obs-value-or-dataAbsentReason
* value[x] 0..1 MS
* value[x] only Quantity or CodeableConcept

* valueCodeableConcept from MII_VS_ICU_Code_Observation_Pupillengroesse (required)
* valueCodeableConcept.coding ^slicing.discriminator.type = #pattern
* valueCodeableConcept.coding ^slicing.discriminator.path = "$this"
* valueCodeableConcept.coding ^slicing.ordered = false
* valueCodeableConcept.coding ^slicing.rules = #closed

* valueQuantity.value MS
* valueQuantity.system 1..1 MS
* valueQuantity.system = $ucum
* valueQuantity.code 1..1 MS
* valueQuantity.code = #mm
* valueQuantity.unit 1..1 MS
* valueQuantity.unit = "mm"