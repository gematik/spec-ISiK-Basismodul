Instance: ISiKCapabilityStatementAmbulanteStammdatenRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementAmbulanteStammdatenRolle"
* name = "ISiKCapabilityStatementAmbulanteStammdatenRolle"
* title = "CapabilityStatement für Rolle ISiKCapabilityStatementAmbulanteStammdatenRolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = "CapabilityStatement für die Rolle ISiKCapabilityStatementAmbulanteStammdatenRolle.
Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf von ISiKAmbulanteStammdaten-Ressourcen."
* rest
  * mode = #server
  * resource[+]
    * type = #Account
    * insert Expectation(#SHALL)
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfallAmbulant"        
    * interaction[+]
      * code = #read
      * insert Expectation(#SHALL)
    * interaction[+]
      * code = #search-type
      * insert Expectation(#SHALL)

    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Account?identifier=http://test.krankenhaus.de/fhir/sid/fallnr|123456`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Account-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Account?status=active`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Account?type=http://terminology.hl7.org/CodeSystem/v3-ActCode|AMB`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Account?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "