### Interaktionen

Für die Ressource Coverage MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

#### Profil ISiKVersicherungsverhaeltnisGesetzlich

1. Der Suchparameter "_id" MUSS unterstützt werden:

   Beispiele:

   ```GET [base]/Coverage?_id=103270```

   Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).


3. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Coverage?status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

4. Der Suchparameter "type" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Coverage?type=http://fhir.de/CodeSystem/versicherungsart-de-basis|GKV```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.type" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

5. Der Suchparameter "beneficiary" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?beneficiary=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.beneficiary" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

6. Der Suchparameter "patient" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?patient=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.beneficiary" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

7. Der Suchparameter "payor" in Kombination mit einem identifier-Modifier MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?payor:identifier=0123456789```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.payor" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

#### Profil ISiKVersicherungsverhaeltnisSelbstzahler

1. Der Suchparameter  "_id" MUSS unterstützt werden:

   Beispiele:

   ```GET [base]/Coverage?_id=103270```

   Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter  "beneficiary" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?beneficiary=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.beneficiary" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der Suchparameter  "payor" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?payor=0123456789```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.payor" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der Suchparameter  "subscriber" KANN unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?subscriber=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.subscriber" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der Suchparameter  "status" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Coverage?status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter  "type" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Coverage?type=http://fhir.de/CodeSystem/versicherungsart-de-basis|SEL```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.type" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

---