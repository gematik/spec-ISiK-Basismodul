# Linksatrialer-Druck - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Linksatrialer-Druck**

## Observation: Linksatrialer-Druck

Profile: [SD MII ICU Linksatrialer Druck](StructureDefinition-sd-mii-icu-linksatrialer-druck.md)

**status**: Final

**category**: Vital Signs

**code**: Left atrial pressure

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100

**bodySite**: Left atrial structure

> **component****code**: Systolic left atrial pressure**value**: 8 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: Mean left atrial pressure**value**: 6 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: Diastolic left atrial pressure**value**: 4 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Linksatrialer-Druck",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksatrialer-druck"
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
        "code" : "276760007",
        "display" : "Left atrial pressure"
      },
      {
        "system" : "http://loinc.org",
        "code" : "60988-3",
        "display" : "Left atrial pressure"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150064",
        "display" : "MDC_PRESS_BLD_ATR_LEFT"
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
        "code" : "82471001",
        "display" : "Left atrial structure"
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
            "code" : "150065",
            "display" : "Systolic left atrial pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "60989-1",
            "display" : "Left atrial pressure Systolic"
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
            "code" : "150067",
            "display" : "Mean left atrial pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8399-8",
            "display" : "Left atrial Intrachamber mean pressure"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 6,
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
            "code" : "150066",
            "display" : "Diastolic left atrial pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "75933-2",
            "display" : "Left atrial pressure Diastolic"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 4,
        "unit" : "millimeter Mercury column",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      }
    }
  ]
}

```
