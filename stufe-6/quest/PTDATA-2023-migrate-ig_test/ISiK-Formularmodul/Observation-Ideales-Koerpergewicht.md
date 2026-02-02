# Example Observation - Ideales-Koerpergewicht - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - Ideales-Koerpergewicht**

## Example Observation: Example Observation - Ideales-Koerpergewicht

Profile: [SD MII ICU Ideales Koerpergewicht](StructureDefinition-sd-mii-icu-ideales-koerpergewicht.md)

**status**: Final

**category**: Vital Signs

**code**: Ideal body weight

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 70 kilogram (Details: UCUM codekg = 'kg')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Ideales-Koerpergewicht",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-ideales-koerpergewicht"
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
        "code" : "170804003",
        "display" : "Ideal body weight"
      },
      {
        "system" : "http://loinc.org",
        "code" : "50064-5",
        "display" : "Ideal body weight"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "188796",
        "display" : "MDC_MASS_BODY_EST_IBW"
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
    "value" : 70,
    "unit" : "kilogram",
    "system" : "http://unitsofmeasure.org",
    "code" : "kg"
  }
}

```
