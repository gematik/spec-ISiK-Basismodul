# Resource ExampleISiKMedikationsListeParkinson



## Resource Content

```json
{
  "resourceType" : "List",
  "id" : "ExampleISiKMedikationsListeParkinson",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsListe"
    ]
  },
  "status" : "current",
  "mode" : "working",
  "code" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/list-example-use-codes",
        "code" : "medications"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "date" : "2024-02-20",
  "entry" : [
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson1"
      }
    },
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson2"
      }
    },
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson3"
      }
    },
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson4"
      }
    },
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson5"
      }
    }
  ]
}

```
