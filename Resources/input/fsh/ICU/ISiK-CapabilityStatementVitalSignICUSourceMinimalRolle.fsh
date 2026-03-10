Instance: ISiKCapabilityStatementVitalSignICUSourceMinimalRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementVitalSignICUSourceMinimalRolle"
* title = "ISiK CapabilityStatement VitalSign ICU Source Minimal Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt verpflichtende Interaktionen, die ein ISiK-konformes System oder eine Systemkomponenten in der Rolle 'VitalSign ICU Source Minimal' zur Unterstützung des ICU-Normalstation-Workflows implementieren muss.

Die Interaktionen umfassen die Bereitstellung von Vitalparametern, die für die Behandlung von Patienten notwendig sind und sie z.B. typischerweise auf einer Normalstation in einem KIS erfasst werden.
  
**HISTORIE:**    

*Historie*: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle extrahiert (die Funktionalität bleibt dabei unverändert).

*Historie*: mit der Version 4.0.1 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement überarbeitet.

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

    // MII-ICU backport profiles for kis
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Intrakranieller_Druck_Icp, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpergewicht_Percentil_Altersabhaengig, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpergroesse_Percentil_Altersabhaengig, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Ideales_Koerpergewicht, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Sauerstoffsaettigung_Im_Arteriellen_Blut_Durch_Pulsoxymetrie, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Puls, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Kern, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Gelenk, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Stirn, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Nasal, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Leiste, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Achsel, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Oral, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Vaginal, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Harnblase, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Rektal, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Trommelfell, SHALL)
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #read
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * insert CommonObservationSearchParameters