Instance: ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* name = "ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur"
* title = "ISiK CapabilityStatement Vitalparameter Server Extended"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement fasst die Rollen (und entsprechende Interaktionen) zusammen, die ein Akteur 'VitalSign ICU Source Extended' zur Unterstützung des ICU-Normalstation-Workflows implementieren muss

Zur Implementierung der Interaktionen sind insbesondere die zu implementierenden Rollen (siehe 'imports' in der CapabilityStatement-Ressource) zu beachten.

**HISTORIE:**  

*Historie*: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne eines eigenständigen Akteurs extrahiert (die Funktionalität bleibt dabei unverändert).

*Historie*: mit der Version 4.0.1 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement überarbeitet.
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
* imports[+] = Canonical(ISiKCapabilityStatementVitalSignICUSourceMinimalRolle)
  * insert ExpectationImports(#SHALL)
// MII-ICU backport profiles extended (e.g for PDMS)
* imports[+] = Canonical(ISiKCapabilityStatementVitalSignICUSourceExtendedRolle)
  * insert ExpectationImports(#SHALL)
//Support für Laborprofile
* imports[+] = Canonical(ISiKCapabilityStatementLaborMinimalRolle)
  * insert ExpectationImports(#SHALL)
//Support für generische Vitalparameter (wie Körpergewicht, Größe etc.)
* imports[+] = Canonical(ISiKCapabilityStatementVitalSignStandardSourceRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementVitalSignICUSourceBilanzRolle)
  * insert ExpectationImports(#SHALL)
