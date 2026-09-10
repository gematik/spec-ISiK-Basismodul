# BilanzAusfuhrGallenfluessigkeitBeispiel - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BilanzAusfuhrGallenfluessigkeitBeispiel**

## Observation: BilanzAusfuhrGallenfluessigkeitBeispiel

Profile: [MII PR ICU Bilanz Ausfuhr Gallenfluessigkeit](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit.md)

**status**: Final

**category**: Exam

**code**: Volume of drainage of bile duct

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2025-07-15 12:00:00+0200

**value**: 80 ml (Details: UCUM codemL = 'mL')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "BilanzAusfuhrGallenfluessigkeitBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit"]
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
      "code" : "1162667009",
      "display" : "Volume of drainage of bile duct"
    },
    {
      "system" : "http://loinc.org",
      "code" : "9113-2",
      "display" : "Fluid output biliary drain"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2025-07-15T12:00:00+02:00",
  "valueQuantity" : {
    "value" : 80,
    "unit" : "ml",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL"
  }
}

```
