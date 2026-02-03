# Example Observation - ExampleISiKLaboruntersuchungPCT1 - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ExampleISiKLaboruntersuchungPCT1**

## Example Observation: Example Observation - ExampleISiKLaboruntersuchungPCT1

Profile: [ISiKLaboruntersuchungPCT](StructureDefinition-ISiKLaboruntersuchungPCT.md)

**status**: Final

**category**: Laboratory

**code**: Procalcitonin

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 0.2 ng/mL (Details: UCUM codeng/mL = 'ng/mL')

### ReferenceRanges

| | |
| :--- | :--- |
| - | **High** |
| * | 0.5 ng/mL (Details: UCUM codeng/mL = 'ng/mL') |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungPCT1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungPCT"
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
        "code" : "33959-8"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "418752001",
        "display" : "Procalcitonin"
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
    "value" : 0.2,
    "system" : "http://unitsofmeasure.org",
    "code" : "ng/mL"
  },
  "referenceRange" : [
    {
      "high" : {
        "value" : 0.5,
        "system" : "http://unitsofmeasure.org",
        "code" : "ng/mL"
      }
    }
  ]
}

```
