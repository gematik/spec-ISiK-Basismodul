#  - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Location: 

Profile: [ISiKStandortBettenstellplatz](StructureDefinition-ISiKStandortBettenstellplatz.md)

**physicalType**: Bed

**managingOrganization**: [Organization Allgemeinchirurgie](Organization-AbteilungAllgemeinchirurgieOrganisationBeispiel.md)

**partOf**: [Location: physicalType = Room](Location-RaumStandortBeispiel.md)



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
