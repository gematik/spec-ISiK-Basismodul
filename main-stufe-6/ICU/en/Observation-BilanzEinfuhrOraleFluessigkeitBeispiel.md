# BilanzEinfuhrOraleFluessigkeitBeispiel - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BilanzEinfuhrOraleFluessigkeitBeispiel**

## Observation: BilanzEinfuhrOraleFluessigkeitBeispiel

Profile: [MII PR ICU Bilanz Einfuhr Orale Fluessigkeit](StructureDefinition-mii-pr-icu-bilanz-einfuhr-orale-fluessigkeit.md)

**status**: Final

**category**: Exam

**code**: Oral fluid input

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2025-07-15 13:00:00+0200

**value**: 800 ml (Details: UCUM codemL = 'mL')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "BilanzEinfuhrOraleFluessigkeitBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-einfuhr-orale-fluessigkeit"]
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
      "code" : "251853006",
      "display" : "Oral fluid input"
    },
    {
      "system" : "http://loinc.org",
      "code" : "9000-1",
      "display" : "Fluid intake oral Measured"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2025-07-15T13:00:00+02:00",
  "valueQuantity" : {
    "value" : 800,
    "unit" : "ml",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL"
  }
}

```
