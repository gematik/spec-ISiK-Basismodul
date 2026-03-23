Instance: ISiKCapabilityStatementOrganspendeerkennungSourceRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementOrganspendeerkennungSourceRolle"
* title = "ISiK CapabilityStatement Organspendeerkennung Source Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt verpflichtende Interaktionen, die ein ISiK-konformes System oder eine Systemkomponenten in der Rolle 'Organspendeerkennung Source Minimal' zur Unterstützung des Organspendeerkennungs-Workflows implementieren muss.

Die Interaktionen umfassen die Bereitstellung von Vitalparametern, die für eine IHA-Diagnostik wesentlich sind.
  
**HISTORIE:**    

*Historie*: mit der Version 6.0.0-rc des IG Organspendeerkennung wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle erstellt.

"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server

  * resource[+]
    * type = #Location
    * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKStandort)
      * insert Expectation(#SHALL)

    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
      * documentation = "Begründung: Die REST-Interaktion `read` muss implementiert werden, um einzelne Ressourcen abzurufen."
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type   
      * documentation = "Begründung: Die REST-Interaktion `search` muss implementiert werden, um Ressourcen nach bestimmten Kriterien zu suchen."

    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Location?identifier=http://fhir.krankenhaus.example|260120196`  
        `GET [base]/Location?identifier=345678975`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "

//Folgender Suchparameter ist in ISiK als Custom-Suchparameter vorgesehen, da er für die Anforderungen der Stationsabfrage relevant ist; zugleich wird er in FHIR R6 als Standard-Parameter für Location eingeführt.
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "characteristic"
      * definition = "https://gematik.de/fhir/isik/SearchParameter/Location-characteristic"
      * type = #token
      * documentation = 
        "Begründung: Die Suche nach Stationen ist notwendig und wird über diesen Suchparameter ermöglicht.    
        
        **Beispiel:**    
        `GET [base]/Location?characteristic=http://terminology.hl7.org/CodeSystem/location-physical-type|wa` 
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
          
  * resource[+]
    * type = #Observation
    * insert CapabilityStatementExpectationExt(SHALL)

    // MII-ICU backport profiles for pdms
    * insert SupportedProfileCapExpectationExt(ISiKGCS, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Score_RASS, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillengroesse, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Indirekt, SHALL)
    // Optionale Parameter
    // MII
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Intrakranieller_Druck_Icp, MAY)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_MUV_zerebraler_Perfusionsdruck, MAY)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillenform, MAY)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillensymmetrie, MAY)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillenbefund, MAY)

    // MII Beatmung
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Unterstuezungsdruck_Beatmung, MAY)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Spontane_Atemfrequenz_Beatmet, MAY)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Spontanes_Atemzugvolumen, MAY)

    
    // ISiK
    * insert SupportedProfileCapExpectationExt(ISiKLaboruntersuchungSerumnatrium, MAY)

    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #read
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * insert CommonObservationSearchParameters

  * resource[+]
    * type = #Procedure
    * insert CapabilityStatementExpectationExt(MAY)
    * insert SupportedProfileCapExpectationExt(ISiKProzedurReanimation, MAY)
    * insert SupportedProfileCapExpectationExt(ISiKProzedurBeatmung, MAY)
    * interaction[+]
      * insert CapabilityStatementExpectationExt(MAY)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * interaction[+]
      * insert Expectation (#MAY)
      * code = #read
    * interaction[+]
      * insert Expectation (#MAY)
      * code = #search-type
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "code"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?code=http://fhir.de/CodeSystem/bfarm/ops|5-470`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "