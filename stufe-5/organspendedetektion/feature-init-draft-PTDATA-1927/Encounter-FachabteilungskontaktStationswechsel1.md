#  - Organspendeerkennung v0.0.1

Organspendeerkennung

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Encounter: 

Profile: [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

**identifier**: Visit number/0123456789

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.0.1/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Abteilungskontakt

**serviceType**: Hals-, Nasen-, Ohrenheilkunde

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**period**: 2025-01-15 08:00:00+0100 --> 2025-01-15 14:00:00+0100

> **location****location**: Station CHA1 (Identifier:`https://test.krankenhaus.de/fhir/sid/stationId`/CHA1)**status**: Active**physicalType**:Ward

> **location****location**: Zimmer Z001 (Identifier:`https://test.krankenhaus.de/fhir/sid/zimmerId`/Z001)**status**: Active**physicalType**:Room

> **location****location**: Bett B027 (Identifier:`https://test.krankenhaus.de/fhir/sid/bettId`/B027)**status**: Active**physicalType**:Bed



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
