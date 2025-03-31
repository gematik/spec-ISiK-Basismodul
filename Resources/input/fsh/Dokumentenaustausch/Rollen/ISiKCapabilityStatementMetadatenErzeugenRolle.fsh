Instance: ISiKCapabilityStatementMetadatenErzeugenRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-role
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMetadatenErzeugenRolle"
* name = "ISiKCapabilityStatementMetadatenErzeugenRolle"
* title = "ISiK CapabilityStatement Metadaten Erzeugen Rolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Dokumentenaustausch"


* rest.mode = #server
* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #DocumentReference
  * operation[+]
    * insert Expectation (#SHALL)
    * name = #generate-metadata
    * definition = "https://profiles.ihe.net/ITI/MHD/OperationDefinition/generate-metadata"

