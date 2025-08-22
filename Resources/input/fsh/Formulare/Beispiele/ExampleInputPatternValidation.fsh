Instance: ExampleInputPatternValidation
InstanceOf: ISiKFormularDefinition

* insert QuestionnaireExamplesMetadata(ExampleInputPatternValidation)
//Etablieren des Patientenkontextes aus SMART-Launch
* title = "Validierung von Formulareingaben gegen RegExPattern"
* description = "### Beispiel-Questionnaire mit Validierung von Benutzereingaben mittels einer FHIRPath-Expression  
Die Validierung erfolgt über die [targetConstraint](https://hl7.org/fhir/extensions/StructureDefinition-targetConstraint.html)-Extension"


* item[+]
  * type = #string
  * linkId = "1.4"
  * text = "Versichertennummer:"
  * insert targetConstraint ("kvid-1", [["matches(^[A-Z][0-9]{9}$)"]], #warning, [["Eine Versichertennummer muss mit einem Großbuchstaben beginnen, gefolgt von 9 Zahlen!"]]) 



