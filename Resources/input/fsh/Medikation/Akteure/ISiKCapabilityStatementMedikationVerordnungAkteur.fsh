Instance: ISiKCapabilityStatementMedikationVerordnungAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatementVerordnung
* name = "ISiKCapabilityStatementMedikationVerordnungAkteur"
* title = "ISiK CapabilityStatement Medikationsverordnung Server Akteur"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* description = "Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'Medikationsverordnung' zu bestehen.
  
**HISTORIE:**    

* 5.0.0 - Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.

"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* imports = Canonical(ISiKCapabilityStatementMedikationVerordnungRolle)
* imports = Canonical(ISiKCapabilityStatementStammdatenRolle)
* imports = Canonical(ISiKCapabilityStatementLeistungserbringerRolle)
