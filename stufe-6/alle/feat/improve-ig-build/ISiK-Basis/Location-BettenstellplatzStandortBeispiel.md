# Example Location - BettenstellplatzStandortBeispiel - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Location - BettenstellplatzStandortBeispiel**

## Example Location: Example Location - BettenstellplatzStandortBeispiel

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
