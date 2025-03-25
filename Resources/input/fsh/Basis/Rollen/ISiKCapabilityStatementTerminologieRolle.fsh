Instance: ISiKCapabilityStatementTerminologieRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementTerminologieRolle"
* name = "ISiKCapabilityISiKCapabilityStatementTerminologieRolle"
* title = "CapabilityStatement für Rolle &quot;ISiKCapabilityStatementTerminologieRolle&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"


* description = 
  "Dieses CapabilityStatement beschreibt alle Interaktionen, 
  die ein System unterstützen MUSS, das die Rolle &quot;TerminologieRolle&quot; implementiert.   

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