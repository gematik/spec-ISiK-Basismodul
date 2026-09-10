# BilanzAusfuhrFluessigkeitGesamtBeispiel - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BilanzAusfuhrFluessigkeitGesamtBeispiel**

## Observation: BilanzAusfuhrFluessigkeitGesamtBeispiel

Profile: [MII PR ICU Bilanz Ausfuhr Fluessigkeit Gesamt](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-fluessigkeit-gesamt.md)

**status**: Final

**category**: Exam

**code**: Total fluid loss

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2025-07-15 06:00:00+0200 --> 2025-07-16 06:00:00+0200

**value**: 2400 ml (Details: UCUM codemL = 'mL')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "BilanzAusfuhrFluessigkeitGesamtBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-ausfuhr-fluessigkeit-gesamt"]
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
      "code" : "251847006",
      "display" : "Total fluid loss"
    },
    {
      "system" : "http://loinc.org",
      "code" : "9257-7",
      "display" : "Fluid output total Measured"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectivePeriod" : {
    "start" : "2025-07-15T06:00:00+02:00",
    "end" : "2025-07-16T06:00:00+02:00"
  },
  "valueQuantity" : {
    "value" : 2400,
    "unit" : "ml",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL"
  }
}

```
