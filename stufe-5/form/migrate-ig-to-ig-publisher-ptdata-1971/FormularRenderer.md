# Formular Renderer - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Formular Renderer**

## Formular Renderer

##

Der Formular-Renderer ist die zentrale Komponente zur Anzeige, Be- und Verarbeitung von Formularen auf Basis von Questionnaires. Er übernimmt sowohl die logische als auch visuelle Umsetzung der FormularDefinition und interagiert mit anderen Akteuren, um eine ISiK-konforme Integration zu ermöglichen.

Unter einem Formular-Renderer ist in diesem Modul eine Software zu verstehen, das folgende Funktionen und Interaktionen implementiert:

* in der Rolle “Client”
* in der Rolle “Client”
* 
* 
* in der Rolle “Datenermittler”
* 
* 
* in der Rolle “Sender”

### Aufgaben des Formular-Renderers

Gemäß diesem Modul übernimmt der FormularRenderer insbesondere folgende Aufgaben:

* Darstellung der FormularDefinition auf Basis der darin enthaltenen Extensions und Strukturangaben
* Ermöglichung des Ausfüllens des Formulars
* Vorbelegung der Formulardaten durch Datenabruf aus der
* Validierung der eingegebenen Daten auf Grundlage der Definition und enthaltener Constraints. Hierbei ist die Interaktion relevant
* Extraktion strukturierter FHIR-Ressourcen aus validierten Eingaben
* Rückübermittlung der ausgefüllten Formulare und extrahierter Daten über die Interaktion

### Zwischenspeicherung nicht abgeschlossener Formulare

Da das Ausfüllen komplexer Formulare in der Praxis nicht immer in einem Schritt erfolgt, SOLL der FormularRenderer in der Lage sein, FormularDaten (QuestionnaireResponses) temporär zwischenzuspeichern – auch wenn diese noch nicht vollständig oder gültig sind.

> **Wichtig:**Diese Zwischenspeicherung erfolgt in der aktuellen Ausbaustufe**lokal im FormularRenderer**selbst und**nicht über die Rückübermittlungs-Interaktion**. Die Rückübermittlung ist ausschließlich für vollständig ausgefüllte und validierte Formulare vorgesehen.

Dies bedeutet:

* Nicht-abgeschlossene oder ungültige Eingaben dürfen NICHT rückübermittelt werden
* Der FormularRenderer SOLL entsprechende Mechanismen zur Speicherung und Wiederaufnahme dieser Eingaben bereitstellen.
* Eine Interaktion mit anderen Akteuren kann ggf. zu einem späteren Zeitpunkt vorgesehen werden, ist aber nicht Teil dieser Stufe.

### Erstellung eines Narrativs für menschenlesbare Darstellung

Im Rahmen der Rückübermittlung SOLL der Formular-Renderer zusätzlich zur strukturierten `QuestionnaireResponse` auch ein menschenlesbares **Narrative** erzeugen, das die Inhalte des ausgefüllten Formulars in übersichtlicher, interpretierbarer Form darstellt.

Dieses Narrative SOLL Bestandteil der Rückübermittlung sein – entweder:

* als Narrative innerhalb der `QuestionnaireResponse.text`, oder
* als Bestandteil des Document-Bundles wie im Modul ISiK-Dokumentenaustausch beschrieben

Das Narrative erfüllt folgende Zwecke:

* **Anzeigefähigkeit in Primärsystemen**, die keine Unterstützung für FHIR-Formulare oder deren Rendering besitzen
* **Vermeidung doppelter Implementierung**, da Systeme das Formular nicht erneut interpretieren müssen
* **Langzeitarchivierung und Nachvollziehbarkeit**, auch außerhalb FHIR-fähiger Umgebungen

> **Hinweis:**Die Erstellung eines Narrativs ist besonders dann wichtig, wenn Formulare komplexe Strukturen oder mehrseitige Inhalte enthalten. Ein gut strukturiertes, menschenlesbares Layout verbessert die Nutzbarkeit erheblich.

### Anforderungen an das Narrative

Ein Narrative SOLL:

* alle beantworteten Fragen samt Antworten gut lesbar darstellen
* relevante, aber unbeantwortete Felder (z. B. “nicht beantwortet”) ggf. mit aufführen
* Gruppen- und Wiederholungsstrukturen (z. B. bei mehreren Einträgen) klar kenntlich machen
* in einem HTML- oder XHTML-kompatiblen Format vorliegen
* sich für die Anzeige innerhalb eines klinischen Informationssystems eignen

