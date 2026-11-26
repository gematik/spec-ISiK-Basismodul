# ISiK Subscription Termine - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Subscription Termine**

## Resource Profile: ISiK Subscription Termine 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscriptionTermin | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKSubscriptionTermin |

 
ISiK Subscription
 **Motivation** 
Die Subscription Ressource für Appointments unterstützt den Informationsaustausch von Termininformationen, die ausgehend vom Termin Repository eine Änderung erfahren haben. Hierdurch können Client-Systeme über relevante Terminänderungen informiert werden, um beispielsweise die Anzeige von Termininformationen zu aktualisieren oder Benachrichtigungen (bspw. im Fall von abgesagten Terminen) an Patienten zu senden. 
**Kompatibilität** 
Das Profil ISiKSubscriptionTermin basiert auf dem Profil ISiKSubscription, welches wiederum auf dem [Backport-Subscription Profil](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription.html) basiert. 
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. 

**Usages:**

* CapabilityStatements using this Profile: [ISiK CapabilityStatement Termin-Repository Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.md) and [CapabilityStatement für Rolle Termin Subscription](CapabilityStatement-ISiKCapabilityStatementTerminSubscriptionRolle.md)
* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/terminplanung|current/StructureDefinition/StructureDefinition-ISiKSubscriptionTermin.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKSubscriptionTermin.csv), [Excel](../StructureDefinition-ISiKSubscriptionTermin.xlsx), [Schematron](../StructureDefinition-ISiKSubscriptionTermin.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKSubscriptionTermin",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscriptionTermin",
  "version" : "6.0.0",
  "name" : "ISiKSubscriptionTermin",
  "title" : "ISiK Subscription Termine",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "ISiK Subscription  \n**Motivation**\n\nDie Subscription Ressource für Appointments unterstützt den Informationsaustausch von Termininformationen, die ausgehend vom Termin Repository eine Änderung erfahren haben.\nHierdurch können Client-Systeme über relevante Terminänderungen informiert werden, um beispielsweise die Anzeige von Termininformationen zu aktualisieren oder Benachrichtigungen (bspw. im Fall von abgesagten Terminen) an Patienten zu senden.\n\n**Kompatibilität**\n\nDas Profil ISiKSubscriptionTermin basiert auf dem Profil ISiKSubscription, welches wiederum auf dem [Backport-Subscription Profil](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription.html) basiert.\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Subscription",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscription",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Subscription",
      "path" : "Subscription"
    },
    {
      "id" : "Subscription.criteria",
      "path" : "Subscription.criteria",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKSubscriptionTopicAppointmentVS"
      }
    }]
  }
}

```
