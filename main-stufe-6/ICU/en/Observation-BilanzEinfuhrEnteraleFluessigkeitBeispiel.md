# BilanzEinfuhrEnteraleFluessigkeitBeispiel - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BilanzEinfuhrEnteraleFluessigkeitBeispiel**

## Observation: BilanzEinfuhrEnteraleFluessigkeitBeispiel

Profile: [MII PR ICU Bilanz Einfuhr Enterale Fluessigkeit](StructureDefinition-mii-pr-icu-bilanz-einfuhr-enterale-fluessigkeit.md)

**status**: Final

**category**: Exam

**code**: Enteral fluid input

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2025-07-15 12:00:00+0200

**value**: 500 ml (Details: UCUM codemL = 'mL')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "BilanzEinfuhrEnteraleFluessigkeitBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-einfuhr-enterale-fluessigkeit"]
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
      "code" : "251854000",
      "display" : "Enteral fluid input"
    },
    {
      "system" : "http://loinc.org",
      "code" : "8953-2",
      "display" : "Fluid intake enteral tube Measured"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2025-07-15T12:00:00+02:00",
  "valueQuantity" : {
    "value" : 500,
    "unit" : "ml",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL"
  }
}

```
