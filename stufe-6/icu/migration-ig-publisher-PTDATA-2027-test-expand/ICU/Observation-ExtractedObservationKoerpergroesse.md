# ExtractedObservationKoerpergroesse - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExtractedObservationKoerpergroesse**

## Observation: ExtractedObservationKoerpergroesse

Profile: [ISiKKoerpergroesse](StructureDefinition-ISiKKoerpergroesse.md)

**status**: Final

**category**: Vital Signs

**code**: Body height

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2025-08-22

**value**: 166 cm (Details: UCUM codecm = 'cm')

**derivedFrom**: [QuestionnaireResponse/ExampleExtractWithUnitResponse](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/QuestionnaireResponse/ExampleExtractWithUnitResponse)



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
