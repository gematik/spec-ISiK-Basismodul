Instance: IsikPatientTemplate
InstanceOf: ISiKPatient
Usage: #example
Title: "IsikPatientTemplate"
Description: ""
* identifier[Patientennummer]
  * insert tbeContext([["item.where(linkId = 'vnr').answer.value"]])
  * system = "urn:uuid:b3c6f1e2-4d2b-4f1e-9f3a-123456789abc"
  * value = "tbd"
    * insert tbeValue([["first()"]])
* name[Name]
  * insert tbeContext([["item.where(linkId = 'name')"]])
  * text
    * insert tbeValue([["item.where(linkId = 'given' or linkId = 'family').answer.value.join(' ')"]])
  * family
    * insert tbeValue([["item.where(linkId = 'family').answer.value.first()"]])
  * given[+]
    * insert tbeValue([["item.where(linkId = 'given').answer.value.first()"]])
* gender = #unknown
  * insert tbeValue([["item.where(linkId = 'gender').answer.value.first().code"]])
* birthDate
  * insert tbeValue([["item.where(linkId = 'birthDate').answer.value.first()"]])

Instance: DemoTemplatebasedExtractionQuestionnaire
InstanceOf: ISiKFormularDefinition
Usage: #example
Title: "DemoTemplatebasedExtractionQuestionnaire"
* contained[+] = IsikPatientTemplate
* insert QuestionnaireExamplesMetadata(DemoTemplatebasedExtractionQuestionnaire)
* title = "DemoTemplatebasedExtractionQuestionnaire"
* description = "### Beispiel-Questionnaire zur Demonstration der Template-basierten Extraktion von Patientendaten"
* item[+] 
  * insert tbeExtract(IsikPatientTemplate, NewPatientId)
  * linkId = "patient"
  * text = "Patient Informationen"
  * type = #group
  * item[+]
    * linkId = "name"
    * text = "Name"
    * type = #group
    * item[+]
      * linkId = "given"
      * text = "Vorname"
      * type = #string
      * repeats = true
    * item[+]
      * linkId = "family"
      * text = "Nachname"
      * type = #string
  * item[+]
    * linkId = "gender"
    * text = "Geschlecht"
    * type = #choice
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
  * item[+]
    * linkId = "birthDate"
    * text = "Geburtsdatum"
    * type = #date
  * item[+]
    * linkId = "vnr"
    * text = "Patienten-ID"
    * type = #string