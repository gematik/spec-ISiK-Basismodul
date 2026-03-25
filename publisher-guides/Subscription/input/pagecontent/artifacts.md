---
topic: ImplementationGuide-markdown-Artifacts
---

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden. Test

Dieses ISiK-Modul zur themenbasierten Ereignisbenachrichtigung in FHIR R4 basiert auf dem
[Subscriptions-Backport ImplementationGuide STU1.1](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/),
welcher das R5-Benachrichtigungsmodell auf FHIR R4
überträgt. Es verwendet dieselben strukturellen Konzepte wie Subscription, SubscriptionTopic (durch
den Server vorgegeben, keine Nutzung der Basic Ressource), Bundle (für Benachrichtigungen) und
Parameters (für Statusmeldungen).

Hinweis zur Profilkompatibilität:
Die in Version 1.1.0 des Subscriptions-Backport IGs enthaltenen Profile 
backport-subscription-notification-r4 und backport-subscription-status-r4 weisen technische Mängel
auf, die eine direkte Wiederverwendung in produktiven Systemen verhindern.

Daher wurden diese beiden Profile im Rahmen dieses Leitfadens funktionsgleich nachgebildet und unter
den Bezeichnungen:

* BackportSubscriptionNotificationR4Fixed
* BackportSubscriptionStatusR4Fixed

lokal publiziert.

Diese lokalen Definitionen dienen als temporärer Ersatz und werden zukünftig durch die offiziellen
HL7-Profile ersetzt, sobald eine technisch korrigierte Version des Backport-IGs veröffentlicht
wurde.

Es gelten zur Umsetzung der Subscription Funktionalität CapabilityStatements (Akteure und Rollen)
sowie Datenstrukturen entsprechend der folgenden Seite.

### CapabilityStatements

#### Akteure

Das CapabilityStatement mit der Kennzeichnung "Expanded" dient der direkten Übersicht aller zu implementierender Interaktionen und Profile.

{% include artifacts-table-generator-isik.html resourceType="CapabilityStatement" nameContains="Akteur" withPurpose=true %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements - Akteure</figcaption></div>

#### Rollen

{% include artifacts-table-generator-isik.html resourceType="CapabilityStatement" nameContains="Rolle" withPurpose=true %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements - Rollen</figcaption></div>

### Ressourcenprofile

{% include artifacts-table-generator-isik.html resourceType="StructureDefinition" %}
<div><figcaption><strong>Tabelle:</strong> Ressourcenprofile</figcaption></div>

### Terminologien

#### Value Sets


{% include artifacts-table-generator.html resourceType="ValueSet" %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>

#### Code Systems

{% include artifacts-table-generator.html resourceType="CodeSystem" %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>

### Beispiele

{% include example-list-generator.html %}
<div><figcaption><strong>Tabelle:</strong> Beispiel-Instanzen</figcaption></div>

