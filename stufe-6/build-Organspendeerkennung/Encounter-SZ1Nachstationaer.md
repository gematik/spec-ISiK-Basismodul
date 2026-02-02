# Resource SZ1Nachstationaer



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "SZ1Nachstationaer",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
    ]
  },
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "VN"
          }
        ]
      },
      "system" : "http://beispiel-krankenhaus.de/sid/besuchsnummer",
      "value" : "0123456789-3"
    }
  ],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "AMB"
  },
  "type" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/Kontaktebene",
          "code" : "abteilungskontakt"
        }
      ]
    },
    {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/kontaktart-de",
          "code" : "nachstationaer",
          "display" : "Nachstationär"
        }
      ]
    }
  ],
  "subject" : {
    "reference" : "Patient/SZ1Patient"
  },
  "period" : {
    "start" : "2024-10-14",
    "end" : "2024-10-14"
  },
  "account" : [
    {
      "reference" : "Account/SZ1DRGFall",
      "identifier" : {
        "system" : "http://beispiel-krankenhaus.de/sid/fallnummern",
        "value" : "0123456789"
      }
    }
  ]
}

```
