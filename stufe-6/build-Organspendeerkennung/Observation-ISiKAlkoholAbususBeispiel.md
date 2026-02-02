# Resource ISiKAlkoholAbususBeispiel



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKAlkoholAbususBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAlkoholAbusus"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "version" : "http://snomed.info/sct/11000274103/version/20231115",
        "code" : "15167005",
        "display" : "Schädlicher Gebrauch von Alkohol"
      },
      {
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "74043-1",
        "display" : "Alcohol use disorder"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "effectiveDateTime" : "2024-01-01",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueCodeableConcept" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0532",
        "code" : "Y",
        "display" : "Yes"
      }
    ]
  }
}

```
