### Verkettete Suchparameter (Chaining und Reverse Chaining)

Für Suchparameter vom Typ 'Reference' MÜSSEN die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) verpflichtend implementiert werden. 
Für das vorliegende Profil betrifft das das Elemente:
* .patient

Chaining und Reverse Chaining KANN für alle Suchparameter über alle Ebenen und Datenobjekte hinweg (potentiell in Kombination) unterstützt werden.



Alle zu unterstützenden verketteten Suchparameter auf den entsprechenden Referenzen sind im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchInclude``` bzw. ```CapabilityStatement.rest.resource.searchRevInclude``` angegeben. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}

Weitere Informationen und Beispiele zur Suche nach verketteten Parametern finden sich in {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/UebergreifendeFestlegungen_Suchparameter.md, text:diesem IG unter Suchparameter}} und in der FHIR-Basisspezifikation im [Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining) und im [Abschnitt "Reverse Chaining"](https://hl7.org/fhir/R4/search.html#has).

Die verketteten Suchparameter des Profils ```RelatedPerson``` hängen wie folgt mit den festgelegten {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Anwendungsfällen (Use Cases)}}  zusammen:

1. Der verkette Suchparameter ```RelatedPerson:patient``` unterstüzt den Anwendungsfall:

    Um für einen Patienten {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:eindeutig}} seinen {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Angehörigen}} identifizieren und einbeziehen zu können.

1. Der verkette Suchparameter ```Coverage:subscriber``` unterstüzt den Anwendungsfall:

    Um für ein bekanntes {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Versicherungsverhältnis}} alle zugehörigen Versicherungsnehmer finden zu können, z.B. die Eltern zur Familienversicherung.

1. Der verkette Suchparameter ```Coverage:payor``` unterstüzt den Anwendungsfall:

    Um für ein bekanntes {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Versicherungsverhältnis}} alle zugehörigen, auch private, Beitragszahler finden zu können, z.B. die Gesellschaft hinter einer betrieblichen Krankenzusatzversicherung.

---