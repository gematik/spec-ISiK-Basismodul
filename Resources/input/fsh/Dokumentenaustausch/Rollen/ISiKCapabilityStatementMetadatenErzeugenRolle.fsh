Instance: ISiKCapabilityStatementMetadatenErzeugenRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMetadatenErzeugenRolle"
* name = "ISiKCapabilityStatementMetadatenErzeugenRolle"
* title = "ISiK CapabilityStatement Metadaten Erzeugen Rolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Dokumentenaustausch"
* purpose = "
CapabilityStatement für die Rolle &quot;ISiKCapabilityStatementMetadatenErzeugenRolle&quot;.
Diese Rolle ist in der Lage, Metadaten für Dokumente zu erzeugen.
"
* rest.mode = #server
* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #DocumentReference
  * operation[+]
    * insert Expectation (#SHALL)
    * name = #generate-metadata
    * definition = "https://profiles.ihe.net/ITI/MHD/OperationDefinition/generate-metadata"

