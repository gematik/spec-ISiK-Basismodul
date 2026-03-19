Profile: MII_PR_ICU_Bilanz_Ausfuhr_Fluessigkeit_Gesamt
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-ausfuhr-fluessigkeit-gesamt
Title: "MII PR ICU Bilanz Ausfuhr Fluessigkeit Gesamt"
* insert Meta
* insert CommonElements

* category.coding[hl7-category].code = #exam

* code.coding 2.. MS
* code.coding[sct] 1..1 MS
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #251847006
* code.coding[sct] ^patternCoding.display = "Total fluid loss"
* code.coding[sct].code MS
* code.coding[loinc] 1..1 MS
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[loinc] ^patternCoding.code = #9257-7
* code.coding[loinc] ^patternCoding.display = "Fluid output total Measured"
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

Instance: BilanzAusfuhrFluessigkeitGesamtBeispiel
InstanceOf: MII_PR_ICU_Bilanz_Ausfuhr_Fluessigkeit_Gesamt
Usage: #example
* status = #final
* category.coding[hl7-category] = $observation-category#exam
* category.coding[kdsicu-category] = $sct#364396009
* code.coding[sct] = $sct#251847006 "Total fluid loss"
* code.coding[loinc] = $loinc#9257-7 "Fluid output total Measured"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod.start = "2025-07-15T06:00:00+02:00"
* effectivePeriod.end = "2025-07-16T06:00:00+02:00"
* valueQuantity.value = 2400
* valueQuantity.unit = "ml"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL