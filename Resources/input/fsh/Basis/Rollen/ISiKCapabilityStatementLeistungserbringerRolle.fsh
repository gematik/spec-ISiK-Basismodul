Instance: ISiKCapabilityStatementLeistungserbringerRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementLeistungserbringerRolle"
* name = "ISiKCapabilityStatementLeistungserbringerRolle"
* title = "CapabilityStatement für Rolle LeistungserbringerRolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = "
CapabilityStatement für die Rolle ISiKCapabilityStatementLeistungserbringerRolle.
Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKPersonen im Gesundheitsberuf.
"

* rest
  * mode = #server
  * resource[+]
    * type = #Practitioner
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKPersonImGesundheitsberuf"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/Practitioner-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?identifier=42`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "family"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?family=Alpenzauber`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "given"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?given=Heidi`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/Practitioner-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?name=Heidi`
        `GET [base]/Practitioner?name=Alpenzauber`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "        
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?address=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "gender"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?gender=female`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
  * resource[+]  
    * type = #Encounter
    * insert Expectation (#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
    * interaction[+]
      * code = #search-type
      * insert Expectation (#SHALL)
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "location"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-location"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?location=Location/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "service-provider"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-service-provider"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?service-provider=Organization/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

    * searchInclude[+] = "Encounter:subject"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Encounter:part-of"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Encounter:diagnosis"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Encounter:account"
      * insert Expectation(#SHALL)
    * searchRevInclude = "Encounter:part-of"
      * insert Expectation(#SHALL)
  * resource[+]
    * type = #PractitionerRole
    * insert Expectation(#MAY)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKLeistungserbringerrolle"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "active"
      * definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-active"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/PractitionerRole?active=true`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/PractitionerRole?identifier=42`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "organization"
      * definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-organization"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/PractitionerRole?organization=Organization/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "practitioner"
      * definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-practitioner"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/PractitionerRole?practitioner=Practitioner/test`        
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "        
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "role"
      * definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-role"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/PractitionerRole?role=doctor`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "specialty"
      * definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-specialty"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/PractitionerRole?specialty=cardiology`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
  
  