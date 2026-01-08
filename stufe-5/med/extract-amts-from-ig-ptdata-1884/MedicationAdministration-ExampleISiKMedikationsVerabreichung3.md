#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MedicationAdministration: 

Profile: [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md)

**status**: Completed

**medication**: [Medication](Medication-ExampleISiKMedikament9.md)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**context**: [Encounter/FachabteilungskontaktMinimal](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Encounter/FachabteilungskontaktMinimal)

**effective**: 2021-07-01

**note**: 

> 

Testnotiz


### Dosages

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| - | **Text** | **Site** | **Route** | **Dose** | **Rate[x]** |
| * | 1L Infusion mit Rate 50ml/h | Structure of ligament of left superior vena cava | Intravenous use | 1000 mL(Details: UCUM codemL = 'mL') | 50 mL/h(Details: UCUM codemL/h = 'mL/h') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "ExampleISiKMedikationsVerabreichung3",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung"
    ]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament9"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal",
    "identifier" : {
      "value" : "0123456789"
    }
  },
  "effectiveDateTime" : "2021-07-01",
  "note" : [
    {
      "text" : "Testnotiz"
    }
  ],
  "dosage" : {
    "text" : "1L Infusion mit Rate 50ml/h",
    "site" : {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "6073002",
          "display" : "Structure of ligament of left superior vena cava"
        }
      ]
    },
    "route" : {
      "coding" : [
        {
          "system" : "http://standardterms.edqm.eu",
          "code" : "20045000",
          "display" : "Intravenous use"
        }
      ]
    },
    "dose" : {
      "value" : 1000,
      "unit" : "mL",
      "system" : "http://unitsofmeasure.org",
      "code" : "mL"
    },
    "rateQuantity" : {
      "value" : 50,
      "unit" : "mL/h",
      "system" : "http://unitsofmeasure.org",
      "code" : "mL/h"
    }
  }
}

```
