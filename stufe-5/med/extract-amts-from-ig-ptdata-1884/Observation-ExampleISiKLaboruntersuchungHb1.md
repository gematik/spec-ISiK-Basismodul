#  - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKLaboruntersuchungHb](StructureDefinition-ISiKLaboruntersuchungHb.md)

**status**: Final

**category**: Laboratory

**code**: Concentration of hemoglobin in erythrocyte

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**value**: 11.4 g/dL(Details: UCUM codeg/dL = 'g/dL')

### ReferenceRanges

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Low** | **High** | **AppliesTo** |
| * | 12 g/dL(Details: UCUM codeg/dL = 'g/dL') | 16 g/dL(Details: UCUM codeg/dL = 'g/dL') | female |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungHb1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungHb"
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
        "code" : "718-7"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "416125006",
        "display" : "Concentration of hemoglobin in erythrocyte"
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
    "value" : 11.4,
    "system" : "http://unitsofmeasure.org",
    "code" : "g/dL"
  },
  "referenceRange" : [
    {
      "low" : {
        "value" : 12,
        "system" : "http://unitsofmeasure.org",
        "code" : "g/dL"
      },
      "high" : {
        "value" : 16,
        "system" : "http://unitsofmeasure.org",
        "code" : "g/dL"
      },
      "appliesTo" : [
        {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "248152002",
              "display" : "female"
            }
          ]
        }
      ]
    }
  ]
}

```
