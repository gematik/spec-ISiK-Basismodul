# Example Observation - Sauerstoffsaettigung-im-Blut-Preduktal-durch-Pulsoxymetrie - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - Sauerstoffsaettigung-im-Blut-Preduktal-durch-Pulsoxymetrie**

## Example Observation: Example Observation - Sauerstoffsaettigung-im-Blut-Preduktal-durch-Pulsoxymetrie

Profile: [SD MII ICU Sauerstoffsaettigung Im Blut Preduktal Durch Pulsoxymetrie](StructureDefinition-sd-mii-icu-o2saettigung-im-blut-preduktal-durch-pulsoxymetrie.md)

**status**: Final

**category**: Vital Signs

**code**: Oxygen saturation in Blood Preductal by Pulse oximetry

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 96 percent (Details: UCUM code% = '%')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Sauerstoffsaettigung-im-Blut-Preduktal-durch-Pulsoxymetrie",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-o2saettigung-im-blut-preduktal-durch-pulsoxymetrie"
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
        "system" : "http://loinc.org",
        "code" : "59407-7",
        "display" : "Oxygen saturation in Blood Preductal by Pulse oximetry"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "160296",
        "display" : "Preductal SpO2"
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
    "value" : 96,
    "unit" : "percent",
    "system" : "http://unitsofmeasure.org",
    "code" : "%"
  }
}

```
