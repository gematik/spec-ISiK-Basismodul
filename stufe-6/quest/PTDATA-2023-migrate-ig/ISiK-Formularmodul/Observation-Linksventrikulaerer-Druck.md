# Example Observation - Linksventrikulaerer-Druck - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - Linksventrikulaerer-Druck**

## Example Observation: Example Observation - Linksventrikulaerer-Druck

Profile: [SD MII ICU Linksventrikulaerer Druck](StructureDefinition-sd-mii-icu-linksventrikulaerer-druck.md)

**status**: Final

**code**: Left ventricular pressure

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100

> **component****code**: Mean left ventricular pressure**value**: 40 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: Systolic left ventricular pressure**value**: 120 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: Diastolic left ventricular pressure**value**: 10 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Linksventrikulaerer-Druck",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventrikulaerer-druck"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "75367002"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "276769008",
        "display" : "Left ventricular pressure"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150100",
        "display" : "MDC_PRESS_BLD_VENT_LEFT"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2019-12-23T09:30:10+01:00",
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
            "code" : "150103",
            "display" : "Mean left ventricular pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8404-6",
            "display" : "Left ventricular Intrachamber mean pressure"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 40,
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
            "code" : "150101",
            "display" : "Systolic left ventricular pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8430-1",
            "display" : "Left ventricular Intrachamber systolic pressure"
          },
          {
            "system" : "http://snomed.info/sct",
            "code" : "276780008",
            "display" : "Left ventricular systolic pressure"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 120,
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
            "code" : "150102",
            "display" : "Diastolic left ventricular pressure"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8375-8",
            "display" : "Left ventricular Intrachamber diastolic pressure"
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
