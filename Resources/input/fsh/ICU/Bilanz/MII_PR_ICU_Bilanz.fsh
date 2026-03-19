Profile: MII_PR_ICU_Bilanz
Parent: Observation
Id: mii-pr-icu-bilanz
Title: "MII PR ICU Bilanz"
* insert Meta
* insert CommonElements

* identifier MS

* category 1.. MS
* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains
    hl7-category 0..1 MS and
    kdsicu-category 1..1 MS
* category.coding[hl7-category] from mii-vs-icu-category-observation-bilanzen-hl7 (required)
* category.coding[hl7-category] ^patternCoding.system = $observation-category
* category.coding[hl7-category] ^binding.description = "A Code of the following value set is required. Only relevant codes for balances should be vital-signs, exam and therapy."
* category.coding[hl7-category].system 1.. MS
* category.coding[hl7-category].code 1.. MS
* category.coding[kdsicu-category].code = $sct#364396009
* category.coding[kdsicu-category].system 1.. MS
* category.coding[kdsicu-category].code 1.. MS

* code MS
* code.coding MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #closed
* code.coding contains sct 0.. MS and 
    loinc 0.. MS and 
    IEEE-11073 0.. MS
* code.coding[sct] from mii-vs-icu-code-observation-bilanzen-snomed (required)
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct].system 1.. MS
* code.coding[sct].code 1.. MS
* code.coding[sct].display MS
* code.coding[loinc] from mii-vs-icu-code-observation-bilanzen-loinc (required)
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[loinc].system 1.. MS
* code.coding[loinc].code 1.. MS
* code.coding[loinc].display MS
* code.coding[IEEE-11073] from mii-vs-icu-code-observation-bilanzen-iso11073 (required)
* code.coding[IEEE-11073] ^patternCoding.system = "urn:iso:std:iso:11073:10101"
* code.coding[IEEE-11073].system 1.. MS
* code.coding[IEEE-11073].code 1.. MS

* subject 1.. MS
* subject only Reference(Patient)

* encounter MS

* effective[x] 1.. MS
* effective[x] only dateTime or Period

* issued MS

* value[x] 1.. MS
* value[x] only Quantity

* dataAbsentReason MS
* interpretation MS
* bodySite MS
* method MS
* specimen MS
* device MS
* referenceRange MS