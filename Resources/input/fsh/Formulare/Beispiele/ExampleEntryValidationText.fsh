Instance: ExampleEntryValidationText
InstanceOf: ISiKFormularDefinition
* insert QuestionnaireExamplesMetadata(ExampleEntryValidationText)
* title = "Validierung von Texten"
* description = "### Beispiel-Questionnaire Validierung von Textfeldern
* Limitierung der Mindest- und Maximalvorkommen einer wiederholbaren Gruppe mittels [questionnaire-minOccurs](https://hl7.org/fhir/R4/extension-questionnaire-minoccurs.html)-Extension und [questionnaire-maxOccurs](https://hl7.org/fhir/R4/extension-questionnaire-maxoccurs.html)-Extension
* Limitierung der Eingabelänge mittels [minLength](https://hl7.org/fhir/R4/extension-minlength.html)-Extension"
* item[+]
  * type = #group
  * required = true
  * linkId = "1"
  * text = "Ausweisdaten"
  * repeats = true
  * insert minMaxOccurs(1,2)
  * item[+]  
    * linkId = "1.1"
    * text = "Ausweistyp"
    * type = #choice
    * answerOption[+].valueString = "Personalausweis"
    * answerOption[+].valueString = "Reisepass"
  * item[+]  
    * linkId = "1.2"
    * text = "Ausweisnummer"
    * type = #string
    * insert minLength(9)
    * maxLength = 9