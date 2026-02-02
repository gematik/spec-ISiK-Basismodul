# Resource SZ2Encounter



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "SZ2Encounter",
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
      "value" : "222222222-2"
    }
  ],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP"
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
          "code" : "normalstationaer",
          "display" : "Normalstationär"
        }
      ]
    }
  ],
  "subject" : {
    "reference" : "Patient/SZ2Patient"
  },
  "period" : {
    "start" : "2024-10-07",
    "end" : "2024-10-10"
  },
  "account" : [
    {
      "reference" : "Account/SZ2DRGFall",
      "identifier" : {
        "system" : "http://beispiel-krankenhaus.de/sid/fallnummern",
        "value" : "22222222222"
      }
    }
  ]
}

```
