# Resource ISiKStillstatusBeispiel



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKStillstatusBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "version" : "http://snomed.info/sct/11000274103/version/20231115",
        "code" : "413712001",
        "display" : "Breastfeeding (mother)"
      },
      {
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "63895-7",
        "display" : "Breastfeeding status"
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
        "code" : "LA29252-6",
        "display" : "Currently breastfeeding"
      }
    ]
  }
}

```
