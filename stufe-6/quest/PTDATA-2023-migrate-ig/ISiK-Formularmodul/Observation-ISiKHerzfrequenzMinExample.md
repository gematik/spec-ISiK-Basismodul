# Example Observation - ISiKHerzfrequenzMinExample - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKHerzfrequenzMinExample**

## Example Observation: Example Observation - ISiKHerzfrequenzMinExample

Profile: [ISiKHerzfrequenz](StructureDefinition-ISiKHerzfrequenz.md)

**status**: Final

**category**: Vital Signs

**code**: Heart rate

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2024-01-15

**value**: 45 per minute (Details: UCUM code/min = '/min')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKHerzfrequenzMinExample",
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
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "effectiveDateTime" : "2024-01-15",
  "valueQuantity" : {
    "value" : 45,
    "unit" : "per minute",
    "system" : "http://unitsofmeasure.org",
    "code" : "/min"
  }
}

```
