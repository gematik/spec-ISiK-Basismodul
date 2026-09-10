# Resource ExampleISiKMedikationsInformation3



## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformation3",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"
    ]
  },
  "status" : "active",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament8"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectivePeriod" : {
    "start" : "2024-01-22",
    "end" : "2024-02-26"
  },
  "dateAsserted" : "2024-01-17",
  "dosage" : [
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
