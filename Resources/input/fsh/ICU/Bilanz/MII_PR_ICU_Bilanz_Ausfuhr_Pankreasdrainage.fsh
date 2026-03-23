Profile: MII_PR_ICU_Bilanz_Ausfuhr_Pankreasdrainage
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-ausfuhr-pankreasdrainage
Title: "MII PR ICU Bilanz Ausfuhr Pankreasdrainage"
* insert Meta
* insert CommonElements

* category.coding[hl7-category].code = #exam

* code.coding 1.. MS
* code.coding[sct] 1..1 MS
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #1162668004
* code.coding[sct] ^patternCoding.display = "Volume of drainage of pancreatic fluid (observable entity)"
* code.coding[sct].code MS
* code.coding[loinc] ..0 MS
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

Instance: BilanzAusfuhrPankreasdrainageBeispiel
InstanceOf: MII_PR_ICU_Bilanz_Ausfuhr_Pankreasdrainage
Usage: #example
* status = #final
* category.coding[hl7-category] = $observation-category#exam "Exam"
* category.coding[kdsicu-category] = $sct#364396009 " Fluid balance observable"
* code.coding[sct] = $sct#1162668004 "Volume of drainage of pancreatic fluid (observable entity)"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2025-07-15T09:00:00+02:00"
* valueQuantity.value = 60
* valueQuantity.unit = "ml"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL