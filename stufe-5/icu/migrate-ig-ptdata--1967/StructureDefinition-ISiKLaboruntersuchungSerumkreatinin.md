# ISiKLaboruntersuchungSerumkreatinin - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKLaboruntersuchungSerumkreatinin**

## Resource Profile: ISiKLaboruntersuchungSerumkreatinin 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungSerumkreatinin | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:ISiKLaboruntersuchungSerumkreatinin |

 
Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumkreatinin eines Patienten in ISiK Szenarien. 

**Usages:**

* Examples for this Profile: [Observation/ExampleISiKLaboruntersuchungSerumkreatinin1](Observation-ExampleISiKLaboruntersuchungSerumkreatinin1.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Labor Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementLaborMinimalRolle.md) and [ISiK CapabilityStatement VitalSign ICU Source Minimal Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/icu.test.ig|current/StructureDefinition/ISiKLaboruntersuchungSerumkreatinin)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.csv), [Excel](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.xlsx), [Schematron](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKLaboruntersuchungSerumkreatinin",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungSerumkreatinin",
  "version" : "0.0.1",
  "name" : "ISiKLaboruntersuchungSerumkreatinin",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumkreatinin eines Patienten in ISiK Szenarien.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "sct-concept",
      "uri" : "http://snomed.info/conceptdomain",
      "name" : "SNOMED CT Concept Domain Binding"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "sct-attr",
      "uri" : "http://snomed.org/attributebinding",
      "name" : "SNOMED CT Attribute Binding"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchung",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesSerumkreatinin"
        }
      },
      {
        "id" : "Observation.code.coding:snomed",
        "path" : "Observation.code.coding",
        "sliceName" : "snomed",
        "short" : "Primärer SNOMED CT-Code ohne Methodenbezug",
        "comment" : "Motivation 0..1 Kardinalität: Abstrakter SNOMED CT-Code ohne Methodenbezug. Weitere (SCT) Codings mit Methodenbezug sind durch das offene Slicing möglich.",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "70901006"
        }
      },
      {
        "id" : "Observation.value[x]:valueQuantity",
        "path" : "Observation.value[x]",
        "sliceName" : "valueQuantity",
        "type" : [
          {
            "code" : "Quantity"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsSerumkreatinin"
        }
      },
      {
        "id" : "Observation.referenceRange.low",
        "path" : "Observation.referenceRange.low",
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsSerumkreatinin"
        }
      },
      {
        "id" : "Observation.referenceRange.high",
        "path" : "Observation.referenceRange.high",
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsSerumkreatinin"
        }
      }
    ]
  }
}

```
