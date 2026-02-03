# Example Observation - Linksvent-Schlagvolumenindex-Durch-Indikatorverduennung - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - Linksvent-Schlagvolumenindex-Durch-Indikatorverduennung**

## Example Observation: Example Observation - Linksvent-Schlagvolumenindex-Durch-Indikatorverduennung

Profile: [SD MII ICU Linksventrikulaerer Schlagvolumenindex Durch Indikatorverduennung](StructureDefinition-sd-mii-icu-linksventri-schlagvolumenindex-durch-indikatorverd.md)

**status**: Final

**category**: Vital Signs

**code**: Left ventricular Stroke volume index by Indicator dilution

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 40 milliliter per square meter (Details: UCUM codemL/m2 = 'mL/m2')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Linksvent-Schlagvolumenindex-Durch-Indikatorverduennung",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventri-schlagvolumenindex-durch-indikatorverd"
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
        "code" : "8791-6",
        "display" : "Left ventricular Stroke volume index by Indicator dilution"
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
    "value" : 40,
    "unit" : "milliliter per square meter",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL/m2"
  }
}

```
