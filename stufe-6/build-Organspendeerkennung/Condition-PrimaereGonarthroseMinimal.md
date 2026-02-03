# Resource PrimaereGonarthroseMinimal



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "PrimaereGonarthroseMinimal",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2025",
        "code" : "M17.0",
        "display" : "Primäre Gonarthrose, beidseitig"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "encounter" : {
    "reference" : "Encounter/FachabteilungskontaktNormal"
  },
  "recordedDate" : "2024-10-21"
}

```
