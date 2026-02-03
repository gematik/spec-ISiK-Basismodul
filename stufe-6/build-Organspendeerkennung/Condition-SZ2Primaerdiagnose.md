# Resource SZ2Primaerdiagnose



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "SZ2Primaerdiagnose",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "code" : {
    "coding" : [
      {
        "extension" : [
          {
            "url" : "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen",
            "valueCoding" : {
              "system" : "http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen",
              "code" : "†"
            }
          }
        ],
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "E10.30",
        "display" : "Diabetes mellitus, Typ 1: Mit Augenkomplikationen: Nicht als entgleist bezeichnet"
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
