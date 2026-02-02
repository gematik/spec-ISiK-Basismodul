# Resource PrimaereGonarthroseNormal



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "PrimaereGonarthroseNormal",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "remission"
      }
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
  "bodySite" : [
    {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "49076000"
        }
      ]
    }
  ],
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "encounter" : {
    "reference" : "Encounter/FachabteilungskontaktNormal"
  },
  "onsetDateTime" : "2020-09-02",
  "abatementDateTime" : "2025-01-01",
  "recordedDate" : "2024-10-21",
  "note" : [
    {
      "text" : "Patientin mit primärer Gonarthrose beidseitig (ICD M17.0), seit mehreren Jahren bestehend, in Remission seit 01.01.2025"
    }
  ]
}

```
