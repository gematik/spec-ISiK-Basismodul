Profile: MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt
Parent: Observation
Id: mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt
Title: "MII PR ICU Untersuchung Pupillenlichtreaktion Direkt"
Description: """
Dieses Profil dient der Abbildung der direkten Pupillenlichtreaktion.

In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.

Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 13.3.2026.
"""
* insert Meta
* insert CommonElements

* id MS
* meta MS
* identifier MS
* status 1..1 MS

* category 1.. MS
* category.coding.system = $observation-category
* category.coding.code = #exam
* category.coding.display = "Exam"

* code 1..1 MS
* code.coding 1..1 MS
* code.coding.system = $sct (exactly)
* code.coding.code = #45832002 (exactly)
* code.coding.display = "Pupil afferent light reaction"

* obeys obs-value-or-dataAbsentReason
* value[x] 0..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept.coding ^slicing.discriminator.type = #pattern
* valueCodeableConcept.coding ^slicing.discriminator.path = "$this"
* valueCodeableConcept.coding ^slicing.ordered = false
* valueCodeableConcept.coding ^slicing.rules = #closed
* valueCodeableConcept.coding contains Loinc 1..1 MS
* valueCodeableConcept.coding[Loinc] from MII_VS_ICU_Code_Observation_Pupillenlichtreaktion (required)

* dataAbsentReason 0..1 MS

* bodySite 1..1 MS
* bodySite from MII_VS_ICU_BodySite_Observation_Pupillenbefund (required)