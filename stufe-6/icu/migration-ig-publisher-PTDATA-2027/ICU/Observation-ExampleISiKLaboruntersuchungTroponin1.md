# ExampleISiKLaboruntersuchungTroponin1 - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleISiKLaboruntersuchungTroponin1**

## Observation: ExampleISiKLaboruntersuchungTroponin1

Profile: [ISiKLaboruntersuchungTroponin](StructureDefinition-ISiKLaboruntersuchungTroponin.md)

**status**: Final

**category**: Laboratory

**code**: Troponin measurement

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 0.1 ug/L (Details: UCUM codeug/L = 'ug/L')

### ReferenceRanges

| | |
| :--- | :--- |
| - | **High** |
| * | 0.4 ug/L (Details: UCUM codeug/L = 'ug/L') |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungTroponin1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungTroponin"
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
        "code" : "42757-5"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "105000003",
        "display" : "Troponin measurement"
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
    "value" : 0.1,
    "system" : "http://unitsofmeasure.org",
    "code" : "ug/L"
  },
  "referenceRange" : [
    {
      "high" : {
        "value" : 0.4,
        "system" : "http://unitsofmeasure.org",
        "code" : "ug/L"
      }
    }
  ]
}

```
