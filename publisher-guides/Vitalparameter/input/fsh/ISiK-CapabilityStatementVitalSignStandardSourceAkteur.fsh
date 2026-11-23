Instance: ISiKCapabilityStatementVitalSignStandardSourceAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* name = "ISiKCapabilityStatementVitalSignStandardSourceAkteur"
* title = "ISiK CapabilityStatement Vital Sign Standard Source Akteur"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVitalSignStandardSourceAkteur"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen, die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren für das Modul Vitalparameter zu bestehen.
  
**HISTORIE:**    

*Historie*: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne eines eigenständigen Akteurs extrahiert (die Funktionalität bleibt dabei unverändert).


**Version 4.0.1**

* `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.   
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.  

"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest.mode = #server

// Vitalparameter
* imports[+] = Canonical(ISiKCapabilityStatementVitalSignStandardSourceRolle)
  * insert ExpectationImports(#SHALL)
// Administative Daten
* imports[+] = Canonical(ISiKCapabilityStatementStammdatenRolle)
  * insert ExpectationImports(#SHALL)
//Support fuer Laborprofile
* imports[+] = Canonical(ISiKCapabilityStatementLaborMinimalRolle)
  * insert ExpectationImports(#SHALL)