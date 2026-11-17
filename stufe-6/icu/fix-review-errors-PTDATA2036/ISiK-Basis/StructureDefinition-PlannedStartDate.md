# PlannedStartDate - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **PlannedStartDate**

## Extension: PlannedStartDate 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:PlannedStartDate |

Diese Extension dient der Erfassung des geplanten Startzeitpunkts (dateTime) eines Encounters, z. B. einer stationären Aufnahme, Operation oder eines Termins. Sie ermöglicht eine strukturierte Terminplanung, erleichtert die Koordination verschiedener Versorgungsprozesse und verbessert die Kommunikation zwischen Systemen und Leistungserbringern.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Encounter

**Usage info**

**Usages:**

* Use this Extension: [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/basis|current/StructureDefinition/PlannedStartDate)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-PlannedStartDate.csv), [Excel](StructureDefinition-PlannedStartDate.xlsx), [Schematron](StructureDefinition-PlannedStartDate.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "PlannedStartDate",
  "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate",
  "version" : "6.0.0-rc",
  "name" : "PlannedStartDate",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "Diese Extension dient der Erfassung des geplanten Startzeitpunkts (dateTime) eines Encounters, z. B. einer stationären Aufnahme, Operation oder eines Termins. Sie ermöglicht eine strukturierte Terminplanung, erleichtert die Koordination verschiedener Versorgungsprozesse und verbessert die Kommunikation zwischen Systemen und Leistungserbringern.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Encounter"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "dateTime"
          }
        ]
      }
    ]
  }
}

```
