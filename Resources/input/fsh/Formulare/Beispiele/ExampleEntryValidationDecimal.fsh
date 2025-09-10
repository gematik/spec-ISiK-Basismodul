Instance: ExampleEntryValidationDecimal
InstanceOf: ISiKFormularDefinition

* insert QuestionnaireExamplesMetadata(ExampleEntryValidationDecimal)
* title = "Validierung von Dezimalen"
* description = "### Beispiel-Questionnaire Validierung von Dezimalwerten  
* Vorgabe des Eingabeformates mittels [entryFormat](https://hl7.org/fhir/R4/extension-entryformat.html)-Extension
* Limitierung der Dezimalstellen mittels [maxDecimalPlaces](https://hl7.org/fhir/R4/extension-maxdecimalplaces.html)-Extension
* Limitierung des Wertebereiches mittels [minValue](https://hl7.org/fhir/R4/extension-minvalue.html) 
   und [maxValue](https://hl7.org/fhir/R4/extension-maxvalue.html)-Extension
* Vorgabe der anzugebenden Maßeinheit mittels [questionnaire-unit](https://hl7.org/fhir/R4/extension-questionnaire-unit.html)-Extension"
* item[+]
  * type = #group
  * required = false
  * linkId = "4"
  * text = "Körpermaße"
  * item[+]  
    //Annotation mit codierter Maßeinheit
    * insert uunit(kg)
    * linkId = "4.1"
    * text = "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)"
    * type = #decimal
    * insert minMaxDecimal (20,300)
    * insert maxDecimalPlaces(1)
  * item[+]  
    //Annotation mit codierter Maßeinheit
    * insert uunit(m)
    //Anzeige einer Formatvorlage für die Eingabe
    * insert entryFormat("x.xx")
    * linkId = "4.2"
    * text = "Körpergröße in m (muss zwischen 1m und 2.50m liegen)"
    * type = #decimal
    * insert minMaxDecimal(1,2.5)
    * insert maxDecimalPlaces(3)


   
Instance: ExampleEntryValidationDecimalResponse
InstanceOf: ISiKFormularDaten
* insert QuestionnaireResponseCommons(ExampleEntryValidationDecimal, PatientinMinimal)
* questionnaire.extension[questionnaireDisplay].valueString = "Validierung von Dezimalen"
* item[+]
  * linkId = "4"
  * text = "Körpermaße"
  * item[+]  
    * linkId = "4.1"
    * text = "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)"
    * answer.valueDecimal = 66
  * item[+]  
    * linkId = "4.2"
    * text = "Körpergröße in m (muss zwischen 1m und 2.50m liegen)"
    * answer.valueDecimal = 1.66
 

Instance: TestMaxDecimal0
InstanceOf: ISiKFormularDaten
* insert QuestionnaireResponseCommons(ExampleEntryValidationDecimal, PatientinMinimal)
* questionnaire.extension[questionnaireDisplay].valueString = "Validierung von Dezimalen"
* item[+]
  * linkId = "4"
  * text = "Körpermaße"
  * item[+]  
    * linkId = "4.1"
    * text = "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)"
    * answer.valueDecimal = 66
  * item[+]  
    * linkId = "4.2"
    * text = "Körpergröße in m (muss zwischen 1m und 2.50m liegen)"
    * answer.valueDecimal = 1

Instance: TestMaxDecimal1
InstanceOf: ISiKFormularDaten
Description: "Test-Instanz für Validierungs-Fehler 'Too many decimal places'"
* insert QuestionnaireResponseCommons(ExampleEntryValidationDecimal, PatientinMinimal)
* questionnaire.extension[questionnaireDisplay].valueString = "Validierung von Dezimalen"
* item[+]
  * linkId = "4"
  * text = "Körpermaße"
  * item[+]  
    * linkId = "4.1"
    * text = "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)"
    * answer.valueDecimal = 66.1
  * item[+]  
    * linkId = "4.2"
    * text = "Körpergröße in m (muss zwischen 1m und 2.50m liegen)"
    * answer.valueDecimal = 1.6

Instance: TestMaxDecimal2
InstanceOf: ISiKFormularDaten
Description: "Test-Instanz für Validierungs-Fehler 'Too many decimal places'"
* insert QuestionnaireResponseCommons(ExampleEntryValidationDecimal, PatientinMinimal)
* questionnaire.extension[questionnaireDisplay].valueString = "Validierung von Dezimalen"
* item[+]
  * linkId = "4"
  * text = "Körpermaße"
  * item[+]  
    * linkId = "4.1"
    * text = "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)"
    * answer.valueDecimal = 66.2
  * item[+]  
    * linkId = "4.2"
    * text = "Körpergröße in m (muss zwischen 1m und 2.50m liegen)"
    * answer.valueDecimal = 1.63


Instance: TestMaxDecimal3
InstanceOf: ISiKFormularDaten
Description: "Test-Instanz für Validierungs-Fehler 'Too many decimal places'"
* insert QuestionnaireResponseCommons(ExampleEntryValidationDecimal, PatientinMinimal)
* questionnaire.extension[questionnaireDisplay].valueString = "Validierung von Dezimalen"
* item[+]
  * linkId = "4"
  * text = "Körpermaße"
  * item[+]  
    * linkId = "4.1"
    * text = "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)"
    * answer.valueDecimal = 66.1
  * item[+]  
    * linkId = "4.2"
    * text = "Körpergröße in m (muss zwischen 1m und 2.50m liegen)"
    * answer.valueDecimal = 1.123    