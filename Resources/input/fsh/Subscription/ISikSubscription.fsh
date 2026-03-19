Profile: ISiKSubscription
Parent: BackportSubscription
Id: ISiKSubscription
Title: "ISiK Subscription"
Description: "ISiK Subscription  
### Motivation

Subscription ist eine FHIR Ressource, um als Client-System Benachrichtigungen über Events auf dem FHIR Server anzufragen. Der Subscription Mechanismus in FHIR R4 ist nicht geeignet, um alle relevanten Events (hier im Speziellen das Mergen von Patienten) zu unterstützen. Daher basiert das ISiK Subscription-Profil auf dem [Subscriptions R5 Backport Profil von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/StructureDefinition-backport-subscription.html).

Um als Subsystem über ein Subscription-Event informiert zu werden, KANN der FHIR Subscription Mechanismus gemäß des [Subscriptions R5 Backport IGs von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/index.html) genutzt werden.

### Kompatibilität

Das Profil ISiKSubscription basiert auf dem [Backport-Subscription Profil](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription.html).
Der [SubscriptionStatus](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription-status-r4.html), sowie das [Subscription Notification Bundle](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription-notification-r4.html) werden unverändert direkt aus dem [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/index.html) genutzt.  

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* insert CommonElements
* ^fhirVersion = #4.0.1
* status MS
  * ^short = "Status"
  * ^comment = "**Bedeutung:** Der Status der Subscription, der den Serverstatus der Subscription angibt. 
  Neue Subscriptions werden immer mit dem Status `requested` an den Server übergeben. 
  Der Server ändert im Anschluss den Status auf `active` oder im Fehlerfall auf `error`."
* reason MS
  * ^short = "Grund der Subscription"
  * ^comment = "**Bedeutung:** Beschreibung wieso diese Subscription erstellt wurde."
* criteria MS
* criteria from ISiKSubscriptionTopicVS (extensible)
  * ^short = "Canonical URL des SubscriptionTopic welches man abonnieren möchte."
  * ^comment = "Enthält eines der in ISiK vereinbarten Subscription Topics."
  * extension[filterCriteria] MS
    * ^short = "Filterkriterium."
    * ^comment = "**Bedeutung:** Filterkriterium für die Subscription. Dieses Feld ist optional und kann genutzt werden, um die Subscription auf bestimmte Events zu filtern."
    * valueString MS
* channel MS
  * ^short = "Kommunikationskanal"
  * ^comment = "**Bedeutung:** Kommunikationskanal über den die Subscription Benachrichtigungen gesendet werden sollen."
  * extension[heartbeatPeriod] MS
    * ^short = "Heartbeat-Intervall"
    * ^comment = "**Bedeutung:** Intervall in dem der Server prüft, ob der Kommunikationskanal noch aktiv ist."
    * valueUnsignedInt MS
  * type MS
    * ^short = "Typ des Kommunikationskanals"
    * ^comment = "**Bedeutung:** Der Typ des Kommunikationskanals, über den Subscription-Benachrichtigungen gesendet werden sollen.  
    In ISiK MUSS der Wert `rest-hook` unterstützt werden, weitere Werte KÖNNEN unterstützt werden."
    * extension[customChannelType] 0..0
      * ^short = "Custom Channel Type"
      * ^comment = "**Bedeutung:** Custom Channel Type welcher in ISiK aktuell nicht unterstützt wird."
  * endpoint MS
    * ^short = "Endpunkt"
    * ^comment = "**Bedeutung:** Adresse des Kommunikationskanals/ Endpunkts, an den Subscription-Benachrichtigungen gesendet werden sollen. Dies ist nur für rest-hook Subscriptions relevant."
  * payload MS
    * ^short = "Format der Nutzdaten"
    * ^comment = "**Bedeutung:** Format in dem Subscription Notifications versendet werden sollen (JSON oder XML)."
  * payload from FhirMimeTypeVS
    * extension[content] MS
      * ^short = "Inhalt der Nutzdaten"
      * ^comment = "**Bedeutung:** Welcher Ressourceninhalt in der Nutzlast der Benachrichtigung geliefert werden soll.  
      Zur Auswahl stehen eine leere Nutzlast (`empty`), nur die Ressourcen-id (`id-only`) oder der gesamte Inhalt der Ressource (`full-resource`)."
  * header MS
    * ^short = "Falls eine REST-Enpunkt einen Authorization-Header benötigt, kann dieser hier gesetzt werden"
    * ^comment = "**Bedeutung:** http-Header welcher dazu genutzt werden kann einen Authorization-header zu setzen. Dies ist nur für rest-hook Subscriptions relevant.  
    **Hinweise:** ACHTUNG: dieses Datenfeld muss bei READ-Interaktionen maskiert werden! Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)"

Profile: ISiKSubscriptionStatus
Parent: BackportSubscriptionStatusR4Fixed
Id: ISiKSubscriptionStatus
Title: "ISiK Subscription Status"
Description: "ISiK Subscription Status"
* insert Meta
* ^fhirVersion = #4.0.1

Profile: ISiKSubscriptionNotification
Parent: BackportSubscriptionNotificationR4Fixed
Id: ISiKSubscriptionNotification
Title: "ISiKSubscriptionNotification"
Description: "ISiKSubscriptionNotification"
* insert Meta
* ^fhirVersion = #4.0.1

Instance: PatientMergeSubscriptionExample
InstanceOf: ISiKSubscription
Usage: #example
* status = #requested
* reason = "Patient merge subscription"
* criteria = "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge"
* channel
  * type = #rest-hook
  * endpoint = "http://localhost:8081/fhir/Bundle"
  * payload = #application/fhir+json
    * extension[content].valueCode = #full-resource
  * header = "Authorization: Bearer xxxxxxxxxx"

Instance: SubscriptionNotificationBundleExample
InstanceOf: ISiKSubscriptionNotification
Usage: #example
* type = #history
* entry[+].fullUrl = "urn:uuid:9bb6fcbd-8391-4e35-bd4c-620a2db47af0"
* entry[=].resource = ISiKSubscriptionStatusExample
* entry[=].request.method = #GET
* entry[=].request.url = "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge/$status"
* entry[=].response.status = "200"
* entry[+].fullUrl = "http://example.org/fhir/Patient/DorisQuelle"
* entry[=].resource = DorisQuelle
* entry[=].request.method = #PUT
* entry[=].request.url = "Patient"
* entry[=].response.status = "201"

Instance: ISiKSubscriptionStatusExample
InstanceOf: ISiKSubscriptionStatus
Usage: #example
* parameter[subscription].valueReference = Reference(Subscription/1)
* parameter[topic].valueCanonical = "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge"
* parameter[status].valueCode = #active
* parameter[type].valueCode = #event-notification
* parameter[eventsSinceSubscriptionStart].valueString = "1"
* parameter[notificationEvent].part[eventNumber].valueString = "1"
* parameter[notificationEvent].part[eventTimestamp].valueInstant = "2024-02-22T18:30:05+01:00"
* parameter[notificationEvent].part[eventFocus].valueReference = Reference(DorisQuelle)

