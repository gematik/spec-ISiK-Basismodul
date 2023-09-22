### Interaktionen

Für die Ressource ValueSet MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ValueSet?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "url" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ValueSet?url=http://example.org/fhir/ValueSet/test```

    Anwendungshinweise: Weitere Informationen zur Suche nach "ValueSet.url" finden sich in der [FHIR-Basisspezifikation - Abschnitt "uri"](https://www.hl7.org/fhir/R4/search.html#uri).

1. Der Suchparameter "name" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ValueSet?name=TestValueSet```

    Anwendungshinweise: Weitere Informationen zur Suche nach "ValueSet.name" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ValueSet?status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach "ValueSet.status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search""](https://hl7.org/fhir/R4/search.html#token).


1. Der Suchparameter "version" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ValueSet?version=1.0.0```

    Anwendungshinweise: Weitere Informationen zur Suche nach "ValueSet.version" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "context-type-value" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ValueSet?context-type-value=http://terminology.hl7.org/CodeSystem/usage-context-type|focus$http://hl7.org/fhir/resource-types|Encounter```

    Anwendungshinweise: Weitere Informationen zur Suche nach "CodeSystem.useContext" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Composite Search Parameters"](https://www.hl7.org/fhir/R4/search.html#composite).

---