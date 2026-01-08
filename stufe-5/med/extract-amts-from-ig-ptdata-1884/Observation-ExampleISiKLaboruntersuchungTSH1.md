#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKLaboruntersuchungTSH](StructureDefinition-ISiKLaboruntersuchungTSH.md)

**status**: Final

**category**: Laboratory

**code**: Thyroid stimulating hormone measurement

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**value**: 3.4 u[IU]/mL(Details: UCUM codeu[IU]/mL = 'u[IU]/mL')

### ReferenceRanges

| | | |
| :--- | :--- | :--- |
| - | **Low** | **High** |
| * | 0.27 u[IU]/mL(Details: UCUM codeu[IU]/mL = 'u[IU]/mL') | 4.2 u[IU]/mL(Details: UCUM codeu[IU]/mL = 'u[IU]/mL') |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungTSH1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungTSH"
    ]
  },
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "laboratory"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "code" : "3015-5"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "61167004",
        "display" : "Thyroid stimulating hormone measurement"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2021-09-01T12:00:00Z",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 3.4,
    "system" : "http://unitsofmeasure.org",
    "code" : "u[IU]/mL"
  },
  "referenceRange" : [
    {
      "low" : {
        "value" : 0.27,
        "system" : "http://unitsofmeasure.org",
        "code" : "u[IU]/mL"
      },
      "high" : {
        "value" : 4.2,
        "system" : "http://unitsofmeasure.org",
        "code" : "u[IU]/mL"
      }
    }
  ]
}

```
