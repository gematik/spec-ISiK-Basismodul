# Resource ISiKAllergieUnvertraeglichkeitBeispiel1



## Resource Content

```json
{
  "resourceType" : "AllergyIntolerance",
  "id" : "ISiKAllergieUnvertraeglichkeitBeispiel1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAllergieUnvertraeglichkeit"
    ]
  },
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical",
        "code" : "active"
      }
    ]
  },
  "verificationStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification",
        "code" : "confirmed"
      }
    ]
  },
  "type" : "allergy",
  "category" : ["environment"],
  "criticality" : "low",
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "256262001",
        "display" : "Betula pendula pollen"
      }
    ]
  },
  "patient" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "onsetDateTime" : "1987",
  "recordedDate" : "2011-05-12",
  "recorder" : {
    "display" : "Dr. Martin Mustermann"
  },
  "asserter" : {
    "display" : "Dr. Berta Beispiel"
  },
  "note" : [
    {
      "authorReference" : {
        "reference" : "Practitioner/PractitionerWalterArzt"
      },
      "time" : "2024-02-20T14:34:12+01:00",
      "text" : "Patientin berichtet von einer leichten Verschlimmerung in den letzten 3 Jahren."
    }
  ],
  "reaction" : [
    {
      "manifestation" : [
        {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "76067001",
              "display" : "Sneezing (finding)"
            }
          ]
        }
      ],
      "severity" : "moderate",
      "exposureRoute" : {
        "coding" : [
          {
            "system" : "http://snomed.info/sct",
            "code" : "14910006",
            "display" : "Inspiration"
          }
        ]
      }
    }
  ]
}

```
