#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MedicationStatement: 

Profile: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md)

**status**: Active

**medication**: LevoCarb 200/50 ret - 1 A Pharma®

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**context**: [Encounter/FachabteilungskontaktMinimal](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Encounter/FachabteilungskontaktMinimal)

**effective**: 2024-02-20 --> (ongoing)

**dateAsserted**: 2024-02-20

**reasonReference**: [Condition/DiagnoseParkinson](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Condition/DiagnoseParkinson)

> **dosage****timing**: Once

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 1 Tbl.(Details: UCUM code1 = '1') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformationParkinson5",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"
    ]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/ifa/pzn",
        "code" : "04855419",
        "display" : "LevoCarb 200/50 ret - 1 A Pharma®"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectivePeriod" : {
    "start" : "2024-02-20"
  },
  "dateAsserted" : "2024-02-20",
  "reasonReference" : [
    {
      "reference" : "Condition/DiagnoseParkinson"
    }
  ],
  "dosage" : [
    {
      "timing" : {
        "repeat" : {
          "timeOfDay" : ["22:00:00"]
        }
      },
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 1,
            "unit" : "Tbl.",
            "system" : "http://unitsofmeasure.org",
            "code" : "1"
          }
        }
      ]
    }
  ]
}

```
