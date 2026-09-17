# ISiKTerminCancelationReason - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKTerminCancelationReason**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKTerminCancelationReason | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKTerminCancelationReason |

 
Enthaelt alle erlaubten Gruende fuer eine Stornierung eines ISiKTermins 

 **References** 

* [ISiKTermin](StructureDefinition-ISiKTermin.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKTerminCancelationReason",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKTerminCancelationReason",
  "version" : "6.0.0",
  "name" : "ISiKTerminCancelationReason",
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
  "description" : "Enthaelt alle erlaubten Gruende fuer eine Stornierung eines ISiKTermins",
  "compose" : {
    "include" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/appointment-cancellation-reason",
      "version" : "2.1.1",
      "concept" : [{
        "code" : "pat",
        "display" : "Patient"
      },
      {
        "code" : "prov",
        "display" : "Provider"
      },
      {
        "code" : "maint",
        "display" : "Equipment Maintenance/Repair"
      },
      {
        "code" : "meds-inc",
        "display" : "Prep/Med Incomplete"
      },
      {
        "code" : "other",
        "display" : "Other"
      }]
    }]
  }
}

```
