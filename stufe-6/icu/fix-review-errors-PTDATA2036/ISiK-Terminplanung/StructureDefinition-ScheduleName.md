# ScheduleName - ISiK Terminplanung Implementierungsleitfaden v6.0.0-rc

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ScheduleName**

## Extension: ScheduleName 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.org/fhir/5.0/StructureDefinition/extension-Schedule.name | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ScheduleName |

Diese Erweiterung ermöglicht es, einem FHIR Schedule (Kalender) einen menschenlesbaren Namen zuzuweisen, der eine schnelle Identifikation und Unterscheidung mehrerer Kalender in Terminplanungsanwendungen erlaubt. Der Name dient zur besseren Übersichtlichkeit, z. B. bei der Auswahl eines Kalenders durch Nutzer oder in Verwaltungsoberflächen für Terminressourcen.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Schedule

**Usage info**

**Usages:**

* Use this Extension: [ISiKKalender](StructureDefinition-ISiKKalender.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/terminplanung|current/StructureDefinition/ScheduleName)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ScheduleName.csv), [Excel](StructureDefinition-ScheduleName.xlsx), [Schematron](StructureDefinition-ScheduleName.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ScheduleName",
  "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Schedule.name",
  "version" : "6.0.0-rc",
  "name" : "ScheduleName",
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
  "description" : "Diese Erweiterung ermöglicht es, einem FHIR Schedule (Kalender) einen menschenlesbaren Namen zuzuweisen, der eine schnelle Identifikation und Unterscheidung mehrerer Kalender in Terminplanungsanwendungen erlaubt. Der Name dient zur besseren Übersichtlichkeit, z. B. bei der Auswahl eines Kalenders durch Nutzer oder in Verwaltungsoberflächen für Terminressourcen.",
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
      "expression" : "Schedule"
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
        "fixedUri" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Schedule.name"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "string"
          }
        ]
      }
    ]
  }
}

```
