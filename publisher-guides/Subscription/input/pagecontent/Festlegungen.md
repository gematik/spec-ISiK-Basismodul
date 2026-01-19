---
topic: Festlegungen
---

### Übergreifende Festlegungen

Es gelten alle übergreifenden Festlegungen entsprechend
dem [ISiK Basismodul](https://gematik.github.io/spec-ISiK-Basismodul/stufe-5/basis/migrate-ig-to-ig-publisher-ptdata-1885/Index_Festlegungen.html).

Zudem gelten die Festlegungen gemäß dem Abschnitt zu den [FHIR-Artefakten](artifacts.html).

#### Normativer Status

Systeme KÖNNEN die hier beschriebenen Use Cases zur Nutzung themenbasierter Subscriptions nach dem
Backport-Modell unterstützen.

Die beschriebenen Strukturen und Profile basieren auf
dem [Subscriptions-Backport ImplementationGuide STU1.1](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/),
wobei die technisch fehlerhaften Profile backport-subscription-status-r4 und
backport-subscription-notification-r4 in Version 1.1.0 funktionsgleich nachgebaut und in diesem
Modul bereitgestellt wurden.

Die Nutzung dieser Mechanismen ist derzeit nicht verpflichtend, sondern dient der Kommentierung und
technischen Orientierung, wie Subscriptions auf Basis von SubscriptionTopic-Konzepten bereits heute
in ISiK-konformen Systemen umgesetzt werden können.

#### Zu Unterstützende Funktionalitäten des Subscription-Backport IGs

Für die Umsetzung von themenbasierten Ereignisbenachrichtigungen im Rahmen dieses Moduls SOLLEN die
folgenden Funktionalitäten aus dem Subscriptions-Backport IG unterstützt werden:

* rest-hook Subscriptions  
  Unterstützung des Benachrichtigungsmechanismus per REST-Hook zur Auslieferung von
  Subscription-Ereignissen an konfigurierbare HTTP-Endpunkte.

* Handshake (Channel Validation) 
  Implementierung des optionalen Handshake-Verfahrens zur
  Bestätigung der Erreichbarkeit und
  Authentizität des Zielsystems.

* `$events` Operation (Subscription/$events)  
  Bereitstellung von zuvor ausgelösten Subscription-Benachrichtigungen über eine dedizierte
  Operation.
  Dient insbesondere zur Synchronisation nach Systemunterbrechungen.

* `$status` Operation (Subscription/$status)  
  Abruf des aktuellen Zustands einer Subscription mittels Parameters-Struktur gemäß dem
  Backport-Profil backport-subscription-status-r4.

* BackportSubscription-Profil  
  Verwendung des erweiterten Subscription-Profils aus dem Backport IG mit Unterstützung für
  topic-basierte Filterlogik und Benachrichtigungskanäle.

* R4 Topic-Based Subscription Notification Bundle  
  Benachrichtigungen über Subscription-Ereignisse erfolgen im Format eines R4-Bundles gemäß dem
  Backport-Profil `backport-subscription-notification-r4`, analog zur Struktur in FHIR R5.

* R4 Backported R5 SubscriptionStatus (Parameters)  
  Die Rückmeldung zum Zustand einer Subscription MUSS in Form eines Parameters-Objekts erfolgen, das
  dem Profil `backport-subscription-status-r4` entspricht.
