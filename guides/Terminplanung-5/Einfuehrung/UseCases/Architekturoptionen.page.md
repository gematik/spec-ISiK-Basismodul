---
topic: Architekturoptionen
---

## {{page-title}}

Im folgenden werden beispielhafte mögliche Architekturen dargestellt, die das Zusammenspiel von Systemen im Kontext der Terminplanung darstellen.

Welche Rolle ein System in diesen Architekturen einnimmt (Termin-Repository oder Termin-Requestor), lässt sich im Wesentlichen daran erkennen, wo die Kalender (Schedules), die Terminblöcke (Slots) und die zugehörigen Akteure verwaltet werden (vgl. Definition des Termin-Repositorys im Abschnitt {{pagelink:guides/Terminplanung-5/Einfuehrung/UseCases/Akteure.page.md, text:Akteure}}).

### KIS als terminführendes System

Eine in der Praxis vermutlich häufig vorkommende Architektur sieht das KIS als terminführendes System, im Sinne des IGs ist es somit das Termin-Repository. Darüber hinaus existiert ein Patientenportal, über das Patienten online Termine buchen können. Das Patientenportal ist somit zugleich Termin-Requestor und Termin-Consumer.

Diese Architektur stellt für Patientenportale den Regelfall dar: Die Kalender stammen aus dem KIS und Buchungen innerhalb dieser Kalender erfolgen durch das Patientenportal in der Rolle des Termin-Requestors.

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/Terminplanung/Termin_KIS_als_Repository.drawio.svg"/>

### Patientenportal als Terminführendes System

Eine andere Variante ist das Patientenportal als terminführendes System einzubinden. In dieser Variente ist das KIS weiterhin auch als Repository zu betrachten, da Kapazitäten der Leistungserbringer hier vorgehalten werden. Das Patientenportal erhält jedoch weitergehende Rechte und kann hierdurch direkt Termine buchen. Eine bidirektionale Synchronisierung des Patientenportals und des KIS muss fortlaufend durchgeführt werden. 

Diese Variante berücksichtigt Rückmeldungen aus der Industrie und stellt gegenüber der Architektur "KIS als terminführendes System" einen Sonderfall dar. Es existieren zwei Termin-Repositories: ein KH-internes Terminmanagement-System (z.B. KIS) und ein externes terminführendes System (z.B. Patientenportal). Das Patientenportal führt hierbei eigene Kalender, verwaltet diese vollständig selbst und besitzt die Hoheit über die Verfügbarkeit relevanter Ressourcen wie Räume oder Personal.

{{render:Material/Terminplanung/images/diagrams/Termin_Patientenportal_als_Repository.drawio.svg}}

Für die Synchronisierung der beiden Termin-Repositories gelten die im Abschnitt {{pagelink:Interaktionen, text:Interaktionen}} definierten Interaktionen:

* Neu gebuchte Termine werden an das jeweils andere Termin-Repository übermittelt: Wird ein Termin im Patientenportal gebucht, tritt das Patientenportal gegenüber dem KIS als Termin-Requestor auf und übermittelt den Termin mittels der {{pagelink:guides/Terminplanung-5/Einfuehrung/Festlegungen/Operations.page.md, text:$book-Operation}}. Umgekehrt tritt das KIS gegenüber dem Patientenportal als Termin-Requestor auf, wenn ein Termin im KIS gebucht wird.
* Für die Synchronisierung von Änderungen an bestehenden Terminen (z.B. Aktualisierung, Verschiebung oder Absage) können in dieser Stufe keine weiteren Vorgaben gemacht werden, da keine Verpflichtung zur Unterstützung eines Push-Mechanismus (z.B. FHIR Subscriptions) besteht (vgl. {{pagelink:guides/Terminplanung-5/Einfuehrung/Festlegungen/Operations.page.md, text:Aktualisierung / Absage eines Termins}}). In zukünftigen Stufen entfällt diese Einschränkung, da dort die Unterstützung von Subscriptions verpflichtend aufgenommen wurde.

Bei der beidseitigen Synchronisierung ist sicherzustellen, dass keine Echo-Schleifen entstehen: Termine und Terminänderungen, die ein Termin-Repository im Rahmen der Synchronisierung vom jeweils anderen Termin-Repository erhalten hat, sollten nicht erneut per $book-Operation oder – sofern ein Push-Mechanismus genutzt wird – per Benachrichtigung an dieses zurückübermittelt werden. Zur Kennzeichnung der Herkunft kann das Element `Appointment.meta.tag` (Slice `Source`) des Profils {{pagelink:guides/Terminplanung-5/Einfuehrung/Artefakte/Datenobjekt_Termin/Profil.page.md, text:ISiKTermin}} verwendet werden. Empfangene Änderungen, die inhaltlich bereits dem vorliegenden Stand entsprechen, sind idempotent zu verarbeiten. Bei konkurrierenden Änderungen hat das Termin-Repository Vorrang, das den betroffenen Kalender führt. Weitergehende Festlegungen (z.B. Korrelationsmerkmale) sind zwischen den beteiligten Systemen bilateral abzustimmen.

Die Grundannahme dieser Architektur ist, dass das KH-interne Terminmanagement-System (z.B. KIS) für die Buchung durch interne Leistungserbringer eine entsprechende Funktionalität bereitstellt, auch im Sinne einer internen Planung. Mitarbeitende des Krankenhauses können demnach über eine Buchungsoberfläche im KIS Termine in den Kalendern des KIS eintragen. Ebenso können Termine über eine Buchungsoberfläche im Patientenportal gebucht werden.

Hinweis: Das Schaubild stellt die Architektur vereinfacht dar. Sowohl im internen als auch im externen Bereich können zusätzliche Termin-Requestoren an das jeweilige Termin-Repository angebunden sein.
