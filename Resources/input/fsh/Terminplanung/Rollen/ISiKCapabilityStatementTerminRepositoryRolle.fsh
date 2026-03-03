Instance: ISiKCapabilityStatementTerminRepositoryRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert MetaInstance
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementTerminRepositoryRolle"
* title = "ISiK CapabilityStatement Termin-Repository Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"

* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* purpose = "Das vorliegende CapabilityStatement beschreibt Interaktionen für ein System, das Termin-Repository-Daten exponiert."
//Das CS instantiiert sich selbst !?!?
//* instantiates = Canonical(ISiKCapabilityStatementTerminRepository)
* rest
  * mode = #server
  * resource[+]
    * type = #Schedule
    * insert Expectation (#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKKalender"
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "active"
      * definition = "http://hl7.org/fhir/SearchParameter/Schedule-active"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Schedule?active=true`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "service-type"
      * definition = "http://hl7.org/fhir/SearchParameter/Schedule-service-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Schedule?service-type=http://example.org/fhir/CodeSystem/ScheduleServiceType|CT`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "specialty"
      * definition = "http://hl7.org/fhir/SearchParameter/Schedule-specialty"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Schedule?specialty=http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen|ALLG`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "actor"
      * definition = "http://hl7.org/fhir/SearchParameter/Schedule-actor"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Schedule?actor=Practitioner/ISiKPractitionerExample`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  " 

    * searchRevInclude[+] = "Slot:schedule"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Schedule:actor"
      * insert Expectation (#MAY)  

  * resource[+]
    * type = #Slot
    * insert Expectation (#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminblock"
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #search-type
    * insert CommonSearchParameters    
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "schedule"
      * definition = "http://hl7.org/fhir/SearchParameter/Slot-schedule"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Slot?schedule=Schedule/ISiKKalenderExample&start=2022-12-10T09:00:00Z`  
        `GET [base]/Slot?schedule=Schedule/ISiKKalenderExample`    
        **Anwendungshinweis:**   
        Der Suchparameter `schedule` MUSS in Kombination mit einem definierten Startzeitpunkt mittels Suchparameter `start` unterstützt werden. 
        Der Suchparameter `schedule` KANN alleinstehend unterstützt werden. Beim Fehlen des `start`-Suchparameters SOLL der aktuelle Zeitpunkt des Servers 
        als Startzeitpunkt per Default verwendet werden.
        In diesem Fall ist auch ein Chaining auf weitere verknüpfte Akteure möglich:  
        `GET https://example.org/fhir/Slot?schedule.actor:HealthcareService.type=https://example.org/fhir/CodeSystem/Behandlungsleistung|CT`  
        Dies kann notwendig sein, falls interdisziplinäre Kalender durch das Termin-Repository gepflegt werden (z.B. ein Kalender pro Station). 
        In solchen Fälle wäre es sinnvoll, wenn das Termin-Repository einem Termin-Requestor eine Verknüpfung zwischen Kalender (Schedule) 
        und Behandlungsleistung (HealthcareService) bereitstellen würde.
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  " 
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Slot-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Slot?status=free&schedule=Schedule/ISiKTerminExample`
        `GET [base]/Slot?status=free&schedule.actor:Practitioner.name=Musterarzt`    
        **Anwendungshinweis:**   
        Der Suchparameter `status` MUSS in Kombination ('&') mit dem Parameter `schedule` unterstützt werden. 
        Diese Abfrage KANN entweder eine direkte Angabe einer Referenz oder eine Angabe von weiteren Chaining-Parametern sein.
        Der Suchparameter MUSS NICHT alleinstehend unterstützt werden. Falls der Parameter nicht alleinstehend unterstützt wird, dann SOLL der Server einen Fehler-Code 422 (Unprocessable Entity) zurückgeben, falls ein Client den Parameter alleinstehend verwendet. Zudem SOLL eine OperationOutcome über die fehlende Kombination bei der Suchanfrage Auskunft geben.
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "start"
      * definition = "http://hl7.org/fhir/SearchParameter/Slot-start"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Slot?start=2022-12-10T09:00:00Z&schedule=Schedule/ISiKTerminExample`  
        `GET [base]/Slot?start=2022-12-10T09:00:00Z&schedule.actor:Practitioner.name=Musterarzt`    
        **Anwendungshinweis:**  
        Der Suchparameter `start` MUSS in Kombination ('&') mit dem Parameter `schedule` unterstützt werden.
        Diese Abfrage KANN entweder eine direkte Angabe einer Referenz oder eine Angabe von weiteren Chaining-Parametern sein.
        Der Suchparameter MUSS NICHT alleinstehend unterstützt werden.
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  " 

    * searchInclude[+] = "Slot:schedule"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Appointment:slot"
      * insert Expectation (#MAY)


  * resource[+]
    * type = #Appointment
    * insert Expectation (#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKTermin"
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #search-type
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #patch
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "_tag"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-tag"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Appointment?_tag=https://example.org/codes|needs-review`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#all) sowie Abschnitt [Tags](https://www.hl7.org/fhir/R4/resource.html#simple-tags)."    
    * searchParam[+]  
      * insert Expectation (#SHALL) 
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Appointment-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Appointment?status=booked`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "service-type"
      * definition = "http://hl7.org/fhir/SearchParameter/Appointment-service-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Appointment?service-type=http://example.org/fhir/CodeSystem/ScheduleServiceType|CT`    
        **Anwendungshinweis:**   
        Anwendungshinweise: Bei einer Suche mit dem `:not`-Modifier MÜSSEN Ressourcen, die keinen Wert für `Appointment.serviceType` enthalten, 
        im Suchergebnis enthalten sein.
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "specialty"
      * definition = "http://hl7.org/fhir/SearchParameter/Appointment-service-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Appointment?specialty=http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen|ALLG`    
        **Anwendungshinweis:** 
        Anwendungshinweise: Bei einer Suche mit dem `:not`-Modifier MÜSSEN Ressourcen, die keinen Wert für `Appointment.specialty` enthalten, 
        im Suchergebnis enthalten sein. 
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/Appointment-date"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Appointment?date=2022-12-10T09:00:00Z`    
        **Anwendungshinweis:** 
        Die Suche wird gegen das Element `Appointment.start` ausgewertet.  
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  " 
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "slot"
      * definition = "http://hl7.org/fhir/SearchParameter/Appointment-slot"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Appointment?slot=Slot/ISiKSlotExample`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  " 
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "actor"
      * definition = "http://hl7.org/fhir/SearchParameter/Appointment-actor"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Appointment?actor=Patient/ISiKPatientExample`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  " 

    * operation[+]
      * insert Expectation (#SHALL)
      * name = "book"
      * definition = Canonical(ISiKAppointmentBookOperation)
      * documentation = "Die $book-Operation ermöglicht einem Termin-Requestor einen Termin in einem Termin-Repository zu buchen bzw. zu verschieben."

    * searchInclude[+] = "Appointment:slot"
      * insert Expectation (#MAY)
    * searchInclude[+] = "Appointment:actor"
      * insert Expectation (#MAY)

  * resource[+]
    * type = #HealthcareService
    * insert Expectation (#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedizinischeBehandlungseinheit"
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #search-type
    * insert CommonSearchParameters  
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "active"
      * definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-active"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/HealthcareService?active=true`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "service-type"
      * definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-service-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/HealthcareService?service-type=http://example.org/fhir/CodeSystem/ScheduleServiceType|CT`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "specialty"
      * definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-specialty"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/HealthcareService?specialty=http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen|ALLG`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " 
    * searchParam[+]
      * insert Expectation (#SHALL) 
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/HealthcareService?name=Medizinische Behandlungseinheit Des Fachbereichs 0100`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  " 
    * searchInclude[+] = "Schedule:actor"
      * insert Expectation (#MAY)  
    * searchInclude[+] = "Appointment:actor"
      * insert Expectation (#MAY)
