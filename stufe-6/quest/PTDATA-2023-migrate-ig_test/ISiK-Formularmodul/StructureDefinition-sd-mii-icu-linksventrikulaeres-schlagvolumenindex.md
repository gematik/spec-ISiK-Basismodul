# SD MII ICU Linksventrikulaeres Schlagvolumenindex - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SD MII ICU Linksventrikulaeres Schlagvolumenindex**

## Resource Profile: SD MII ICU Linksventrikulaeres Schlagvolumenindex 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventrikulaeres-schlagvolumenindex | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Linksventrikulaeres_Schlagvolumenindex |

 
Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Schlagvolumenindex in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Linksventrikulaeres-Schlagvolumenindex](Observation-Linksventrikulaeres-Schlagvolumenindex.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Extended](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/sd-mii-icu-linksventrikulaeres-schlagvolumenindex)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-linksventrikulaeres-schlagvolumenindex.csv), [Excel](StructureDefinition-sd-mii-icu-linksventrikulaeres-schlagvolumenindex.xlsx), [Schematron](StructureDefinition-sd-mii-icu-linksventrikulaeres-schlagvolumenindex.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-linksventrikulaeres-schlagvolumenindex",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventrikulaeres-schlagvolumenindex",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Linksventrikulaeres_Schlagvolumenindex",
  "title" : "SD MII ICU Linksventrikulaeres Schlagvolumenindex",
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
  "description" : "Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Schlagvolumenindex in der Akutmedizin.",
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
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten",
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
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "76297-1"
        }
      },
      {
        "id" : "Observation.code.coding:IEEE-11073",
        "path" : "Observation.code.coding",
        "sliceName" : "IEEE-11073",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101",
          "code" : "150636"
        }
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "patternQuantity" : {
          "unit" : "milliliter per square meter",
          "system" : "http://unitsofmeasure.org",
          "code" : "mL/m2"
        }
      },
      {
        "id" : "Observation.value[x].unit",
        "path" : "Observation.value[x].unit",
        "min" : 1
      },
      {
        "id" : "Observation.bodySite",
        "path" : "Observation.bodySite",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "87878005"
            }
          ]
        }
      }
    ]
  }
}

```
