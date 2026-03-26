Instance: ISiKCapabilityStatementVitalSignStandardSourceRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementVitalSignStandardSource Rolle"
* title = "ISiK CapabilityStatement VitalSign Standard Source Rolle"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVitalSignStandardSourceRolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen, die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren für das Modul Vitalparameter zu bestehen.
  
**HISTORIE:**    

*Historie*: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle extrahiert (die Funktionalität bleibt dabei unverändert).


**Version 4.0.1**

* `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.   
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.  

"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * resource[+]
    * type = #Observation
    * insert CapabilityStatementExpectationExt(SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKAtemfrequenz, SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKBlutdruckSystemischArteriell, SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKHerzfrequenz, SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKKoerpergewicht, SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKKoerpergroesse, SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKKoerperkerntemperatur, SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKKopfumfang, SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKSauerstoffsaettigungArteriell, SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKGCS, SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKEKG, MAY)
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #read
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * insert CommonObservationSearchParameters