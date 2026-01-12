# ISiK Schwangerschaft - Erwarteter Entbindungstermin - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiK Schwangerschaft - Erwarteter Entbindungstermin**

## Resource Profile: ISiK Schwangerschaft - Erwarteter Entbindungstermin 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin | *Version*:0.0.1-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKSchwangerschaftErwarteterEntbindungstermin |

**Usages:**

* Refer to this Profile: [ISiK Schwangerschaftsstatus](StructureDefinition-ISiKSchwangerschaftsstatus.md)
* Examples for this Profile: [Observation/ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel](Observation-ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) and [CapabilityStatement für Rolle "ISiKCapabilityStatementGesundheitsstatusRolle"](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/Organspendeerkennung.test.ig|current/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.csv), [Excel](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.xlsx), [Schematron](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKSchwangerschaftErwarteterEntbindungstermin",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin",
  "version" : "0.0.1-rc",
  "name" : "ISiKSchwangerschaftErwarteterEntbindungstermin",
  "title" : "ISiK Schwangerschaft - Erwarteter Entbindungstermin",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
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
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/SchwangerschaftEtMethodeVS"
        }
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "type" : [
          {
            "code" : "dateTime"
          }
        ]
      },
      {
        "id" : "Observation.value[x]:valueDateTime",
        "path" : "Observation.value[x]",
        "sliceName" : "valueDateTime",
        "comment" : "Motivation: Eine Observation MUSS immer einen Wert enthalten",
        "min" : 1,
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
