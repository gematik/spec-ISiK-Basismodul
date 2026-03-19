Profile: MII_PR_ICU_Bilanz_Tagesbilanz_Fluessigkeit
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-tagesbilanz-fluessigkeit
Title: "MII PR ICU Bilanz Tagesbilanz Fluessigkeit"
* insert Meta
* insert CommonElements

* category.coding[hl7-category].code = #exam

* code.coding 2.. MS
* code.coding[sct] 1..1 MS
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #251856003
* code.coding[sct] ^patternCoding.display = "Fluid balance status (observable entity)"
* code.coding[sct].code MS
* code.coding[loinc] 1..1 MS
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[loinc] ^patternCoding.code = #9097-7
* code.coding[loinc] ^patternCoding.display = "Fluid balance 24 hour"
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

Instance: BilanzTagesbilanzFluessigkeitBeispiel
InstanceOf: MII_PR_ICU_Bilanz_Tagesbilanz_Fluessigkeit
Usage: #example
* status = #final
* category.coding[hl7-category] = $observation-category#exam
* category.coding[kdsicu-category] = $sct#364396009
* code.coding[sct] = $sct#251856003 "Fluid balance status (observable entity)"
* code.coding[loinc] = $loinc#9097-7 "Fluid balance 24 hour"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod.start = "2025-07-15T06:00:00+02:00"
* effectivePeriod.end = "2025-07-16T06:00:00+02:00"
* valueQuantity.value = 400
* valueQuantity.unit = "ml"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL