# Example Observation - ISiKKopfumfangMinExample - ISiK Vitalparameter Implementierungsleitfaden v6.0.0-rc

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0-rc - 6.0.0-rc 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKKopfumfangMinExample**

## Example Observation: Example Observation - ISiKKopfumfangMinExample

Profile: [ISiKKopfumfang](StructureDefinition-ISiKKopfumfang.md)

**status**: Final

**category**: Vital Signs

**code**: Head Occipital-frontal circumference

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2024-01-15

**value**: 32.5 Centimeter (Details: UCUM codecm = 'cm')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKopfumfangMinExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKopfumfang"
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
        "code" : "9843-4",
        "display" : "Head Occipital-frontal circumference"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "effectiveDateTime" : "2024-01-15",
  "valueQuantity" : {
    "value" : 32.5,
    "unit" : "Centimeter",
    "system" : "http://unitsofmeasure.org",
    "code" : "cm"
  }
}

```
