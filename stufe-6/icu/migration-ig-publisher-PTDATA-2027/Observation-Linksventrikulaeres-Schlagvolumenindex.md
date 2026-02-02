#  - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [SD MII ICU Linksventrikulaeres Schlagvolumenindex](StructureDefinition-sd-mii-icu-linksventrikulaeres-schlagvolumenindex.md)

**status**: Final

**category**: Vital Signs

**code**: Left ventricular Stroke volume index

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 40 milliliter per square meter (Details: UCUM codemL/m2 = 'mL/m2')

**bodySite**: Left cardiac ventricular structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Linksventrikulaeres-Schlagvolumenindex",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventrikulaeres-schlagvolumenindex"
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
        "system" : "http://loinc.org",
        "code" : "76297-1",
        "display" : "Left ventricular Stroke volume index"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150636",
        "display" : "MDC_VOL_BLD_STROKE_INDEX"
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
    "value" : 40,
    "unit" : "milliliter per square meter",
    "system" : "http://unitsofmeasure.org",
    "code" : "mL/m2"
  },
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "87878005",
        "display" : "Left cardiac ventricular structure"
      }
    ]
  }
}

```
