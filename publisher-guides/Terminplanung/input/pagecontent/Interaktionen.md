---
topic: Interaktionen
---

Für folgende Interaktionen werden im vorliegenden Implementierungsleitfaden Vorgaben für die Umsetzung innerhalb der ISiK-Schnittstelle definiert:

* Übermittlung von Patienteninformationen
* Verfügbare Behandlungsleistungen abrufen
* Verfügbare Terminlisten abrufen 
* Abfrage von (verfügbaren) Terminblöcken 
* Termin neu buchen (Buchungsmanagement von verfügbaren Terminen) 
* Termin absagen (ausgehend vom Client) 
* Termin verschieben (ausgehend vom Client) 
* Terminzusatzinformationen aktualisieren (ausgehend vom Client)

Nähere Informationen zur technischen Festlegung der oben genannten Interaktionen sind hier zu finden:

* [Book-Operation](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.html)
* [CapabilityStatement Termin-Repository Akteur](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.html)

Die folgenden Diagramme verdeutlichen das Zusammenspiel der Akteure in Bezug auf die oben genannten Interaktionen:

---

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/1.Uebermittlung_Patienteninformationen_zum_Termin_zugehoerige_Vorabinformationen.png" alt=" 1. Übermittlung Patienteninformationen - zum Termin zugehörige Vorabinformationen" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 1. Übermittlung Patienteninformationen - zum Termin zugehörige Vorabinformationen</figcaption>
</figure>


Für die Auswahl eines verfügbaren Terminblocks kann es notwendig sein, dass das Termin-Repository vorab durch den Termin-Requestor Vorabinformationen (z.B. für die Krankenversicherung) erhält. Diese können über eine schreibende Schnittstelle an das Termin-Repository übermittelt werden. Es ist zu beachten, dass das Termin-Repository gegebenenfalls diese Informationen separat von eigens erstellten Datenobjekten vorhält und/oder die Information dauerhaft erst nach einer manuellen Überprüfung durch einen Benutzer freigibt.

Gleichermaßen können Informationen zum Patienten vorab übermittelt werden, sodass gewisse Basisangaben bereits im Termin-Repository vorliegen.

Siehe  [Anlage einer Patient-Ressource](Operations.md) für die technische Umsetzung.

---

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/2.Verfuegbare_Behandlungsleistungen_abrufen.png" alt="2. Verfügbare Behandlungsleistungen abrufen" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 2. Verfügbare Behandlungsleistungen abrufen</figcaption>
</figure>

Als Einstiegspunkt in die Terminvereinbarung können durch den Termin-Requestor alle verfügbaren Behandlungsleistungen (HealthcareServices) abgerufen werden, für die das Termin-Repository Informationen zu notwendigen Ressourcen (Räume, Personen, Geräte, etc.) bereitstellt.

Siehe [ISiKMedizinischeBehandlungseinheit (HealthcareService) - Interaktionen](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.html#HealthcareService1-8) für die technische Umsetzung. Es sind die Hinweise zum Abruf der ValueSets für die Kodierung der Medizinischen Behandlungseinheit zu beachten.

---

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/3.Verfuegbare_Terminlisten_abrufen.png" alt="3. Verfügbare Terminlisten abrufen" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 3. Verfügbare Terminlisten abrufen</figcaption>
</figure>

Der Termin-Requestor kann nach der Auswahl einer Behandlungsleistung verfügbare Terminlisten (Schedules) für diese im Termin-Repository abrufen. Die Terminlisten repräsentieren somit den "Kalender", in dem Termine gebucht werden können.

Siehe [ISiKKalender (Schedule) - Interaktionen](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.html#Schedule1-5) für die technische Umsetzung.

---

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/4.Abfrage_von_verfuegbaren_Terminbloecken.png" alt="4. Abfrage von (verfübaren) Terminblöcken" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 4. Abfrage von (verfübaren) Terminblöcken</figcaption>
</figure>

Für einen jeweiligen Kalender kann der Termin-Requestor die darin definierten Terminblöcke abfragen. Diese können entsprechend eines Zeitraums und/oder Status (verfügbar, belegt) gefiltert werden.

Siehe [ISiKTerminblock (Slot) - Interaktionen](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.html#Slot1-6) für die technische Umsetzung.

---

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/5.Termin_neu_buchen_Buchungsmanagemnent_von_verfuegbaren_Terminen.png" alt="5. Termin neu buchen - Buchungsmanagemnent von verfügbaren Terminen" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 5. Termin neu buchen - Buchungsmanagemnent von verfügbaren Terminen</figcaption>
</figure>

Für einen durch den Benutzer ausgewählten Terminblock bzw. mehreren aufeinander folgenden Terminblöcken kann durch den Termin-Requestor ein Termin angefragt werden. Dieser kann direkt oder erst nach manueller Bestätigung durch das Termin-Repository freigegeben werden.

Es ist zu beachten, dass innerhalb dieser Aktion ein terminführendes Termin-Repository die Rolle des Termin-Requestors übernehmen kann und den neu-angelegten Termin in ein weiteres Termin-Repository spiegelt.

In diesem Kontext kann das Termin-Repository zudem Zusatzinformationen (z.B. Lagepläne) an den Termin-Requestor übermitteln.

Die Buchung eines Termins kann auch eine Aktualisierung eines Termins darstellen, indem für einen bestehenden Termin ein oder mehrere neu ausgewählte Terminblöcke an das Termin-Repository übergeben werden.

Siehe [Buchung eines Termins](OperationDefinition-ISiKAppointmentBookOperation.html) für die technische Umsetzung.

---

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/6.1_Termin_absagen_ausgehend_vom_Client.png" alt="6.1 Termin absagen (ausgehend vom Client)" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 6.1 Termin absagen (ausgehend vom Client)</figcaption>
</figure>

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/6.2_Termin_absagen_ausgehend_vom_terminführenden_System.png" alt="6.2 Termin absagen (ausgehend vom terminführenden System)" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 6.2 Termin absagen (ausgehend vom terminführenden System)</figcaption>
</figure>

Termine können sowohl durch den Termin-Requestor als Client oder durch das Termin-Repository als terminführendes System abgesagt werden. Im Falle, dass das Termin Repository den Termin absagt, ist der Termin-Consumer darüber zu benachrichtigen. Hierfür ist das im [ISiK Subscription Implementation Guide](https://gemspec.gematik.de/ig/fhir/isik/subscriptions/6.0.0-rc/index.html) beschrieben Vorgehen anzuwenden. Für diesen speziellen Use-Case steht darüber hinaus das Subscription Profil [ISiKSubscriptionTermin](ISiKSubscriptionTermin.html) zur Verfügung.

Siehe [Aktualisierung / Absage eines Termins](OperationDefinition-ISiKAppointmentBookOperation.html) für die technische Umsetzung.

---

Eine Verschiebeoperation kann im Normalfall als eine Neubuchung mit geändertem Zeitfenster ausgeführt werden (siehe Interaktion 5, bzw.  [Aktualisierung / Absage eines Termins](OperationDefinition-ISiKAppointmentBookOperation.html) für die technische Umsetzung.)

Bei einer Verschiebung kann allerdings auch eine Absage und Neubuchung eines Termins notwendig werden, wenn ursprüngliche Ressourcen nicht mehr verfügbar sind für den neu zu belegenden Slot:

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/7.1_Termin_verschieben_ausgehend_vom_Client.png" alt="7.1 Termin verschieben (ausgehend vom Client)" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 7.1 Termin verschieben (ausgehend vom Client)</figcaption>
</figure>

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/7.2_Termin_verschieben_ausgehend_vom_Termin_Repository.png" alt="7.2 Termin verschieben (ausgehend vom Termin-Repository)" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 7.2 Termin verschieben (ausgehend vom Termin-Repository)</figcaption>
</figure>

Termine können sowohl durch den Termin-Requestor als Client oder durch das Termin-Repository als terminführendes System verschoben werden. Im Falle, dass das Termin-Repository den Termin verschiebt ist der Termin-Consumer darüber zu benachrichtigen. Hierfür ist das im [ISiK Subscription Implementation Guide](https://gemspec.gematik.de/ig/fhir/isik/subscriptions/6.0.0-rc/index.html) beschriebene Vorgehen anzuwenden. Für diesen speziellen Use-Case steht darüber hinaus das Subscription Profil [ISiKSubscriptionTermin](ISiKSubscriptionTermin.html) zur Verfügung. 

Siehe [Buchung eines Termins](OperationDefinition-ISiKAppointmentBookOperation.html) für die technische Umsetzung.

---

<figure>
    <div class="geInteraktionen/8.1_Terminzusatzinformationen_aktualisieren_ausgehend_vom_Client.png" alt="8.1 Terminzusatzinformationen aktualisieren (ausgehend vom Client)" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 8.1 Terminzusatzinformationen aktualisieren (ausgehend vom Client)</figcaption>
</figure>

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/8.2_Terminzusatzinformationen_aktualisieren_ausgehend_vom_Termin_Repository.png" alt="8.2 Terminzusatzinformationen aktualisieren (ausgehend vom Termin-Repository)" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 8.2 Terminzusatzinformationen aktualisieren (ausgehend vom Termin-Repository)</figcaption>
</figure>

Termine können sowohl durch den Termin-Requestor als Client oder durch das Termin-Repository als terminführendes System durch Zusatzinformationen (z.B. welche Teilnehmer oder Ressourcen sind Teil des Termins) erweitert werden. Aktualisierungen an Terminzusatzinformationen ausgehend vom Termin Repository sind dem Termin Consumer mitzuteilen. Hierfür ist das im [ISiK Subscription Implementation Guide](https://gemspec.gematik.de/ig/fhir/isik/subscriptions/6.0.0-rc/index.html) beschriebene Vorgehen anzuwenden. Für diesen speziellen Use-Case steht darüber hinaus das Subscription Profil [ISikSubscriptionTermin](ISiKSubscriptionTermin.html) zur Verfügung.

Siehe [Aktualisierung / Absage eines Termins](OperationDefinition-ISiKAppointmentBookOperation.html) für die technische Umsetzung.

---

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Interaktionen/9.Abfrage_von_verinbarten_Terminen.png" alt="9. Abfrage von (verinbarten) Terminen" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> 9. Abfrage von (verinbarten) Terminen</figcaption>
</figure>

Der Termin-Requestor oder Termin-Consumer kann einen, mehrere oder alle Termine eines Termin-Repositories abfragen.

Siehe [ISiKTermin (Appointment) - Interaktionen](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.html#Appointment1-7) für die technische Umsetzung.
