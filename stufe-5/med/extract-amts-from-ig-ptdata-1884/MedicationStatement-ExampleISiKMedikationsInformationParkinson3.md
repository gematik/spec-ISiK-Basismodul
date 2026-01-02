#  - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MedicationStatement: 

Profile: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md)

**status**: Active

**medication**: Madopar® 125 mg

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
| * | 1 FTbl.(Details: UCUM code1 = '1') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformationParkinson3",
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
        "code" : "03395803",
        "display" : "Madopar® 125 mg"
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
          "timeOfDay" : ["18:00:00"]
        }
      },
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 1,
            "unit" : "FTbl.",
            "system" : "http://unitsofmeasure.org",
            "code" : "1"
          }
        }
      ]
    }
  ]
}

```
