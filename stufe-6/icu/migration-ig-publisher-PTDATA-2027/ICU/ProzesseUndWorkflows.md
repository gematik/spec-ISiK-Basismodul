# Prozesse und Workflows - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* **Prozesse und Workflows**

## Prozesse und Workflows

### Prozesse

#### Prozess Überleitung

Vorannahmen zu den unten modellierten Workflows sind, dass die betroffenen Patienten einen Zugang- oder Entlassungsprozess im Kontext der Intesivversorgung durchlaufen haben, durchlaufen, oder in naher Zukunft durchlaufen werden.

Die Illustration möglicher bidirektionaler Überleitungs-Prozesse (analog zum [spezifischen Zulassungsprozess hier](https://breathe.ersjournals.com/content/16/2/200062)) erscheint in diesem Kontext nicht zielführend.

#### Workflow - Support-Prozess zur Datenübermittlung bei Überleitung

Zur Abbildung des bidirektionalen Überleitungsprozesses zwischen einer Intensiv- und einer Normalstation können KIS und PDMS jeweils die Rolle des KIS und Client einnehmen.

##### Diagramme

Der Workflow dient im Wesentlichen dazu, verschiedene Nutzungsmöglichkeiten der REST-Schnittstelle zur abfragebasierten Datenkommunikation im Rahmen der Workflow-Unterstützung darzustellen.

Für Festlegungen zu REST-Abfragen siehe den [Abschnitt zur REST-API im Basismodul](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_Rest).

###### Abfrage zeitlich folgend

Folgende Diagramme illustrieren die Fälle, bei denen Daten zeitlich nach der Überleitung abgefragt werden (mittels HTTP GET).

Folgendes Diagramm Illustriert den Workflow zu **UC-VIT-ICU-NORM-001** als BPMN-Prozess:

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/rc/main-stufe-4/Material/images/Abfrage-aus-ICU.PNG)

**Hinweis:** hier agiert das KIS als Client.

Folgendes Diagramm Illustriert den Workflow zu **UC-VIT-ICU-NORM-002** als BPMN-Prozess:

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/rc/main-stufe-4/Material/images/Abfrage-aus-Normal.PNG)

###### Übernahme zeitlich vorgelagert

Denkbar sind auch Workflows, bei denen erhobene Daten aus einem System vor der Verlegung übermittelt werden. Siehe z.B. den Workflow zu **UC-VIT-ICU-NORM-003** als BPMN-Prozess:

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/rc/main-stufe-4/Material/images/Uebermittlung-an-ICU.PNG)

Eine Abfrage per HTTP GET allein reicht nicht aus, um die benötigten Daten rechtzeitig zu übermitteln. Stattdessen muss eine Vorab-Übermittlung durch einen anderen Mechanismus erfolgen. Sobald diese angestoßen wurde, kann das PDMS die vollständigen Daten per GET abrufen. An dieser Stelle werden keine weiteren Festlegungen zur vorgelagerten Übermittlung der Daten erhoben und es wird keine direkte Schreiboperation auf FHIR-Basis des KIS im PDMS für diesen Fall gefordert. Die Vorab-Übermittlung könnte durch verschiedene Mechanismen unterstützt werden:

* FHIR Subscription (vgl. im ISiK Kontext [Patient merge Notification](https://simplifier.net/guide/isik-subscription-stufe-5/Einfuehrung/Spezifikation/Patientenzusammenführung)
* Create-Interaktion (POST) (vgl. im ISiK Kontext [REST-API](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_Rest))
* HL7 v2 Messaging
* Rückübermittelung als FHIR Document per [ISiKBerichtSubSysteme](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_BerichtSubsystem)
* etc.

