# Puls - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Puls**

## Observation: Puls

Profile: [SD MII ICU Puls](StructureDefinition-sd-mii-icu-puls.md)

**status**: Final

**category**: Vital Signs

**code**: Pulse, function

**subject**: [Patient/202](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Patient/202)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 70 beats per minute (Details: UCUM code/min = '/min')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Puls",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-puls"
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
        "code" : "8499008",
        "display" : "Pulse, function"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "149514",
        "display" : "Pulse rate"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/202"
  },
  "effectivePeriod" : {
    "start" : "2019-12-23T09:30:10+01:00",
    "end" : "2019-12-23T10:30:10+01:00"
  },
  "valueQuantity" : {
    "value" : 70,
    "unit" : "beats per minute",
    "system" : "http://unitsofmeasure.org",
    "code" : "/min"
  }
}

```
