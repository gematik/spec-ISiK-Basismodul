Instance: ISiKCapabilityStatementOrganspendeerkennungSourceAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* name = "ISiKCapabilityStatementOrganspendeerkennungSourceAkteur"
* title = "ISiK CapabilityStatement Organspendeerkennung Server"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement fasst die Rollen (und entsprechende Interaktionen) zusammen, die ein Akteur für die Organspendeerkennung zur Unterstützung des Organspendeerkennungs-Workflows implementieren muss.

Zur Implementierung der Interaktionen sind insbesondere die zu implementierenden Rollen (siehe 'imports' in der CapabilityStatement-Ressource) zu beachten.

**HISTORIE:**  

*Historie*: mit der Version 6.0.0-rc des IG Organspendeerkennung wurde das vorliegende CapabilityStatement im Sinne eines eigenständigen Akteurs erstellt und damit ein eigenständiger Schnittstellen-Akteur für die Bereitstellung von Vitalparametern im Kontext der Organspendeerkennung etabliert - samt neuer Funktionalität in der Abfrage.
"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest.mode = #server

// Administative Daten
* imports[+] = Canonical(ISiKCapabilityStatementStammdatenRolle)
  * insert ExpectationImports(#SHALL)
// MII-ICU backport profiles minimal (übergreifend)
* imports[+] = Canonical(ISiKCapabilityStatementVitalSignOrganspendeerkennungSourceRolle)
  * insert ExpectationImports(#SHALL)
  
// TODO Location
// TODO Suchparameter codi:in VS
