### Verkettete Suchparameter (Chaining und Reverse Chaining)

Für Suchparameter vom Typ 'Reference' MÜSSEN die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) verpflichtend implementiert werden.

Alle zu unterstützenden verketteten Suchparameter auf den entsprechenden Referenzen sind im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchInclude``` bzw. ```CapabilityStatement.rest.resource.searchRevInclude``` angegeben. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}

Weitere Informationen und Beispiele zur Suche nach verketteten Parametern finden sich in {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/UebergreifendeFestlegungen_Suchparameter.md, text:diesem IG unter Suchparameter}} und in der FHIR-Basisspezifikation im [Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining) und im [Abschnitt "Reverse Chaining"](https://hl7.org/fhir/R4/search.html#has).

Die verketteten Suchparameter des Profils ```Coverage``` hängen wie folgt mit den festgelegten {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Anwendungsfällen (Use Cases)}}  zusammen:

1. Der verkette Suchparameter ```Coverage:subscriber``` unterstüzt den Anwendungsfall:

    Um bei einer anwesenden {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Person}} alle zugehörigen {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Versicherungsverhältnisse}} zuordnen zu können, auch für Eltern mit Familienversicherung der Kinder.

1. Der verkette Suchparameter ```Coverage:patient``` unterstüzt den Anwendungsfall:

    Um bei einem {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Patienten}} alle zugehörigen {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Versicherungsverhältnisse}} zuordnen zu können.

1. Der verkette Suchparameter ```Coverage:payor``` unterstüzt den Anwendungsfall:

    Um bei einer existierenden Gesellschaft alle übernommenen {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Versicherungsverhältnisse}} zuordnen zu können, z.B. bei einer betrieblichen Krankenzusatzversicherung durch den Arbeitgeber.

1. Der verkette Suchparameter ```Coverage:beneficiary``` unterstüzt den Anwendungsfall:

    Um für eine versicherte {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Person}} alle zugehörigen {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Versicherungsverhältnisse}} zuordnen zu können, z.B. für die Familienversicherung der GKV für Kinder.
---
