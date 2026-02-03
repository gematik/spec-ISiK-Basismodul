# ISiKStillstatus - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKStillstatus**

## Resource Profile: ISiKStillstatus 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus | *Version*:0.0.1-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKStillstatus |

 
Profil zur Abbildung ob gestillt/Muttermilch abgepumpt und gefüttert wird 

**Usages:**

* Examples for this Profile: [Observation/ISiKStillstatusBeispiel](Observation-ISiKStillstatusBeispiel.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) and [CapabilityStatement für Rolle "ISiKCapabilityStatementGesundheitsstatusRolle"](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/Organspendeerkennung.test.ig|current/StructureDefinition/ISiKStillstatus)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKStillstatus.csv), [Excel](StructureDefinition-ISiKStillstatus.xlsx), [Schematron](StructureDefinition-ISiKStillstatus.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKStillstatus",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus",
  "version" : "0.0.1-rc",
  "name" : "ISiKStillstatus",
  "title" : "ISiKStillstatus",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Profil zur Abbildung ob gestillt/Muttermilch abgepumpt und gefüttert wird",
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
        "id" : "Observation.code.coding:snomed-ct",
        "path" : "Observation.code.coding",
        "sliceName" : "snomed-ct",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "413712001"
        }
      },
      {
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "63895-7"
        }
      },
      {
        "id" : "Observation.performer",
        "path" : "Observation.performer",
        "patternReference" : {
          "reference" : "Practitioner/PractitionerWalterArzt"
        }
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Observation.value[x]:valueCodeableConcept",
        "path" : "Observation.value[x]",
        "sliceName" : "valueCodeableConcept",
        "min" : 1,
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/StillstatusVS"
        }
      }
    ]
  }
}

```
