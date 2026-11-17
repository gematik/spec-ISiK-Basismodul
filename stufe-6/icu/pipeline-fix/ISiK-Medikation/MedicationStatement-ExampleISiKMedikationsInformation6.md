# Resource ExampleISiKMedikationsInformation6



## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformation6",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"
    ]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/ifa/pzn",
        "code" : "06922060",
        "display" : "Huminsulin® Normal KwikPen™"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectivePeriod" : {
    "start" : "2024-02-20"
  },
  "dateAsserted" : "2024-02-20",
  "reasonReference" : [
    {
      "reference" : "Condition/DiagnoseDiabetesMellitus"
    }
  ],
  "dosage" : [
    {
      "patientInstruction" : "Dosierung nach BZ, gemäß Informationsblatt vom 20.02.2024",
      "timing" : {
        "repeat" : {
          "timeOfDay" : ["19:00:00"]
        }
      }
    }
  ]
}

```
