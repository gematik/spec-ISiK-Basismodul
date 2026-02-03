# SD MII ICU Intrakranieller Druck ICP - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SD MII ICU Intrakranieller Druck ICP**

## Resource Profile: SD MII ICU Intrakranieller Druck ICP 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-intrakranieller-druck-icp | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Intrakranieller_Druck_Icp |

 
Dieses Profil dient der spezialisierten Abbildung des intrakraniellen Drucks (ICP) in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Intrakranieller-Druck-ICP](Observation-Intrakranieller-Druck-ICP.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Vitalparameter Server Extended (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ICU|current/StructureDefinition/sd-mii-icu-intrakranieller-druck-icp)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-intrakranieller-druck-icp.csv), [Excel](StructureDefinition-sd-mii-icu-intrakranieller-druck-icp.xlsx), [Schematron](StructureDefinition-sd-mii-icu-intrakranieller-druck-icp.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-intrakranieller-druck-icp",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-intrakranieller-druck-icp",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Intrakranieller_Druck_Icp",
  "title" : "SD MII ICU Intrakranieller Druck ICP",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil dient der spezialisierten Abbildung des intrakraniellen Drucks (ICP) in der Akutmedizin.",
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
        "min" : 3
      },
      {
        "id" : "Observation.code.coding:sct",
        "path" : "Observation.code.coding",
        "sliceName" : "sct",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "250844005"
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
          "code" : "60956-0"
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
          "code" : "153608"
        }
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "patternQuantity" : {
          "unit" : "millimeter Mercury column",
          "system" : "http://unitsofmeasure.org",
          "code" : "mm[Hg]"
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
              "code" : "731998000"
            }
          ]
        }
      }
    ]
  }
}

```
