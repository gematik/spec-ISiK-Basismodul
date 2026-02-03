# Example Observation - ExampleISiKLaboruntersuchungThrombozyten1 - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ExampleISiKLaboruntersuchungThrombozyten1**

## Example Observation: Example Observation - ExampleISiKLaboruntersuchungThrombozyten1

Profile: [ISiKLaboruntersuchungThrombozyten](StructureDefinition-ISiKLaboruntersuchungThrombozyten.md)

**status**: Final

**category**: Laboratory

**code**: Platelet count - finding

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 178 10*3/uL (Details: UCUM code10*3/uL = '10*3/uL')

### ReferenceRanges

| | | |
| :--- | :--- | :--- |
| - | **Low** | **High** |
| * | 150 10*3/uL (Details: UCUM code10*3/uL = '10*3/uL') | 400 10*3/uL (Details: UCUM code10*3/uL = '10*3/uL') |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungThrombozyten1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungThrombozyten"
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
        "code" : "26515-7"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "365632008",
        "display" : "Platelet count - finding"
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
    "value" : 178,
    "system" : "http://unitsofmeasure.org",
    "code" : "10*3/uL"
  },
  "referenceRange" : [
    {
      "low" : {
        "value" : 150,
        "system" : "http://unitsofmeasure.org",
        "code" : "10*3/uL"
      },
      "high" : {
        "value" : 400,
        "system" : "http://unitsofmeasure.org",
        "code" : "10*3/uL"
      }
    }
  ]
}

```
