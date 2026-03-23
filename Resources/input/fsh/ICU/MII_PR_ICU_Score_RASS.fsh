Profile: MII_PR_ICU_Score_RASS
Parent: Observation
Id: mii-pr-icu-score-rass
Title: "MII PR ICU Score RASS"
Description: """
Dieses Profil dient der spezialisierten Abbildung des Richmond Agitation Sedation Scale (RASS) Scores in der Akutmedizin.

In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.

Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Scores/MII_PR_ICU_Score_RASS.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 13.3.2026.
"""
* insert Meta
* insert CommonElements

* status 1..
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains exam 1..1 MS
* category[exam] = $observation-category#exam "Exam"

* obeys obs-value-or-dataAbsentReason

* code 1..1 MS
* code.coding 1..1 MS
* code.coding.system = $sct (exactly)
* code.coding.code = #1345050000 (exactly)
* code.coding.display = "Richmond Agitation Sedation Scale score (observable entity)"
* code.coding.code ^comment = "Instrument/Observation type is represented using SNOMED CT observable entity. Answer options are represented using LOINC Answer List LL6536-8. Ordinal score is not exchanged; implementers may derive it internally."

// Subject must be a patient
* subject 1.. MS
* subject only Reference(Patient)
* subject ^short = "Patient being assessed"

// Encounter context
* encounter 0.. MS
* encounter only Reference(Encounter)
* encounter ^short = "Encounter during which score was assessed"
* encounter ^definition = "The encounter context in which the score was determined"

// Issued timestamp
* issued 0..1 MS
* issued ^short = "Date/Time this observation was made available"

// Performer: who performed the assessment
* performer 0.. MS
* performer ^short = "Who performed the score assessment"

// Data absent reason for missing values
* dataAbsentReason 0..1 MS

// Interpretation of the score
* interpretation MS

// Note for additional comments
* note MS

// Timing of the assessment
* effective[x] 1..1 MS
* effective[x] only dateTime
* effective[x] ^short = "Time of score assessment"
* effective[x] ^definition = "The time or time period when the score was assessed"

// Total score value
* value[x] 0..1 MS
* value[x] only CodeableConcept
* value[x] ^short = "RASS Value"

* valueCodeableConcept from MII_VS_ICU_Score_RASS (required)
* valueCodeableConcept ^comment = "Answer is a LOINC LA-code from the RASS Answer List (LL6536-8)."
* valueCodeableConcept.coding ^slicing.discriminator.type = #pattern
* valueCodeableConcept.coding ^slicing.discriminator.path = "$this"
* valueCodeableConcept.coding ^slicing.rules = #closed
* valueCodeableConcept.coding contains Loinc 1..1 MS

* valueCodeableConcept.coding[Loinc] ^patternCoding.system = $loinc
* valueCodeableConcept.coding[Loinc].system 1..1 MS
* valueCodeableConcept.coding[Loinc].code 1..1 MS

* bodySite 0..0
* specimen 0..0