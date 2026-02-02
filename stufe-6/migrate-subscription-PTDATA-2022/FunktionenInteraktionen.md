# Funktionen und Interaktionen - ISiK Subscription Implementierungsleitfaden v6.0.0-rc

ISiK Subscription Implementierungsleitfaden

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* **Funktionen und Interaktionen**

## Funktionen und Interaktionen

Es gelten die in Interaktionen und der Workflow aus dem [Subscription Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/workflow.html#workflow-fhir-r4)

### Interaktionen

* Topic Discovery SOLL durch die [CapabilityStatementSubscriptionTopic-Extension](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-capabilitystatement-subscriptiontopic-canonical.html) supported werden.
* [HandShake](https://hl7.org/fhir/uv/subscriptions-backport/workflow.html#workflow-fhir-r4) MUSS unterstützt werden.
* Benachrichtigungen mittels [REST-Hook](https://hl7.org/fhir/uv/subscriptions-backport/channels.html#rest-hook-1) MÜSSEN unterstützt werden.

