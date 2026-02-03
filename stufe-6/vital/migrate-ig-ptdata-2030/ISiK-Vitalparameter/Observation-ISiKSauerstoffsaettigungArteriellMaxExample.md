# Example Observation - ISiKSauerstoffsaettigungArteriellMaxExample - ISiK Vitalparameter Implementierungsleitfaden v6.0.0-rc

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0-rc - 6.0.0-rc 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKSauerstoffsaettigungArteriellMaxExample**

## Example Observation: Example Observation - ISiKSauerstoffsaettigungArteriellMaxExample

Profile: [ISiKSauerstoffsaettigungArteriell](StructureDefinition-ISiKSauerstoffsaettigungArteriell.md)

**status**: Final

**category**: Vital Signs

**code**: Pulsoximetrische Sauerstoffsättigung - Intensivmonitoring

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 14:30:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 100 % (Details: UCUM code% = '%')

**interpretation**: Normal

**note**: 

> 

Kontinuierliches Monitoring unter Beatmung mit 100% Sauerstoff


**bodySite**: Finger structure

**method**: Pulse oximetry

**device**: [Device/ExampleDevice](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Device/ExampleDevice)

> **component****code**: Sauerstoffflussrate**value**: 15 Liter pro Minute (Details: UCUM codeL/min = 'L/min')

> **component****code**: Inspiratorische Sauerstoffkonzentration - FiO2**value**: 100 % (Details: UCUM code% = '%')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKSauerstoffsaettigungArteriellMaxExample",
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
          "code" : "vital-signs",
          "display" : "Vital Signs"
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
    "text" : "Pulsoximetrische Sauerstoffsättigung - Intensivmonitoring"
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "effectiveDateTime" : "2024-01-15T14:30:00+01:00",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 100,
    "unit" : "%",
    "system" : "http://unitsofmeasure.org",
    "code" : "%"
  },
  "interpretation" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
          "code" : "N",
          "display" : "Normal"
        }
      ]
    }
  ],
  "note" : [
    {
      "text" : "Kontinuierliches Monitoring unter Beatmung mit 100% Sauerstoff"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "7569003",
        "display" : "Finger structure"
      }
    ]
  },
  "method" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "252465000",
        "display" : "Pulse oximetry"
      }
    ]
  },
  "device" : {
    "reference" : "Device/ExampleDevice"
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
        "value" : 15,
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
        "text" : "Inspiratorische Sauerstoffkonzentration - FiO2"
      },
      "valueQuantity" : {
        "value" : 100,
        "unit" : "%",
        "system" : "http://unitsofmeasure.org",
        "code" : "%"
      }
    }
  ]
}

```
