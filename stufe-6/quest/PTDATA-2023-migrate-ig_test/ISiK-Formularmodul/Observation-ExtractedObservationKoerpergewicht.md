# Example Observation - ExtractedObservationKoerpergewicht - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - ExtractedObservationKoerpergewicht**

## Example Observation: Example Observation - ExtractedObservationKoerpergewicht

Profile: [ISiKKoerpergewicht](StructureDefinition-ISiKKoerpergewicht.md)

**status**: Final

**category**: Vital Signs

**code**: Body weight

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2025-08-22

**value**: 166 kg (Details: UCUM codekg = 'kg')

**derivedFrom**: [Response to Questionnaire 'https://gematik.de/fhir/isik/Questionnaire/ExampleExtractWithUnit' about '->Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)'](QuestionnaireResponse-ExampleExtractWithUnitResponse.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExtractedObservationKoerpergewicht",
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
        "code" : "29463-7"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "effectiveDateTime" : "2025-08-22",
  "valueQuantity" : {
    "value" : 166,
    "unit" : "kg",
    "system" : "http://unitsofmeasure.org",
    "code" : "kg"
  },
  "derivedFrom" : [
    {
      "reference" : "QuestionnaireResponse/ExampleExtractWithUnitResponse"
    }
  ]
}

```
