# Suchparameter - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Suchparameter**

## Suchparameter

## Allgemeine Hinweise zu Suchparametern

Originäre ISiK Use Cases sind versorgungsorientiert und patientenorientiert. Dies resultiert darin, dass in der Profilierung der ISiK-Datenobjekte das Vorhandensein einer Referenz auf ISiKPatient (Patient) und ISiKKontaktGesundheitseinrichtung (Encounter) wo möglich gefordert wird. Entsprechend sind Abfragen durch Clients auf Basis von bekannten Informationen aus dem Kontext **einer einzelnen** Patient- und/oder Encounter-Ressource zu begrenzen (Abfragen auf Patientenkohorten oder sonstige Forschungsabfragen sind nicht im Fokus von ISiK). Auf Basis dieser grundsätzlichen Design-Entscheidung können Clients davon ausgehen, dass alle vorliegenden referenzierten bzw. referenzierenden Ressourcen aus dem Kontext der genannten Ressourcen-Typen abrufbar sind. Durch das Vorliegen der Referenzen erfolgt die Dokumentation aller Datenobjekte stets im korrekten Patientenkontext. Zudem liegen für den jeweiligen Kontext relevante Informationen zur Interpretation der Dokumentation und Sicherstellung der Datenintegrität vor.

Innerhalb der jeweiligen Abschnitte ‘Interaktionen’ (Siehe ) werden für alle innerhalb dieses Implementierungsleitfadens spezifizierten FHIR-Ressourcen Suchparameter bestimmt, welche im Rahmen des Bestätigungsverfahrens von ISiK unterstützt werden MÜSSEN.

Ein Server MUSS sicherstellen, dass nicht unterstützte oder leere Suchparameter ignoriert werden und **nicht** zu einem Fehler führen. Siehe [FHIR RESTful Search - Handling Errors](https://www.hl7.org/fhir/R4/search.html#errors). Alle vom Server für eine konkrete Suche verwendeten Parameter MÜSSEN im Self-Link des Searchset-Bundles angegeben sein, siehe [Self-Link](https://hl7.org/fhir/R4/search.html#selflink).

Alle Suchparameter in FHIR entsprechen einem von neun definierten [Such-Parameter-Typen](https://hl7.org/fhir/R4/search.html):

* Number
* Date/DateTime
* String
* Token
* Reference
* Composite
* Quantity
* URI
* Special

Des Weiteren werden zusätzlich sogenannte ‘Modifier’ pro Suchparameter-Typ definiert. Eine Übersicht findet sich unter [“Search Modifiers”](https://hl7.org/fhir/R4/search.html#modifiers).

Für die im Rahmen dieses Leitfadens relevanten Typen gelten folgende allgemeinen Festlegungen:

### Date/DateTime

Die Präfixe `lt`,`le`,`gt`,`ge`,`eq` MÜSSEN für jeden Suchparameter vom Typ ‘date/dateTime’ unterstützt werden.

Begründung: Die Abfragemöglichkeit mittels Präfix arbeitet ungewollten Massendatenabfragen entgegen, da sich sonst Suchen zwangsläufig über den gesamten Zeitraum erstrecken würden.

**Beispiele**:

`[base]/Encounter?date=eq2024-01-01&patient=Patient/Test` 
 Suche nach allen Kontakten mit einem Datum am 2024-01-01 für den Patienten “Test”.

`[base]/Condition?recorded-date=ge2024-01-01&recorded-date=lt2024-02-01&patient=Patient/Test` 
 Suche nach allen Diagnosen mit einem Dokumentationsdatum im Zeitraum Januar 2024 (von 2024-01-01 bis - aber nicht einschließlich - 2024-02-01) im Patientenkontext “Test”.

Es ist zu beachten, dass jedes Datum einen impliziten Werte-Bereich besitzt. Siehe https://hl7.org/fhir/R4/search.html#date.

### String

Der Modifier `:contains` MUSS für alle spezifizierten Suchparameter vom Typ ‘String’ unterstützt werden.

**Beispiele**:

`[base]/Patient?address:contains=Berlin` 
 Diese Suchanfrage gibt alle Patienten zurück zum Client, welche in einem Adress-Bestandteil den String ‘Berlin’ enthält (z.B. alle Berliner Adressen unabhängig von konkreten Bezirken).

### Token

Der Modifier `:not` MUSS für alle spezifizierten Suchparameter vom Typ ‘Token’ unterstützt werden, sofern diese auf die Datentypen “code”, “Coding” oder “CodeableConcept” verwendet werden. Bei einer Suche mit dem “:not”-Modifier MÜSSEN Ressourcen, die keinen Wert für das Element des Suchparameters enthalten, im Suchergebnis enthalten sein.

Der Modifier `:text` MUSS für alle spezifizierten Suchparameter vom Typ ‘Token’ unterstützt werden, sofern diese auf die Datentypen “Coding” oder “CodeableConcept” verwendet werden.

**Beispiele**:

`[base]/Condition?code:text=Freitext` 
 Diese Suche gibt alle Condition-Ressourcen zurück zum Client, welche innerhalb `Condition.code.text` das Wort “Freitext” enthält. Es ist zu beachten, dass hier ein partielles Matching erfolgen MUSS (es ist implizit der Modifier :contains anzunehmen).

`[base]/Condition?code:not=Test` 
 Diese Suche gibt alle Condition-Ressourcen zurück zum Client, welche innerhalb `Condition.code.coding` NICHT den Code ‘Test’ enthält. Es ist zu beachten, dass dies auch alle Ressourcen beinhaltet, die keinen kodierten Wert für `Condition.code` enthalten.

### Reference

Der Modifier `:identifier` KANN für alle spezifizierten Suchparameter vom Typ ‘Reference’ unterstützt werden.

Der Modifier `:identifier` MUSS implementiert werden, wenn die entsprechende Reference eine 1..1-Kardinalität oder ein MS-Flag auf Reference.identifier hat.

Dies gilt beispielsweise für Encounter.account - also die Referenz zwischen ISiKKontaktGesundheitseinrichtung und ISiKAbrechnungsfall. Encounter MÜSSEN anhand der Fallnummer gesucht werden können, ohne dass Clients Zugriffsberechtigungen auf Accounts haben müssen, bzw. ohne dass Account zwingend implementiert/referenziert werden muss. Der Suchabruf erfolgt entsprechend dann nur über die logische Referenz.

**Beispiele**:

`[base]/Coverage?Payor:identifier=http://fhir.de/sid/arge-ik/iknr|123456` 
 Diese Suche gibt alle Coverage-Ressourcen zurück zum Client, welche innerhalb `Coverage.payor` eine logische Referenz auf den Versicherer mit der IK-Nummer “123456” enthält.

Für Suchparameter vom Typ ‘Reference’ sind nur teilweise die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) verpflichtend zu implementieren (siehe “Verkettete Suchparameter”).

**Beispiele**:

`[base]/Procedure?subject.name=Test` Diese Suche gibt alle Prozeduren zurück zum Client, welche innerhalb `Procedure.subject` auf einen Patienten verweist mit dem Namen “Test”.

`[base]/Condition?_has:Encounter:diagnosis:identifier=https://example.org/fhir/sid/aufnahmenummer|1234` Diese Suche gibt alle Diagnosen zurück, die im Kontext des Kontakts mit der Aufnahmenummer ‘1234’ dokumentiert worden sind.

## Verkettete Suchparameter (Fokus auf Patient und Encounter)

Für Suchparameter namens ‘patient’ und ‘encounter’ MÜSSEN die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) verpflichtend implementiert werden. Eine Verkettung über die Chaining-Parameter (Multi-Chaining) KANN implementiert werden.

* `Chaining`

Für Suchparameter KÖNNEN die Festlegungen für [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) implementiert werden.

* `Reverse Chaining`

Der Suchparameter `_include` MUSS verpflichtend für Suchparameter implementiert werden, für die auch Chaining erforderlich ist (‘patient’ und ‘encounter’):

* `_include`

Für Suchparameter KÖNNEN die Festlegungen für `_revinclude` implementiert werden.

* `_revinclude`

Im Kontext dieser Spezifikation (einschließlich weitere ISIK Module) werden - wo notwendig - weitere Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) getroffen.

Mehrfach-Chaining ist generell nicht gefordert, es sei denn es wird in einem Modul für einzelne Parameter explizit verlangt.

## Best-Practice-Empfehlungen für Standard-Suchfilter

Diese grundlegenden Best-Practice-Empfehlungen beziehen sich auf die korrekte Verwaltung des Suchprozesses seitens des Servers, mit Bezug auf Sicherheit im klinischen Umfeld. Unstimmigkeiten in den Erwartungen zwischen Client und Server können dazu führen, dass mehr Ressourcen als erwartet oder angemessen gefunden werden, oder, dass Ressourcen in den Suchergebnissen fehlen, die eigentlich vorhanden sein sollten. Im Folgenden werden daher Empfehlungen für Standard-Suchfilter genannt, die ein Grundmaß an Sicherheit im klinischen Umfeld bereitstellen sollen.

* Der Server SOLLTE dafür sorgen, dass Clients die benötigten Informationen finden können, auch bei Inhalten, die sich über mehrere FHIR-Ressourcen hinweg strecken.
* Wenn der Inhalt eines Suchparameters leer ist, SOLLTE der Server diesen ignorieren.
* Wenn der Inhalt eines Suchparameters syntaktisch falsch ist, SOLLTE der Server einen Fehler zurückgeben. Handelt es sich jedoch um eine logische Bedingung (z.B. einen Code), SOLLTE der Server die Suche verarbeiten, einschließlich des Parameters. Als Ergebnis wird in diesem Fall eine leere Suchmenge zurückgegeben, da der Parameter nicht erfüllt werden kann. In solchen Fällen kann zusätzlich ein OperationOutcome mit Hinweisen und Warnungen über den Suchprozess in das Ergebnis aufgenommen werden. Dieses wird in die Suchergebnisse als Eintrag mit [search mode](https://www.hl7.org/fhir/R4/bundle-definitions.html#Bundle.entry.search.mode) = [`outcome`](https://www.hl7.org/fhir/R4/valueset-search-entry-mode.html) aufgenommen. Clients können diese Informationen nutzen, um zukünftige Suchen zu verbessern.
* Wenn der Server geeignete Standardfilter bei der Suche auf der Grundlage des Patientenkontextes (z.B. das Herausfiltern von fehlerhaften Datensätzen oder inaktiven und verstorbenen Patienten) enthält, SOLLTEN diese angemessen und eindeutig dokumentiert sein (vorzugsweise durch Aufnahme in den ‘self link’ für eine Suche).
* Weitere Hinweise können in der [FHIR Spezifikation im Abschnitt`Search`](https://www.hl7.org/fhir/R4/search.html#errors) eingesehen werden.

