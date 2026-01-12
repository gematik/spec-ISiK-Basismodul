#  - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Encounter: 

Profile: [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

**identifier**: Visit number/222222222-2

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.0.1/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Abteilungskontakt, Normalstationär

**subject**: [Friedlinde Musterfrau (official) Female, DoB: 1924-01-01 ( Medical record number)](Patient-SZ2Patient.md)

**period**: 2024-10-07 --> 2024-10-10

**account**: [Account: extension = ; identifier = Account number; status = active; type = inpatient encounter](Account-SZ2DRGFall.md)



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
