#  - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [SD MII ICU Pulmonalarterieller Wedge Druck](StructureDefinition-sd-mii-icu-pulmonalarterieller-wedge-druck.md)

**status**: Final

**category**: Vital Signs

**code**: Pulmonary artery wedge pressure

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 10 millimeter Mercury column (Details: UCUM codemm[Hg] = 'mm[Hg]')

**bodySite**: Entire vein of lung



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Pulmonalarterieller-wedge-Blutdruck",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-pulmonalarterieller-wedge-druck"
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
        "code" : "118433006",
        "display" : "Pulmonary artery wedge pressure"
      },
      {
        "system" : "http://loinc.org",
        "code" : "75994-4",
        "display" : "Pulmonary artery wedge pressure"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150052",
        "display" : "Pulmonary artery wedge pressure"
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
        "code" : "430160002",
        "display" : "Entire vein of lung"
      }
    ]
  }
}

```
