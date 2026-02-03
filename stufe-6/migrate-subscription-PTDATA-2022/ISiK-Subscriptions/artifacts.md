# FHIR-Artefakte - ISiK Subscription Implementierungsleitfaden v6.0.0-rc

ISiK Subscription Implementierungsleitfaden

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

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

Das CapabilityStatement mit der Kennzeichnung “Expanded” dient der direkten Übersicht aller zu implementierender Interaktionen und Profile.

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

### Ressourcenprofile

| | |
| :--- | :--- |
| [ R4 Topic-Based Subscription Notification Bundle ](StructureDefinition-BackportSubscriptionNotificationR4Fixed.md) | Profil auf der FHIR-R4-Resource Bundle, um R5-ähnliche, themenbasierte Subscription-Benachrichtigungen in FHIR R4 zu ermöglichen.Dieses Profil ist funktional identisch mit `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-notification-r4`. Die Version 1.1.0 des offiziellen Profils enthält jedoch technische Fehler. Daher wurde dieses Profil lokal als temporärer Workaround nachgebildet. Es wird durch das offizielle `backport-subscription-notification-r4` Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde. |
| [ R4 Backported R5 SubscriptionStatus ](StructureDefinition-BackportSubscriptionStatusR4Fixed.md) | Profil auf der FHIR-R4-Resource Parameters zur Unterstützung themenbasierter Subscription-Benachrichtigungen in R4.Dieses Profil ist funktional identisch mit `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-status-r4`. Die Version 1.1.0 des offiziellen Profils weist jedoch technische Fehler auf. Daher wurde es hier als Workaround erneut implementiert. Diese lokale Definition wird durch das offizielle `backport-subscription-status-r4` Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde. |
| [ ISiK CapabilityStatement Imports Expectation ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |
| [ ISiKBerichtBundle ](StructureDefinition-ISiKBerichtBundle.md) | Das Document-Bundle dient dem Transport von Berichten zwischen Subsystemen im Krankenhaus. Das Bundle entspricht den Anforderungen an ein [FHIR Document Bundle](https://hl7.org/fhir/R4/documents.html) : Alle referenzierten Ressourcen müssen als Einträge im Bundle enthalten sein. Das Bundle unterstützt die Übermittlung einer menschenlesbaren Dokumentation (Narrative) und erlaubt zudem die Übernahme wichtiger Ressourcen (z. B. Diagnosen und Prozeduren), die einem Patienten und Fall (Patient, Encounter) zugeordnet sind. |
| [ ISiK Subscription ](StructureDefinition-ISiKSubscription.md) | ISiK Subscription MotivationSubscription ist eine FHIR Ressource, um als Client-System Benachrichtigungen über Events auf dem FHIR Server anzufragen. Der Subscription Mechanismus in FHIR R4 ist nicht geeignet, um alle relevanten Events (hier im Speziellen das Mergen von Patienten) zu unterstützen. Daher basiert das ISiK Subscription-Profil auf dem [Subscriptions R5 Backport Profil von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/StructureDefinition-backport-subscription.html).Um als Subsystem über ein Subsription-Event informiert zu werden, KANN der FHIR Subscription Mechanismus gemäß des [Subscriptions R5 Backport IGs von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/index.html) genutzt werden.KompatibilitätDas Profil ISiKSubscription basiert auf dem [Backport-Subscription Profil](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription.html). Der [SubscriptionStatus](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription-status-r4.html), sowie das [Subscription Notification Bundle](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription-notification-r4.html) werden unverändert direkt aus dem [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/index.html) genutzt.Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKTerminPriorityExtension ](StructureDefinition-ISiKTerminPriorityExtension.md) | Diese Extension ermöglicht die strukturierte Angabe der Dringlichkeit (Priorität) eines Termins. Dies ist wichtig, um Notfälle oder besonders dringliche Termine im Buchungs- und Verwaltungssystem deutlich zu kennzeichnen und eine priorisierte Bearbeitung zu ermöglichen. |

**Tabelle:**Ressourcenprofile

### Terminologien

#### Value Sets

Die folgenden Value Sets sind für die Audit-Event-Service-Funktionalitäten festgelegt.

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
| [ SubscriptionNotificationType ](CodeSystem-subscription-notification-type.md) | The type of notification represented by the status message. |

**Tabelle:**Code Systems

### Beispiele

**Subscription**

* [Example Subscription - PatientMergeSubscriptionExample](Subscription-PatientMergeSubscriptionExample.md)

**Tabelle:**Beispiel-Instanzen

