# Example Observation - Koerpertemperatur-Kern - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - Koerpertemperatur-Kern**

## Example Observation: Example Observation - Koerpertemperatur-Kern

Profile: [SD MII ICU Koerpertemperatur Kern](StructureDefinition-sd-mii-icu-koerpertemperatur-kern.md)

**status**: Final

**category**: Vital Signs

**code**: Body temperature

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 37 degree Celsius (Details: UCUM codeCel = 'Cel')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Koerpertemperatur-Kern",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-kern"
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
        "code" : "8310-5",
        "display" : "Body temperature"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "276885007",
        "display" : "Core body temperature"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150364"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150368",
        "display" : "Body temperature - Core"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8329-5",
        "display" : "Body temperature - Core"
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
  }
}

```
