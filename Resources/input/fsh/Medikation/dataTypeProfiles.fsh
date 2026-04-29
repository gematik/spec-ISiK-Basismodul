Profile: MedicationQuantity
Parent: SimpleQuantity
Id: MedicationQuantity
Title: "Medication Quantity"
Description: "Quantity Datentyp der die Nutzung von UCUM vorgibt. Bei dimensionslosen Einheiten wie 'Tablette' wird ein code von '1' erwartet, 'Tablette' kann als String in Unit hinterlegt werden."
* insert Meta
* value 1..1 MS
  * ^short = "Menge der Medikation"
  * ^comment = "Begründung des Must-Support: Basisinformation zur Medikation"
* unit MS
  * ^short = "Einheit der Medikation als String"
  * ^comment = "Begründung des Must-Support: Bereitstellung einer menschenlesbaren Darstellung der Einheit."
* system 1..1 MS
* system = $cs-ucum
  * ^short = "System der Einheit"
  * ^comment = "fix: http://unitsofmeasure.org"
* code 1..1 MS
  * ^short = "Code der Einheit"
  * ^comment = "Begründung des Must-Support: Zur Interpretation der Menge ist der Code erforderlich."

Profile: MedicationQuantityDoseForm
Parent: SimpleQuantity
Id: MedicationQuantityDoseForm
Title: "Medication Quantity Dose Form"
Description: "Quantity Datentyp für Dosage Informationen, der die Nutzung des VS DosageDoseQuantityDE vorgibt."
* insert Meta
* . ^binding.strength = #required
* . ^binding.valueSet = Canonical($vs-dosage-dose-quantity-de)
* value 1..1 MS
  * ^short = "Menge der Medikation"
  * ^comment = "Begründung des Must-Support: Basisinformation zur Medikation"
* unit MS
  * ^short = "Einheit der Medikation als String"
  * ^comment = "Begründung des Must-Support: Bereitstellung einer menschenlesbaren Darstellung der Einheit."
* system 1..1 MS
  * ^short = "System der Einheit"
  * ^comment = "Begründung des Must-Support: Zur Interpretation des Codes ist die Angabe des Systems erforderlich."
* code 1..1 MS
  * ^short = "Code der Einheit"
  * ^comment = "Begründung des Must-Support: Zur Interpretation der Menge ist der Code erforderlich."