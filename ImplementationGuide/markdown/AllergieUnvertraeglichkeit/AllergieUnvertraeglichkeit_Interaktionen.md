### Interaktionen

Für die Ressource AllergyIntolerance MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/AllergyIntolerance?_id=test```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "clinical-status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/AllergyIntolerance?clinical-status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach "AllergyIntolerance.clinicalStatus" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

    Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend.

1. Der Suchparameter "patient" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/AllergyIntolerance?patient=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "AllergyIntolerance.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der Suchparameter "onset" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/AllergyIntolerance?onset=2015-01-01T12:00:23Z+02:00```

    Anwendungshinweise: Weitere Informationen zur Suche nach "AllergyIntolerance.onset[x]" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Date Search"](https://hl7.org/fhir/R4/search.html#date).

1. Der Suchparameter "date" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/AllergyIntolerance?date=2015-01-01T12:00:23Z+02:00```

    Anwendungshinweise: Weitere Informationen zur Suche nach "AllergyIntolerance.recordedDate" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Date Search"](https://hl7.org/fhir/R4/search.html#date).

1. Der Suchparameter "category" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/AllergyIntolerance?category=environment```

1. Der Suchparameter "type" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/AllergyIntolerance?type=allergy```


---
