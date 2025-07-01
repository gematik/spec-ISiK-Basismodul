Alias: $loinc = http://loinc.org
Alias: $gender = http://hl7.org/fhir/administrative-gender



Instance: QuestionnaireDemo
InstanceOf: Questionnaire

//Etablieren des Patientenkontextes aus SMART-Launch
* insert launchContext("patient", #Patient, "Patientenkontext")
* status = #draft
* title = "Questionnaire Feature Demo"
* description = "Beispiel-Questionnaire zur Demonstration diverser SDC Funktionalitäten, z.B. Prepopulation & Extraction"
* url = "https://gematik.de/fhir/isik/Questionnaire/Demo"
//Teil1: Demografische Patientendaten
* item[+]
  * type = #group
  * required = true
  * linkId = "1"
  * text = "Angaben zur Person"
  * item[+]
    * type = #string
    * linkId = "1.1"
    * text = "Vorname:"
    //Vorbelegung mit Vorname aus Patientenkontext
    * insert initialExpression("%patient.name[0].given[0]", "erster Vorname im ersten Namen des Patienten")
  * item[+]
    * type = #string
    * linkId = "1.2"
    * text = "Nachname:"
    //Vorbelegung mit Nachname aus Patientenkontext
    * insert initialExpression("%patient.name[0].family", "Nachname im ersten Namen des Patienten")
  * item[+]
    * type = #choice
    * linkId = "1.3"
    * text = "Geschlecht:"
    * answerOption[+].valueCoding = $gender#male "männlich"
    * answerOption[+].valueCoding = $gender#female "weiblich"
    //Vorbelegung mit Geschlechts-Code aus Patientenkontext
    * insert initialExpression([["%questionnaire.repeat(item).where(linkId='1.3').answerOption.value.where(code=%patient.gender)"]], [["Geschlecht des Patienten, gemappt von Code auf Coding der Antwortoptionen"]])
  * item[+]
    * type = #string
    * linkId = "1.4"
    * text = "Versichertennummer:"
    //Validierung der Versichertennummer gegen RegEx-Pattern (muss für LHC mit /.../ eingerahmt werden!)
    * insert regEx([["/^[A-Z][0-9]{9}$/"]])



//Teil 2: Bedingte Fragestellungen
* item[+]
  * type = #group
  * linkId = "2"
  * text = "Fragen mit EnableWhen-Bedingung"
  * item[+]
    * type = #choice
    * linkId = "2.1"
    * text = "Wie geht's?"
    * answerOption[+].valueCoding.display = "gut."
    * answerOption[+].valueCoding.display = "geht."
    * answerOption[+].valueCoding.display = "muss."
    //Darstellung als Radio-Buttons statt Drop-Down-Liste
    * insert itemControl(#radio-button)
  * item[+]
    * type = #choice
    * linkId = "2.2"
    * text = "Was ist denn los?"
    * answerOption[+]
      * valueCoding.display = "Nix."
      //Annotation der Option mit Punktwerten
    * answerOption[+]
      * valueCoding.display = "Frag nicht!"
      //Annotation der Option mit Punktwerten
    * enableWhen
      * question = "2.1"
      * operator = #=
      * answerCoding.display = "muss."



//Teil 3: Pflegegrad
* item[+]
  * type = #group
  * required = true
  * linkId = "3"
  * text = "Pflegegrad"
  * item[+]
    //Anzeige eines Links mit weiteren Hinweisen (von LHC aktuell nicht unterstützt)
    //* insert supportLink("https://ig.fhir.de/basisprofile-de/stable/Ressourcen-BeobachtungenMessungenObservation.html#Ressourcen-Observation-Pflegegrad")
    * type = #choice
    * linkId = "3.1"
    * text = "Bitte geben Sie den Pflegegrad an:"
    //Code für die Extraktion in die Observation
    * code = $loinc#80391-6
    //Alter bis zu dem passende Observations für die Vorbelegung akzeptiert werden
    * insert observationLinkPeriod(1 'a')
    //Aktivierung der Extraction
    * insert observationExtract
    //Referenz auf das eingebettete (contained) ValueSet
    * answerValueSet = Canonical(PflegegradDE)
      
//Teil 4: Observation mit Vorbelegeung und Extraktion
* item[+]
  * type = #group
  * required = false
  * linkId = "4"
  * text = "Körpermaße"
  * item[+]  
    //Annotation mit codierter Maßeinheit
    * insert uunit(kg)
    * insert observationExtract
    * insert observationLinkPeriod(1 'm')
    * linkId = "4.1"
    * text = "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)"
    * type = #decimal
    * insert minMaxDecimal (20,300)
  * item[+]  
    //Annotation mit codierter Maßeinheit
    * insert uunit(m)
    //Anzeige einer Formatvorlage für die Eingabe
    * insert entryFormat("x.xx")
    * insert observationExtract
    * insert observationLinkPeriod(1 'a')
    * linkId = "4.2"
    * text = "Körpergröße in m (muss zwischen 1 und 2.50 liegen)"
    * type = #decimal
    * insert minMaxDecimal (1,2.5)




 

