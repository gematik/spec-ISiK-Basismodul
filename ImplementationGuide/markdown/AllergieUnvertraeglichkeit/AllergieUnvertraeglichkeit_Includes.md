### Verkettete Suchparameter (Chaining und Reverse Chaining)

Für Suchparameter vom Typ 'Reference' MÜSSEN die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) verpflichtend implementiert werden. Chaining und Reverse Chaining MUSS für alle Suchparameter über alle Ebenen und Datenobjekte hinweg (potentiell in Kombination) unterstützt werden.

Alle zu unterstützenden verketteten Suchparameter auf den entsprechenden Referenzen sind im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchInclude``` bzw. ```CapabilityStatement.rest.resource.searchRevInclude``` angegeben. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}

Weitere Informationen und Beispiele zur Suche nach verketteten Parametern finden sich in {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/UebergreifendeFestlegungen_Suchparameter.md, text:diesem IG unter Suchparameter}} und in der FHIR-Basisspezifikation im [Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining) und im [Abschnitt "Reverse Chaining"](https://hl7.org/fhir/R4/search.html#has).

Die verketteten Suchparameter des Profils ```AllergyIntolerance``` hängen wie folgt mit den festgelegten {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Anwendungsfällen (Use Cases)}}  zusammen:


1. Der verkette Suchparameter ```AllergyIntolerance:patient``` unterstüzt den Anwendungsfall:

    Um für einen Patienten {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:eindeutig}} die zugehörigen {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Allergien und Intoleranzen}} identifizieren zu können und eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Fehlbehandlung}} auszuschließen.

1. Der verkette Suchparameter ```AllergyIntolerance:encounter``` unterstüzt den Anwendungsfall:

    Um einem Kontakt eindeutig als Ursprung einer {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Allergie-Diagnose}} zuordnen zu können.

---