# Example Observation - Koerpertemperatur-Halswirbelsaeule - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - Koerpertemperatur-Halswirbelsaeule**

## Example Observation: Example Observation - Koerpertemperatur-Halswirbelsaeule

Profile: [SD MII ICU Koerpertemperatur Halswirbelsaeule](StructureDefinition-sd-mii-icu-koerpertemperatur-halswirbelsaeule.md)

**status**: Final

**category**: Vital Signs

**code**: Temperature of cervical spine

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 37 degree Celsius (Details: UCUM codeCel = 'Cel')

**bodySite**: Structure of cervical vertebral column (body structure)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Koerpertemperatur-Halswirbelsaeule",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-halswirbelsaeule"
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
        "code" : "364419004",
        "display" : "Temperature of cervical spine"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8310-5"
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
    "value" : 37,
    "unit" : "degree Celsius",
    "system" : "http://unitsofmeasure.org",
    "code" : "Cel"
  },
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "122494005",
        "display" : "Structure of cervical vertebral column (body structure)"
      }
    ]
  }
}

```
