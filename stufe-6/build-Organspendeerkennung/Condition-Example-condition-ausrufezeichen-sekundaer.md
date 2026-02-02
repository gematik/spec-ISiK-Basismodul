# Resource Example-condition-ausrufezeichen-sekundaer



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Example-condition-ausrufezeichen-sekundaer",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/condition-related",
      "valueReference" : {
        "reference" : "Condition/Example-condition-ausrufezeichen-primaer"
      }
    }
  ],
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "recurrence"
      }
    ]
  },
  "code" : {
    "coding" : [
      {
        "extension" : [
          {
            "url" : "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen",
            "valueCoding" : {
              "system" : "http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen",
              "code" : "!"
            }
          }
        ],
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "U69.32",
        "display" : "Sekundäre Schlüsselnummern für die Art des Konsums psychotroper Substanzen bei durch diese verursachten psychischen und Verhaltensstörungen:Intravenöser Konsum sonstiger psychotroper Substanzen"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "recordedDate" : "2021-05-24",
  "note" : [
    {
      "text" : "Beispiel für eine Anmerkung"
    }
  ]
}

```
