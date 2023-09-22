### Interaktionen

Für die Ressource RelatedPerson MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/RelatedPerson?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Die Suche nach einem beliebigen Bestandteil des Namens KANN unterstützt werden:

    Beispiele:

    ```GET [base]/RelatedPerson?name=Heidi```

    ```GET [base]/RelatedPerson?name=Alpenzauber```

    Anwendungshinweise: Weitere Informationen zur Suche nach "RelatedPerson.name" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

2. Der Suchparameter "patient" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/RelatedPerson?patient=Patient/123```  

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.beneficiary" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).
