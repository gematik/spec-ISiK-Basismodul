### Verkettete Suchparameter (Chaining und Reverse Chaining)

Für Suchparameter vom Typ 'Reference' MÜSSEN die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) verpflichtend implementiert werden. Chaining und Reverse Chaining MUSS für alle Suchparameter über alle Ebenen und Datenobjekte hinweg (potentiell in Kombination) unterstützt werden.

Alle zu unterstützenden verketteten Suchparameter auf den entsprechenden Referenzen sind im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchInclude``` bzw. ```CapabilityStatement.rest.resource.searchRevInclude``` angegeben. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}

Weitere Informationen und Beispiele zur Suche nach verketteten Parametern finden sich in {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/UebergreifendeFestlegungen_Suchparameter.md, text:diesem IG unter Suchparameter}} und in der FHIR-Basisspezifikation im [Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining) und im [Abschnitt "Reverse Chaining"](https://hl7.org/fhir/R4/search.html#has).

Die verketteten Suchparameter des Profils ```Patient``` hängen wie folgt mit den festgelegten {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Anwendungsfällen (Use Cases)}}  zusammen:

1. Der verkette Suchparameter ```Composition:patient``` unterstüzt den Anwendungsfall:

    Um eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Grundlagen-Funktion}} zu ermöglichen, in der für einen Patienten all seine Dokumenten-Kontexte identifizierte werden können.

1. Der verkette Suchparameter ```Composition:subject``` unterstüzt den Anwendungsfall:

    Um eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Grundlagen-Funktion}} zu ermöglichen, in der für eine Person all ihre Dokumenten-Kontexte identifiziert werden können.

1. Der verkette Suchparameter ```Composition:author``` unterstüzt den Anwendungsfall:

    Um eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Grundlagen-Funktion}} zu ermöglichen, in der für einen Urheber all seine Dokumenten-Kontexte identifiziert werden können.

1. Der verkette Suchparameter ```Condition:patient``` unterstüzt den Anwendungsfall:

    Um für einen Patienten {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:eindeutig}} zu all seinen Diagnosen zu finden und eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Verwechslung}} auszuschließen.

1. Der verkette Suchparameter ```Condition:subject``` unterstüzt den Anwendungsfall:

    Um für eine Person {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:eindeutig}} zu all ihren zugehörigen Diagnosen zu finden und eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Verwechslung}} auszuschließen.

1. Der verkette Suchparameter ```Procedure:patient``` unterstüzt den Anwendungsfall:

    Um für einen Patienten {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:eindeutig}} zu all seinen Behandlungsprozeduren zu finden und eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Verwechslung}} auszuschließen.

1. Der verkette Suchparameter ```Procedure:subject``` unterstüzt den Anwendungsfall:

    Um für eine Person {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:eindeutig}} zu all ihre zugehörigen Behandlungsprozeduren zu finden und eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Verwechslung}} auszuschließen.

1. Der verkette Suchparameter ```Encounter:patient``` unterstüzt den Anwendungsfall:

    Um für einen Patienten {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:eindeutig}} die komplette Fallhistorie mit allen Kontakten zu finden und eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Verwechslung}} auszuschließen.

1. Der verkette Suchparameter ```Encounter:subject``` unterstüzt den Anwendungsfall:

    Um für eine Person {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:eindeutig}} die komplette Fallhistorie mit allen Kontakten zu finden und eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Verwechslung}} auszuschließen.

1. Der verkette Suchparameter ```Account:patient``` unterstüzt den Anwendungsfall:

    Um für einen Patienten {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:eindeutig}} die komplette Abrechnungshistorie mit allen Kosten zu finden und eine falsche {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Abrechnung}} auszuschließen.

1. Der verkette Suchparameter ```Account:subject``` unterstüzt den Anwendungsfall:

    Um für eine Person {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:eindeutig}} die komplette Abrechnungshistorie mit allen Kosten zu finden und eine falsche {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Abrechnung}} auszuschließen.

1. Der verkette Suchparameter ```Coverage:patient``` unterstüzt den Anwendungsfall:

    Um für einen Patienten das korrekte {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Versicherungsverhältnis}} zuzuordnen und eine korrekte {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Abrechnung}} zu gewährleisten.

1. Der verkette Suchparameter ```Coverage:subscriber``` unterstüzt den Anwendungsfall:

    Um für einen Versicherungsnehmer das korrekte {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Versicherungsverhältnis}} zuzuordnen und eine korrekte {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Abrechnung}} zu gewährleisten.

1. Der verkette Suchparameter ```Coverage:beneficiary``` unterstüzt den Anwendungsfall:

    Um für eine versicherte Person das korrekte {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Versicherungsverhältnis}} zuzuordnen und eine korrekte {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Abrechnung}} zu gewährleisten.

1. Der verkette Suchparameter ```Coverage:payor``` unterstüzt den Anwendungsfall:

    Um für einen zahlendes Unternehmen alle betreuten {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Versicherungsverhältnisse}} zuzuordnen und eine korrekte {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Abrechnung}} zu gewährleisten.

---