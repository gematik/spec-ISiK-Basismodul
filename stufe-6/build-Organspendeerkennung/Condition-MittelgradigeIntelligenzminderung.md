# Resource MittelgradigeIntelligenzminderung



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "MittelgradigeIntelligenzminderung",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "active"
      }
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "F71",
        "display" : "Mittelgradige Intelligenzminderung"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "onsetDateTime" : "2019-09-02",
  "recordedDate" : "2021-01-01"
}

```
