#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKSauerstoffsaettigungArteriell](StructureDefinition-ISiKSauerstoffsaettigungArteriell.md)

**status**: Final

**category**: Vital Signs

**code**: Pulsoximetrische Sauerstoffsättigung

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2020-10-11

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 98 %(Details: UCUM code% = '%')

> **component****code**:Sauerstoffflussrate**value**: 2 Liter pro Minute(Details: UCUM codeL/min = 'L/min')

> **component****code**:Inspiratorische Sauerstoffkonzentration**value**: 50 %(Details: UCUM code% = '%')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKSauerstoffsaettigungArteriellExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKSauerstoffsaettigungArteriell"
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
        "code" : "2708-6",
        "display" : "Oxygen saturation in Arterial blood"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "442476006",
        "display" : "Arterial oxygen saturation"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150324",
        "display" : "MDC_SAT_O2_ART"
      }
    ],
    "text" : "Pulsoximetrische Sauerstoffsättigung"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2020-10-11",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 98,
    "unit" : "%",
    "system" : "http://unitsofmeasure.org",
    "code" : "%"
  },
  "component" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "3151-8",
            "display" : "Inhaled oxygen flow rate"
          },
          {
            "system" : "http://snomed.info/sct",
            "code" : "427081008",
            "display" : "Delivered oxygen flow rate"
          }
        ],
        "text" : "Sauerstoffflussrate"
      },
      "valueQuantity" : {
        "value" : 2,
        "unit" : "Liter pro Minute",
        "system" : "http://unitsofmeasure.org",
        "code" : "L/min"
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "3150-0",
            "display" : "Inhaled oxygen concentration"
          },
          {
            "system" : "http://snomed.info/sct",
            "code" : "250774007",
            "display" : "Inspired oxygen concentration"
          }
        ],
        "text" : "Inspiratorische Sauerstoffkonzentration"
      },
      "valueQuantity" : {
        "value" : 50,
        "unit" : "%",
        "system" : "http://unitsofmeasure.org",
        "code" : "%"
      }
    }
  ]
}

```
