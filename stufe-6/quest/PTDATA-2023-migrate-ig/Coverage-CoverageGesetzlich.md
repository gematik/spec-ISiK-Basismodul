#  - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Coverage: 

Profile: [ISiKVersicherungsverhaeltnisGesetzlich](StructureDefinition-ISiKVersicherungsverhaeltnisGesetzlich.md)

**status**: Active

**type**: gesetzliche Krankenversicherung

**beneficiary**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**payor**: Eine Gesundheitskasse (Identifier: Organization identifier/260326822)



## Resource Content

```json
{
  "resourceType" : "Coverage",
  "id" : "CoverageGesetzlich",
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
  "beneficiary" : {
    "reference" : "Patient/PatientinMusterfrau"
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
        "value" : "260326822"
      },
      "display" : "Eine Gesundheitskasse"
    }
  ]
}

```
