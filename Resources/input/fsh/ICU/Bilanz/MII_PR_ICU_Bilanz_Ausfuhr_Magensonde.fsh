Profile: MII_PR_ICU_Bilanz_Ausfuhr_Magensonde
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-ausfuhr-magensonde
Title: "MII PR ICU Bilanz Ausfuhr Magensonde"
* insert Meta
* insert CommonElements

* category.coding[hl7-category].code = #exam

* code.coding 2.. MS
* code.coding[sct] 1..1 MS
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #1162665001
* code.coding[sct] ^patternCoding.display = "Volume of drainage of gastric contents (observable entity)"
* code.coding[sct].code MS
* code.coding[loinc] 1..1 MS
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[loinc] ^patternCoding.code = #79561-7
* code.coding[loinc] ^patternCoding.display = "Fluid output enteral tube [Volume] Measured"
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

Instance: BilanzAusfuhrMagensondeBeispiel
InstanceOf: MII_PR_ICU_Bilanz_Ausfuhr_Magensonde
Usage: #example
* status = #final
* category.coding[hl7-category] = $observation-category#exam
* category.coding[kdsicu-category] = $sct#364396009
* code.coding[sct] = $sct#1162665001 "Volume of drainage of gastric contents (observable entity)"
* code.coding[loinc] = $loinc#79561-7 "Fluid output enteral tube [Volume] Measured"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2025-07-15T16:00:00+02:00"
* valueQuantity.value = 250
* valueQuantity.unit = "ml"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL