# ISiKTerminPriorityExtension - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKTerminPriorityExtension**

## Extension: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminPriorityExtension | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKTerminPriorityExtension |

Diese Extension ermöglicht die strukturierte Angabe der Dringlichkeit (Priorität) eines Termins. Dies ist wichtig, um Notfälle oder besonders dringliche Termine im Buchungs- und Verwaltungssystem deutlich zu kennzeichnen und eine priorisierte Bearbeitung zu ermöglichen.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [ISiKTermin](StructureDefinition-ISiKTermin.md)
* Examples for this Extension: [Appointment/ISiKTerminExample](Appointment-ISiKTerminExample.md) and [Appointment/ISiKTerminExampleExtendedICU](Appointment-ISiKTerminExampleExtendedICU.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/terminplanung|current/StructureDefinition/StructureDefinition-ISiKTerminPriorityExtension.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKTerminPriorityExtension.csv), [Excel](../StructureDefinition-ISiKTerminPriorityExtension.xlsx), [Schematron](../StructureDefinition-ISiKTerminPriorityExtension.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKTerminPriorityExtension",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminPriorityExtension",
  "version" : "6.0.0",
  "name" : "ISiKTerminPriorityExtension",
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
  "description" : "Diese Extension ermöglicht die strukturierte Angabe der Dringlichkeit (Priorität) eines Termins. Dies ist wichtig, um Notfälle oder besonders dringliche Termine im Buchungs- und Verwaltungssystem deutlich zu kennzeichnen und eine priorisierte Bearbeitung zu ermöglichen.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Appointment.priority"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminPriorityExtension"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKTerminPriority"
      }
    }]
  }
}

```
