# Resource SZ1VersicherungGesetzlich



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
