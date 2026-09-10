# Resource ExampleISiKMedikationsVerordnung2



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "ExampleISiKMedikationsVerordnung2",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerordnung"
    ]
  },
  "extension" : [
    {
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedicationRequestReplaces",
      "valueReference" : {
        "reference" : "MedicationRequest/77777"
      }
    }
  ],
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament8"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "authoredOn" : "2024-01-17",
  "requester" : {
    "reference" : "Practitioner/PractitionerWalterArzt"
  },
  "dosageInstruction" : [
    {
      "timing" : {
        "repeat" : {
          "count" : 6,
          "duration" : 6,
          "durationUnit" : "wk",
          "frequency" : 1,
          "period" : 1,
          "periodUnit" : "wk"
        }
      },
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 500,
            "unit" : "ml Infusionslösung",
            "system" : "http://unitsofmeasure.org",
            "code" : "mL"
          }
        }
      ]
    }
  ]
}

```
