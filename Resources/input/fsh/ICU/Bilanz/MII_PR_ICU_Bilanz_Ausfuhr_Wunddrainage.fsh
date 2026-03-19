Profile: MII_PR_ICU_Bilanz_Ausfuhr_Wunddrainage
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-ausfuhr-wunddrainage
Title: "MII PR ICU Bilanz Ausfuhr Wunddrainage"
* insert Meta
* insert CommonElements

* category.coding[hl7-category].code = #exam

* code.coding 2.. MS
* code.coding[sct] 1..1 MS
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #251845003
* code.coding[sct] ^patternCoding.display = "Fluid output from wound drain (observable entity)"
* code.coding[sct].code MS
* code.coding[loinc] 1..1 MS
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[loinc] ^patternCoding.code = #9203-1
* code.coding[loinc] ^patternCoding.display = "Fluid output wound drain"
* code.coding[loinc].code MS
* code.coding[IEEE-11073] ..0 MS

* valueQuantity.code 1.. MS
* valueQuantity.code from mii-vs-icu-unit-equivalent-ucum-milliliter (required)
* valueQuantity.code ^binding.description = "equivalent codes for milliliter"
* valueQuantity.unit 1..1 MS
* valueQuantity.unit = "ml"
* valueQuantity.unit ^short = "Display unit (SI)"
* valueQuantity.unit ^definition = "Human-readable display for the unit. SI display unit SHALL be 'ml', independent of whether code is 'mL' or 'ml'."
* valueQuantity.unit ^example[0].label = "Preferred display"
* valueQuantity.unit ^example[0].valueString = "ml"

Instance: BilanzAusfuhrWunddrainageBeispiel
InstanceOf: MII_PR_ICU_Bilanz_Ausfuhr_Wunddrainage
Usage: #example
* status = #final
* category.coding[hl7-category] = $observation-category#exam
* category.coding[kdsicu-category] = $sct#364396009
* code.coding[sct] = $sct#251845003 "Fluid output from wound drain (observable entity)"
* code.coding[loinc] = $loinc#9203-1 "Fluid output wound drain"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2025-07-15T20:00:00+02:00"
* valueQuantity.value = 95
* valueQuantity.unit = "ml"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL