Instance: ISiKCapabilityStatementAufbaustrukturRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementAufbaustrukturRolle"
* name = "ISiKCapabilityStatementAufbaustrukturRolle"
* title = "CapabilityStatement für Rolle AufbaustrukturRolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = "
CapabilityStatement für die Rolle ISiKCapabilityStatementAufbaustrukturRolle.
Diese Rolle stellt Interaktionen zur Abfrage von Informationen zur Aufbaustruktur bereit.
Die Aufbaustruktur umfasst die Organisationseinheiten, Standorte und deren Zuordnungen.
"
* rest
  * mode = #server
  * resource[+]
    * type = #Organization
    * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKOrganisation)
      * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKOrganisationFachabteilung)
      * insert Expectation(#MAY)

    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #read
      * documentation = "Sofern die Ressource `Organization` unterstützt wird, SOLL die REST-Interaktion `read` implementiert werden."
    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #search-type   
      * documentation = "Sofern die Ressource `Organization` unterstützt wird, SOLL die REST-Interaktion `search` implementiert werden."
    

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
      * insert Expectation(#SHALL)
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
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?address=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "partof"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-partof"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?partof:identifier=260120196`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "endpoint"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-endpoint"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?endpoint:identifier=123456`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

  * resource[+]
    * type = #Location
    * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKStandort)
      * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKStandortRaum)
      * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKStandortBettenstellplatz)
      * insert Expectation(#MAY)

    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #read
      * documentation = "Sofern die Ressourcen zum Standort unterstützt werden, SOLL die REST-Interaktion `read` implementiert werden."
    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #search-type   
      * documentation = "Sofern die Ressourcen zum Standort unterstützt werden, SOLL die REST-Interaktion `search` implementiert werden."
    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #update
      * documentation = "Sofern die Ressourcen zum Standort unterstützt werden, `update` implementiert werden. 
      Diese dient insbesondere dem Synchronisieren des Status (`Location.operationalStatus`) der abgeleiteten 
      Ressourcen ISiKStandortRaum und ISiKStandortBettenstellplatz - u.a. zur Kennzeichnung als 
      'Frei', 'Besetzt', 'Kontaminiert', 'Isoliert', in 'Reinigung' etc."        

    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Location?identifier=http://fhir.krankenhaus.example|260120196`  
        `GET [base]/Location?identifier=345678975`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Location?address=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "operational-status"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-operational-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Location?operational-status=Unoccupied`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "organization"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-organization"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Location?organization=AbteilungAllgemeinchirurgieOrganisationBeispiel`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

//Warum ist "characteristic" ein Suchparameter!? Das Element gibt es nicht mal in der Ressourcen-Definition!!
/*     * searchParam[+]
      * insert Expectation(#MAY)
      * name = "characteristic"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-characteristic"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?component-code=http://loinc.org|85354-9`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " */

    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-type"
      * type = #token
      * documentation = 
        "**Beispiel zur Suche nach Typ eines Standorts:**    
        `GET [base]/Location?type=bed`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "partof"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-partof"
      * type = #reference
      * documentation = 
        "**Beispiel zur Suche nach Standort-Zugehörigkeit eines Raums (Zu welcher Abteilung gehört dieser Raum?):**    
        `[base]/Location?partof=RaumStandortBeispiel`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "near"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-near"
      * type = #special
      * documentation = 
        "**Beispiel zur Suche nach Standort nahe (100m) Koordinaten:**    
        `GET [base]/Location?near=52.525851|13.37774|100|m`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#special).  "

