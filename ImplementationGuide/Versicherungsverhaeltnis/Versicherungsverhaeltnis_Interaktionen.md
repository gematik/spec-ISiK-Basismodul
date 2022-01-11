### Interaktionen

Für die Ressource Coverage MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

#### Profil ISiKVersicherungsverhaeltnisGesetzlich

1. Der Suchparameter "_id" MUSS unterstützt werden:

   Beispiele:

   ```GET [base]/Coverage?_id=103270```

   Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "identifier" zur Suche nach einer Krankenversicherten-ID MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Coverage?identifier=http://fhir.de/CodeSystem/identifier-type-de-basis|0123456789```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.identifier" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

3. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Coverage?status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

4. Der Suchparameter "type" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Coverage?type=http://fhir.de/CodeSystem/versicherungsart-de-basis|GKV```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.type" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

5. Der Suchparameter "beneficiary" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?beneficiary=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.beneficiary" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

6. Der Suchparameter "payor" in Kombination mit einem identifier-Modifier MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?payor:identifier=0123456789```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.payor" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter  "_profile" KANN unterstützt werden:

    Beispiele:

    GET [base]/Coverage?_profile=https://gematik.de/fhir/ISiK/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://www.hl7.org/fhir/search.html#all).

#### Profil ISiKVersicherungsverhaeltnisSelbstzahler

1. Der Suchparameter  "_id" MUSS unterstützt werden:

   Beispiele:

   ```GET [base]/Coverage?_id=103270```

   Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter  "beneficiary" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?beneficiary=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.beneficiary" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter  "payor" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?payor=0123456789```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.payor" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter  "subscriber" KANN unterstützt werden:

   Beispiele:

    ```GET [base]/Coverage?subscriber=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.subscriber" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter  "status" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Coverage?status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter  "type" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Coverage?type=http://fhir.de/CodeSystem/versicherungsart-de-basis|SEL```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Coverage.type" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter  "_profile" KANN unterstützt werden:

    Beispiele:

    GET [base]/Coverage?_profile=https://gematik.de/fhir/ISiK/StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://www.hl7.org/fhir/search.html#all).
