Instance: ISiKCapabilityStatementVersicherungsverhaeltnisRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVersicherungsverhaeltnisRolle"
* name = "ISiKCapabilityStatementVersicherungsverhaeltnisRolle"
* title = "CapabilityStatement für Rolle ISiKCapabilityStatementVersicherungsverhaeltnisRolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = "CapabilityStatement für die Rolle ISiKCapabilityStatementVersicherungsverhaeltnisRolle.
Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf von ISiKVersicherungsverhaeltnis-Ressourcen."
* rest
  * mode = #server
  * resource[+]
    * type = #Coverage
    * insert Expectation(#SHALL)
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich"
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler"
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSonstige"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?status=active`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?type=http://fhir.de/CodeSystem/versicherungsart-de-basis|GKV`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "beneficiary"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-beneficiary"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?beneficiary=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "payor"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-payor"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?payor:identifier=0123456789`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "subscriber"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-subscriber"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?subscriber=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

    * searchInclude[+] = "Coverage:subscriber"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Coverage:patient"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Coverage:payor"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Coverage:beneficiary"
      * insert Expectation(#MAY)

  * resource[+]
    * type = #RelatedPerson
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
    * interaction[+]
      * code = #read
      * insert Expectation(#SHALL)
    * interaction[+]
      * code = #search-type
      * insert Expectation(#SHALL)
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/RelatedPerson-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/RelatedPerson-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?name=Heidi`  
        `GET [base]/RelatedPerson?name=Alpenzauber`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?address=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address-city"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-city"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?address-city=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address-country"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-country"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?address-country=DE`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address-postalcode"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-postalcode"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?address-postalcode=10117`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchInclude[+] = "RelatedPerson:patient"
      * insert Expectation(#SHALL)
    * searchRevInclude = "Coverage:subscriber"
      * insert Expectation(#MAY)
    * searchRevInclude[+] = "Coverage:payor"
      * insert Expectation(#MAY)

  * resource[+]
    * type = #Account
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"    
    * interaction[+]
      * code = #read
      * insert Expectation(#SHALL)
    * interaction[+]
      * code = #search-type
      * insert Expectation(#SHALL)

    * insert CommonSearchParameters
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
  