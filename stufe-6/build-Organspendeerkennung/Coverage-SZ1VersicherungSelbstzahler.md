# Resource SZ1VersicherungSelbstzahler



## Resource Content

```json
{
  "resourceType" : "Coverage",
  "id" : "SZ1VersicherungSelbstzahler",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler"
    ]
  },
  "status" : "active",
  "type" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/versicherungsart-de-basis",
        "code" : "SEL"
      }
    ]
  },
  "beneficiary" : {
    "reference" : "Patient/SZ1Patient"
  },
  "payor" : [
    {
      "reference" : "RelatedPerson/SZ1Mutter"
    }
  ]
}

```
