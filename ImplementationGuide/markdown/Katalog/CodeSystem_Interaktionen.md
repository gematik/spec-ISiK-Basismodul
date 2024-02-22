### Interaktionen

Für die Ressource CodeSystem MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/CodeSystem?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "url" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/CodeSystem?url=http://example.org/fhir/CodeSystem/test```

    Anwendungshinweise: Weitere Informationen zur Suche nach "CodeSystem.url" finden sich in der [FHIR-Basisspezifikation - Abschnitt "uri"](https://www.hl7.org/fhir/R4/search.html#uri).

1. Der Suchparameter "name" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/CodeSystem?name=TestCodeSystem```

    Anwendungshinweise: Weitere Informationen zur Suche nach "CodeSystem.name" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/CodeSystem?status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach "CodeSystem.status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search""](https://hl7.org/fhir/R4/search.html#token).


1. Der Suchparameter "version" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/CodeSystem?version=1.0.0```

    Anwendungshinweise: Weitere Informationen zur Suche nach "CodeSystem.version" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "content-mode" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/CodeSystem?content-mode=complete```

    Anwendungshinweise: Weitere Informationen zur Suche nach "CodeSystem.content" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

---