# SD MII ICU Pulmonalarterieller Blutdruck - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SD MII ICU Pulmonalarterieller Blutdruck**

## Resource Profile: SD MII ICU Pulmonalarterieller Blutdruck 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-pulmonalarterieller-blutdruck | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Pulmonalarterieller_Blutdruck |

 
Dieses Profil dient der spezialisierten Abbildung des pulmonalarteriellen Blutdrucks in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Pulmonalarterieller-Blutdruck](Observation-Pulmonalarterieller-Blutdruck.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Extended](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/sd-mii-icu-pulmonalarterieller-blutdruck)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-pulmonalarterieller-blutdruck.csv), [Excel](StructureDefinition-sd-mii-icu-pulmonalarterieller-blutdruck.xlsx), [Schematron](StructureDefinition-sd-mii-icu-pulmonalarterieller-blutdruck.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-pulmonalarterieller-blutdruck",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-pulmonalarterieller-blutdruck",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Pulmonalarterieller_Blutdruck",
  "title" : "SD MII ICU Pulmonalarterieller Blutdruck",
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
  "description" : "Dieses Profil dient der spezialisierten Abbildung des pulmonalarteriellen Blutdrucks in der Akutmedizin.",
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
          "code" : "250767002"
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
          "code" : "76284-9"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:IEEE-11073",
        "path" : "Observation.code.coding",
        "sliceName" : "IEEE-11073",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101",
          "code" : "150044"
        }
      },
      {
        "id" : "Observation.bodySite",
        "path" : "Observation.bodySite",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "81040000"
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
          "code" : "150045"
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
          "code" : "8440-0"
        }
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:sct-detailed",
        "path" : "Observation.component.code.coding",
        "sliceName" : "sct-detailed",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "250768007"
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
          "code" : "150046"
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
          "code" : "8385-7"
        }
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:sct-detailed",
        "path" : "Observation.component.code.coding",
        "sliceName" : "sct-detailed",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "250769004"
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
          "code" : "150047"
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
          "code" : "8414-5"
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
          "code" : "250770003"
        }
      }
    ]
  }
}

```
