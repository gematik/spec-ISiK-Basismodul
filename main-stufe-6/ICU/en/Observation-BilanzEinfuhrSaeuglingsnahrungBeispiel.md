# BilanzEinfuhrSaeuglingsnahrungBeispiel - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BilanzEinfuhrSaeuglingsnahrungBeispiel**

## Observation: BilanzEinfuhrSaeuglingsnahrungBeispiel

Profile: [MII PR ICU Bilanz Einfuhr Saeuglingsnahrung](StructureDefinition-mii-pr-icu-bilanz-einfuhr-saeuglingsnahrung.md)

**status**: Final

**category**: Exam

**code**: Measured volume of intake of infant formula

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2025-07-15 11:00:00+0200

**value**: 120 ml (Details: UCUM codemL = 'mL')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "BilanzEinfuhrSaeuglingsnahrungBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-einfuhr-saeuglingsnahrung"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "exam",
      "display" : "Exam"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "364396009",
      "display" : " Fluid balance observable"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1204305004",
      "display" : "Measured volume of intake of infant formula"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2025-07-15T11:00:00+02:00",
  "valueQuantity" : {
    "value" : 120,
    "unit" : "ml",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL"
  }
}

```
