# SD MII ICU Rechtsatrialer Druck - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SD MII ICU Rechtsatrialer Druck**

## Resource Profile: SD MII ICU Rechtsatrialer Druck 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-rechtsatrialer-druck | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Rechtsatrialer_Druck |

 
Dieses Profil dient der spezialisierten Abbildung des rechtsatrialen Drucks in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Rechtsatrialer-Druck](Observation-Rechtsatrialer-Druck.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Vitalparameter Server Extended (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Extended](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ICU|current/StructureDefinition/sd-mii-icu-rechtsatrialer-druck)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-rechtsatrialer-druck.csv), [Excel](StructureDefinition-sd-mii-icu-rechtsatrialer-druck.xlsx), [Schematron](StructureDefinition-sd-mii-icu-rechtsatrialer-druck.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-rechtsatrialer-druck",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-rechtsatrialer-druck",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Rechtsatrialer_Druck",
  "title" : "SD MII ICU Rechtsatrialer Druck",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil dient der spezialisierten Abbildung des rechtsatrialen Drucks in der Akutmedizin.",
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
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-sonstige-pulsatile-druecke-generisch",
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
              "code" : "vital-signs"
            }
          ]
        }
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "min" : 4,
        "max" : "4"
      },
      {
        "id" : "Observation.code.coding:sct",
        "path" : "Observation.code.coding",
        "sliceName" : "sct",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "276755008"
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
          "code" : "60996-6"
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
          "code" : "150068"
        }
      },
      {
        "id" : "Observation.bodySite",
        "path" : "Observation.bodySite",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "73829009"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:SystolicBP",
        "path" : "Observation.component",
        "sliceName" : "SystolicBP"
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:IEEE-11073",
        "path" : "Observation.component.code.coding",
        "sliceName" : "IEEE-11073",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101",
          "code" : "150069"
        }
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:loinc-detailed",
        "path" : "Observation.component.code.coding",
        "sliceName" : "loinc-detailed",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "60998-2"
        }
      },
      {
        "id" : "Observation.component:DiastolicBP",
        "path" : "Observation.component",
        "sliceName" : "DiastolicBP"
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:IEEE-11073",
        "path" : "Observation.component.code.coding",
        "sliceName" : "IEEE-11073",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101",
          "code" : "150070"
        }
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:loinc-detailed",
        "path" : "Observation.component.code.coding",
        "sliceName" : "loinc-detailed",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "60997-4"
        }
      },
      {
        "id" : "Observation.component:meanBP",
        "path" : "Observation.component",
        "sliceName" : "meanBP"
      },
      {
        "id" : "Observation.component:meanBP.code.coding:IEEE-11073",
        "path" : "Observation.component.code.coding",
        "sliceName" : "IEEE-11073",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101",
          "code" : "150071"
        }
      },
      {
        "id" : "Observation.component:meanBP.code.coding:loinc-detailed",
        "path" : "Observation.component.code.coding",
        "sliceName" : "loinc-detailed",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "8400-4"
        }
      },
      {
        "id" : "Observation.component:meanBP.code.coding:sct-detailed",
        "path" : "Observation.component.code.coding",
        "sliceName" : "sct-detailed",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "276775004"
        }
      }
    ]
  }
}

```
