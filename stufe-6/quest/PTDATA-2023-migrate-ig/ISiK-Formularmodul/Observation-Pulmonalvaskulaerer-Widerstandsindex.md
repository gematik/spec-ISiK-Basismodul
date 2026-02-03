# Example Observation - Pulmonalvaskulaerer-Widerstandsindex - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - Pulmonalvaskulaerer-Widerstandsindex**

## Example Observation: Example Observation - Pulmonalvaskulaerer-Widerstandsindex

Profile: [SD MII ICU Pulmonalvaskulaerer Widerstandsindex](StructureDefinition-sd-mii-icu-pulmonalvaskulaerer-widerstandsindex.md)

**status**: Final

**category**: Vital Signs

**code**: Pulmonary vascular Resistance index

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 80 dyne second per centimeter5 and square meter (Details: UCUM codedyn.s/cm5/m2 = 'dyn.s/cm5/m2')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Pulmonalvaskulaerer-Widerstandsindex",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-pulmonalvaskulaerer-widerstandsindex"
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
        "code" : "276902009",
        "display" : "Pulmonary vascular Resistance index"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8834-4",
        "display" : "Pulmonary vascular Resistance index"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "152852",
        "display" : "Pulmonary Vascular Resistance Index"
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
    "value" : 80,
    "unit" : "dyne second per centimeter5 and square meter",
    "system" : "http://unitsofmeasure.org",
    "code" : "dyn.s/cm5/m2"
  }
}

```
