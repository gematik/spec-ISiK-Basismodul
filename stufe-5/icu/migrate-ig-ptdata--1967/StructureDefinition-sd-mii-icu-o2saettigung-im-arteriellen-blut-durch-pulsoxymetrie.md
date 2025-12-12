# SD MII ICU Sauerstoffsaettigung Im Arteriellen Blut Durch Pulsoxymetrie - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SD MII ICU Sauerstoffsaettigung Im Arteriellen Blut Durch Pulsoxymetrie**

## Resource Profile: SD MII ICU Sauerstoffsaettigung Im Arteriellen Blut Durch Pulsoxymetrie 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:SD_MII_ICU_Sauerstoffsaettigung_Im_Arteriellen_Blut_Durch_Pulsoxymetrie |

 
Dieses Profil dient der spezialisierten Abbildung der Sauerstoffsättigung im arteriellen Blut durch Pulsoxymetrie in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Sauerstoffsaettigung-im-Arteriellen-Blut-durch-Pulsoxymetrie](Observation-Sauerstoffsaettigung-im-Arteriellen-Blut-durch-Pulsoxymetrie.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement VitalSign ICU Source Minimal Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/icu.test.ig|current/StructureDefinition/sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie.csv), [Excel](StructureDefinition-sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie.xlsx), [Schematron](StructureDefinition-sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie",
  "version" : "0.0.1",
  "name" : "SD_MII_ICU_Sauerstoffsaettigung_Im_Arteriellen_Blut_Durch_Pulsoxymetrie",
  "title" : "SD MII ICU Sauerstoffsaettigung Im Arteriellen Blut Durch Pulsoxymetrie",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "description" : "Dieses Profil dient der spezialisierten Abbildung der Sauerstoffsättigung im arteriellen Blut durch Pulsoxymetrie in der Akutmedizin.",
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
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "min" : 4
      },
      {
        "id" : "Observation.code.coding:sct",
        "path" : "Observation.code.coding",
        "sliceName" : "sct",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "442476006"
        }
      },
      {
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "59408-5"
        }
      },
      {
        "id" : "Observation.code.coding:IEEE-11073",
        "path" : "Observation.code.coding",
        "sliceName" : "IEEE-11073",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101",
          "code" : "150324"
        }
      },
      {
        "id" : "Observation.code.coding:loinc-fhir-core",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc-fhir-core",
        "short" : "Magic Loinc Value Sauerstoffsättigung",
        "comment" : "**Begründung Pflichtfeld:** Die Angabe des magic Loinc Wertes für die Sauerstoffsättigung ist laut FHIR-Core-Spezifikation verpflichtend.",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "2708-6"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:loinc-fhir-core.system",
        "path" : "Observation.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:loinc-fhir-core.code",
        "path" : "Observation.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "patternQuantity" : {
          "unit" : "percent",
          "system" : "http://unitsofmeasure.org",
          "code" : "%"
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
              "code" : "11527006"
            }
          ]
        }
      },
      {
        "id" : "Observation.bodySite.coding",
        "path" : "Observation.bodySite.coding",
        "mustSupport" : true
      },
      {
        "id" : "Observation.bodySite.coding.system",
        "path" : "Observation.bodySite.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.bodySite.coding.code",
        "path" : "Observation.bodySite.coding.code",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
