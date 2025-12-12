#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Encounter: 

Profile: [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

**identifier**: Visit number/0123456789-1

**status**: Finished

**class**: [ActCode: AMB](http://terminology.hl7.org/7.0.0/CodeSystem-v3-ActCode.html#v3-ActCode-AMB) (ambulatory)

**type**: Abteilungskontakt, Vorstationär

**subject**: [Töchterchen Musterfrau (official) Female, DoB: 2010-01-01 ( Medical record number)](Patient-SZ1Patient.md)

**period**: 2024-10-01 --> 2024-10-01

**account**: [Account/SZ1DRGFall](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Account/SZ1DRGFall)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "SZ1Vorstationaer",
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
      "value" : "0123456789-1"
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
          "code" : "vorstationaer",
          "display" : "Vorstationär"
        }
      ]
    }
  ],
  "subject" : {
    "reference" : "Patient/SZ1Patient"
  },
  "period" : {
    "start" : "2024-10-01",
    "end" : "2024-10-01"
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
