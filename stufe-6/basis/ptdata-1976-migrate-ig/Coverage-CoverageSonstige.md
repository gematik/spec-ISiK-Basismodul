# Example Coverage - CoverageSonstige - Basis Implementation Guide v6.0.0-rc

Basis Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Coverage - CoverageSonstige**

## Example Coverage: Example Coverage - CoverageSonstige

Profile: [ISiKVersicherungsverhaeltnisSonstige](StructureDefinition-ISiKVersicherungsverhaeltnisSonstige.md)

**status**: Active

**type**: Sozialamt

**beneficiary**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**payor**: Sozialamt Posemuckel



## Resource Content

```json
{
  "resourceType" : "Coverage",
  "id" : "CoverageSonstige",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSonstige"
    ]
  },
  "status" : "active",
  "type" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/versicherungsart-de-basis",
        "code" : "SOZ"
      }
    ]
  },
  "beneficiary" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "payor" : [
    {
      "display" : "Sozialamt Posemuckel"
    }
  ]
}

```
