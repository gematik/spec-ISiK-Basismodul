### Interaktionen

Für die Ressource Encounter MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Encounter?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "identifier" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Encounter?identifier=http://test.krankenhaus.de/fhir/sid/fallnr|123456```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.identifier" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Encounter?status=finished```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "class" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Encounter?class=IMP```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.class" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "type" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Encounter?type=http://fhir.de/CodeSystem/kontaktart-de|stationaer```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.type" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "subject" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Encounter?subject=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter "patient" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Encounter?patient=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

    Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend.

1. Der Suchparameter "account" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Encounter?account=Account/123```

    ```GET [base]/Encounter?account:identifier=https://example.org/fhir/sid/abrechnungsfallnr|123456```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.account" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter "date" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Encounter?date=eq2020-26-10```

    Einschränkungen: Dieser Suchparameter darf in einer Suchanfrage nur einmal angegeben sein und darf auch nur einen Wert haben (siehe hierzu auch die entsprechende [Klarstellung in FHIR R5](http://hl7.org/fhir/encounter-search.html#clinical-date)). 

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.period" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Date Search"](http://hl7.org/fhir/R4/search.html#date). Bei der Formulierung der Suche sollten die Vorgaben aus der [Definition der Such-Prefixe](http://hl7.org/fhir/R4/search.html#prefix) - und hier insbesondere die Unterschiede zwischen "lt" und "eb" bzw. "gt" und "sa" - beachtet werden.

    Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend.

1. Der Suchparameter "location" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Encounter?location=Location/test```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.location" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter "service-provider" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Encounter?service-provider=Organization/test```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Encounter.serviceProvider" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter "_profile" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Encounter?_profile=https://gematik.de/fhir/isik/v2/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

---
    
