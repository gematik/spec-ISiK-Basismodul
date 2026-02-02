# Resource ExampleISiKMedikationsInformation2



## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformation2",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"
    ]
  },
  "extension" : [
    {
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedicationStatementReplaces",
      "valueReference" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformation1"
      }
    }
  ],
  "status" : "active",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament2"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectivePeriod" : {
    "start" : "2021-07-04"
  },
  "dateAsserted" : "2021-07-03",
  "dosage" : [
    {
      "timing" : {
        "repeat" : {
          "count" : 6,
          "frequency" : 1,
          "period" : 3,
          "periodUnit" : "wk"
        }
      },
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 100,
            "unit" : "mg",
            "system" : "http://unitsofmeasure.org",
            "code" : "mg"
          }
        }
      ]
    }
  ]
}

```
