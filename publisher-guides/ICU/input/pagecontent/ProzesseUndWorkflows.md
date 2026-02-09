### Prozess Überleitung - Vorannahmen

Vorannahmen zu den unten modellierten Workflows sind, dass die betroffenen Patienten einen Zugang- oder Entlassungsprozess im Kontext der Intesivversorgung durchlaufen haben, durchlaufen, oder in naher Zukunft durchlaufen werden. 

Die Illustration möglicher bidirektionaler Überleitungs-Prozesse (analog zum [spezifischen Zulassungsprozess hier](https://breathe.ersjournals.com/content/16/2/200062)) erscheint in diesem Kontext nicht zielführend.

### Workflow - Support-Prozess zur Datenübermittlung bei Überleitung
Zur Abbildung des bidirektionalen Überleitungsprozesses zwischen einer Intensiv- und einer Normalstation können KIS und PDMS jeweils die Rolle des KIS und Client einnehmen.


Der Workflow dient im Wesentlichen dazu, verschiedene Nutzungsmöglichkeiten der REST-Schnittstelle zur abfragebasierten Datenkommunikation im Rahmen der Workflow-Unterstützung darzustellen.

Für Festlegungen zu REST-Abfragen siehe den [Abschnitt zur REST-API im Basismodul](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_Rest).

#### Abfrage zeitlich folgend - Diagramm

Folgende Diagramme illustrieren die Fälle, bei denen Daten zeitlich nach der Überleitung abgefragt werden (mittels HTTP GET).

Folgendes Diagramm Illustriert den Workflow zu **UC-VIT-ICU-NORM-001** als BPMN-Prozess:

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Abfrage-aus-ICU.PNG" alt="Nachträgliche Blutdruck-Abfrage aus Normalstation" style="width: 100%;">
    </div>
    <figcaption>Abbildung: Nachträgliche Blutdruck-Abfrage aus Normalstation</figcaption>
</figure>


**Hinweis:** hier agiert das KIS als Client. 


Folgendes Diagramm Illustriert den Workflow zu **UC-VIT-ICU-NORM-002** als BPMN-Prozess:

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Abfrage-aus-Normal.PNG" alt="Nachträgliche Blutdruck-Abfrage aus Intensivstation" style="width: 100%;">
    </div>
    <figcaption>Abbildung: Nachträgliche Blutdruck-Abfrage aus Intensivstation</figcaption>
</figure>


#### Übernahme zeitlich vorgelagert - Diagramm

Denkbar sind auch Workflows, bei denen erhobene Daten aus einem System vor der Verlegung übermittelt werden. Siehe z.B. den Workflow zu **UC-VIT-ICU-NORM-003** als BPMN-Prozess:

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Uebermittlung-an-ICU.PNG" alt="Vorgelagerte Übermittlung an Intensivstation" style="width: 100%;">
    </div>
    <figcaption>Abbildung: Vorgelagerte Übermittlung an Intensivstation</figcaption>
</figure>

Eine Abfrage per HTTP GET allein reicht nicht aus, um die benötigten Daten rechtzeitig zu übermitteln. Stattdessen muss eine Vorab-Übermittlung durch einen anderen Mechanismus erfolgen. Sobald diese angestoßen wurde, kann das PDMS die vollständigen Daten per GET abrufen. An dieser Stelle werden keine weiteren Festlegungen zur vorgelagerten Übermittlung der  Daten erhoben und es wird keine direkte Schreiboperation auf FHIR-Basis des KIS im PDMS für diesen Fall gefordert. Die Vorab-Übermittlung könnte durch verschiedene Mechanismen unterstützt werden:

- FHIR Subscription (vgl. im ISiK Kontext [Patient merge Notification](https://simplifier.net/guide/isik-subscription-stufe-5/Einfuehrung/Spezifikation/Patientenzusammenführung)
- Create-Interaktion (POST) (vgl. im ISiK Kontext [REST-API](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_Rest))
- HL7 v2 Messaging
- Rückübermittelung als FHIR Document per [ISiKBerichtSubSysteme](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_BerichtSubsystem)

- etc.
