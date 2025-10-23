# FHIR-Artefakte - Test Implementation Guide v0.0.1

Implementation Guide

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

#

## Festlegungen

Dieses ISiK-Modul zur themenbasierten Ereignisbenachrichtigung in FHIR R4 basiert auf dem [Subscriptions-Backport ImplementationGuide STU1.1](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/), welcher das R5-Benachrichtigungsmodell auf FHIR R4 überträgt. Es verwendet dieselben strukturellen Konzepte wie Subscription, SubscriptionTopic (durch den Server vorgegeben, keine Nutzung der Basic Ressource), Bundle (für Benachrichtigungen) und Parameters (für Statusmeldungen).

Hinweis zur Profilkompatibilität: Die in Version 1.1.0 des Subscriptions-Backport IGs enthaltenen Profile backport-subscription-notification-r4 und backport-subscription-status-r4 weisen technische Mängel auf, die eine direkte Wiederverwendung in produktiven Systemen verhindern.

Daher wurden diese beiden Profile im Rahmen dieses Leitfadens funktionsgleich nachgebildet und unter den Bezeichnungen:

* BackportSubscriptionNotificationR4Fixed
* BackportSubscriptionStatusR4Fixed

lokal publiziert.

Diese lokalen Definitionen dienen als temporärer Ersatz und werden zukünftig durch die offiziellen HL7-Profile ersetzt, sobald eine technisch korrigierte Version des Backport-IGs veröffentlicht wurde.

Es gelten zur Umsetzung der Subscription Funktionalität CapabilityStatements (Akteure und Rollen) sowie Datenstrukturen entsprechend der folgenden Unterseiten.

