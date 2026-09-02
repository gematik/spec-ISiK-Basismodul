# ISiKEKGMinExample - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKEKGMinExample**

## Observation: ISiKEKGMinExample

Profile: [ISiKEKG](StructureDefinition-ISiKEKG.md)

**status**: Final

**category**: Procedure

**code**: EKG-Bericht

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2024-01-15

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | Lead I | Origin: 2048 , Dimensions: 1 , Data: 2048 2048 2048 2048 2048 |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKEKGMinExample",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKEKG"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "procedure"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "11524-6",
      "display" : "EKG-Bericht"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "effectiveDateTime" : "2024-01-15",
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "272729005",
        "display" : "Lead I"
      }]
    },
    "valueSampledData" : {
      "origin" : {
        "value" : 2048
      },
      "period" : 10,
      "dimensions" : 1,
      "data" : "2048 2048 2048 2048 2048"
    }
  }]
}

```
