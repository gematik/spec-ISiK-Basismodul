Instance: ISiKCapabilityStatementTerminologieRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementTerminologieRolle"
* name = "ISiKCapabilityStatementTerminologieRolle"
* title = "CapabilityStatement für Rolle ISiKCapabilityStatementTerminologieRolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = "
CapabilityStatement für die Rolle ISiKCapabilityStatementTerminologieRolle.
Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von Terminologie-Ressourcen.
"
* rest
  * mode = #server
  * resource[+]
    * type = #CodeSystem
    * insert Expectation(#MAY)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKCodeSystem"
    * interaction[+]
      * code = #read
      * insert Expectation(#MAY)
    * interaction[+]
      * code = #search-type
      * insert Expectation(#MAY)
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "url"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-url"
      * type = #uri
      * documentation = 
        "**Beispiel:**    
        `GET [base]/CodeSystem?url=http://example.org/fhir/CodeSystem/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri).  "

  * resource[+]
    * type = #ValueSet
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKValueSet"
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
      * name = "url"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-url"
      * type = #uri
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?url=http://example.org/fhir/ValueSet/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?name=TestValueSet`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?status=active`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "version"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-version"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?version=1.0.0`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "context-type-value"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-context-type-value"
      * type = #composite
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?context-type-value=http://terminology.hl7.org/CodeSystem/usage-context-type|focus$http://hl7.org/fhir/resource-types|Encounter`    
        **Anwendungshinweis:**  
        Mit dieser Abfrage können hausinterne Kataloge anhand des Ressource-Typs ermittelt werden. Diese Informationen sind u.a. relevant im Kontext von:  
        * Hausinternen Prozeduren/Diagnosen-Codes
        * Kodierung von Encounter-Informationen (z.B. Wahlleistungen, Orttypen)  
        Use Cases im Zusammenhang:    
        (A) Zur Konfigurationszeit können passende ValueSets von einem Server spezifisch für einen Ressourcentyp abgerufen und vorbereitend auf eine Systemintegration begutachtet 
        bzw. in Client-Systeme eingebunden werden. In diesem Sinne wird die Abfrage im Kontext der [Terminvereinbarung durch einen Termin-Requestor](https://simplifier.net/guide/isik-terminplanung-v4/ImplementationGuide-markdown-Datenobjekte-Operations?version=current) genutzt.  
        (B) Zur Laufzeit können spezifische ValueSets synchronisiert bzw. direkt in die Eingabemasken von Clients eingebunden werden.  
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#composite).  "