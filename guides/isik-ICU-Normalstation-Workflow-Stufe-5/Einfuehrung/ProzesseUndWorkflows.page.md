# Prozesse

## Prozess Überleitung

Vorannahmen zu den unten modellierten Workflows sind, dass die betroffenen Patienten einen Zugang- oder Entlassungsprozess im Kontext der Intesivversorgung durchlaufen haben, durchlaufen, oder in naher Zukunft durchlaufen werden. 

Die Illustration möglicher bidirektionaler Überleitungs-Prozesse (analog zum [spezifischen Zulassungsprozess hier](https://breathe.ersjournals.com/content/16/2/200062)) erscheint in diesem Kontext nicht zielführend.

## Workflow - Support-Prozess zur Datenübermittlung bei Überleitung
Zur Abbildung des bidirektionalen Überleitungsprozesses zwischen einer Intensiv- und einer Normalstation können KIS und PDMS jeweils die Rolle des KIS und Client einnehmen.

### Diagramme

Der Workflow dient im Wesentlichen der Darstellung zu verschiedenen Möglichkeiten der Nutzung der REST-Schnittstelle zur Unterstützung des Workflows durch abfrage-basierte Kommunikation von Daten.

Für Festlegungen zu REST-Abfragen siehe den [Abschnitt zur REST-API im Basismodul](https://simplifier.net/guide/isik-basis-403/Einfuehrung/UebergreifendeFestlegungen/UebergreifendeFestlegungen_Rest).

#### Abfrage zeitlich folgend 
Folgende Diagramme illustrieren Die Fälle, bei denen Daten zeitlich nach der Überleitung abgefragt werden (mittels HTTP GET).

Folgendes Diagramm Illustriert den Workflow zu **UC-VIT-ICU-NORM-001** als BPMN-Prozess:

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/rc/main-stufe-4/Material/images/Abfrage-aus-ICU.PNG" alt="Nachträgliche Blutdruck-Abfrage aus Normalstation" width="90%"/>

**Hinweis:** hier agiert das KIS als Client. 


Folgendes Diagramm Illustriert den Workflow zu **UC-VIT-ICU-NORM-002** als BPMN-Prozess:

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/rc/main-stufe-4/Material/images/Abfrage-aus-Normal.PNG" alt="Nachträgliche Blutdruck-Abfrage aus Intensivstation" width="90%"/>


#### Übernahme zeitlich vorgelagert 

Denkbar sind auch Workflows, bei denen erhobene Daten aus einem System vor der Verlegung übermittelt werden. Siehe z.B. den Workflow zu **UC-VIT-ICU-NORM-003** als BPMN-Prozess:

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/rc/main-stufe-4/Material/images/Uebermittlung-an-ICU.PNG" alt="Vorgelagerte Übermittlung an Intensivstation" width="90%"/>

Eine Abfrage per HTTP GET allein reicht nicht aus, um die benötigten Daten rechtzeitig zu übermitteln. Stattdessen muss eine Vorab-Übermittlung durch einen anderen Mechanismus erfolgen. Sobald diese angestoßen wurde, kann das PDMS die vollständigen Daten per GET abrufen. An dieser Stelle werden keine weiteren Festlegungen zur vorgelagerten Übermittlung der  Daten erhoben und es wird keine direkte Schreiboperation auf FHIR-Basis des KIS im PDMS für diesen Fall gefordert. Die Vorab-Übermittlung könnte durch verschiedene Mechanismen unterstützt werden:

- FHIR Subscription (vgl. im ISiK Kontext [Patient merge Notification](https://simplifier.net/guide/isik-basis-v4/UebergreifendeFestlegungen-UebergreifendeFestlegungen_Patient-merge?version=current))
- Create-Interaktion (POST) (vgl. im ISiK Kontext [REST-API](https://simplifier.net/guide/isik-basis-v4/markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen_Rest?version=current))
- HL7 v2 Messaging
- etc.