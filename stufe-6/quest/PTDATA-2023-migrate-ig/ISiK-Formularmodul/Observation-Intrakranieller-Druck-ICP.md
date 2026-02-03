# Example Observation - Intrakranieller-Druck-ICP - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - Intrakranieller-Druck-ICP**

## Example Observation: Example Observation - Intrakranieller-Druck-ICP

Profile: [SD MII ICU Intrakranieller Druck ICP](StructureDefinition-sd-mii-icu-intrakranieller-druck-icp.md)

**status**: Final

**category**: Vital Signs

**code**: Intracranial pressure

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 10 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

**bodySite**: Entire intracranial structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Intrakranieller-Druck-ICP",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-intrakranieller-druck-icp"
    ]
  },
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "vital-signs"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "250844005",
        "display" : "Intracranial pressure"
      },
      {
        "system" : "http://loinc.org",
        "code" : "60956-0",
        "display" : "Intracranial pressure (ICP)"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "153608",
        "display" : "Intracranial pressure"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectivePeriod" : {
    "start" : "2019-12-23T09:30:10+01:00",
    "end" : "2019-12-23T10:30:10+01:00"
  },
  "valueQuantity" : {
    "value" : 10,
    "unit" : "millimeter Mercury column",
    "system" : "http://unitsofmeasure.org",
    "code" : "mm[Hg]"
  },
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "731998000",
        "display" : "Entire intracranial structure"
      }
    ]
  }
}

```
