## Motivation

 Subscription ist eine FHIR Ressource um als Client-System Benachrichtigungen über Events auf dem FHIR Server zu erhalten. Der Subscription Mechanismus in FHIR R4 ist nicht geeignet um alle relevanten Events, hier im Speziellen das Mergen von Patienten, zu unterstützen. Daher basiert das ISiK Subscriptionprofil auf dem [Subscriptions R5 Backport Profil von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/StructureDefinition-backport-subscription.html).

Siehe auch: {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/UebergreifendeFestlegungen_Patient-merge.md, text:Übergreifende Festlegungen Patient-merge}}

Um als Subsystem über ein Patienten-Merge-Event informiert zu werden, KANN der FHIR Subscription Mechanismus gemäß des [Subscriptions R5 Backport IGs von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/index.html) genutzt werden.

---
