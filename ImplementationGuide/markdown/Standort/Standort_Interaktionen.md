### Interaktionen

Sofern die Ressourcen zum Standort unterstützt werden, SOLL die REST-Interaktion "READ" implementiert werden. Ebenso SOLL die REST-Interaktion "UPDATE" implementiert werden. Letztere dient insbesondere dem Synchronisieren des Status (.operationalStatus) der abgeleiteten Ressourcen ISiKStandortRaum und ISiKStandortBettenstellplatz - u.a. zur Kennzeichnung als "Frei", "Besetzt", "Kontaminiert", "Isoliert", in "Reinigung" etc.


Interaktionen zum Standort werden derzeit für das Bestätigungsverfahren nicht festgelegt.

Auf folgende Suchparameter sei aufgrund der Relevanz hingewiesen - diese SOLLEN implementiert werden, falls die oben genannten Ressourcen unterstützt werden:


1. Der Suchparameter "identifier" SOLL unterstützt werden:

    Beispiele:

    ```GET [base]/Location?identifier=http://fhir.krankenhaus.example|260120196```

    ```GET [base]/Location?identifier=345678975```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Location.identifier" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "operational-status" SOLL unterstützt werden:

    Beispiel zur Suche freier Standorte:

    ```GET [base]/Location?operational-status=Unoccupied```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Location.operational-status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "organization" SOLL unterstützt werden:

    Beispiel zur Suche von Standorten einer Organisation:

    ```GET [base]/Location?organization=AbteilungAllgemeinchirurgieOrganisationBeispiel```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Location.organization" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://hl7.org/fhir/R4/search.html#reference).

1. Der Suchparameter "partof" SOLL unterstützt werden:

    Beispiel zur Suche nach Standort-Zugehörigkeit eines Raums (Zu welcher Abteilung gehört dieser Raum?):
    ```GET [base]/Location?partof=RaumStandortBeispiel```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Location.partof" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://hl7.org/fhir/R4/search.html#reference).

1. Der Suchparameter "address" KANN unterstützt werden:

    Beispiele

    ```GET [base]/Location?address=Berlin```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Location.address" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "type" KANN unterstützt werden:

    Beispiel zur Suche nach Typ eines Standorts:
    ```GET [base]/Location?type=bed```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Location.type" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "contains" KANN unterstützt werden:

    Beispiel zur Suche nach Standort-Zugehörigkeit eines Raums:
    ```GET [base]/Location?contains=KoordinatenBeispielGeoJSON```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Location.contains" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "near" KANN unterstützt werden:

    Beispiel zur Suche nach Standort nahe (100m) Koordinaten:
    ```GET [base]/Location?contains=52.525851|13.37774|100|m```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Location.near" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).


