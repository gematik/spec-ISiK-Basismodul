# Example Observation - ISiKHerzfrequenzExample - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - ISiKHerzfrequenzExample**

## Example Observation: Example Observation - ISiKHerzfrequenzExample

Profile: [ISiKHerzfrequenz](StructureDefinition-ISiKHerzfrequenz.md)

**status**: Final

**category**: Vital Signs

**code**: Herzfrequenz

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2020-10-11

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 63 per minute (Details: UCUM code/min = '/min')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKHerzfrequenzExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKHerzfrequenz"
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
        "code" : "8867-4",
        "display" : "Heart rate"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "364075005",
        "display" : "Heart rate"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "147842",
        "display" : "MDC_ECG_HEART_RATE"
      }
    ],
    "text" : "Herzfrequenz"
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
    "value" : 63,
    "unit" : "per minute",
    "system" : "http://unitsofmeasure.org",
    "code" : "/min"
  }
}

```
