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

**type**: Pediatric intensive care unit

**address**: Krankenhausstraße 123 Musterstadt 12345 

**physicalType**: Ward

**managingOrganization**: [Organization/KlinikPaediatrieOrganisationBeispiel](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Organization/KlinikPaediatrieOrganisationBeispiel)

**partOf**: [Location Krankenhaus Standort](Location-KrankenhausStandortBeispiel.md)

> **hoursOfOperation****daysOfWeek**: Friday**allDay**: true

> **hoursOfOperation****daysOfWeek**: Sunday



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "StationPediaICUStandortBeispiel",
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
      "code" : "PEDICU",
      "display" : "Pediatric intensive care unit"
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
  "managingOrganization" : {
    "reference" : "Organization/KlinikPaediatrieOrganisationBeispiel"
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
