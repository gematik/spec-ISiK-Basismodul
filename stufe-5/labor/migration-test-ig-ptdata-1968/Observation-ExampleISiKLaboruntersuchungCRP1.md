#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKLaboruntersuchungCRP](StructureDefinition-ISiKLaboruntersuchungCRP.md)

**status**: Final

**category**: Laboratory

**code**: C-reaktives Protein [Masse/Volumen] in Serum oder Plasma

**subject**: [Patient/PatientinMusterfrau](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Patient/PatientinMusterfrau)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 7.4 mg/L(Details: UCUM codemg/L = 'mg/L')

### ReferenceRanges

| | |
| :--- | :--- |
| - | **High** |
| * | 5 mg/L(Details: UCUM codemg/L = 'mg/L') |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungCRP1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungCRP"
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
        "code" : "1988-5",
        "display" : "C-reaktives Protein [Masse/Volumen] in Serum oder Plasma"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "55235003",
        "display" : "C-reactive protein measurement"
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
    "value" : 7.4,
    "system" : "http://unitsofmeasure.org",
    "code" : "mg/L"
  },
  "referenceRange" : [
    {
      "high" : {
        "value" : 5,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg/L"
      }
    }
  ]
}

```
