#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Location: 

Profile: [ISiKStandortRaum](StructureDefinition-ISiKStandortRaum.md)

**physicalType**: Room

**managingOrganization**: [Organization Allgemeinchirurgie](Organization-AbteilungAllgemeinchirurgieOrganisationBeispiel.md)



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "RaumStandortBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortRaum"
    ]
  },
  "physicalType" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "code" : "ro",
        "display" : "Room"
      }
    ]
  },
  "managingOrganization" : {
    "reference" : "Organization/AbteilungAllgemeinchirurgieOrganisationBeispiel"
  }
}

```
