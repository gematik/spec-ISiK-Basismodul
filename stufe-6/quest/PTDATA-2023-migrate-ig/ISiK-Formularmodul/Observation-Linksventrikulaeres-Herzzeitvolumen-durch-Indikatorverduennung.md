# Example Observation - Linksventrikulaeres-Herzzeitvolumen-durch-Indikatorverduennung - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - Linksventrikulaeres-Herzzeitvolumen-durch-Indikatorverduennung**

## Example Observation: Example Observation - Linksventrikulaeres-Herzzeitvolumen-durch-Indikatorverduennung

Profile: [SD MII ICU Linksventrikulaeres Herzzeitvolumen Durch Indikatorverduennung](StructureDefinition-sd-mii-icu-linksventri-herzzeitvolumen-durch-indikatorverd.md)

**status**: Final

**category**: Vital Signs

**code**: Left ventricular Cardiac output by Indicator dilution

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 5 liter per minute (Details: UCUM codeL/min = 'L/min')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Linksventrikulaeres-Herzzeitvolumen-durch-Indikatorverduennung",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventri-herzzeitvolumen-durch-indikatorverd"
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
        "code" : "8737-9",
        "display" : "Left ventricular Cardiac output by Indicator dilution"
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
    "value" : 5,
    "unit" : "liter per minute",
    "system" : "http://unitsofmeasure.org",
    "code" : "L/min"
  }
}

```
