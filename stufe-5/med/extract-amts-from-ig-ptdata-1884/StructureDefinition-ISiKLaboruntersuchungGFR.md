# ISiKLaboruntersuchungGFR - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKLaboruntersuchungGFR**

## Resource Profile: ISiKLaboruntersuchungGFR 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungGFR | *Version*:0.0.1 |
| Active as of 2025-12-17 | *Computable Name*:ISiKLaboruntersuchungGFR |

 
Dieses Profil ermöglicht die Abbildung der Laboruntersuchung GFR eines Patienten in ISiK Szenarien. 

**Usages:**

* Examples for this Profile: [Observation/ExampleISiKLaboruntersuchungGFR1](Observation-ExampleISiKLaboruntersuchungGFR1.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement AMTS Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementAMTSAkteur-expanded.md) and [ISiK CapabilityStatement Labor Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementLaborMinimalRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/amts.test.ig|current/StructureDefinition/ISiKLaboruntersuchungGFR)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKLaboruntersuchungGFR.csv), [Excel](StructureDefinition-ISiKLaboruntersuchungGFR.xlsx), [Schematron](StructureDefinition-ISiKLaboruntersuchungGFR.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKLaboruntersuchungGFR",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungGFR",
  "version" : "0.0.1",
  "name" : "ISiKLaboruntersuchungGFR",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung GFR eines Patienten in ISiK Szenarien.",
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
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesGFR"
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
          "code" : "80274001"
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
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsGFR"
        }
      },
      {
        "id" : "Observation.referenceRange.low",
        "path" : "Observation.referenceRange.low",
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsGFR"
        }
      },
      {
        "id" : "Observation.referenceRange.high",
        "path" : "Observation.referenceRange.high",
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsGFR"
        }
      }
    ]
  }
}

```
