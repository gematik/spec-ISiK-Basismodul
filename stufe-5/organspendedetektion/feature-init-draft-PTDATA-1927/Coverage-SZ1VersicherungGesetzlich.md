#  - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Coverage: 

Profile: [ISiKVersicherungsverhaeltnisGesetzlich](StructureDefinition-ISiKVersicherungsverhaeltnisGesetzlich.md)

**status**: Active

**type**: gesetzliche Krankenversicherung

**subscriber**: [RelatedPerson Mama Musterfrau (official)](RelatedPerson-SZ1Mutter.md)

**beneficiary**: [Töchterchen Musterfrau (official) Female, DoB: 2010-01-01 ( Medical record number)](Patient-SZ1Patient.md)

**payor**: TKKG (Identifier: Organization identifier/260326822)



## Resource Content

```json
{
  "resourceType" : "Coverage",
  "id" : "SZ1VersicherungGesetzlich",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich"
    ]
  },
  "status" : "active",
  "type" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/versicherungsart-de-basis",
        "code" : "GKV"
      }
    ]
  },
  "subscriber" : {
    "reference" : "RelatedPerson/SZ1Mutter",
    "identifier" : {
      "type" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "KVZ10"
          }
        ]
      },
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "A987654321"
    }
  },
  "beneficiary" : {
    "reference" : "Patient/SZ1Patient"
  },
  "payor" : [
    {
      "identifier" : {
        "type" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
              "code" : "XX"
            }
          ]
        },
        "system" : "http://fhir.de/sid/arge-ik/iknr",
        "value" : "260326822"
      },
      "display" : "TKKG"
    }
  ]
}

```
