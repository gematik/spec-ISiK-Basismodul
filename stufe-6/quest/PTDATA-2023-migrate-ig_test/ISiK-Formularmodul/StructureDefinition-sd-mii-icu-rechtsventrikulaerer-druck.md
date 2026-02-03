# SD MII ICU Rechtsventrikulaerer Druck - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SD MII ICU Rechtsventrikulaerer Druck**

## Resource Profile: SD MII ICU Rechtsventrikulaerer Druck 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-rechtsventrikulaerer-druck | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Rechtsventrikulaerer_Druck |

 
Dieses Profil dient der spezialisierten Abbildung des rechtsventrikulären Drucks in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Rechtsventrikulaerer-Druck](Observation-Rechtsventrikulaerer-Druck.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Extended](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/sd-mii-icu-rechtsventrikulaerer-druck)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-rechtsventrikulaerer-druck.csv), [Excel](StructureDefinition-sd-mii-icu-rechtsventrikulaerer-druck.xlsx), [Schematron](StructureDefinition-sd-mii-icu-rechtsventrikulaerer-druck.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-rechtsventrikulaerer-druck",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-rechtsventrikulaerer-druck",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Rechtsventrikulaerer_Druck",
  "title" : "SD MII ICU Rechtsventrikulaerer Druck",
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
  "description" : "Dieses Profil dient der spezialisierten Abbildung des rechtsventrikulären Drucks in der Akutmedizin.",
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
        "min" : 3,
        "max" : "3"
      },
      {
        "id" : "Observation.code.coding:sct",
        "path" : "Observation.code.coding",
        "sliceName" : "sct",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "276756009"
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
          "code" : "150104"
        }
      },
      {
        "id" : "Observation.bodySite",
        "path" : "Observation.bodySite",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "53085002"
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
          "code" : "150105"
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
          "code" : "8432-7"
        }
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:sct-detailed",
        "path" : "Observation.component.code.coding",
        "sliceName" : "sct-detailed",
        "min" : 0,
        "max" : "*",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "276772001"
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
          "code" : "150106"
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
          "code" : "8377-4"
        }
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:sct-detailed",
        "path" : "Observation.component.code.coding",
        "sliceName" : "sct-detailed",
        "min" : 0,
        "max" : "*",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "276773006"
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
          "code" : "150107"
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
          "code" : "8406-1"
        }
      }
    ]
  }
}

```
