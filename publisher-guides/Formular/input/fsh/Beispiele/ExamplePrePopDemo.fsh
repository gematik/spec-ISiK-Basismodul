Instance: ExamplePrePopDemo
InstanceOf: ISiKFormularDefinition

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
    * insert initialExpression([["(%patient.name.where(use = 'official').given[0] | %patient.name[0].given[0]).first()"]], [["Selektion des ersten Vornamens des Patienten. Präferiert aus dem offiziellem Namen, alternativ erster gefundener Name"]])
  * item[+]
    * type = #string
    * linkId = "1.2"
    * text = "Nachname:"
    //Vorbelegung mit Nachnamen aus Patientenkontext
    * insert initialExpression([["(%patient.name.where(use = 'official').family | %patient.name[0].family).first()"]], [["Selektion des Nachnamens des Patienten. Präferiert aus dem offiziellem Namen, alternativ erster gefundener Name"]])
  * item[+]
    * type = #string
    * linkId = "1.4"
    * text = "Versichertennummer:"
    * insert initialExpression([["%patient.identifier.where(system='http://fhir.de/sid/gkv/kvid-10').value"]], [["Versichertennnummer(KVID) des Patienten"]])

