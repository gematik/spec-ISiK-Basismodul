# BilanzAusfuhrDrainageGenerischBeispiel - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BilanzAusfuhrDrainageGenerischBeispiel**

## Observation: BilanzAusfuhrDrainageGenerischBeispiel

Profile: [MII PR ICU Bilanz Ausfuhr Drainage Generisch](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-drainage-generisch.md)

**status**: Final

**category**: Exam

**code**: Fluid output from drain

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2025-07-15 10:00:00+0200

**value**: 120 ml (Details: UCUM codemL = 'mL')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "BilanzAusfuhrDrainageGenerischBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-ausfuhr-drainage-generisch"]
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
      "code" : "251843005",
      "display" : "Fluid output from drain"
    },
    {
      "system" : "urn:iso:std:iso:11073:10101",
      "code" : "157740",
      "display" : "Drainage volume in bag"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2025-07-15T10:00:00+02:00",
  "valueQuantity" : {
    "value" : 120,
    "unit" : "ml",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL"
  }
}

```
