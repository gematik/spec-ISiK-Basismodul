Instance: ISiKCapabilityStatementVitalSignICUSourceExtendedRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementVitalSignICUSourceExtendedRolle"
* title = "ISiK CapabilityStatement VitalSign ICU Source Extended"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt verpflichtende Interaktionen, die ein ISiK-konformes System oder eine Systemkomponente in der Rolle 'VitalSign ICU Source Extended' zur Unterstützung des ICU-Normalstation-Workflows implementieren muss.

Die Interaktionen umfassen die Bereitstellung von Vitalparametern, die für die Behandlung von Intensivpatienten notwendig sind und sie z.B. typischerweise auf einer Intensivstation in einem PDMS erfasst werden.

**HISTORIE:**   

*Historie*: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle extrahiert (die Funktionalität bleibt dabei unverändert).

*Historie*: mit der Version 4.0.1 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement überarbeitet.

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

    // MII-ICU backport profiles extended (e.g for PDMS)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Pulmonalarterieller_Wedge_Druck, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Sauerstoffsaettigung_Im_Blut_Preduktal_Durch_Pulsoxymetrie, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Sauerstoffsaettigung_Im_Blut_Postduktal_Durch_Pulsoxymetrie, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Linksventrikulaeres_Schlagvolumenindex, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Linksventrikulaerer_Schlagvolumenindex_Durch_Indikatorverduennung, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Linksventrikulaeres_Schlagvolumen, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Linksventrikulaeres_Schlagvolumen_Durch_Indikatorverduennung, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Pulmonalvaskulaerer_Widerstandsindex, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Systemischer_Vaskulaerer_Widerstandsindex, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Linksventrikulaerer_Herzindex, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Herzzeitvolumen, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Linksventrikulaerer_Herzindex_Durch_Indikatorverduennung, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Linksventrikulaeres_Herzzeitvolumen_Durch_Indikatorverduennung, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Zentralvenoeser_Blutdruck, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Linksatrialer_Druck, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Rechtsatrialer_Druck, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Rechtsventrikulaerer_Druck, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Linksventrikulaerer_Druck, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Pulmonalarterieller_Blutdruck, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Brustwirbelsaeule, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Lendenwirbelsaeule, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Halswirbelsaeule, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Brust, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Myokard, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Atemwege, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Blut, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Nasen_Rachen_Raum, SHALL)
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Koerpertemperatur_Speiseroehre, SHALL)

    // Paraemter aus dem Use Case Organspendeerkennung, die auch für den ICU-Normalstation-Workflow relevant sind
    // MII
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Intrakranieller_Druck_Icp, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_MUV_zerebraler_Perfusionsdruck, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Indirekt, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillenform, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillensymmetrie, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillenbefund, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillengroesse, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Score_RASS, SHALL)

    // MII Beatmung
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Unterstuezungsdruck_Beatmung, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Spontane_Atemfrequenz_Beatmet, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Spontanes_Atemzugvolumen, SHALL)

    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #read
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * insert CommonObservationSearchParameters


  // Procedure-Profile aus dem Use Case Organspendeerkennung, die auch für den ICU-Normalstation-Workflow relevant sind
  * resource[+]
    * type = #Procedure
    * insert CapabilityStatementExpectationExt(SHALL)
    * insert Expectation(#SHALL)
    * insert SupportedProfileCapExpectationExt(ISiKProzedurReanimation, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Beatmung, SHALL)
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #search-type
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "code"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?code=http://fhir.de/CodeSystem/bfarm/ops|5-470`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
