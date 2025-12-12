# Station A - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Station A**

## Location: Station A

Profile: [ISiKStandort](StructureDefinition-ISiKStandort.md)

**identifier**: `http://fhir.de/sid/dkgev/standortnummer`/123456

**operationalStatus**: [bedStatus: O](http://terminology.hl7.org/5.0.0/CodeSystem-v2-0116.html#v2-0116-O) (Occupied)

**name**: Station A

**mode**: Instance

**type**: LocationIdentifiedEntityRoleCode

**address**: Krankenhausstraße 123 Musterstadt 12345 

**physicalType**: Ward

### Positions

| | | |
| :--- | :--- | :--- |
| - | **Longitude** | **Latitude** |
| * | 13.405 | 52.52 |

**managingOrganization**: [Organization Allgemeinchirurgie](Organization-AbteilungAllgemeinchirurgieOrganisationBeispiel.md)

> **hoursOfOperation****daysOfWeek**: Friday**allDay**: true

> **hoursOfOperation****daysOfWeek**: Sunday



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
