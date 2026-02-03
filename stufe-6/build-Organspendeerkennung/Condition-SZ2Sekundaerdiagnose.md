# Resource SZ2Sekundaerdiagnose



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "SZ2Sekundaerdiagnose",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/condition-related",
      "valueReference" : {
        "reference" : "Condition/SZ2Primaerdiagnose"
      }
    }
  ],
  "code" : {
    "coding" : [
      {
        "extension" : [
          {
            "url" : "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen",
            "valueCoding" : {
              "system" : "http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen",
              "code" : "*"
            }
          }
        ],
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "H36.0",
        "display" : "Retinopathia diabetica"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/SZ2Patient"
  },
  "encounter" : {
    "reference" : "Encounter/SZ2Encounter"
  },
  "recordedDate" : "2024-11-05"
}

```
