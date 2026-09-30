Im folgenden werden beispielhaft Architekturen dargestellt, die das Zusammenspiel von Systemen im Kontext der Terminplanung darstellen.

Welche Rolle ein System in diesen Architekturen einnimmt (Termin-Repository oder Termin-Requestor), lässt sich im Wesentlichen daran erkennen, wo die Kalender (Schedules), die Terminblöcke (Slots) und die zugehörigen Akteure verwaltet werden (vgl. Definition des Termin-Repositorys im Abschnitt [Akteure](Akteure.html)).

### KIS als terminführendes System

Eine in der Praxis vorkommende Architektur sieht das KIS als terminführendes System. Im Sinne des IGs wäre das KIS somit das Termin-Repository. Darüber hinaus existiert ein Patientenportal, über das Patienten online Termine buchen können. Das Patientenportal ist somit zugleich Termin-Requestor und Termin-Consumer.

Diese Architektur stellt für Patientenportale den Regelfall dar: Die Kalender stammen aus dem KIS und Buchungen innerhalb dieser Kalender erfolgen durch das Patientenportal in der Rolle des Termin-Requestors.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Termin_KIS_als_Repository.drawio.svg"  style="width: 100%;">
    </div>
</figure>

### Patientenportal als Terminführendes System

Eine andere Variante sieht vor das Patientenportal als terminführendes System einzubinden. In dieser Variante ist das KIS weiterhin auch als Termin-Repository zu betrachten, da Kapazitäten der Leistungserbringer hier vorgehalten werden. Das Patientenportal erhält jedoch weitergehende Rechte und kann hierdurch direkt Termine buchen. Eine bidirektionale Synchronisierung des Patientenportals und des KIS müsste bei dieser Variante fortlaufend durchgeführt werden. 

Diese Variante berücksichtigt Rückmeldungen aus der Industrie und stellt gegenüber der Architektur "KIS als terminführendes System" einen Sonderfall dar. Es existieren zwei Termin-Repositories: ein KH-internes Terminmanagement-System (z.B. KIS) und ein externes terminführendes System (z.B. Patientenportal). Das Patientenportal führt hierbei eigene Kalender, verwaltet diese vollständig selbst und besitzt die Hoheit über die Verfügbarkeit relevanter Ressourcen wie Räume oder Personal.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Termin_Patientenportal_als_Repository.drawio.svg"  style="width: 100%;">
    </div>
</figure>

Für die Synchronisierung der beiden Termin-Repositories gelten die im Abschnitt [Interaktionen](Interaktionen.html) definierten Interaktionen:

* Neu gebuchte Termine werden an das jeweils andere Termin-Repository übermittelt: Wird ein Termin im Patientenportal gebucht, tritt das Patientenportal gegenüber dem KIS als Termin-Requestor auf und übermittelt den Termin mittels der [$book-Operation](Operations.html). Umgekehrt tritt das KIS gegenüber dem Patientenportal als Termin-Requestor auf, wenn ein Termin im KIS gebucht wird.
* Änderungen an bestehenden Terminen (z.B. Aktualisierung, Verschiebung oder Absage) werden zwischen den Termin-Repositories über Subscriptions synchronisiert. Das jeweils andere System registriert sich hierzu per Subscription und wird über Terminänderungen per Subscription-Benachrichtigung informiert. Hierfür ist das im [ISiK Subscription Implementation Guide](https://gemspec.gematik.de/ig/fhir/isik/subscriptions/latest/index.html) beschriebene Vorgehen anzuwenden. Für Termine steht das Subscription-Profil [ISiKSubscriptionTermin](ISiKSubscriptionTermin.html) zur Verfügung.

Bei der beidseitigen Synchronisierung ist sicherzustellen, dass keine Echo-Schleifen entstehen: Termine und Terminänderungen, die ein Termin-Repository im Rahmen der Synchronisierung vom jeweils anderen Termin-Repository erhalten hat, sollten nicht erneut per $book-Operation oder Subscription-Benachrichtigung an dieses zurückübermittelt werden. Zur Kennzeichnung der Herkunft kann das Element `Appointment.meta.tag` (Slice `Source`) des Profils [ISiKTermin](StructureDefinition-ISiKTermin.html) verwendet werden. Empfangene Änderungen, die inhaltlich bereits dem vorliegenden Stand entsprechen, sind idempotent zu verarbeiten. Bei konkurrierenden Änderungen hat das Termin-Repository Vorrang, das den betroffenen Kalender führt. Weitergehende Festlegungen (z.B. Korrelationsmerkmale) sind zwischen den beteiligten Systemen bilateral abzustimmen.

Die Grundannahme dieser Architektur ist, dass das KH-interne Terminmanagement-System (z.B. KIS) für die Buchung durch interne Leistungserbringer eine entsprechende Funktionalität bereitstellt, auch im Sinne einer internen Planung. Mitarbeitende des Krankenhauses können demnach über eine Buchungsoberfläche im KIS, die die Rolle eines Termin-Requestors einnimmt, Termine in den Kalendern des KIS eintragen. Ebenso können Termine über eine Buchungsoberfläche im Patientenportal gebucht werden.

Hinweis: Das Schaubild stellt die Architektur vereinfacht dar. Sowohl im internen als auch im externen Bereich können zusätzliche Termin-Requestoren an das jeweilige Termin-Repository angebunden sein.
