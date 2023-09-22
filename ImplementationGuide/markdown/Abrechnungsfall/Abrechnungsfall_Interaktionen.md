### Interaktionen

Für die Ressource Account MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Account?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "identifier" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Account?identifier=http://test.krankenhaus.de/fhir/sid/fallnr|123456```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Account.identifier" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Account?status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Account.status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "type" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Account?type=http://terminology.hl7.org/CodeSystem/v3-ActCode|AMB```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Account.type" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "patient" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Account?patient=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Account.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter "_profile" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Account?_profile=https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKAbrechnungsfall```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).
    
    ---
