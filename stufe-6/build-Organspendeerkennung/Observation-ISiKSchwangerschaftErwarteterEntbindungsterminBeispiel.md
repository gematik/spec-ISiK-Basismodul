# Resource ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "11779-6",
        "display" : "Delivery date Estimated from last menstrual period"
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
  "valueDateTime" : "2024-08-01"
}

```
