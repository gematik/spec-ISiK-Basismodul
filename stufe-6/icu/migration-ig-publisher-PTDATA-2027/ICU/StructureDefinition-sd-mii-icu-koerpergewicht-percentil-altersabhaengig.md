# SD MII ICU Koerpergewicht Percentil Altersabhaengig - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SD MII ICU Koerpergewicht Percentil Altersabhaengig**

## Resource Profile: SD MII ICU Koerpergewicht Percentil Altersabhaengig 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpergewicht-percentil-altersabhaengig | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Koerpergewicht_Percentil_Altersabhaengig |

 
Dieses Profil dient der spezialisierten Abbildung des altersabhängigen Körpergewicht-Perzentils in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Koerpergewicht-Percentile-altersabhaengig](Observation-Koerpergewicht-Percentile-altersabhaengig.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Vitalparameter Server Extended (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ICU|current/StructureDefinition/sd-mii-icu-koerpergewicht-percentil-altersabhaengig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-koerpergewicht-percentil-altersabhaengig.csv), [Excel](StructureDefinition-sd-mii-icu-koerpergewicht-percentil-altersabhaengig.xlsx), [Schematron](StructureDefinition-sd-mii-icu-koerpergewicht-percentil-altersabhaengig.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-koerpergewicht-percentil-altersabhaengig",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpergewicht-percentil-altersabhaengig",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Koerpergewicht_Percentil_Altersabhaengig",
  "title" : "SD MII ICU Koerpergewicht Percentil Altersabhaengig",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil dient der spezialisierten Abbildung des altersabhängigen Körpergewicht-Perzentils in der Akutmedizin.",
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
        "id" : "Observation.category:sct",
        "path" : "Observation.category",
        "sliceName" : "sct",
        "min" : 0,
        "max" : "*",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "248326004"
            }
          ]
        }
      },
      {
        "id" : "Observation.category:sct.coding",
        "path" : "Observation.category.coding",
        "mustSupport" : true
      },
      {
        "id" : "Observation.category:sct.coding.system",
        "path" : "Observation.category.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.category:sct.coding.code",
        "path" : "Observation.category.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "min" : 2
      },
      {
        "id" : "Observation.code.coding:sct",
        "path" : "Observation.code.coding",
        "sliceName" : "sct",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1153592008"
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
          "code" : "8336-0"
        }
      },
      {
        "id" : "Observation.code.coding:IEEE-11073",
        "path" : "Observation.code.coding",
        "sliceName" : "IEEE-11073",
        "max" : "0"
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
      }
    ]
  }
}

```
