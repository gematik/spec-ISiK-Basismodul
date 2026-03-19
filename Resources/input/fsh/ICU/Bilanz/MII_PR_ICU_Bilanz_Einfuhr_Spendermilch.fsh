Profile: MII_PR_ICU_Bilanz_Einfuhr_Spendermilch
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-einfuhr-spendermilch
* insert Meta
* insert CommonElements

* category.coding[hl7-category].code = #exam

* code.coding 1.. MS
* code.coding[sct] 1..1 MS
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #819973005
* code.coding[sct] ^patternCoding.display = "Donor breastmilk intake (observable entity)"
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