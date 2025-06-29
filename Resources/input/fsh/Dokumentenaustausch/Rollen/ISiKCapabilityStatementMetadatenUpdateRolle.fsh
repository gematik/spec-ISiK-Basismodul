Instance: ISiKCapabilityStatementMetadatenUpdateRolle
InstanceOf: CapabilityStatement
Usage: #definition

* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMetadatenUpdateRolle"
* name = "ISiKCapabilityStatementMetadatenUpdateRolle"
* title = "ISiK CapabilityStatement Metadaten Update Rolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Dokumentenaustausch"
* purpose = "
CapabilityStatement für die Rolle &quot;ISiKCapabilityStatementMetadatenUpdateRolle&quot;.
Diese Rolle beschreibt verpflichtende Interaktionen zur Aktualisierung von Metadaten für Dokumente.
"
* rest.mode = #server
* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #DocumentReference
  * operation[+]
    * insert Expectation (#SHALL)
    * name = #update-metadata
    * definition = Canonical(UpdateMetadata)
