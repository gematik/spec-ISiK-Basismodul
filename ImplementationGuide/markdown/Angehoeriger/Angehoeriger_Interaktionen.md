### Interaktionen

Für die Ressource RelatedPerson MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/RelatedPerson?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "patient" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/RelatedPerson?patient=Patient/123```  

    Anwendungshinweise: Weitere Informationen zur Suche nach "RelatedPerson.patient" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Die Suche nach einem beliebigen Bestandteil des Namens KANN unterstützt werden:

    Beispiele:

    ```GET [base]/RelatedPerson?name=Heidi```

    ```GET [base]/RelatedPerson?name=Alpenzauber```

    Anwendungshinweise: Weitere Informationen zur Suche nach "RelatedPerson.name" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "address" KANN unterstützt werden:

    Beispiele

    ```GET [base]/RelatedPerson?address=Berlin```

    Anwendungshinweise: Weitere Informationen zur Suche nach "RelatedPerson.address" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

    1. Der Suchparameter "address-city" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/RelatedPerson?address-city=Berlin```

    Anwendungshinweise: Weitere Informationen zur Suche nach "RelatedPerson.address.city" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "address-country" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/RelatedPerson?address-country=DE```

    Anwendungshinweise: Weitere Informationen zur Suche nach "RelatedPerson.address.country" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "address-postalcode" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/RelatedPerson?address-postalcode=10117```

    Anwendungshinweise: Weitere Informationen zur Suche nach "RelatedPerson.address.postalCode" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

    ---