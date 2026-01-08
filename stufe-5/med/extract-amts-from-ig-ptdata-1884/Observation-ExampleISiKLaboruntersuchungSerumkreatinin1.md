#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKLaboruntersuchungSerumkreatinin](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.md)

**status**: Final

**category**: Laboratory

**code**: Creatinine measurement

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**value**: 0.7 mg/dL(Details: UCUM codemg/dL = 'mg/dL')

### ReferenceRanges

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Low** | **High** | **AppliesTo** |
| * | 0.6 mg/dL(Details: UCUM codemg/dL = 'mg/dL') | 1.2 mg/dL(Details: UCUM codemg/dL = 'mg/dL') | female |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungSerumkreatinin1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungSerumkreatinin"
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
        "code" : "2160-0"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "70901006",
        "display" : "Creatinine measurement"
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
    "value" : 0.7,
    "system" : "http://unitsofmeasure.org",
    "code" : "mg/dL"
  },
  "referenceRange" : [
    {
      "low" : {
        "value" : 0.6,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg/dL"
      },
      "high" : {
        "value" : 1.2,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg/dL"
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
