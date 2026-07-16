Es gelten alle übergreifenden Festlegungen entsprechend
dem [ISiK Basismodul](https://gematik.github.io/spec-ISiK-Basismodul/stufe-5/basis/migrate-ig-to-ig-publisher-ptdata-1885/Index_Festlegungen.html).

Zudem gelten die Festlegungen gemäß dem Abschnitt zu den [FHIR-Artefakten](artifacts.html).

### Normativer Status

ISiK-konforme FHIR Subscriptions MÜSSEN durch den Akteur „Subscription Server“ unterstützt werden, um ineffizientes Polling zu vermeiden und eine einheitliche, ereignisbasierte Kommunikation sicherzustellen.
Der Subscription-Server MUSS für jede FHIR-Ressource, die er gemäß seinem CapabilityStatement unterstützt, das entsprechende ISiK-SubscriptionTopic implementieren und über das CapabilityStatement bekannt geben. Die verfügbaren Topics sind im [ISiKSubscriptionTopic CodeSystem](CodeSystem-ISiKSubscriptionTopicCS.html) definiert.
Die beschriebenen Strukturen und Profile basieren auf
dem [Subscriptions-Backport ImplementationGuide STU1.1](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/),
wobei die technisch fehlerhaften Profile backport-subscription-status-r4 und
backport-subscription-notification-r4 in Version 1.1.0 funktionsgleich nachgebaut und in diesem
Modul bereitgestellt wurden.

### Zu Unterstützende Funktionalitäten des Subscription-Backport IGs

Für die Umsetzung von themenbasierten Ereignisbenachrichtigungen im Rahmen dieses Moduls MÜSSEN die
folgenden Funktionalitäten aus dem Subscriptions-Backport IG unterstützt werden:

* rest-hook Subscriptions  
  Unterstützung des Benachrichtigungsmechanismus per REST-Hook zur Auslieferung von
  Subscription-Ereignissen an konfigurierbare HTTP-Endpunkte.

* Handshake (Channel Validation)  
  Implementierung des Handshake-Verfahrens zur Bestätigung der Erreichbarkeit und
  Aktivierung des Kommunikationskanals.

* Heartbeat  
  Der Subscription-Server MUSS Heartbeat-Benachrichtigungen gemäß der konfigurierten `heartbeatPeriod` senden,
  sofern in diesem Zeitraum keine regulären Notifications erfolgt sind.

* `$events` Operation (Subscription/$events)  
  Bereitstellung von zuvor ausgelösten Subscription-Benachrichtigungen über eine dedizierte
  Operation. Dient insbesondere zur Synchronisation nach Systemunterbrechungen.
  Die Filterparameter `eventsSinceNumber` und `eventsUntilNumber` MÜSSEN unterstützt werden.

* `$status` Operation (Subscription/$status)  
  Abruf des aktuellen Zustands einer Subscription mittels Parameters-Struktur gemäß dem
  Backport-Profil backport-subscription-status-r4.

* BackportSubscription-Profil  
  Verwendung des erweiterten Subscription-Profils aus dem Backport IG mit Unterstützung für
  topic-basierte Filterlogik und Benachrichtigungskanäle.

* R4 Topic-Based Subscription Notification Bundle  
  Benachrichtigungen über Subscription-Ereignisse erfolgen im Format eines R4-Bundles gemäß dem
  Backport-Profil `backport-subscription-notification-r4`, analog zur Struktur in FHIR R5.  
  Notifications MÜSSEN mit `payload=id-only` versendet werden. Vollständige Ressourcendaten
  DÜRFEN nicht in Notifications enthalten sein, um Datenschutzanforderungen einzuhalten und die Entkopplung von Ereignissignal und sicherem Datenabruf sicherzustellen.

* R4 Backported R5 SubscriptionStatus (Parameters)  
  Die Rückmeldung zum Zustand einer Subscription MUSS in Form eines Parameters-Objekts erfolgen, das
  dem Profil `backport-subscription-status-r4` entspricht.

* Fehler- und Statushandling  
  Bei einem nicht erreichbaren REST-Hook-Endpunkt MUSS der Subscription-Server den `SubscriptionStatus`
  auf `error` setzen. Der Subscription-Client KANN per `$status` den Fehler prüfen und die Subscription
  durch ein erneutes `PUT` mit `status=requested` reaktivieren.
