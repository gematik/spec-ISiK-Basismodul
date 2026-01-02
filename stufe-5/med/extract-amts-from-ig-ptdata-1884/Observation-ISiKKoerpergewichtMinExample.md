#  - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKKoerpergewicht](StructureDefinition-ISiKKoerpergewicht.md)

**status**: Final

**category**: Vital Signs

**code**: Body weight

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2024-01-15

**value**: 2.1 kilogram(Details: UCUM codekg = 'kg')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKoerpergewichtMinExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergewicht"
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
        "code" : "29463-7",
        "display" : "Body weight"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "effectiveDateTime" : "2024-01-15",
  "valueQuantity" : {
    "value" : 2.1,
    "unit" : "kilogram",
    "system" : "http://unitsofmeasure.org",
    "code" : "kg"
  }
}

```
