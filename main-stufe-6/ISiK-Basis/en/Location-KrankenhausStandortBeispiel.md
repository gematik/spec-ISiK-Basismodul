# Krankenhaus Standort - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Krankenhaus Standort**

## Location: Krankenhaus Standort

Profile: [ISiKStandort](StructureDefinition-ISiKStandort.md)

**identifier**: `http://fhir.de/sid/dkgev/standortnummer`/123456

**operationalStatus**: [bedStatus: O](http://terminology.hl7.org/7.3.0/CodeSystem-v2-0116.html#v2-0116-O) (belegt)

**name**: Krankenhaus Standort

**mode**: Instance

**type**: Hospital

**address**: Krankenhausstraße 123 Musterstadt 12345 

**physicalType**: Building

### Positions

| | | |
| :--- | :--- | :--- |
| - | **Longitude** | **Latitude** |
| * | 13.405 | 52.52 |

**managingOrganization**: [Organization Uniklinik Entenhausen](Organization-KrankenhausOrganisationBeispiel.md)



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "KrankenhausStandortBeispiel",
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
  "name" : "Krankenhaus Standort",
  "mode" : "instance",
  "type" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
      "code" : "HOSP",
      "display" : "Hospital"
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
      "code" : "bu",
      "display" : "Building"
    }]
  },
  "position" : {
    "longitude" : 13.405,
    "latitude" : 52.52
  },
  "managingOrganization" : {
    "reference" : "Organization/KrankenhausOrganisationBeispiel"
  }
}

```
