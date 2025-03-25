Instance: ISiKCapabilityStatementVersicherungsverhältnisRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVersicherungsverhältnisRolle"
* name = "ISiKCapabilityStatementVersicherungsverhältnisRolle"
* title = "CapabilityStatement für Rolle &quot;ISiKCapabilityStatementVersicherungsverhältnisRolle&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"


* description = 
  "Dieses CapabilityStatement beschreibt alle *zusätzlichen* Interaktionen, 
  die ein System unterstützen MUSS, das die Rolle &quot;VersicherungsverhältnisRolle&quot; implementiert.   

  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.
Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. 
Der `MODE`-Parameter kann ignoriert werden.  
Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). 
Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, 
wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.  

Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen 
und die Versionsnummer angeben. 
Darüber hinaus MUSS in `CapabilityStatement.instantiates` die Canonical URL des nachfolgenden CapabilityStatements angegeben werden.  

Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement mit `SHALL` gekennzeichnet sind. 
Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, 
sofern diese in der Instanz implementiert wurden.  

Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich."



* rest
  * mode = #server
  * resource[+]
    * type = #Coverage
    * insert Expectation(#SHALL)
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich"
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler"
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
  