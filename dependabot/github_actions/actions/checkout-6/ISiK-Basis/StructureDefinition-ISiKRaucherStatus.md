# ISiK Raucherstatus - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiK Raucherstatus**

## Resource Profile: ISiK Raucherstatus 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKRaucherStatus |

 
Dieses Profil dient der Abbildung des Raucherstatus von Patienten. 

**Usages:**

* Examples for this Profile: [Observation/ISiKRaucherStatusBeispiel](Observation-ISiKRaucherStatusBeispiel.md)
* CapabilityStatements using this Profile: [Akteur ISiKCapabilityStatementBasisServerAkteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) and [CapabilityStatement für Rolle ISiKCapabilityStatementGesundheitsstatusRolle](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/basis|current/StructureDefinition/ISiKRaucherStatus)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKRaucherStatus.csv), [Excel](StructureDefinition-ISiKRaucherStatus.xlsx), [Schematron](StructureDefinition-ISiKRaucherStatus.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKRaucherStatus",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus",
  "version" : "6.0.0-rc",
  "name" : "ISiKRaucherStatus",
  "title" : "ISiK Raucherstatus",
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
  "description" : "Dieses Profil dient der Abbildung des Raucherstatus von Patienten.",
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
        "id" : "Observation.category",
        "path" : "Observation.category",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
              "code" : "social-history"
            }
          ]
        }
      },
      {
        "id" : "Observation.code.coding:snomed-ct",
        "path" : "Observation.code.coding",
        "sliceName" : "snomed-ct",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "77176002"
        }
      },
      {
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "72166-2"
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
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/current-smoking-status-uv-ips"
        }
      }
    ]
  }
}

```
