# Resource AbrechnungsfallGonarthrose



## Resource Content

```json
{
  "resourceType" : "Account",
  "id" : "AbrechnungsfallGonarthrose",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
    ]
  },
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "AN"
          }
        ]
      },
      "system" : "https://test.krankenhaus.de/fhir/sid/abrechnungsnummer",
      "value" : "1234567891"
    }
  ],
  "status" : "active",
  "type" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code" : "IMP"
      }
    ]
  },
  "subject" : [
    {
      "reference" : "Patient/PatientinNormal"
    }
  ]
}

```
