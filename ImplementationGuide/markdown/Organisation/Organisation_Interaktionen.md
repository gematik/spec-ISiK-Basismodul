### Interaktionen

Sofern die Ressourcen zur Organisation unterstützt werden, SOLL die REST-Interaktion "READ" implementiert werden.

Interaktionen zur Organisation werden derzeit für das Bestätigungsverfahren nicht festgelegt.

Auf folgende Suchparameter sei aufgrund der Relevanz hingewiesen - diese SOLLEN (in Einzelfällen KÖNNEN) implementiert werden, falls die oben genannten Ressourcen unterstützt werden:

1. Der Suchparameter "identifier" SOLL unterstützt werden:

    Beispiele:

    ```GET [base]/Organization?identifier=http://fhir.de/sid/arge-ik/iknr|260120196```

    ```GET [base]/Organization?identifier=http://fhir.de/StructureDefinition/identifier-bsnr|345678975```

    ```GET [base]/Organization?identifier=345678975```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Organization.identifier" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "active" SOLL unterstützt werden:

    Beispiele:

    ```GET [base]/Organization?active=true```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Oganization.active" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "type" SOLL unterstützt werden:

    Beispiele:

    ```GET [base]/Organization?type=dept```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Oganization.type" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "name" SOLL unterstützt werden (dies gilt auch für das Element .alias):

    Beispiele:

    ```GET [base]/Organization?name=FA-Gynäkologie```

    ```GET [base]/Organization?name=GYN```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Oganization.name" und "Oganization.alias" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "address" SOLL unterstützt werden:

    Beispiele

    ```GET [base]/Organization?address=Berlin```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Organization.address" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).


1. Der Suchparameter "address-city" SOLL unterstützt werden:

    Beispiele:

    ```GET [base]/Organization?address-city=Berlin```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Organization.address.city" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "address-country" SOLL unterstützt werden:

    Beispiele:

    ```GET [base]/Organization?address-country=DE```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Organization.address.country" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).


1. Der Suchparameter "address-postalcode" SOLL unterstützt werden:

    Beispiele:

    ```GET [base]/Organization?address-postalcode=10117```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Organization.address.postalCode" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).


1. Der Suchparameter "partof" in Kombination mit einem identifier-Modifier SOLL unterstützt werden :

    Beispiele:

    ```GET [base]/Organization?partof:identifier=260120196```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Oganization.name" und "Oganization.alias" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "endpoint" in Kombination mit einem identifier-Modifier KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Organization?endpoint:identifier=123456```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Organization.endpoint" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

