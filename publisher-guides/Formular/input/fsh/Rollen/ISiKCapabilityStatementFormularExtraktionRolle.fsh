Instance: ISiKCapabilityStatementFormularExtraktionRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularExtraktionRolle"
* name = "ISiKCapabilityStatementFormularExtraktionRolle"
* title = "CapabilityStatement für Rolle `FormularExtraktionRolle`"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"
* purpose = "CapabilityStatement für Rolle `FormularExtraktionRolle`
Diese Rolle stellt die Operation zur Extraktion von FormularenDaten bereit."
* rest
  * mode = #server
  * resource[+]
    * type = #QuestionnaireResponse
    * insert Expectation(#SHALL)
    * operation[+]
      * insert Expectation(#SHALL)
      * name = "extract"
      * definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/QuestionnaireResponse-extract"