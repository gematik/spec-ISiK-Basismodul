Profile: MII_PR_ICU_Parameter_Von_Beatmung
Parent: Observation
Id: mii-pr-vent-icu-parameter-von-beatmung
Title: "MII PR ICU Parameter von Beatmung"
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-parameter-von-beatmung"
* ^status = #active

* obeys obs-10 and vs-de-2
* identifier MS
* partOf 1..1 MS
* partOf only Reference(Procedure)
* partOf ^short = "Observation belongs to a specific extracorporeal procedure."
* partOf ^definition = "Dasjenige extrakorporale Verfahren, im Rahmen dessen der vorliegende Parameter (die Daten dieser Observation-Ressource) erhoben wurden."
* status MS
* category 1..1 MS
* category from mii-vs-icu-category-procedure-beatmung-snomed (required)
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category.coding MS
* category.coding.system 1.. MS
* category.coding.code 1.. MS
* code MS
* code.coding 1.. MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains sct 0..
* code.coding[sct] from mii-vs-icu-code-observation-beatmung-snomed  (required)
* code.coding[sct].system = "http://snomed.info/sct"
* code.coding[sct] MS
* code.coding[sct].system 1..1 MS
* code.coding[sct].code 1..1 MS
* code.coding[sct].display MS
* code.coding contains loinc 0..
* code.coding[loinc] from mii-vs-icu-code-observation-beatmung-loinc  (required)
* code.coding[loinc].system = "http://loinc.org"
* code.coding[loinc] MS
* code.coding[loinc].system 1..1 MS
* code.coding[loinc].code 1..1 MS
* code.coding[loinc].display MS
* code.coding contains IEEE-11073 0..
* code.coding[IEEE-11073] from mii-vs-icu-code-observation-beatmung-loinc-iso11073 (required)
* code.coding[IEEE-11073].system = "urn:iso:std:iso:11073:10101"
* code.coding[IEEE-11073] MS
* code.coding[IEEE-11073].system 1..1 MS
* code.coding[IEEE-11073].code 1..1 MS
* subject 1.. MS
* subject only Reference(Patient or Device)
* encounter only Reference(Encounter)
* encounter MS
* effective[x] only dateTime or Period
* effective[x] MS
* issued MS
* performer only Reference(Practitioner or PractitionerRole or Organization or CareTeam)
* value[x] 0..1 MS
* value[x] only Quantity
* valueQuantity 1.. MS
* valueQuantity MS
* valueQuantity.unit 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code 1.. MS
* dataAbsentReason MS
* bodySite from mii-vs-icu-body-site-observation-beatmung (extensible)
* device only Reference(MII_PR_ICU_Devicemetric_Eingestellte_Gemessene_Parameter_Beatmung)
* device MS
