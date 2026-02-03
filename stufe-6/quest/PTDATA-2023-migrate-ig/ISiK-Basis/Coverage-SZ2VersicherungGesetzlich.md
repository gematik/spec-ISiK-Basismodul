# Example Coverage - SZ2VersicherungGesetzlich - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Coverage - SZ2VersicherungGesetzlich**

## Example Coverage: Example Coverage - SZ2VersicherungGesetzlich

Profile: [ISiKVersicherungsverhaeltnisGesetzlich](StructureDefinition-ISiKVersicherungsverhaeltnisGesetzlich.md)

**status**: Active

**type**: gesetzliche Krankenversicherung

**subscriber**: [Friedlinde Musterfrau (official) Female, DoB: 1924-01-01 ( Medical record number)](Patient-SZ2Patient.md)

**beneficiary**: [Friedlinde Musterfrau (official) Female, DoB: 1924-01-01 ( Medical record number)](Patient-SZ2Patient.md)

**payor**: BKK für Testpatienten (Identifier: Organization identifier/260326855)



## Resource Content

```json
{
  "resourceType" : "Coverage",
  "id" : "SZ2VersicherungGesetzlich",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich"
    ]
  },
  "status" : "active",
  "type" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/versicherungsart-de-basis",
        "code" : "GKV"
      }
    ]
  },
  "subscriber" : {
    "reference" : "Patient/SZ2Patient",
    "identifier" : {
      "type" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "KVZ10"
          }
        ]
      },
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "A222222222"
    }
  },
  "beneficiary" : {
    "reference" : "Patient/SZ2Patient"
  },
  "payor" : [
    {
      "identifier" : {
        "type" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
              "code" : "XX"
            }
          ]
        },
        "system" : "http://fhir.de/sid/arge-ik/iknr",
        "value" : "260326855"
      },
      "display" : "BKK für Testpatienten"
    }
  ]
}

```
