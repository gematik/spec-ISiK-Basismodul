# Example Observation - Linksventrikulaerer-Herzindex - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - Linksventrikulaerer-Herzindex**

## Example Observation: Example Observation - Linksventrikulaerer-Herzindex

Profile: [SD MII ICU Linksventrikulaerer Herzindex](StructureDefinition-sd-mii-icu-linksventrikulaerer-herzindex.md)

**status**: Final

**category**: Vital Signs

**code**: Cardiac index

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 3 liter per minute and square meter (Details: UCUM codeL/min/m2 = 'L/min/m2')

**bodySite**: Left cardiac ventricular structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Linksventrikulaerer-Herzindex",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventrikulaerer-herzindex"
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
        "code" : "54993008",
        "display" : "Cardiac index"
      },
      {
        "system" : "http://loinc.org",
        "code" : "75919-1",
        "display" : "Left ventricular Cardiac index"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "149772",
        "display" : "Cardiac index"
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
    "value" : 3,
    "unit" : "liter per minute and square meter",
    "system" : "http://unitsofmeasure.org",
    "code" : "L/min/m2"
  },
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "87878005",
        "display" : "Left cardiac ventricular structure"
      }
    ]
  }
}

```
