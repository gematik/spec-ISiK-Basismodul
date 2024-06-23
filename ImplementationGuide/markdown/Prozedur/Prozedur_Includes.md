### Verkettete Suchparameter (Chaining und Reverse Chaining)

Für Suchparameter vom Typ 'Reference' MÜSSEN die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) verpflichtend implementiert werden.

Alle zu unterstützenden verketteten Suchparameter auf den entsprechenden Referenzen sind im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchInclude``` bzw. ```CapabilityStatement.rest.resource.searchRevInclude``` angegeben. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}

Weitere Informationen und Beispiele zur Suche nach verketteten Parametern finden sich in {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/UebergreifendeFestlegungen_Suchparameter.md, text:diesem IG unter Suchparameter}} und in der FHIR-Basisspezifikation im [Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining) und im [Abschnitt "Reverse Chaining"](https://hl7.org/fhir/R4/search.html#has).

Die verketteten Suchparameter des Profils ```Procedure``` hängen wie folgt mit den festgelegten {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Anwendungsfällen (Use Cases)}}  zusammen:

1. Der verkette Suchparameter ```Procedure:patient``` unterstüzt den Anwendungsfall:

    Um für einen Patienten {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:eindeutig}} die aktuell anstehende {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Behandlungsprozedur}} identifizieren zu können und eine {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Fehlbehandlung}} auszuschließen.

1. Der verkette Suchparameter ```Procedure:subject``` unterstüzt den Anwendungsfall:

    Um für eine Person {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:eindeutig}} die aktuell anstehende {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Untersuchungsprozedur}} identifizieren zu können und eine {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Fehldiagnose}} auszuschließen.

1. Der verkette Suchparameter ```Procedure:encounter``` unterstüzt den Anwendungsfall:

    Um einem Kontakt eindeutig zu einer {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Behandlung}} zuordnen zu können.

1. Der verkette Suchparameter ```Encounter:diagnosis``` unterstüzt den Anwendungsfall:

    Um bei einer vorliegenden {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Untersuchung}} im Rahmen einer Diagnose eines Patienten alle zugehörigen {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Kontakte}} zuordnen zu können.

---
