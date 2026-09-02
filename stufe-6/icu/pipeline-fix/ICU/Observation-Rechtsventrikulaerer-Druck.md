# Rechtsventrikulaerer-Druck - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rechtsventrikulaerer-Druck**

## Observation: Rechtsventrikulaerer-Druck

Profile: [SD MII ICU Rechtsventrikulaerer Druck](StructureDefinition-sd-mii-icu-rechtsventrikulaerer-druck.md)

**status**: Final

**category**: Vital Signs

**code**: Right ventricular pressure

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100

**bodySite**: Right cardiac ventricular structure

> **component****code**: Mean right ventricular pressure**value**: 10 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: Systolic right ventricular pressure**value**: 25 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: Diastolic right ventricular pressure**value**: 5 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Rechtsventrikulaerer-Druck",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-rechtsventrikulaerer-druck"
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
        "code" : "276756009",
        "display" : "Right ventricular pressure"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150104",
        "display" : "MDC_PRESS_BLD_VENT_RIGHT"
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
        "code" : "53085002",
        "display" : "Right cardiac ventricular structure"
      }
    ]
  },
  "component" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "8478-0"
          },
          {
            "system" : "urn:iso:std:iso:11073:10101",
            "code" : "150107",
            "display" : "Mean right ventricular pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8406-1",
            "display" : "Right ventricular Intrachamber mean pressure"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 10,
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
            "code" : "8480-6"
          },
          {
            "system" : "urn:iso:std:iso:11073:10101",
            "code" : "150105",
            "display" : "Systolic right ventricular pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8432-7",
            "display" : "Right ventricular Intrachamber systolic pressure"
          },
          {
            "system" : "http://snomed.info/sct",
            "code" : "276772001",
            "display" : "Right ventricular systolic pressure"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 25,
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
            "code" : "150106",
            "display" : "Diastolic right ventricular pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8377-4",
            "display" : "Right ventricular Intrachamber diastolic pressure"
          },
          {
            "system" : "http://snomed.info/sct",
            "code" : "276773006",
            "display" : "Right ventricular diastolic pressure"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 5,
        "unit" : "millimeter Mercury column",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      }
    }
  ]
}

```
