### Anmerkungen zu den Must-Support-Feldern

### `Subscription.status`

**Bedeutung:** Der Status der Subscription, der den Serverstatus der Subscription angibt. Neue Subscriptions werden immer mit dem Status `requested` an den Server übergeben. Der Server ändert im Anschluss den Status auf `active` oder im Fehlerfall auf `error`.

**Hinweise:** Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)

### `Subscription.reason`

**Bedeutung:** Beschreibung wieso diese Subscription erstellt wurde.

**Hinweise:** Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)

### `Subscription.category`

**Bedeutung:** Canonical URL des Subscription-Topics, aktuell wird nur folgendes SubscriptionTopic unterstützt: https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge

**Hinweise:** Siehe [Subscriptions R5 Backport](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription.html)

### `Subscription.type`

**Bedeutung:** Der Typ des Kommunikationskanals, über den Subscription-Benachrichtigungen gesendet werden sollen.

**Hinweise:** Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)

### `Subscription.endpoint`

**Bedeutung:** Adresse des Kommunikationskanals/ Endpunkts, an den Subscription-Benachrichtigungen gesendet werden sollen. Dies ist nur für rest-hook Subscriptions relevant.

**Hinweise:** Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)

### `Subscription.payload`

**Bedeutung:** Format in dem Subscription Notifications versendet werden sollen (JSON oder XML)

**Hinweise:** Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)

### `Subscription.payload.extension[content]`

**Bedeutung:** Welcher Ressourceninhalt in der Nutzlast der Benachrichtigung geliefert werden soll. Zur Auswahl stehen eine leere Nutzlast (`empty`), nur die Ressourcenid (`id-only`) oder der gesamte Inhalt der Ressource (`full-resource`).

**Hinweise:** Siehe [Extension: Backport R5 Subscription Payload Content Information](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-payload-content.html)

### `Subscription.header`

**Bedeutung:** http-Header welcher dazu genutzt werden kann einen Authorization-header zu setzen. Dies ist nur für rest-hook Subscriptions relevant.  

**Hinweise:** ACHTUNG: dieses Datenfeld muss bei READ-Interaktionen maskiert werden! Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)