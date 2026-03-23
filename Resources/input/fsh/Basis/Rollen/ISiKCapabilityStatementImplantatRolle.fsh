Instance: ISiKCapabilityStatementImplantatRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementImplantatRolle"
* name = "ISiKCapabilityStatementImplantatRolle"
* title = "CapabilityStatement für Rolle ImplantatRolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = "
CapabilityStatement für die Rolle ISiKCapabilityStatementImplantatRolle.
Diese Rolle stellt Interaktionen zur Abfrage von Informationen zu Implantaten bereit.
"
* rest
  * mode = #server
  * resource[+]
    * type = #Device
    * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKImplantat)
       * insert Expectation(#MAY)
   
    * interaction[+]
      * insert Expectation(#MAY)
      * code = #read
      * documentation = "Sofern die Ressource `Device` unterstützt wird, KANN die REST-Interaktion `read` implementiert werden."
    * interaction[+]
      * insert Expectation(#MAY)
      * code = #search-type   
      * documentation = "Sofern die Ressource `Device` unterstützt wird, KANN die REST-Interaktion `search` implementiert werden."
    

    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Device-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Device?status=active` 
        `GET [base]/Device?status=inactive` 
        `GET [base]/Device?status=entered-in-error`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/Device-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Device?type=http://snomed.info/sct|14106009`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "

    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/Device-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Device?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "    