## Allgemeine Hinweise zu Suchparametern

Innerhalb der jeweiligen Abschnitte 'Interaktionen' (Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/Datenobjekte.md}}) werden für alle innerhalb dieses Implementierungsleitfadens spezifizierten FHIR-Ressourcen Suchparameter bestimmt, welche im Rahmen des Bestätigungsverfahrens von ISiK unterstützt werden MÜSSEN.

Es MUSS sichergestellt werden, dass nicht unterstützte oder leere Suchparameter **nicht** zu einem Fehler führen. Siehe [FHIR RESTful Search - Handling Errors](https://www.hl7.org/fhir/search.html#errors). Alle unterstützten und verwendeten Suchparameter sind im Self-Link des Suchbundles korrekt anzugeben.

Alle Suchparameter in FHIR entsprechen einem von neun definierten [Such-Parameter-Typen](http://hl7.org/fhir/search.html):

* Number
* Date/DateTime
* String
* Token
* Reference
* Composite
* Quantity
* URI
* Special

Des Weiteren werden zusätzlich sogenannte 'Modifier' pro Suchparameter-Typ definiert. Eine Übersicht findet sich unter ["Search Modifiers"](http://hl7.org/fhir/search.html#modifiers).

Für die im Rahmen dieses Leitfadens relevanten Typen gelten folgende allgemeinen Festlegungen:

### Date/DateTime

Die Präfixe `lt`,`le`,`gt`,`ge`,`eq` MÜSSEN für jeden Suchparameter vom Typ 'date/dateTime' unterstützt werden.

**Beispiele**:

```[base]/Patient?birthDate=ge2000-01-01``` <br>
Suche nach allen Patienten mit einem Geburtsdatum 2000-01-01T00:00 oder später.

```[base]/Patient?birthDate=eq2000-01-01``` <br>
Suche nach allen Patienten mit einem Geburtsdatum von 2000-01-01T00:00 bis (aber nicht einschließlich) 2000-02-01T00:00

Es ist zu beachten, dass jedes Datum einen impliziten Werte-Bereich besitzt. Siehe http://hl7.org/fhir/search.html#date.

### String

Der Modifier `:contains` MUSS für alle spezifizierten Suchparameter vom Typ 'String' unterstützt werden.

**Beispiele**:

```[base]/Patient?address:contains=Berlin``` <br>
Diese Suchanfrage gibt alle Patienten zurück zum Client, welche in einem Adress-Bestandteil den String 'Berlin' enthält (z.B. alle Berliner Adressen unabhängig von konkreten Bezirken).

### Token

Der Modifier `:not` MUSS für alle spezifizierten Suchparameter vom Typ 'Token' unterstützt werden, sofern diese auf die Datentypen "code", "Coding" oder "CodeableConcept" verwendet werden.

Der Modifier `:text` MUSS für alle spezifizierten Suchparameter vom Typ 'Token' unterstützt werden, sofern diese auf die Datentypen "Coding" oder "CodeableConcept" verwendet werden.

**Beispiele**:

```[base]/Condition?code:text=Freitext``` <br>
Diese Suche gibt alle Condition-Ressourcen zurück zum Client, welche innerhalb `Condition.code.text` das Wort "Freitext" enthält. Es ist zu beachten, dass hier ein partielles Matching erfolgen MUSS (es ist implizit der Modifier :contains anzunehmen).

```[base]/Condition?code:not=Test``` <br>
Diese Suche gibt alle Condition-Ressourcen zurück zum Client, welche innerhalb `Condition.code.coding` NICHT den Code 'Test' enthält. Es ist zu beachten, dass dies auch alle Ressourcen beinhaltet, die keinen kodierten Wert für `Condition.code` enthalten.

### Reference

Der Modifier `:identifier` MUSS für alle spezifizierten Suchparameter vom Typ 'Reference' unterstützt werden.

Der [type] Modifier MUSS für alle spezifizierten Suchparameter vom Typ 'Reference' unterstützt werden.

**Beispiele**:

``[base]/Procedure?subject:Patient=Test``
Diese Suche gibt alle Prozeduren zurück zum Client, welche innerhalb `Procedure.subject` auf einen Patienten verweist mit dem der ID "Test". Hierdurch werden Referenzen auf den Ressourcentyp "Group" in der Suche ausgeschlossen.

**Beispiele**:

```[base]/Coverage?Payor:identifier=http://fhir.de/sid/arge-ik/iknr|123456``` <br>
Diese Suche gibt alle Coverage-Ressourcen zurück zum Client, welche innerhalb `Coverage.payor` eine logische Referenz auf den Versicherer mit der IK-Nummer "123456" enthält.

Für Suchparameter vom Typ 'Reference' MÜSSEN die Festlegungen für [Chaining](http://hl7.org/fhir/search.html#chaining) und [Reverse Chaining](http://hl7.org/fhir/search.html#has) verpflichtend implementiert werden. Chaining und Reverse Chaining MUSS für alle Suchparameter über alle Ebenen und Datenobjekte hinweg (potentiell in Kombination) unterstützt werden.

**Beispiele**:

``[base]/Procedure?subject.name=Test``
Diese Suche gibt alle Prozeduren zurück zum Client, welche innerhalb `Procedure.subject` auf einen Patienten verweist mit dem Namen "Test".

``[base]/Condition?encounter.subject.name=Test``
Diese Suche gibt alle Diagnosen zurück zum Client, welche eine Encounter Reference besitzen und innerhalb `Encounter.subject` auf einen Patienten verweist mit dem Namen "Test".

``[base]/Patient?_has:Procedure:patient:code=1234-5``
Diese Suche gibt alle Patienten zurück zum Client, welche innerhalb `Procedure.subject` auf einen Patienten verweisen und einen Code mit dem Wert '1234-5' in `Procedure.code` enthalten.

``[base]/Patient?_has:Procedure:patient:encounter.identifier=12345``
Diese Suche gibt alle Patienten zurück zum Client, welche innerhalb `Procedure.subject` auf einen Patienten verweisen und einen deren Procedure auf einen Encounter verweist z.B. mit der Aufnahmenummer '1234-5'.

``[base]/Procedure?_has:Encounter:diagnosis:diagnosis:Condition.code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|F16.1``
Diese Suche gibt alle Prozeduren zurück zum Client, welche innerhalb `Encounter.diagnosis.condition` auf einen Encounter verweisen, der wiederrum mit einer Condition verlinkt ist mit dem ICD-10-GM Code 'F16.1'.

## Verpflichtende Suchparameter (Alle Datenobjekte)

Folgende Suchparameter MÜSSEN für alle bestätigungsrelevante Datenojekte implementiert werden:

* ``_id``

    - Beispiele: ``GET [base]/Patient?_id=103270``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
    - Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

* ``_tag``

    - Beispiele: ``GET [base]/Patient?_tag=https://example.org/codes|needs-review``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_tag" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all) und [FHIR-Basisspezifikation - Abschnitt "Tags"](https://www.hl7.org/fhir/resource.html#simple-tags).

* ``_has``

    - Siehe Abschnitt "Allgemeine Hinweise zu Suchparametern".

* ``_count``

    - Beispiele: ``GET [base]/Patient?_count=100``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_count" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Page Count"](https://www.hl7.org/fhir/search.html#count).

    Hierraus ergibt sich, dass durch ein [Paging ensprechende der FHIR-Kernspezifikation](https://www.hl7.org/fhir/http.html#paging) unterstützt werden MUSS.
    Für die URIs in den Link-Relationen "first", "last", "next", sowie "prev" MUSS sichergestellt werden, dass NICHT die ursprünglich verwendeten Suchparameter, sowie anderweitig sensitive Informationen enthalten, welche in der Suchanfrage an das bestätigungsrelevante System versendet wurden.
    Der "self"-Link innerhalb des Such-Bundles MUSS entsprechend der Vorgaben aus [FHIR Kernspezifikation - 3.1.1.6 - Server Conformance](https://www.hl7.org/fhir/search.html#conformance) strukturiert sein.

* ``_include``

    - Beispiele: ``GET [base]/Encounter?_include=Patient:subject``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_tag" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Including other resources in result"](https://www.hl7.org/fhir/search.html#revinclude).
    - Alle Referenzen für die ein Chaining unterstützt wird MUSS auch der _include-Parameter implementiert werden. Alle unterstützten Include-Referenzen MÜSSEN im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchInclude``` angegeben werden. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}.

    Der ```:iterate``` Modifier KANN unterstützt werden.

* ``_revinclude``

    - Beispiele: ``GET [base]/Patient?_revinclude=Encounter:subject``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_tag" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Including other resources in result"](https://www.hl7.org/fhir/search.html#revinclude).
    - Alle Referenzen für die ein Chaining unterstützt wird MUSS auch der _include-Parameter implementiert werden. Alle unterstützten Include-Referenzen MÜSSEN im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchRevInclude``` angegeben werden. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}.

    Der ```:iterate``` Modifier KANN unterstützt werden.


Folgende Suchparameter KÖNNEN für alle bestätigungsrelevante Datenojekte implementiert werden:

* ``_profile``

    - Beispiele: ``GET [base]/Patient?_profile=https://gematik.de/fhir/ISiK/v3/StructureDefinition/ISiKPatient``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

Die aufgelisteten Suchparameter MÜSSEN entsprechend der Vorgaben für das CapabilityStatement pro Ressource aufgelistet werden.

## Best Practice Empfehlungen für Standard-Suchfilter

Diese grundlegenden Best Practice Empfehlungen beziehen sich auf die korrekte Verwaltung des Suchprozesses seitens des Servers, mit Bezug auf Sicherheit im klinischen Umfeld. Unstimmigkeiten in den Erwartungen zwischen Client und Server können dazu führen, dass mehr Ressourcen als erwartet oder angemessen gefunden werden, oder, dass Ressourcen in den Suchergebnissen fehlen, die eigentlich vorhanden sein sollten. Im Folgenden werden daher Empfehlungen für Standard-Suchfilter genannt, die ein Grundmaß an Sicherheit im klinischen Umfeld bereitstellen sollen.

- Der Server SOLLTE dafür sorgen, dass Clients die benötigten Informationen finden können, auch bei Inhalten, die sich über mehrere FHIR-Ressourcen hinweg strecken.

- Wenn der Inhalt eines Suchparameters leer ist, SOLLTE der Server diesen ignorieren.

- Wenn der Inhalt eines Suchparameters syntaktisch falsch ist, SOLLTE der Server einen Fehler zurückgeben. Handelt es sich jedoch um eine logische Bedingung (z. B. einen Code), SOLLTE der Server die Suche verarbeiten, einschließlich des Parameters. Als Ergebnis wird in diesem Fall eine leere Suchmenge zurückgegeben, da der Parameter nicht erfüllt werden kann. In solchen Fällen kann zusätzlich ein OperationOutcome mit Hinweisen und Warnungen über den Suchprozess in das Ergebnis aufgenommen werden. Dieses wird in die Suchergebnisse als Eintrag mit [search mode](https://www.hl7.org/fhir/bundle-definitions.html#Bundle.entry.search.mode) = [`outcome`](https://www.hl7.org/fhir/valueset-search-entry-mode.html) aufgenommen. Clients können diese Informationen nutzen, um zukünftige Suchen zu verbessern.

- Wenn der Server geeignete Standardfilter bei der Suche auf der Grundlage des Patientenkontextes (z. B. das Herausfiltern von fehlerhaften Datensätzen oder inaktiven und verstorbenen Patienten) enthält, SOLLTEN diese angemessen und eindeutig dokumentiert sein (vorzugsweise durch Aufnahme in den 'self link' für eine Suche).

- Weitere Hinweise können in der [FHIR Spezifikation im Abschnitt `Search`](https://www.hl7.org/fhir/search.html#errors) eingesehen werden.
