Profile: MII_PR_ICU_Bilanz_Ausfuhr_Stuhlgang
Parent: MII_PR_ICU_Bilanz
Id: mii-pr-icu-bilanz-ausfuhr-stuhlgang
Title: "MII PR ICU Bilanz Ausfuhr Stuhlgang"
Description: "Dieses Profil wurde aus dem Modul KDS ICU entnommen und dient der Abbildung der Stuhlausfuhr als Teil der Bilanzierung von Patienten. Es ermöglicht die Erfassung der Menge des Stuhlgangs, die ein Patient über einen bestimmten Zeitraum ausgeschieden hat, und bietet somit eine spezifische Lösung für die Dokumentation dieses Aspekts der Flüssigkeitsbilanz."
* insert Meta
* insert CommonElements
* category.coding[hl7-category].code = #exam

* code.coding 1.. MS
* code.coding[sct] ..0 MS
* code.coding[loinc] 1..1 MS
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[loinc] ^patternCoding.code = #9217-1
* code.coding[loinc] ^patternCoding.display = "Output.stool [Volume]"
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

Instance: BilanzAusfuhrStuhlgangBeispiel
InstanceOf: MII_PR_ICU_Bilanz_Ausfuhr_Stuhlgang
Usage: #example
* status = #final
* category.coding[hl7-category] = $observation-category#exam "Exam"
* category.coding[kdsicu-category] = $sct#364396009 " Fluid balance observable"
* code.coding[loinc] = $loinc#9217-1 "Output.stool [Volume]"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2025-07-15T07:00:00+02:00"
* valueQuantity.value = 350
* valueQuantity.unit = "ml"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL