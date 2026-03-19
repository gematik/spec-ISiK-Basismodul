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
      * type = #Organization
      * insert Expectation(#SHALL)
      * supportedProfile[+] = Canonical(ISiKOrganisation)
        * insert Expectation(#SHALL)
      * supportedProfile[+] = Canonical(ISiKOrganisationFachabteilung)
        * insert Expectation(#SHALL)

      * interaction[+]
        * insert Expectation(#SHALL)
        * code = #read
        * documentation = "Die Ressource `Organization` MUSS unterstützt werden, da sie notwendig ist zur Abbildung der Aufbaustruktur und insbesondere zur Ausgabe von Angaben zu Fachbereichen und Stationen."
      * interaction[+]
        * insert Expectation(#SHALL)
        * code = #search-type   
        * documentation = "Die REST-Interaktion `search` MUSS implementiert werden, um die Suche nach Organisationseinheiten, Fachbereichen und Stationen zu ermöglichen."
      * insert CommonSearchParameters 
      * insert OptionalTagSearchParameter
      * searchParam[+]
        * insert Expectation(#SHALL)
        * name = "identifier"
        * definition = "http://hl7.org/fhir/SearchParameter/Organization-identifier"
        * type = #token
        * documentation = 
          "**Beispiel:**    
          `GET [base]/Organization?identifier=http://fhir.de/sid/arge-ik/iknr|260120196` 
          `GET [base]/Organization?identifier=http://fhir.de/StructureDefinition/identifier-bsnr|345678975` 
          `GET [base]/Organization?identifier=345678975`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
      * searchParam[+]
        * insert Expectation(#MAY)
        * name = "active"
        * definition = "http://hl7.org/fhir/SearchParameter/Organization-active"
        * type = #token
        * documentation = 
          "**Beispiel:**    
          `GET [base]/Organization?active=true` 
          `GET [base]/Organization?active=false`    
          **Anwendungshinweis:**   
          Insbesondere für die Suche nach Daten historischer Organisationsstrukturen - z.B. nach Schließung, Zusammenlegung von Fachabteilungen etc. - 
          erscheint es erforderlich nach Ressourcen nicht aktiver Organisationseinheiten suchen zu können.
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
      * searchParam[+]
        * insert Expectation(#SHALL)
        * name = "type"
        * definition = "http://hl7.org/fhir/SearchParameter/Organization-type"
        * type = #token
        * documentation = 
          "**Beispiel:**    
          `GET [base]/Organization?type=dept`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
      * searchParam[+]
        * insert Expectation(#SHALL)
        * name = "name"
        * definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
        * type = #string
        * documentation = 
          "**Beispiel:**    
          `GET [base]/Organization?name=FA-Gynäkologie`  
          `GET [base]/Organization?name=GYN`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
          
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

    * searchParam[+]
      * insert Expectation(#MAY) // ggf. SHALL ?
      * name = "code:in"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
      * type = #token
      * documentation =
        "**Hintergrund:**  
        Der Modifier ermöglicht die Suche nach `Observation.code`-Codes, die in einem angegebenen ValueSet enthalten sind. Insbesondere bei der Suche nach dem Vorhandensein von bestimmten Prozeduren (Beatmung, Reanimation) im Kontext der IHA-Diagnostik ist dies von Bedeutung.

        **Beispiel:**    
        `GET [base]/Observation?code:in=https://example.org/fhir/ValueSet/observation-codes`    
        **Anwendungshinweis:**   
        Der Modifier `:in` filtert nach `Observation.code`-Codes, die in dem angegebenen ValueSet enthalten sind (kanonische ValueSet-URL).  
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#in)."

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