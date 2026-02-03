# Resource ISiKRaucherStatusBeispiel



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKRaucherStatusBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "version" : "http://snomed.info/sct/11000274103/version/20231115",
        "code" : "77176002",
        "display" : "Smoker"
      },
      {
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "72166-2",
        "display" : "Tobacco smoking status"
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
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "LA15920-4",
        "display" : "Former smoker"
      }
    ]
  }
}

```
