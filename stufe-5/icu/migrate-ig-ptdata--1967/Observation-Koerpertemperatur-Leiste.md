#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [SD MII ICU Koerpertemperatur Leiste](StructureDefinition-sd-mii-icu-koerpertemperatur-leiste.md)

**status**: Final

**category**: Vital Signs

**code**: Estimated core body temperature measured in inguinal region

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 37 degree Celsius(Details: UCUM codeCel = 'Cel')

**bodySite**: Inguinal region structure (body structure)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Koerpertemperatur-Leiste",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-leiste"
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
        "code" : "8310-5"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "415929009",
        "display" : "Estimated core body temperature measured in inguinal region"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8329-5"
      },
      {
        "system" : "http://loinc.org",
        "code" : "104063-3",
        "display" : "Body temperature - Groin"
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
        "code" : "26893007",
        "display" : "Inguinal region structure (body structure)"
      }
    ]
  }
}

```
