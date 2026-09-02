# ISiK MedicationRequestReplaces - ISiK Medikation Implementierungsleitfaden v6.0.0-rc

ISiK Medikation Implementierungsleitfaden

Version 6.0.0-rc - release-candidate 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ISiK MedicationRequestReplaces**

## Extension: ISiK MedicationRequestReplaces 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedicationRequestReplaces | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ExtensionISiKMedicationRequestReplaces |

Extension zur Verlinkung der Medikationsverordnung die ersetzt wurde

**Context of Use**

This extension may be used on the following element(s):

* Element ID MedicationRequest

**Usage info**

**Usages:**

* Use this Extension: [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/medikation|current/StructureDefinition/ExtensionISiKMedicationRequestReplaces)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ExtensionISiKMedicationRequestReplaces.csv), [Excel](StructureDefinition-ExtensionISiKMedicationRequestReplaces.xlsx), [Schematron](StructureDefinition-ExtensionISiKMedicationRequestReplaces.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ExtensionISiKMedicationRequestReplaces",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedicationRequestReplaces",
  "version" : "6.0.0-rc",
  "name" : "ExtensionISiKMedicationRequestReplaces",
  "title" : "ISiK MedicationRequestReplaces",
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
  "description" : "Extension zur Verlinkung der Medikationsverordnung die ersetzt wurde",
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
      "expression" : "MedicationRequest"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedicationRequestReplaces"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/MedicationRequest"]
          }
        ]
      },
      {
        "id" : "Extension.value[x].reference",
        "path" : "Extension.value[x].reference",
        "min" : 1
      }
    ]
  }
}

```
