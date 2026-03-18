Instance: ISiKCapabilityStatementAMTSAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementAMTSAkteur"
* name = "ISiKCapabilityStatementAMTSAkteur"
* title = "ISiK CapabilityStatement AMTS Akteur"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'AMTS' zu bestehen.
  
**HISTORIE:**    

* 5.0.0 
  * Hinzufügen von Interaktionen für die Prozedur für den AMTS-Bereich.
  * Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.

"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest.mode = #server

* imports[+] = Canonical(ISiKCapabilityStatementAMTSRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementStammdatenRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementLeistungserbringerRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementKlinischeRolle) //Hinzufügen von Interaktionen für die Prozedur für den AMTS-Bereich.
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementMedikationVerabreichungRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementMedikationInformationRolle) 
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementMedikationVerordnungRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementMedikationVerordnungWRITERolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementMedikamentRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementLaborMinimalRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementGesundheitsstatusRolle)
  * insert ExpectationImports(#SHALL)