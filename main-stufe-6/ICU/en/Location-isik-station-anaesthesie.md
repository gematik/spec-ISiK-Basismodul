# Intensivstation Anaesthesie - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Intensivstation Anaesthesie**

## Location: Intensivstation Anaesthesie

Profile: [ISiKStandort](StructureDefinition-ISiKStandort.md)

**identifier**: `http://fhir.de/sid/dkgev/standortnummer`/ANEITS

**operationalStatus**: [bedStatus: O](http://terminology.hl7.org/7.3.0/CodeSystem-v2-0116.html#v2-0116-O) (belegt)

**name**: Intensivstation Anaesthesie

**mode**: Instance

**type**: Intensive care unit

**address**: Krankenhausstraße 123 Musterstadt 12345 

**physicalType**: Ward

**managingOrganization**: [Organization/KrankenhausOrganisationBeispiel](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Organization/KrankenhausOrganisationBeispiel)

**partOf**: [Location Krankenhaus Standort](Location-KrankenhausStandortBeispiel.md)



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "isik-station-anaesthesie",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort"]
  },
  "identifier" : [{
    "system" : "http://fhir.de/sid/dkgev/standortnummer",
    "value" : "ANEITS"
  }],
  "operationalStatus" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v2-0116",
    "code" : "O",
    "display" : "belegt"
  },
  "name" : "Intensivstation Anaesthesie",
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
  "managingOrganization" : {
    "reference" : "Organization/KrankenhausOrganisationBeispiel"
  },
  "partOf" : {
    "reference" : "Location/KrankenhausStandortBeispiel"
  }
}

```
