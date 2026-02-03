# Resource FachabteilungskontaktStationswechsel1



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "FachabteilungskontaktStationswechsel1",
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
        "code" : "2600",
        "display" : "Hals-, Nasen-, Ohrenheilkunde"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "period" : {
    "start" : "2025-01-15T08:00:00+01:00",
    "end" : "2025-01-15T14:00:00+01:00"
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
