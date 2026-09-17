# Resource FachabteilungskontaktNormal



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "FachabteilungskontaktNormal",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
    ]
  },
  "extension" : [
    {
      "extension" : [
        {
          "url" : "ErsteUndZweiteStelle",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle",
            "code" : "01",
            "display" : "Krankenhausbehandlung, vollstationär"
          }
        }
      ],
      "url" : "http://fhir.de/StructureDefinition/Aufnahmegrund"
    },
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate",
      "valueDateTime" : "2025-01-02"
    },
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate",
      "valueDateTime" : "2025-01-04"
    }
  ],
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
      "system" : "https://test.krankenhaus.de/fhir/sid/besuchsnummer",
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
    },
    {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/kontaktart-de",
          "code" : "operation"
        }
      ]
    }
  ],
  "serviceType" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel",
        "code" : "2300",
        "display" : "Orthopädie"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "period" : {
    "start" : "2024-10-21",
    "end" : "2025-01-01"
  },
  "diagnosis" : [
    {
      "condition" : {
        "reference" : "Condition/PrimaereGonarthroseNormal"
      },
      "use" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/KontaktDiagnoseProzedur",
            "code" : "treatment-diagnosis"
          }
        ]
      },
      "rank" : 1
    }
  ],
  "account" : [
    {
      "reference" : "Account/AbrechnungsfallGonarthrose",
      "identifier" : {
        "system" : "https://test.krankenhaus.de/fhir/sid/fallnummer",
        "value" : "1234"
      }
    }
  ],
  "hospitalization" : {
    "admitSource" : {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass",
          "code" : "E"
        }
      ]
    },
    "dischargeDisposition" : {
      "extension" : [
        {
          "extension" : [
            {
              "url" : "ErsteUndZweiteStelle",
              "valueCoding" : {
                "system" : "http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle",
                "code" : "01",
                "display" : "Behandlung regulär beendet"
              }
            }
          ],
          "url" : "http://fhir.de/StructureDefinition/Entlassungsgrund"
        }
      ]
    }
  },
  "location" : [
    {
      "location" : {
        "reference" : "Location/RaumStandortBeispiel",
        "identifier" : {
          "system" : "https://test.krankenhaus.de/fhir/sid/roomid",
          "value" : "1234"
        },
        "display" : "Zimmer 1234"
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
        "reference" : "Location/BettenstellplatzStandortBeispiel",
        "identifier" : {
          "system" : "https://test.krankenhaus.de/fhir/sid/bedid",
          "value" : "1234"
        },
        "display" : "Bettenstellplatz 1234"
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
          "system" : "https://test.krankenhaus.de/fhir/sid/stationid",
          "value" : "1234"
        },
        "display" : "Ward 1234"
      },
      "status" : "active"
    },
    {
      "location" : {
        "identifier" : {
          "system" : "https://test.krankenhaus.de/fhir/sid/stationid",
          "value" : "56789"
        },
        "display" : "Ward 56789"
      },
      "status" : "completed",
      "physicalType" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
            "code" : "wa",
            "display" : "Ward"
          }
        ]
      }
    }
  ],
  "serviceProvider" : {
    "identifier" : {
      "system" : "https://test.krankenhaus.de/fhir/sid/fachabteilungsid",
      "value" : "ORTHO-1234"
    },
    "display" : "Fachabteilung für Orthopädie und Endoprothetik"
  }
}

```
