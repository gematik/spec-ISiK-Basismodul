# Example Observation - ExtractedObservationKoerpergroesse - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - ExtractedObservationKoerpergroesse**

## Example Observation: Example Observation - ExtractedObservationKoerpergroesse

Profile: [ISiKKoerpergroesse](StructureDefinition-ISiKKoerpergroesse.md)

**status**: Final

**category**: Vital Signs

**code**: Body height

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2025-08-22

**value**: 166 cm (Details: UCUM codecm = 'cm')

**derivedFrom**: [Response to Questionnaire 'https://gematik.de/fhir/isik/Questionnaire/ExampleExtractWithUnit' about '->Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)'](QuestionnaireResponse-ExampleExtractWithUnitResponse.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExtractedObservationKoerpergroesse",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergroesse"
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
        "code" : "8302-2"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "effectiveDateTime" : "2025-08-22",
  "valueQuantity" : {
    "value" : 166,
    "unit" : "cm",
    "system" : "http://unitsofmeasure.org",
    "code" : "cm"
  },
  "derivedFrom" : [
    {
      "reference" : "QuestionnaireResponse/ExampleExtractWithUnitResponse"
    }
  ]
}

```
