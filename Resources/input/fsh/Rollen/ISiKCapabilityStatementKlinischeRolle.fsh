Instance: ISiKCapabilityStatementKlinischeRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementKlinischeRolle"
* name = "ISiKCapabilityStatementKlinischeRolle"
* title = "CapabilityStatement für Rolle &quot;ISiKCapabilityStatementKlinischeRolle&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"


* description = 
  "Dieses CapabilityStatement beschreibt alle Interaktionen, 
  die ein System unterstützen MUSS, das die Rolle &quot;Klinische Rolle&quot; implementiert.   

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
    * type = #Procedure
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedur"
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
      * definition = "http://hl7.org/fhir/SearchParameter/Procedure-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?status=http://hl7.org/fhir/event-status|entered-in-error`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/Procedure-category"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?category=http://snomed.info/sct|387713003`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
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
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "subject"
      * definition = "http://hl7.org/fhir/SearchParameter/Procedure-subject"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?subject=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?encounter=Encounter/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?date=lt2020-26-10`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchInclude = "Procedure:patient"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Procedure:subject"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Procedure:encounter"
      * insert Expectation(#SHALL)
    * searchRevInclude = "Encounter:diagnosis"
      * insert Expectation(#MAY)

  * resource[+]
    * type = #Condition
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "clinical-status"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-clinical-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?clincial-status=active`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  
        Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend."
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "subject"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-subject"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?subject=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-encounter"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?encounter=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "recorded-date"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-recorded-date"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?recorded-date=2015-01-01`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "related"
      * definition = "http://fhir.de/SearchParameter/Condition-related"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?related=Condition/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference) 
        und [Deutsche Basisprofile R4 - Doppel-/Mehrfachkodierte ICD-Codes](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-DiagnosenCondition.html)."
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?category=http://hl7.org/fhir/ValueSet/condition-category|problem-list-item`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  
        Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend."

    * searchInclude[+] = "Condition:patient"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Condition:subject"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Condition:encounter"
      * insert Expectation(#SHALL)
    * searchRevInclude[+] = "Encounter:diagnosis"
      * insert Expectation(#MAY)
