Instance: ISiKCapabilityStatementMedikationVerordnungRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementMedikationVerordnungRolle"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerordnungRolle"
* title = "ISiK CapabilityStatement Medikationsverordnung Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'Medikationsverordnung' zu bestehen.
  
**HISTORIE:**    

* `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.   
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.  
"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * resource[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #MedicationRequest
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerordnung"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #create
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #update
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * searchInclude[0] = "MedicationRequest:medication"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchInclude[+] = "MedicationRequest:patient"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchInclude[+] = "MedicationRequest:encounter"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchInclude[+] = "MedicationRequest:requester"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "_id"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?_id=103270`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach '_id' finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Parameters for all resources'](https://hl7.org/fhir/R4/search.html#all).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "authoredon"
      * definition = "http://hl7.org/fhir/SearchParameter/MedicationRequest-authoredon"
      * type = #date
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?authoredon=2022-03-21`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Date-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Date'](https://hl7.org/fhir/R4/search.html#date).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "code"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/medications-date"
      * type = #date
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?date=2022-03-23`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Date-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Date'](https://hl7.org/fhir/R4/search.html#date).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/medications-encounter"
      * type = #reference
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?encounter=Encounter/123`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "intent"
      * definition = "http://hl7.org/fhir/SearchParameter/MedicationRequest-intent"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?intent=order`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "medication"
      * definition = "http://hl7.org/fhir/SearchParameter/medications-medication"
      * type = #reference
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?medication=Medication/123`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?patient=Patient/123`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "requester"
      * definition = "http://hl7.org/fhir/SearchParameter/MedicationRequest-requester"
      * type = #reference
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?requester=Practitioner/101112`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/medications-status"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?status=active`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "encounter.identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/medications-encounter"
      * type = #token
      * documentation = 
        "**Beispiele:**  
        `GET [base]/MedicationRequest?encounter.identifier=http://mein-krankenhaus.example/fhir/sid/fallnummern|7567867`

        `GET [base]/MedicationRequest?encounter.identifier=7567867`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).

        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "medication.code"
      * definition = "http://hl7.org/fhir/SearchParameter/medications-medication"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/MedicationRequest?medication.code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).

        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient.identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #token
      * documentation = 
        "**Beispiele:**  
        `GET [base]/MedicationRequest?patient.identifier=http://mein-krankenhaus.example/fhir/sid/patienten|1032702`

        `GET [base]/MedicationRequest?patient.identifier=1032702`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).

        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "requester.identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/MedicationRequest-requester"
      * type = #token
      * documentation = 
        "**Beispiele:**  
        `GET [base]/MedicationRequest?requester.identifier=http://fhir.de/sid/bundesaerztekammer/efn|123456789123456`

        `GET [base]/MedicationRequest?requester.identifier=123456789123456`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).

        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).

        "
  * interaction[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #transaction
    * documentation = "Transaktions-Bundle gemäß Profil https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransaction - Transaktions-Antwort-Bundle gemäß Profil https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransactionResponse"

