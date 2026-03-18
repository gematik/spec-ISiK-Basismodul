Instance: ISiKCapabilityStatementMedikationVerabreichungAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerabreichungAkteur"
* name = "ISiKCapabilityStatementMedikationVerabreichungMedikationsinformationAkteur"
* title = "ISiK CapabilityStatement Medikationsverabreichung Server Akteur"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'Medikationsverabreichung' zu bestehen.
  
**HISTORIE:**    

* 5.0.0 - Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.
"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest.mode = #server

* imports[+] = Canonical(ISiKCapabilityStatementMedikationVerabreichungRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementMedikationVerabreichungWRITERolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementStammdatenRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementLeistungserbringerRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementMedikamentRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementMedikamentWRITERolle)
  * insert ExpectationImports(#SHALL)
