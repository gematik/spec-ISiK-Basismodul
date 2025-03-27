Instance: ISiKCapabilityStatementAMTSAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatementAMTS
* name = "ISiKCapabilityStatementAMTSAkteur"
* title = "ISiK CapabilityStatement AMTS Akteur"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* description = "Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'AMTS' zu bestehen.
  
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
* imports = Canonical(ISiKCapabilityStatementAMTSRolle)
* imports = Canonical(ISiKCapabilityStatementStammdatenRolle)
* imports = Canonical(ISiKCapabilityStatementLeistungserbringerRolle)
* imports = Canonical(ISiKCapabilityStatementKlinischeRolle) //Hinzufügen von Interaktionen für die Prozedur für den AMTS-Bereich.
//* imports = Canonical(ISiKCapabilityStatementMedikationInformationRolle)
//* imports = Canonical(ISiKCapabilityStatementMedikationVerordnungRolle)