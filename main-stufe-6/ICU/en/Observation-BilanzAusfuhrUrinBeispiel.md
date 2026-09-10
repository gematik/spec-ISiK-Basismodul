# BilanzAusfuhrUrinBeispiel - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BilanzAusfuhrUrinBeispiel**

## Observation: BilanzAusfuhrUrinBeispiel

Profile: [MII PR ICU Bilanz Ausfuhr Urin](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-urin.md)

**status**: Final

**category**: Exam

**code**: Urine output observable

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2025-07-15 06:00:00+0200

**value**: 1200 ml (Details: UCUM codemL = 'mL')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "BilanzAusfuhrUrinBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-ausfuhr-urin"]
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
      "code" : "364201005",
      "display" : "Urine output observable"
    },
    {
      "system" : "http://loinc.org",
      "code" : "9187-6",
      "display" : "Urine output"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2025-07-15T06:00:00+02:00",
  "valueQuantity" : {
    "value" : 1200,
    "unit" : "ml",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL"
  }
}

```
