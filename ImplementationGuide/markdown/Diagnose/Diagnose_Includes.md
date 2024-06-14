### Verkettete Suchparameter (Chaining und Reverse Chaining)

Für Suchparameter vom Typ 'Reference' MÜSSEN die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) verpflichtend implementiert werden. 
Für das vorliegende Profil betrifft das die Elemente:
* .subject
* .encounter

Chaining und Reverse Chaining KANN für alle Suchparameter über alle Ebenen und Datenobjekte hinweg (potentiell in Kombination) unterstützt werden.

Alle zu unterstützenden verketteten Suchparameter auf den entsprechenden Referenzen sind im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchInclude``` bzw. ```CapabilityStatement.rest.resource.searchRevInclude``` angegeben. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}

Weitere Informationen und Beispiele zur Suche nach verketteten Parametern finden sich in {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/UebergreifendeFestlegungen_Suchparameter.md, text:diesem IG unter Suchparameter}} und in der FHIR-Basisspezifikation im [Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining) und im [Abschnitt "Reverse Chaining"](https://hl7.org/fhir/R4/search.html#has).

Die verketteten Suchparameter des Profils ```Condition``` hängen wie folgt mit den festgelegten {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Anwendungsfällen (Use Cases)}}  zusammen:

1. Der verkette Suchparameter ```Condition.patient``` unterstüzt den Anwendungsfall:

    Um für einen Patienten {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:eindeutig}} alle zugehörigen {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Diagnosen}} identifizieren zu können und eine {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Fehlbehandlung}} auszuschließen.

1. Der verkette Suchparameter ```Condition.subject``` unterstüzt den Anwendungsfall:

    Um für eine Person {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:eindeutig}} die aktuell zugehörige {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Diagnose}} identifizieren zu können.

1. Der verkette Suchparameter ```Condition.encounter``` unterstüzt den Anwendungsfall:

    Um einem Kontakt eindeutig als Ursprung einer {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Diagnose}} zuordnen zu können.

1. Der verkette Suchparameter ```Encounter.diagnosis``` unterstüzt den Anwendungsfall:

    Um bei einer vorliegenden {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Diagnose}} eines Patienten alle zugehörigen {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Kontakte}} zuordnen zu können.

---
