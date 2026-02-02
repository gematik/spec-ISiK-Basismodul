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

**beneficiary**: [Töchterchen Musterfrau (official) Female, DoB: 2010-01-01 ( Medical record number)](Patient-SZ1Patient.md)

**payor**: [RelatedPerson Mama Musterfrau (official)](RelatedPerson-SZ1Mutter.md)



## Resource Content

```json
{
  "resourceType" : "Coverage",
  "id" : "SZ1VersicherungSelbstzahler",
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
    "reference" : "Patient/SZ1Patient"
  },
  "payor" : [
    {
      "reference" : "RelatedPerson/SZ1Mutter"
    }
  ]
}

```
