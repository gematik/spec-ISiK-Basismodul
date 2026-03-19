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
Description: """
Dieses Profil dient der Abbildung der Pupillengröße.

In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.

Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.3.2026.
"""

* insert Meta
* insert CommonElements

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
* valueQuantity.system = $cs-ucum
* valueQuantity.code 1..1 MS
* valueQuantity.code = #mm
* valueQuantity.unit 1..1 MS
* valueQuantity.unit = "mm"