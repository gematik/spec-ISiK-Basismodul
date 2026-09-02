# BilanzAusfuhrBlutverlustBeispiel - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BilanzAusfuhrBlutverlustBeispiel**

## Observation: BilanzAusfuhrBlutverlustBeispiel

Profile: [MII PR ICU Bilanz Ausfuhr Blutverlust](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-blutverlust.md)

**status**: Final

**category**: Exam

**code**: Actual blood loss

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2025-07-15 14:30:00+0200

**value**: 350 ml (Details: UCUM codemL = 'mL')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "BilanzAusfuhrBlutverlustBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-ausfuhr-blutverlust"]
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
      "code" : "250771004",
      "display" : "Actual blood loss"
    },
    {
      "system" : "http://loinc.org",
      "code" : "81661-1",
      "display" : "Blood loss [Volume] Measured"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2025-07-15T14:30:00+02:00",
  "valueQuantity" : {
    "value" : 350,
    "unit" : "ml",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL"
  }
}

```
