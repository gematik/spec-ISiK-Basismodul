# Prozesse - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Prozesse**

## Prozesse

#

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Betriebskoordination_Gruen_gematik.svg)

**Diskussion**: Dieser Abschnitt fasst einen Diskussionsstand mit beteiligten Stakeholdern zusammen und enthält keine normativen Festlegungen.

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Betriebskoordination_Gruen_gematik.svg)

Ein Terminbuchungsprozess in einem Krankenhaus kann sowohl automatisierte als auch manuelle Zwischenschritte umfassen, um eine nahtlose Terminbuchung und Terminwahrnehmung für Patienten zu gewährleisten. Hier finden sich Skizzen zu entsprechenden Prozessen.

## Allgemeiner Prozess (Übersicht)

Ein grobes Prozessmodell gewährt eine Übersicht zu drei möglichen Sub-Prozessen der Terminbuchung:

## Registrierung und Terminbuchung (happy path)

Folgendes BPMN-Diagramm gibt eine Übersicht zu einer Terminbuchung durch einen User mittels Patientenportal:

Folgendes Sequenzdiagramm detailliert den Ablauf unter Berücksichtigung der Akteure Termin-Requestor (z.B. Patientenportal) und Termin-Repository (z.B. KIS); offen bleibt hier allerdings noch der Ablauf zum Austausch von Patientendaten zwischen den Systemen:

Einzelne Interaktionen, die in diesem Sequenzdiagramm skizziert werden und für die der vorliegende Implementierungsleitfaden spezifischere Festlegungen trifft, sind unter gelistet.

**Hinweis:** Es sei darauf hingewiesen, dass hier explizit der UML-Akteur **‘Buchender’** genutzt wurde, wobei dies sowohl einen **Patienten** als auch eine **angehörige Person** bedeuten kann, die im Namen des Patienten einen Termin bucht. Der Anteil an Buchungen durch Dritte ist relevant und kann in bestimmten Versorgungs-Settings sogar die Regel darstellen. Entsprechend sollten auch die Registrierungs-, Authentifizierungs und die Patientendatenübermittlung gestaltet werden.

**Hinweis:** Es sei darauf hingewiesen, dass hier explizit der UML-Akteur **‘Buchender’** genutzt wurde, wobei dies sowohl einen **Patienten** als auch eine **angehörige Person** bedeuten kann, die im Namen des Patienten einen Termin buchen können.

## Identitätsnachweis der Patienten

Insbesondere zur nahtlosen Integration von Prozessen über verschiedene Systeme (z.B. Patientenportal und KIS), die sich in gekapselten Zugriffsumgebungen befinden, sind Workflows zum Identitätsnachweis von Patienten unabdinglich.

Folgende Alternativen zur Erbringung eines Identitätsnachweises können schematisch angeführt werden:

Insbesondere für die Verifizierung des Patienten im Laufe der Registrierung im Patientenportal soll hier ein Workflow vorgestellt werden, der einem künftigen Happy Path zur Terminbuchung samt Datenaustausch über eine validierte Patienten-Identität und zugehöriger Daten (in Portal und KIS) entspricht. Der Nachweis-Workflow soll die Übernahme validierter Patienten-Identitäten unter der Annahme von Read-Only Operationen (GET) zwischen den daten-führenden Systemen zur Übernahme sowie vorgelagerter Identifizierung eines Patienten mittels IDP (z.B. mittels GesundheitsID) skizzieren (Annahme: Patientendaten liegen bereits intern im Basis-Server vor, da Patient bereits Kontakt mit dem Krankenhaus hatte):

**Hinweis zur Abfolge von Terminbuchung und Registrierung:** Explizit soll eine Registrierung erst bei tatsächlicher Buchung erfolgen – nicht bereits zur Anzeige verfügbarer Termine. So ist es möglich Absprungraten zu senken, die digitale Zugänglichkeit zu steigern sowie die Nutzerakzeptanz allgemein zu verbessern. Auch der Vorsatz der Datenminimierung kann besser eingehalten werden. Es muss angenommen werden, dass viele Termine durch Dritte gebucht werden – etwa Angehörige, Eltern oder gesetzlich betreuende Personen. Eine sofortige Registrierung erschwert diese unterstützenden Prozesse und schränkt die barrierearme Nutzung deutlich ein, vor allem bei einmaliger oder sporadischer Inanspruchnahme. Zudem ist naheliegend, dass Patienten sich zunächst unverbindlich orientieren möchten, ob passende Termine oder Leistungen angeboten werden. Eine Registrierung als Einstieg widerspräche etablierten UX-Prinzipien („erst Wert zeigen, dann Verpflichtung“) und erhöht die Nutzungshürde ohne erkennbaren Mehrwert.

Zur Darstellung des Sachverhalts einer Buchung durch Angehörige kann folgendes Diagramm dienen:

In diesem Kontext sollte gelten:

* Die Registrierung im Patientenportal bezieht sich ausschließlich auf die buchende Person. Ihre Identität und Kontaktdaten werden zur Nutzerführung, Kommunikation und ggf. Authentifizierung verwendet.
* Die Terminbuchung selbst sollte die Identität der zu behandelnden Person erfassen – also des tatsächlichen Patienten. Diese Patientendaten (z. B. Name, Geburtsdatum, KVNR) sind mit dem gebuchten Termin zu verknüpfen und sollten korrekt an nachgelagerte Systeme (z. B. Termin-Repository, Basis-Server) übergeben werden.
* Bei Bedarf (z. B. für die Slot-Suche) kann bereits vor der Buchung eine (minimale) strukturierte Erfassung von Patientendaten (z. B. Sprache, Alter, Geschlecht etc.) im Termin-Requestor (oder angeschlossener Komponente) erfolgen, ohne dabei eine Registrierung zu erzwingen.

Die Abfragen von Patientendaten gegenüber dem Basis-Server dienen anknüpfenden Workflows (z.B. zur Bereitstellung von Dokumenten, Vitaldaten etc.). Das Zugriffsmanagement bleibt bei dieser Skizze jedoch noch offen.

