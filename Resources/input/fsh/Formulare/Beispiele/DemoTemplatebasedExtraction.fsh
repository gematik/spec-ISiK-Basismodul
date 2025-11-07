Instance: DemoTemplatebasedExtractionQuestionnaire
InstanceOf: ISiKFormularDefinition
Usage: #example
Title: "DemoTemplatebasedExtractionQuestionnaire"
* contained[+] = IsikPatientTemplate
* insert QuestionnaireExamplesMetadata(DemoTemplatebasedExtractionQuestionnaire)
* insert launchContext("patient", #Patient, "Patientenkontext")
* title = "DemoTemplatebasedExtractionQuestionnaire"
* description = "### Beispiel-Questionnaire zur Demonstration der Template-basierten Extraktion von Patientendaten"
* item[+] 
  * insert tbeExtract(IsikPatientTemplate, [["('Patient/' + item.where(linkId = 'resourceId').answer.value)"]])
  * linkId = "patient"
  * text = "Patient Informationen"
  * type = #group
  * item[+]
    * linkId = "resourceId"
    * text = "Ressourcen-ID"
    * type = #string
    * insert hiddenItem
    * insert initialExpression([["%patient.id"]], [["Selektion der Ressourcen-ID des Patienten"]])
  * item[+]
    * linkId = "name"
    * text = "Name"
    * type = #group
    * item[+]
      * linkId = "given"
      * text = "Vorname"
      * type = #string
      * repeats = true
      * insert initialExpression([["(%patient.name.where(use = 'official').given[0] | %patient.name[0].given[0]).first()"]], [["Selektion des ersten Vornamens des Patienten. Präferiert aus dem offiziellem Namen, alternativ erster gefundener Name"]])
    * item[+]
      * linkId = "family"
      * text = "Nachname"
      * type = #string
      * insert initialExpression([["(%patient.name.where(use = 'official').family | %patient.name[0].family).first()"]], [["Selektion des Nachnamens des Patienten. Präferiert aus dem offiziellem Namen, alternativ erster gefundener Name"]])
  * item[+]
    * linkId = "gender"
    * text = "Geschlecht"
    * type = #choice
    * insert initialExpression([["%questionnaire.repeat(item).where(linkId='gender').answerOption.valueCoding.where(code=%patient.gender)"]], [["Selektion des Geschlechts des Patienten"]])
    * answerOption[+]
      * valueCoding
        * system = "http://hl7.org/fhir/administrative-gender"
        * code = #unknown
        * display = "Unbekannt"
      * initialSelected = true
    * answerOption[+].valueCoding
      * system = "http://hl7.org/fhir/administrative-gender"
      * code = #male
      * display = "Männlich"
    * answerOption[+].valueCoding
      * system = "http://hl7.org/fhir/administrative-gender"
      * code = #female
      * display = "Weiblich"
    * answerOption[+].valueCoding
      * system = "http://hl7.org/fhir/administrative-gender"
      * code = #other
      * display = "Anderes"
  * item[+]
    * linkId = "birthDate"
    * text = "Geburtsdatum"
    * type = #date
    * insert initialExpression([["%patient.birthDate"]], [["Selektion des Geburtsdatums des Patienten"]])
  * item[+]
    * linkId = "patientId"
    * text = "Patienten-ID"
    * type = #group
    * item[+]
      * linkId = "patientId-system"
      * text = "System der Patienten-ID"
      * type = #string
      * insert initialExpression([["%patient.identifier.where(type.coding.first().code = 'MR').system"]], [["Selektion des Systems der Patienten-ID."]])
    * item[+]
      * linkId = "patientId-value"  
      * text = "Wert der Patienten-ID"
      * type = #string
      * insert initialExpression([["%patient.identifier.where(type.coding.first().code = 'MR').value"]], [["Selektion des Value der Patienten-ID."]])
  * item[+]
    * linkId = "versichertenId"
    * text = "Versichertennummer"
    * type = #string
    * insert initialExpression([["%patient.identifier.where(system = 'http://fhir.de/sid/gkv/kvid-10').value"]], [["Versichertennnummer(KVID) des Patienten"]])
  * item[+]
    * linkId = "telecom"
    * text = "Kontaktmöglichkeit"
    * type = #group
    * item[+]
      * linkId = "telecom-system"
      * type = #string
      * initial.valueString = "phone"
      * insert hiddenItem
    * item[+]
      * linkId = "telecom-value"
      * text = "Telefonnummer"
      * type = #string
      * insert initialExpression([["%patient.telecom.where(system = 'phone').first().value"]], [["Selektion des Value der Patienten-ID."]])