# Example RelatedPerson - SZ1Mutter - Basis Implementation Guide v6.0.0-rc

Basis Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example RelatedPerson - SZ1Mutter**

## Example RelatedPerson: Example RelatedPerson - SZ1Mutter

Profile: [ISiKAngehoeriger](StructureDefinition-ISiKAngehoeriger.md)

**identifier**: Krankenversichertennummer/A987654321

**patient**: [Töchterchen Musterfrau (official) Female, DoB: 2010-01-01 ( Medical record number)](Patient-SZ1Patient.md)

**relationship**: mother

**name**: Mama Musterfrau (Official)

**address**: Milchstr. 42 Beispielstadt 78143 DE 



## Resource Content

```json
{
  "resourceType" : "RelatedPerson",
  "id" : "SZ1Mutter",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
    ]
  },
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "KVZ10"
          }
        ]
      },
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "A987654321"
    }
  ],
  "patient" : {
    "reference" : "Patient/SZ1Patient"
  },
  "relationship" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
          "code" : "MTH"
        }
      ]
    }
  ],
  "name" : [
    {
      "use" : "official",
      "family" : "Musterfrau",
      "given" : ["Mama"]
    }
  ],
  "address" : [
    {
      "type" : "both",
      "line" : ["Milchstr. 42"],
      "city" : "Beispielstadt",
      "postalCode" : "78143",
      "country" : "DE"
    }
  ]
}

```
