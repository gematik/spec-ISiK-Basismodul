Profile: MII_PR_ICU_Bilanz_Einfuhr_Abgepumpte_Muttermilch
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-einfuhr-abgepumpte-muttermilch
Title: "MII PR ICU Bilanz Einfuhr Abgepumpte Muttermilch"
* insert Meta
* insert CommonElements

* category.coding[hl7-category].code = #exam

* code.coding 1.. MS
* code.coding[sct] 1..1 MS
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #819975003
* code.coding[sct] ^patternCoding.display = "Intake of maternal expressed breast milk (observable entity)"
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

Instance: BilanzEinfuhrAbgepumpteMuttermilchBeispiel
InstanceOf: MII_PR_ICU_Bilanz_Einfuhr_Abgepumpte_Muttermilch
Usage: #example
* status = #final
* category.coding[hl7-category] = $observation-category#exam "Exam"
* category.coding[kdsicu-category] = $sct#364396009 " Fluid balance observable"
* code.coding[sct] = $sct#819975003 "Intake of maternal expressed breast milk (observable entity)"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2025-07-15T09:30:00+02:00"
* valueQuantity.value = 60
* valueQuantity.unit = "ml"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL