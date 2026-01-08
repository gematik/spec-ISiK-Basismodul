#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MedicationStatement: 

Profile: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md)

**de/fhir/isik/StructureDefinition/ExtensionISiKMedicationStatementReplaces**: [MedicationStatement: extension = Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar.,akut (ISiKMedikationsartCS#akut),true,Schmerztherapie postoperativ; status = active; medication[x] = ->Medication Acetylcystein; effective[x] = 2021-07-01 --> (ongoing); dateAsserted = 2021-07-01](MedicationStatement-ExampleISiKMedikationsInformation1.md)

**status**: Active

**medication**: [Medication](Medication-ExampleISiKMedikament2.md)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**context**: [Encounter/FachabteilungskontaktMinimal](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Encounter/FachabteilungskontaktMinimal)

**effective**: 2021-07-04 --> (ongoing)

**dateAsserted**: 2021-07-03

> **dosage****timing**: Count 6 times, Once per 3 weeks

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 100 mg(Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformation2",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"
    ]
  },
  "extension" : [
    {
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedicationStatementReplaces",
      "valueReference" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformation1"
      }
    }
  ],
  "status" : "active",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament2"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectivePeriod" : {
    "start" : "2021-07-04"
  },
  "dateAsserted" : "2021-07-03",
  "dosage" : [
    {
      "timing" : {
        "repeat" : {
          "count" : 6,
          "frequency" : 1,
          "period" : 3,
          "periodUnit" : "wk"
        }
      },
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 100,
            "unit" : "mg",
            "system" : "http://unitsofmeasure.org",
            "code" : "mg"
          }
        }
      ]
    }
  ]
}

```
