# Example Location - RaumStandortBeispiel - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Location - RaumStandortBeispiel**

## Example Location: Example Location - RaumStandortBeispiel

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
