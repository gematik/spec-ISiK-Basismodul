Instance: ISiKCapabilityStatementKontextUebersichtRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementKontextUebersichtRolle"
* name = "ISiKCapabilityStatementKontextÜbersichtRolle"
* title = "CapabilityStatement für Rolle ISiKCapabilityStatementKontextÜbersichtRolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = "
CapabilityStatement für die Rolle ISiKCapabilityStatementKontextÜbersichtRolle.
Diese Rolle stellt Operationen zum Abfragen von Patienten-, Abrechnungsfall- und Kontaktbasierten Informationen bereit. Dabei liegt der Fokus darauf, alle verfügbaren Informationen zum jeweiligen Scope zu erhalten. Als Basis werden die Core Operations [Patient-everything](http://hl7.org/fhir/OperationDefinition/Patient-everything) und [Encounter-everything](http://hl7.org/fhir/OperationDefinition/Encounter-everything) verwendet. Darüber hinaus definiert ISiK eine weitere Operation, die im Kontext des Abrechnungsfall ein Account-everything ermöglicht."
* rest
  * mode = #server
  * resource[+]
    * type = #Patient
    * insert Expectation(#SHALL)
    * operation[+]
      * name = "Patient-everything"
      * definition = "http://hl7.org/fhir/OperationDefinition/Patient-everything"
      * insert Expectation(#SHALL)
  * resource[+]
    * type = #Encounter
    * insert Expectation(#SHALL)
    * operation[+]
      * name = "Encounter-everything"
      * definition = "http://hl7.org/fhir/OperationDefinition/Encounter-everything"
      * insert Expectation(#SHALL)
  * resource[+]
    * type = #Account
    * insert Expectation(#SHALL)
    * operation[+]
      * name = "Account-everything"
      * definition = "https://gematik.de/fhir/isik/OperationDefinition/ISiKAccountEverything"
      * insert Expectation(#SHALL)