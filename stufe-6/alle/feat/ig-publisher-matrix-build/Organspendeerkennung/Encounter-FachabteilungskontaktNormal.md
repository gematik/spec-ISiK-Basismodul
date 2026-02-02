# FachabteilungskontaktNormal - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **FachabteilungskontaktNormal**

## Encounter: FachabteilungskontaktNormal

Profile: [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

> **ExtensionAufnahmegrund**
* ErsteUndZweiteStelle: [CodeSystemAufnahmegrundErsteUndZweiteStelle: 01](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle#AufnahmegrundErsteUndZweiteStelle-01) (Krankenhausbehandlung, vollstationär)

**Extension Definition for Encounter.plannedStartDate for Version 5.0**: 2025-01-02

**Extension Definition for Encounter.plannedEndDate for Version 5.0**: 2025-01-04

**identifier**: Visit number/0123456789

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.0.1/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Abteilungskontakt, Operation

**serviceType**: Orthopädie

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**period**: 2024-10-21 --> 2025-01-01

### Diagnoses

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Condition** | **Use** | **Rank** |
| * | [Condition Primäre Gonarthrose, beidseitig](Condition-PrimaereGonarthroseNormal.md) | Behandlungsrelevante Diagnosen | 1 |

**account**: [Account: identifier = Account number; status = active; type = inpatient encounter](Account-AbrechnungsfallGonarthrose.md)

### Hospitalizations

| | | |
| :--- | :--- | :--- |
| - | **AdmitSource** | **DischargeDisposition** |
| * | Einweisung durch einen Arzt |  |

> **location****location**: [Zimmer 1234](Location-RaumStandortBeispiel.md)**status**: Active**physicalType**: Room

> **location****location**: [Bettenstellplatz 1234](Location-BettenstellplatzStandortBeispiel.md)**status**: Active**physicalType**: Bed

> **location****location**: Ward 1234 (Identifier: `https://test.krankenhaus.de/fhir/sid/stationid`/1234)**status**: Active

> **location****location**: Ward 56789 (Identifier: `https://test.krankenhaus.de/fhir/sid/stationid`/56789)**status**: Completed**physicalType**: Ward

**serviceProvider**: Fachabteilung für Orthopädie und Endoprothetik (Identifier: `https://test.krankenhaus.de/fhir/sid/fachabteilungsid`/ORTHO-1234)



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
