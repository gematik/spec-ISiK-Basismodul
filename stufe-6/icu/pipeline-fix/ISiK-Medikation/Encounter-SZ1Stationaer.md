# Resource SZ1Stationaer



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "SZ1Stationaer",
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
      "value" : "0123456789-2"
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
    "reference" : "Patient/SZ1Patient"
  },
  "period" : {
    "start" : "2024-10-07",
    "end" : "2024-10-10"
  },
  "account" : [
    {
      "reference" : "Account/SZ1DRGFall",
      "identifier" : {
        "system" : "http://beispiel-krankenhaus.de/sid/fallnummern",
        "value" : "0123456789"
      }
    }
  ],
  "hospitalization" : {
    "extension" : [
      {
        "url" : "http://fhir.de/StructureDefinition/Wahlleistung",
        "valueCoding" : {
          "system" : "http://fhir.de/CodeSystem/wahlleistungen-de",
          "code" : "unterkunft-und-verpflegung-begleitperson-kinder-ohne-med-begruedung",
          "display" : "Unterkunft und Verpflegung einer Begleitperson ohne med. Begründung"
        }
      }
    ]
  },
  "location" : [
    {
      "location" : {
        "identifier" : {
          "system" : "http://beispiel-krankenhaus.de/sid/betten",
          "value" : "123"
        },
        "display" : "Bettenstellplatz 123"
      },
      "status" : "active",
      "physicalType" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
            "code" : "bd",
            "display" : "Bed"
          }
        ]
      }
    },
    {
      "location" : {
        "identifier" : {
          "system" : "http://beispiel-krankenhaus.de/sid/zimmer",
          "value" : "12"
        },
        "display" : "Zimmer 12"
      },
      "status" : "active",
      "physicalType" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
            "code" : "ro",
            "display" : "Room"
          }
        ]
      }
    }
  ]
}

```
