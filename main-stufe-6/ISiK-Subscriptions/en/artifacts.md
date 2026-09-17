# FHIR-Artefakte - ISiK Subscription Implementierungsleitfaden v6.0.0

ISiK Subscription Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden. Test

Dieses ISiK-Modul zur themenbasierten Ereignisbenachrichtigung in FHIR R4 basiert auf dem [Subscriptions-Backport ImplementationGuide STU1.1](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/), welcher das R5-Benachrichtigungsmodell auf FHIR R4 überträgt. Es verwendet dieselben strukturellen Konzepte wie Subscription, SubscriptionTopic (durch den Server vorgegeben, keine Nutzung der Basic Ressource), Bundle (für Benachrichtigungen) und Parameters (für Statusmeldungen).

Hinweis zur Profilkompatibilität: Die in Version 1.1.0 des Subscriptions-Backport IGs enthaltenen Profile backport-subscription-notification-r4 und backport-subscription-status-r4 weisen technische Mängel auf, die eine direkte Wiederverwendung in produktiven Systemen verhindern.

Daher wurden diese beiden Profile im Rahmen dieses Leitfadens funktionsgleich nachgebildet und unter den Bezeichnungen:

* BackportSubscriptionNotificationR4Fixed
* BackportSubscriptionStatusR4Fixed

lokal publiziert.

Diese lokalen Definitionen dienen als temporärer Ersatz und werden zukünftig durch die offiziellen HL7-Profile ersetzt, sobald eine technisch korrigierte Version des Backport-IGs veröffentlicht wurde.

Es gelten zur Umsetzung der Subscription Funktionalität CapabilityStatements (Akteure und Rollen) sowie Datenstrukturen entsprechend der folgenden Seite.

### CapabilityStatements

#### Akteure

Das CapabilityStatement mit der Kennzeichnung "Expanded" dient der direkten Übersicht aller zu implementierender Interaktionen und Profile.

| | |
| :--- | :--- |
| [ Akteur "ISiKCapabilityStatementSubscriptionServerAkteur" (Expanded) ](CapabilityStatement-ISiKCapabilityStatementSubscriptionServerAkteur-expanded.md) | CapabilityStatement für den Akteur "ISiKCapabilityStatementBasisServerAkteur". |
| [ Akteur "ISiKCapabilityStatementSubscriptionServerAkteur" ](CapabilityStatement-ISiKCapabilityStatementSubscriptionServerAkteur.md) | CapabilityStatement für den Akteur "ISiKCapabilityStatementBasisServerAkteur". |

**Tabelle:**Capability Statements - Akteure

#### Rollen

| | |
| :--- | :--- |
| [ CapabilityStatement für Rolle "Subscription" ](CapabilityStatement-ISiKCapabilityStatementSubscriptionRolle.md) | CapabilityStatement für die Rolle "ISiKCapabilityStatementSubscriptionRolle". Diese Rolle beschreibt die Fähigkeiten eines Systems zur Registrierung, Verwaltung und Verarbeitung von FHIR Subscriptions auf Basis themenbasierter Benachrichtigungen nach dem R5-Modell unter Verwendung der Subscriptions-Backport-Mechanismen in FHIR R4. |

**Tabelle:**Capability Statements - Rollen

### Profile

#### Datentyp-Profile

|
|

**Tabelle:**Datentyp-Profile

#### Extensions

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Imports Expectation (Extension) ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |

**Tabelle:**Extensions

#### Ressourcen-Profile

| | | |
| :--- | :--- | :--- |
| [ R4 Topic-Based Subscription Notification Bundle (Bundle) ](StructureDefinition-BackportSubscriptionNotificationR4Fixed.md) | Bundle | Profil auf der FHIR-R4-Resource Bundle, um R5-ähnliche, themenbasierte Subscription-Benachrichtigungen in FHIR R4 zu ermöglichen.Dieses Profil ist funktional identisch mit `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-notification-r4`. Die Version 1.1.0 des offiziellen Profils enthält jedoch technische Fehler. Daher wurde dieses Profil lokal als temporärer Workaround nachgebildet. Es wird durch das offizielle `backport-subscription-notification-r4` Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde. |
| [ R4 Backported R5 SubscriptionStatus (Parameters) ](StructureDefinition-BackportSubscriptionStatusR4Fixed.md) | Parameters | Profil auf der FHIR-R4-Resource Parameters zur Unterstützung themenbasierter Subscription-Benachrichtigungen in R4.Dieses Profil ist funktional identisch mit `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-status-r4`. Die Version 1.1.0 des offiziellen Profils weist jedoch technische Fehler auf. Daher wurde es hier als Workaround erneut implementiert. Diese lokale Definition wird durch das offizielle `backport-subscription-status-r4` Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde. |
| [ ISiK Subscription (BackportSubscription) ](StructureDefinition-ISiKSubscription.md) | Subscription | ISiK Subscription**Motivation**Subscription ist eine FHIR Ressource, um als Client-System Benachrichtigungen über Events auf dem FHIR Server anzufragen. Der Subscription Mechanismus in FHIR R4 ist nicht geeignet, um alle relevanten Events (hier im Speziellen das Mergen von Patienten) zu unterstützen. Daher basiert das ISiK Subscription-Profil auf dem [Subscriptions R5 Backport Profil von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/StructureDefinition-backport-subscription.html).Um als Subsystem über ein Subscription-Event informiert zu werden, MUSS der FHIR Subscription Mechanismus gemäß des [Subscriptions R5 Backport IGs von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/index.html) vom Subscription Server Akteur unterstützt werden.**Kompatibilität**Das Profil ISiKSubscription basiert auf dem [Backport-Subscription Profil](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription.html). Der [SubscriptionStatus](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription-status-r4.html), sowie das [Subscription Notification Bundle](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription-notification-r4.html) werden unverändert direkt aus dem [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/index.html) genutzt.Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |

**Tabelle:**Ressourcen-Profile

### Terminologien

#### Value Sets

| | |
| :--- | :--- |
| [ FhirMimeTypeVS ](ValueSet-FhirMimeTypeVS.md) | FHIR Mime Types |
| [ ISiKSubscriptionTopic ValueSet ](ValueSet-ISiKSubscriptionTopicVS.md) | ValueSet, das alle Codes des ISiKSubscriptionTopic CodeSystems enthält |
| [ SubscriptionNotificationType ](ValueSet-subscription-notification-type.md) | The type of notification represented by the status message. |

**Tabelle:**Value Sets

#### Code Systems

| | |
| :--- | :--- |
| [ ISiK-SubscriptionTopic ](CodeSystem-ISiKSubscriptionTopic.md) | Liste der aller SubscriptionTopics, die in ISiK verwendet werden können. Neben den merge-SubscriptionTopics sind auch die SubscriptionTopics für Updates der Ressourcen enthalten, die in ISiK verwendet werden können. |
| [ MIME Types (Fragment) ](CodeSystem-MimeTypeCS.md) | Fragment des CodeSystems urn:ietf:bcp:13 mit den in ISiK relevanten MIME-Typen. |
| [ SubscriptionNotificationType ](CodeSystem-subscription-notification-type.md) | The type of notification represented by the status message. |

**Tabelle:**Code Systems

### Beispiele

**Parameters**

* [exp-params](Parameters-exp-params.md)

**Subscription**

* [PatientMergeSubscriptionExample](Subscription-PatientMergeSubscriptionExample.md)

**Tabelle:**Beispiel-Instanzen

