# Resource BettenstellplatzStandortBeispiel



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "BettenstellplatzStandortBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortBettenstellplatz"
    ]
  },
  "physicalType" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "code" : "bd",
        "display" : "Bed"
      }
    ]
  },
  "managingOrganization" : {
    "reference" : "Organization/AbteilungAllgemeinchirurgieOrganisationBeispiel"
  },
  "partOf" : {
    "reference" : "Location/RaumStandortBeispiel"
  }
}

```
