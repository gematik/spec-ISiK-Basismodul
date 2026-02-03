# Resource Station A



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "StationStandortBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort"
    ]
  },
  "identifier" : [
    {
      "system" : "http://fhir.de/sid/dkgev/standortnummer",
      "value" : "123456"
    }
  ],
  "operationalStatus" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v2-0116",
    "code" : "O",
    "display" : "Occupied"
  },
  "name" : "Station A",
  "mode" : "instance",
  "type" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
          "code" : "_LocationIdentifiedEntityRoleCode"
        }
      ]
    }
  ],
  "address" : {
    "line" : ["Krankenhausstraße 123"],
    "city" : "Musterstadt",
    "postalCode" : "12345"
  },
  "physicalType" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "code" : "wa",
        "display" : "Ward"
      }
    ]
  },
  "position" : {
    "longitude" : 13.405,
    "latitude" : 52.52
  },
  "managingOrganization" : {
    "reference" : "Organization/AbteilungAllgemeinchirurgieOrganisationBeispiel"
  },
  "hoursOfOperation" : [
    {
      "daysOfWeek" : ["fri"],
      "allDay" : true
    },
    {
      "daysOfWeek" : ["sun"]
    }
  ]
}

```
