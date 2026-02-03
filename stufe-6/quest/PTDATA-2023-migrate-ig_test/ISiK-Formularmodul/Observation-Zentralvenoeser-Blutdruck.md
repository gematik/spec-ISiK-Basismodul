# Example Observation - Zentralvenoeser-Blutdruck - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - Zentralvenoeser-Blutdruck**

## Example Observation: Example Observation - Zentralvenoeser-Blutdruck

Profile: [SD MII ICU Zentralvenoeser Blutdruck](StructureDefinition-sd-mii-icu-zentralvenoeser-blutdruck.md)

**status**: Final

**category**: Vital Signs

**code**: Central venous pressure

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 12 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

**bodySite**: Right atrial structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Zentralvenoeser-Blutdruck",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-zentralvenoeser-blutdruck"
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
        "code" : "71420008",
        "display" : "Central venous pressure"
      },
      {
        "system" : "http://loinc.org",
        "code" : "60985-9",
        "display" : "Central venous pressure (CVP)"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150084",
        "display" : "Central venous pressure"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectivePeriod" : {
    "start" : "2019-12-23T09:30:10+01:00",
    "end" : "2019-12-23T10:30:10+01:00"
  },
  "valueQuantity" : {
    "value" : 12,
    "unit" : "millimeter Mercury column",
    "system" : "http://unitsofmeasure.org",
    "code" : "mm[Hg]"
  },
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "73829009",
        "display" : "Right atrial structure"
      }
    ]
  }
}

```
