# Resource ISiKAngehoerigerMustermann



## Resource Content

```json
{
  "resourceType" : "RelatedPerson",
  "id" : "ISiKAngehoerigerMustermann",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
    ]
  },
  "patient" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "relationship" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
          "code" : "DAUC"
        }
      ]
    }
  ],
  "name" : [
    {
      "use" : "official",
      "family" : "Mustermann",
      "given" : ["Maxine"]
    }
  ],
  "address" : [
    {
      "type" : "both",
      "line" : ["Milchstr. 42"],
      "city" : "Beispielstadt",
      "postalCode" : "78143",
      "country" : "DE"
    }
  ]
}

```
