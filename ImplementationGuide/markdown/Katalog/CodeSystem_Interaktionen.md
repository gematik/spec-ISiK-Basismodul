### Interaktionen

Für die Ressource CodeSystem MUSS die REST-Interaktion "READ" implementiert werden, falls die Resource CodeSystem umgesetzt wird.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden, falls die Resource CodeSystem umgesetzt wird:

    Beispiele:

    ```GET [base]/CodeSystem?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "url" MUSS unterstützt werden, falls die Resource CodeSystem umgesetzt wird:

    Beispiele:

    ```GET [base]/CodeSystem?url=http://example.org/fhir/CodeSystem/test```

    Anwendungshinweise: Weitere Informationen zur Suche nach "CodeSystem.url" finden sich in der [FHIR-Basisspezifikation - Abschnitt "uri"](https://www.hl7.org/fhir/R4/search.html#uri).

---