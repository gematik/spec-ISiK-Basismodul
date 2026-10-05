# ISiKSauerstoffsaettigungArteriellMinExample - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKSauerstoffsaettigungArteriellMinExample**

## Observation: ISiKSauerstoffsaettigungArteriellMinExample

Profile: [ISiKSauerstoffsaettigungArteriell](StructureDefinition-ISiKSauerstoffsaettigungArteriell.md)

**status**: Final

**category**: Vital Signs

**code**: Oxygen saturation in Arterial blood

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2024-01-15

**value**: 85 % (Details: UCUM code% = '%')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKSauerstoffsaettigungArteriellMinExample",
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
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "effectiveDateTime" : "2024-01-15",
  "valueQuantity" : {
    "value" : 85,
    "unit" : "%",
    "system" : "http://unitsofmeasure.org",
    "code" : "%"
  }
}

```
