Instance: ISiKCapabilityStatementFormularVorbelegungRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularVorbelegungRolle"
* name = "ISiKCapabilityStatementFormularVorbelegungRolle"
* title = "CapabilityStatement für Rolle `FormularVorbelegungRolle`"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"
* purpose = "
CapabilityStatement für die Rolle `FormularVorbelegungRolle`.
Diese Rolle stellt die Operation zur Vorbelegung (Prepopulation) von Formularen bereit."
* rest
  * mode = #server
  * resource[+]
    * type = #Questionnaire
    * insert Expectation(#SHALL)
    * operation[+]
      * insert Expectation(#SHALL)
      * name = "populate"
      * definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-populate"