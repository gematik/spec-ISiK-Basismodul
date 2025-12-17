# ISiK Schwangerschaftsstatus - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Schwangerschaftsstatus**

## Resource Profile: ISiK Schwangerschaftsstatus 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus | *Version*:0.0.1 |
| Active as of 2025-12-11 | *Computable Name*:ISiKSchwangerschaftsstatus |

 
Schwangerschaftsstatus einer Patientin 

**Usages:**

* Examples for this Profile: [Observation/ISiKSchwangerschaftsstatusBeispiel](Observation-ISiKSchwangerschaftsstatusBeispiel.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) and [CapabilityStatement für Rolle "ISiKCapabilityStatementGesundheitsstatusRolle"](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/Organspendeerkennung.test.ig|current/StructureDefinition/ISiKSchwangerschaftsstatus)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKSchwangerschaftsstatus.csv), [Excel](StructureDefinition-ISiKSchwangerschaftsstatus.xlsx), [Schematron](StructureDefinition-ISiKSchwangerschaftsstatus.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKSchwangerschaftsstatus",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus",
  "version" : "0.0.1",
  "name" : "ISiKSchwangerschaftsstatus",
  "title" : "ISiK Schwangerschaftsstatus",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-11",
  "description" : "Schwangerschaftsstatus einer Patientin",
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
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLebensZustand",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://loinc.org",
              "code" : "82810-3"
            }
          ]
        }
      },
      {
        "id" : "Observation.value[x]:valueCodeableConcept",
        "path" : "Observation.value[x]",
        "sliceName" : "valueCodeableConcept",
        "comment" : "Motivation: Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)",
        "min" : 1,
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/SchwangerschaftsstatusVS"
        }
      },
      {
        "id" : "Observation.hasMember",
        "path" : "Observation.hasMember",
        "short" : "Erwartetes Geburtsdatum",
        "comment" : "Eine Referenz auf die ErwartetesGeburtsdatum Observation",
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.hasMember.reference",
        "path" : "Observation.hasMember.reference",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
