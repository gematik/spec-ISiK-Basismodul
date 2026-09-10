# Station A - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Station A**

## Location: Station A

Profile: [ISiKStandort](StructureDefinition-ISiKStandort.md)

**identifier**: `http://fhir.de/sid/dkgev/standortnummer`/123456

**operationalStatus**: [bedStatus: O](http://terminology.hl7.org/7.3.0/CodeSystem-v2-0116.html#v2-0116-O) (belegt)

**name**: Station A

**mode**: Instance

**type**: Intensive care unit

**address**: Krankenhausstraße 123 Musterstadt 12345 

**physicalType**: Ward

### Positions

| | | |
| :--- | :--- | :--- |
| - | **Longitude** | **Latitude** |
| * | 13.405 | 52.52 |

**managingOrganization**: [Organization/KlinikIntensivAnaesthesieOrganisationBeispiel](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Organization/KlinikIntensivAnaesthesieOrganisationBeispiel)

**partOf**: [Location Krankenhaus Standort](Location-KrankenhausStandortBeispiel.md)

> **hoursOfOperation****daysOfWeek**: Friday**allDay**: true

> **hoursOfOperation****daysOfWeek**: Sunday



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "StationICUStandortBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort"]
  },
  "identifier" : [{
    "system" : "http://fhir.de/sid/dkgev/standortnummer",
    "value" : "123456"
  }],
  "operationalStatus" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v2-0116",
    "code" : "O",
    "display" : "belegt"
  },
  "name" : "Station A",
  "mode" : "instance",
  "type" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
      "code" : "ICU",
      "display" : "Intensive care unit"
    }]
  }],
  "address" : {
    "line" : ["Krankenhausstraße 123"],
    "city" : "Musterstadt",
    "postalCode" : "12345"
  },
  "physicalType" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
      "code" : "wa",
      "display" : "Ward"
    }]
  },
  "position" : {
    "longitude" : 13.405,
    "latitude" : 52.52
  },
  "managingOrganization" : {
    "reference" : "Organization/KlinikIntensivAnaesthesieOrganisationBeispiel"
  },
  "partOf" : {
    "reference" : "Location/KrankenhausStandortBeispiel"
  },
  "hoursOfOperation" : [{
    "daysOfWeek" : ["fri"],
    "allDay" : true
  },
  {
    "daysOfWeek" : ["sun"]
  }]
}

```
