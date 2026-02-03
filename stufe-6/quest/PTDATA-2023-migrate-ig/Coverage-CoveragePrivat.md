#  - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Coverage: 

Profile: [ISiKVersicherungsverhaeltnisSelbstzahler](StructureDefinition-ISiKVersicherungsverhaeltnisSelbstzahler.md)

**status**: Active

**type**: Selbstzahler

**beneficiary**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**payor**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)



## Resource Content

```json
{
  "resourceType" : "Coverage",
  "id" : "CoveragePrivat",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler"
    ]
  },
  "status" : "active",
  "type" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/versicherungsart-de-basis",
        "code" : "SEL"
      }
    ]
  },
  "beneficiary" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "payor" : [
    {
      "reference" : "Patient/PatientinMusterfrau"
    }
  ]
}

```
