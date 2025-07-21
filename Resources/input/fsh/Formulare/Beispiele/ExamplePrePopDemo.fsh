Instance: ExamplePrePopDemo
InstanceOf: Questionnaire

* insert QuestionnaireExamplesMetadata(ExamplePrePopDemo)
//Etablieren des Patientenkontextes aus SMART-Launch
* insert launchContext("patient", #Patient, "Patientenkontext")
* title = "Vorbelegung Demografischer Daten"
* description = "### Beispiel-Questionnaire mit automatischer Vorbelegung von demografischen Patientendaten 
Der Patientenkontext wird mittels der [SDC-LaunchContexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html)-Extension hergestellt.  
Die Vorbelegung erfolgt über die [SDC-InitialExpression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-initialExpression.html)-Extension"

* item[+]
  * type = #group
  * required = true
  * linkId = "1"
  * text = "Demografische Patientendaten"
  * item[+]
    * type = #string
    * linkId = "1.1"
    * text = "Vorname:"
    //Vorbelegung mit Vornamen aus Patientenkontext
    * insert initialExpression("%patient.name[0].given[0]", "erster Vorname im ersten Namen des Patienten")
  * item[+]
    * type = #string
    * linkId = "1.2"
    * text = "Nachname:"
    //Vorbelegung mit Nachnamen aus Patientenkontext
    * insert initialExpression("%patient.name[0].family", "Nachname im ersten Namen des Patienten")
  * item[+]
    * type = #string
    * linkId = "1.4"
    * text = "Versichertennummer:"
    * insert initialExpression([["%patient.identifier.where(system='http://fhir.de/sid/gkv/kvid-10').value"]], [["Versichertennnummer(KVID) des Patienten"]])

