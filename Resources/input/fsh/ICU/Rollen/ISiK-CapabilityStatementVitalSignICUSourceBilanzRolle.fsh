Instance: ISiKCapabilityStatementVitalSignICUSourceBilanzRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementVitalSignICUSourceBilanzRolle"
* title = "ISiK CapabilityStatement VitalSign ICU Source Bilanz Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt verpflichtende Interaktionen, die ein ISiK-konformes System oder eine Systemkomponenten in der Rolle 'VitalSign ICU Source Bilanz' zur Unterstützung des ICU-Normalstation-Workflows implementieren muss.

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

    // MII-ICU Bilanz profiles
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Blutverlust, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Drainage_Generisch, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Fluessigkeit_Gesamt, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Gallenfluessigkeit, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Haemofiltration_Einzelmesswerte, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Magensonde, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_OP_Drainage, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Pankreasdrainage, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Stuhlgang, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Urin, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Ausfuhr_Wunddrainage, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Einfuhr_Abgepumpte_Muttermilch, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Einfuhr_Enterale_Fluessigkeit, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Einfuhr_Fluessigkeit_Gesamt, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Einfuhr_Muttermilch, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Einfuhr_Orale_Fluessigkeit, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Einfuhr_Saeuglingsnahrung, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Einfuhr_Spendermilch, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Bilanz_Tagesbilanz_Fluessigkeit, SHALL)
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #read
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * insert CommonObservationSearchParameters