Instance: ISiKCapabilityStatementTerminRepositoryAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert MetaInstance
* insert Meta-CapabilityStatement-Akteur
* name = "ISiKCapabilityStatementTerminRepositoryAkteur"
* title = "ISiK CapabilityStatement Termin-Repository Akteur"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"

* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json

* purpose = "Das vorliegende CapabilityStatement fasst die Rollen (und entsprechende Interaktionen) zusammen, die ein Akteur 'Termin-Repository' zur Unterstützung des Termin-Workflows implementieren muss."
* imports[+] = Canonical(ISiKCapabilityStatementTerminologieRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementStammdatenRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementTerminRepositoryRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementTerminSubscriptionRolle)
  * insert ExpectationImports(#SHALL)

* rest.mode = #server
  