#  - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKKoerpergewicht](StructureDefinition-ISiKKoerpergewicht.md)

**status**: Final

**category**: Vital Signs

**code**: Body weight

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2025-08-22

**value**: 166 kg (Details: UCUM codekg = 'kg')

**derivedFrom**: [QuestionnaireResponse/ExampleExtractWithUnitResponse](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/QuestionnaireResponse/ExampleExtractWithUnitResponse)



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
