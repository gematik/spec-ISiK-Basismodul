#  - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [SD MII ICU Pulmonalarterieller Blutdruck](StructureDefinition-sd-mii-icu-pulmonalarterieller-blutdruck.md)

**status**: Final

**category**: Vital Signs

**code**: Pulmonary artery pressure

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100

**bodySite**: Pulmonary artery structure

> **component****code**: Systolic pulmonary arterial pressure**value**: 18 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: Diastolic pulmonary arterial pressure**value**: 8 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: Mean pulmonary arterial pressure**value**: 10 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Pulmonalarterieller-Blutdruck",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-pulmonalarterieller-blutdruck"
    ]
  },
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "vital-signs"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "75367002"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "250767002",
        "display" : "Pulmonary artery pressure"
      },
      {
        "system" : "http://loinc.org",
        "code" : "76284-9",
        "display" : "Pulmonary artery Blood pressure"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150044",
        "display" : "MDC_PRESS_BLD_ART_PULM"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2019-12-23T09:30:10+01:00",
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "81040000",
        "display" : "Pulmonary artery structure"
      }
    ]
  },
  "component" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "8480-6"
          },
          {
            "system" : "urn:iso:std:iso:11073:10101",
            "code" : "150045",
            "display" : "Systolic pulmonary arterial pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8440-0",
            "display" : "Pulmonary artery Systolic blood pressure"
          },
          {
            "system" : "http://snomed.info/sct",
            "code" : "250768007",
            "display" : "Pulmonary artery systolic pressure"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 18,
        "unit" : "millimeter Mercury column",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "8462-4"
          },
          {
            "system" : "urn:iso:std:iso:11073:10101",
            "code" : "150046",
            "display" : "Diastolic pulmonary arterial pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8385-7",
            "display" : "Pulmonary artery Diastolic blood pressure"
          },
          {
            "system" : "http://snomed.info/sct",
            "code" : "250769004",
            "display" : "Pulmonary artery diastolic pressure"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 8,
        "unit" : "millimeter Mercury column",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "8478-0"
          },
          {
            "system" : "urn:iso:std:iso:11073:10101",
            "code" : "150047",
            "display" : "Mean pulmonary arterial pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8414-5",
            "display" : "Pulmonary artery Mean blood pressure"
          },
          {
            "system" : "http://snomed.info/sct",
            "code" : "250770003",
            "display" : "Pulmonary artery mean pressure"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 10,
        "unit" : "millimeter Mercury column",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      }
    }
  ]
}

```
