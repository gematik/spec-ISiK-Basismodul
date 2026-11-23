Instance: ExamplePrePopObservation
InstanceOf: ISiKFormularDefinition

* contained[+] = PflegegradDE

* insert QuestionnaireExamplesMetadata(ExamplePrePopObservation)
//Etablieren des Patientenkontextes aus SMART-Launch
* insert launchContext("patient", #Patient, "Patientenkontext")
* title = "Vorbelegung von Observations"
* description = "### Beispiel-Questionnaire mit automatischer Vorbelegung von Observations  
Die Suche nach passenden Observations geschieht innerhlab des Patienten-Kontextes anhand des in `item-code`hinterlegten Codes.
Die Extension [SDC-ObservationLinkPeriod](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationLinkPeriod.html) legt fest, wie alt  Observations maximal sein dürfen, um für die Vorbelegung herangezogen zu werden (hier: max. 1 Jahr)  
Die Extension [SDC-ObservationExtract](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationExtract.html) legt fest, ob aus den Angaben des Questionnaires eine neue Observation extrahiert werden soll (hier: true)"


//Teil 3: Pflegegrad
* item[+] 
  * type = #group
  * required = true
  * linkId = "3"
  * text = "Pflegegrad"
  * item[+]
    * type = #choice
    * linkId = "3.1"
    * text = "Bitte geben Sie den Pflegegrad an:"
    //Code für die Vorbelegung und Extraktion in die Observation
    * code = $loinc#80391-6
    //Alter bis zu dem passende Observations für die Vorbelegung akzeptiert werden
    * insert observationLinkPeriod(1 'a')
    //Aktivierung der Extraction
    * insert observationExtract
    //Referenz auf das ValueSet
    * answerValueSet = Canonical(PflegegradDE)
   




 

