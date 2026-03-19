Profile: MII_PR_ICU_Bilanz_Einfuhr_Saeuglingsnahrung
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-einfuhr-saeuglingsnahrung
Title: "MII PR ICU Bilanz Einfuhr Saeuglingsnahrung"
* insert Meta
* insert CommonElements

* category.coding[hl7-category].code = #exam

* code.coding 1.. MS
* code.coding[sct] 1..1 MS
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #1204305004
* code.coding[sct] ^patternCoding.display = "Measured volume of intake of infant formula"
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

Instance: BilanzEinfuhrSaeuglingsnahrungBeispiel
InstanceOf: MII_PR_ICU_Bilanz_Einfuhr_Saeuglingsnahrung
Usage: #example
* status = #final
* category.coding[hl7-category] = $observation-category#exam
* category.coding[kdsicu-category] = $sct#364396009
* code.coding[sct] = $sct#1204305004 "Measured volume of intake of infant formula"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2025-07-15T11:00:00+02:00"
* valueQuantity.value = 120
* valueQuantity.unit = "ml"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL