### Interaktionen

Für die Ressource Patient MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Patient?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "identifier" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Patient?identifier=http://fhir.krankenhaus.example|1032702```

    ```GET [base]/Patient?identifier=1032702```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.identifier" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "given" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Patient?given=Erika```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.name.given" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](http://hl7.org/fhir/R4/search.html#string).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "family" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Patient?family=Musterfrau```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.name.family" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](http://hl7.org/fhir/R4/search.html#string).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "birthdate" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Patient?birthdate=1964-12-08```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.birthDate" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Date Search"](http://hl7.org/fhir/R4/search.html#date).

1. Der Suchparameter "gender" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Patient?gender=female```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.gender" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "name" KANN unterstützt werden:

    Beispiele

    ```GET [base]/Patient?name=Erika```

    ```GET [base]/Patient?name=Musterfrau```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.name" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](http://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "_profile" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Patient?_profile=https://gematik.de/fhir/ISiK/StructureDefinition/ISiKPatient```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "address" KANN unterstützt werden:

    Beispiele

    ```GET [base]/Patient?address=Berlin```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.address" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](http://hl7.org/fhir/R4/search.html#string).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "address-city" KANN unterstützt werden:

    Beispiele

    ```GET [base]/Patient?address-city=Berlin```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.address.city" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](http://hl7.org/fhir/R4/search.html#string).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "address-country" KANN unterstützt werden:

    Beispiele

    ```GET [base]/Patient?address-country=DE```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.address.country" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](http://hl7.org/fhir/R4/search.html#string).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "address-postalcode" KANN unterstützt werden:

    Beispiele

    ```GET [base]/Patient?address-postalcode=10117```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.address.postalCode" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](http://hl7.org/fhir/R4/search.html#string).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "active" KANN unterstützt werden:

    Beispiele

    ```GET [base]/Patient?active=true```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.active" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

1. Der Suchparameter "telecom" KANN unterstützt werden:

    Beispiele

    ```GET [base]/Patient?telecom=phone|+49152236898```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Patient.telecom" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

    Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.
