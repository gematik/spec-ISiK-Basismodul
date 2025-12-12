#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [SD MII ICU Sauerstoffsaettigung Im Arteriellen Blut Durch Pulsoxymetrie](StructureDefinition-sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie.md)

**status**: Final

**category**: Vital Signs

**code**: Arterial oxygen saturation

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 98 percent(Details: UCUM code% = '%')

**bodySite**: Arterial system structure (body structure)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Sauerstoffsaettigung-im-Arteriellen-Blut-durch-Pulsoxymetrie",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie"
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
        "code" : "442476006",
        "display" : "Arterial oxygen saturation"
      },
      {
        "system" : "http://loinc.org",
        "code" : "59408-5",
        "display" : "Oxygen saturation in Arterial blood by Pulse oximetry"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150324",
        "display" : "MDC_SAT_O2_ART"
      },
      {
        "system" : "http://loinc.org",
        "code" : "2708-6"
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
    "value" : 98,
    "unit" : "percent",
    "system" : "http://unitsofmeasure.org",
    "code" : "%"
  },
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "11527006",
        "display" : "Arterial system structure (body structure)"
      }
    ]
  }
}

```
