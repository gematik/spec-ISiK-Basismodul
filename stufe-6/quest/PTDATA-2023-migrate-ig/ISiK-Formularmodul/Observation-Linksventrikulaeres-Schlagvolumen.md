# Example Observation - Linksventrikulaeres-Schlagvolumen - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - Linksventrikulaeres-Schlagvolumen**

## Example Observation: Example Observation - Linksventrikulaeres-Schlagvolumen

Profile: [SD MII ICU Linksventrikulaeres Schlagvolumen](StructureDefinition-sd-mii-icu-linksventrikulaeres-schlagvolumen.md)

**status**: Final

**category**: Vital Signs

**code**: Stroke volume

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 70 milliliter (Details: UCUM codemL = 'mL')

**bodySite**: Entire left cardiac ventricle



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Linksventrikulaeres-Schlagvolumen",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventrikulaeres-schlagvolumen"
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
        "code" : "90096001",
        "display" : "Stroke volume"
      },
      {
        "system" : "http://loinc.org",
        "code" : "20562-5",
        "display" : "Left ventricular Stroke volume"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150408",
        "display" : "MDC_VOL_BLD_VENT_LEFT_STROKE"
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
    "unit" : "milliliter",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL"
  },
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "244385005",
        "display" : "Entire left cardiac ventricle"
      }
    ]
  }
}

```
