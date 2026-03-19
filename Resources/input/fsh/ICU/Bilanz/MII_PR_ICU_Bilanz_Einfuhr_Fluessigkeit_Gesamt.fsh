Profile: MII_PR_ICU_Bilanz_Einfuhr_Fluessigkeit_Gesamt
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-einfuhr-fluessigkeit-gesamt
Title: "MII PR ICU Bilanz Einfuhr Fluessigkeit Gesamt"
* insert Meta
* insert CommonElementse

* category.coding[hl7-category].code = #exam

* code.coding 2.. MS
* code.coding[sct] 1..1 MS
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #251852001
* code.coding[sct] ^patternCoding.display = "Total fluid input (observable entity)"
* code.coding[sct].code MS
* code.coding[loinc] 1..1 MS
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[loinc] ^patternCoding.code = #9103-3
* code.coding[loinc] ^patternCoding.display = "Fluid intake total Measured"
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

Instance: BilanzEinfuhrFluessigkeitGesamtBeispiel
InstanceOf: MII_PR_ICU_Bilanz_Einfuhr_Fluessigkeit_Gesamt
Usage: #example
* status = #final
* category.coding[hl7-category] = $observation-category#exam
* category.coding[kdsicu-category] = $sct#364396009
* code.coding[sct] = $sct#251852001 "Total fluid input (observable entity)"
* code.coding[loinc] = $loinc#9103-3 "Fluid intake total Measured"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod.start = "2025-07-15T06:00:00+02:00"
* effectivePeriod.end = "2025-07-16T06:00:00+02:00"
* valueQuantity.value = 2800
* valueQuantity.unit = "ml"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL