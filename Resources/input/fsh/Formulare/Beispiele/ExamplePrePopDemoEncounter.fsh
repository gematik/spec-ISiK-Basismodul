Instance: ExamplePrePopDemoEnc
InstanceOf: ISiKFormularDefinition

* insert QuestionnaireExamplesMetadata(ExamplePrePopDemoEnc)
//Etablieren des Patientenkontextes aus SMART-Launch
* insert launchContext("patient", #Patient, "Patientenkontext")
* insert launchContext("encounter", #Encounter, "Fallkontext")
* title = "Vorbelegung Demografischer Daten Encounter"
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

* item[+]
  * type = #group
  * linkId = "2"
  * text = "Fallinformationen"
  * item[+]
    * type = #string
    * linkId = "2.1"
    * text = "Fallnummer:"
    * insert initialExpression([["%encounter.account.identifier.first().value"]], [["Selektion der Fallnummer"]])
  * item[+]
    * type = #string
    * linkId = "2.2"
    * text = "Fallart:"
    * insert initialExpression([["(%encounter.type.coding.where(system = 'http://fhir.de/CodeSystem/kontaktart-de').display | %encounter.type.coding.where(system = 'http://fhir.de/CodeSystem/kontaktart-de').code)"]], [["Selektion der Fallart"]])
  * item[+]
    * type = #string
    * linkId = "2.3"
    * text = "Fachabteilungsschlüssel §301:"
    * insert initialExpression([["(%encounter.serviceType.coding.where(system = 'http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel').display | %encounter.serviceType.coding.where(system = 'http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel').code)"]], [["Selektion des Fachabteilungsschlüssel"]])
  * item[+]
    * type = #string
    * linkId = "2.4"
    * text = "Status:"
    * insert initialExpression([["%encounter.status"]], [["Selektion der Status"]])
  * item[+]
    * type = #string
    * linkId = "2.5"
    * text = "Von:"
    * insert initialExpression([["%encounter.period.start"]], [["Selektion der Period Start"]])
  * item[+]
    * type = #string
    * linkId = "2.6"
    * text = "Bis:"
    * insert initialExpression([["%encounter.period.end"]], [["Selektion der Period End"]])
  * item[+]
    * type = #string
    * linkId = "2.7"
    * text = "Aktuelle Station:"
    * insert initialExpression([["%encounter.location.where(physicalType.coding.first().code = 'wa' and status = 'active').location.display"]], [["Selektion der Station"]])
  * item[+]
    * type = #string
    * linkId = "2.8"
    * text = "Aktuelles Bett:"
    * insert initialExpression([["%encounter.location.where(physicalType.coding.first().code = 'bd' and status = 'active').location.display"]], [["Selektion des Bett"]])