# Resource FachabteilungskontaktFachbereichswechsel1



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "FachabteilungskontaktFachbereichswechsel1",
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
      "value" : "0123456789"
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
    }
  ],
  "serviceType" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel",
        "code" : "1500",
        "display" : "Allgemeine Chirurgie"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "period" : {
    "start" : "2025-01-01T10:00:00+01:00",
    "end" : "2025-01-10T08:00:00+01:00"
  },
  "location" : [
    {
      "location" : {
        "identifier" : {
          "system" : "https://test.krankenhaus.de/fhir/sid/stationId",
          "value" : "CHA1"
        },
        "display" : "Station CHA1"
      },
      "status" : "active",
      "physicalType" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
            "code" : "wa",
            "display" : "Ward"
          }
        ]
      }
    },
    {
      "location" : {
        "identifier" : {
          "system" : "https://test.krankenhaus.de/fhir/sid/zimmerId",
          "value" : "Z001"
        },
        "display" : "Zimmer Z001"
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
    },
    {
      "location" : {
        "identifier" : {
          "system" : "https://test.krankenhaus.de/fhir/sid/bettId",
          "value" : "B016"
        },
        "display" : "Bett B016"
      },
      "status" : "completed",
      "physicalType" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
            "code" : "bd",
            "display" : "Bed"
          }
        ]
      },
      "period" : {
        "end" : "2025-05-01T12:00:00+01:00"
      }
    },
    {
      "location" : {
        "identifier" : {
          "system" : "https://test.krankenhaus.de/fhir/sid/bettId",
          "value" : "B027"
        },
        "display" : "Bett B027"
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
    }
  ]
}

```
