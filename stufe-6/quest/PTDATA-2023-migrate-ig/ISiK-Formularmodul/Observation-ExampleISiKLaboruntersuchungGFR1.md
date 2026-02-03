# Example Observation - ExampleISiKLaboruntersuchungGFR1 - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - ExampleISiKLaboruntersuchungGFR1**

## Example Observation: Example Observation - ExampleISiKLaboruntersuchungGFR1

Profile: [ISiKLaboruntersuchungGFR](StructureDefinition-ISiKLaboruntersuchungGFR.md)

**status**: Final

**category**: Laboratory

**code**: Glomerular filtration rate

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 100 milliliter pro Minute pro Körperoberfläche von 1,73 m2 (Details: UCUM codemL/min/(1.73) = 'mL/min/(1.73)')

### ReferenceRanges

| | |
| :--- | :--- |
| - | **High** |
| * | 100 milliliter pro Minute pro Körperoberfläche von 1,73 m2 (Details: UCUM codemL/min/(1.73) = 'mL/min/(1.73)') |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungGFR1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungGFR"
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
        "code" : "98980-6"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "80274001",
        "display" : "Glomerular filtration rate"
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
    "value" : 100,
    "unit" : "milliliter pro Minute pro Körperoberfläche von 1,73 m2",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL/min/(1.73)"
  },
  "referenceRange" : [
    {
      "high" : {
        "value" : 100,
        "unit" : "milliliter pro Minute pro Körperoberfläche von 1,73 m2",
        "system" : "http://unitsofmeasure.org",
        "code" : "mL/min/(1.73)"
      }
    }
  ]
}

```
