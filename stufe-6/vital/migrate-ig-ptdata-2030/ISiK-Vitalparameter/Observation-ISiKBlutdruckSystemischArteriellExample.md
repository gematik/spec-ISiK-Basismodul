# Example Observation - ISiKBlutdruckSystemischArteriellExample - ISiK Vitalparameter Implementierungsleitfaden v6.0.0-rc

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0-rc - 6.0.0-rc 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKBlutdruckSystemischArteriellExample**

## Example Observation: Example Observation - ISiKBlutdruckSystemischArteriellExample

Profile: [ISiKBlutdruckSystemischArteriell](StructureDefinition-ISiKBlutdruckSystemischArteriell.md)

**status**: Final

**category**: Vital Signs

**code**: Systolischer und Diastolischer Blutdruck

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2012-09-17

**performer**: [Practitioner/example](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/example)

**interpretation**: Below low normal

**bodySite**: Right arm

> **component****code**: MDC_PRESS_BLD_SYS**value**: 107 mmHg (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: MDC_PRESS_BLD_DIA**value**: 60 mmHg (Details: UCUM codemm[Hg] = 'mm[Hg]')

> **component****code**: MDC_PRESS_BLD_MEAN**value**: 80 mmHg (Details: UCUM codemm[Hg] = 'mm[Hg]')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKBlutdruckSystemischArteriellExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKBlutdruckSystemischArteriell"
    ]
  },
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "vital-signs",
          "display" : "Vital Signs"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "code" : "85354-9",
        "display" : "Blood pressure panel with all children optional"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "75367002",
        "display" : "Blood pressure"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150016",
        "display" : "MDC_PRESS_BLD"
      }
    ],
    "text" : "Systolischer und Diastolischer Blutdruck"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2012-09-17",
  "performer" : [
    {
      "reference" : "Practitioner/example"
    }
  ],
  "interpretation" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
          "code" : "L",
          "display" : "low"
        }
      ],
      "text" : "Below low normal"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "368209003",
        "display" : "Right arm"
      }
    ]
  },
  "component" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "urn:iso:std:iso:11073:10101",
            "code" : "150017",
            "display" : "MDC_PRESS_BLD_SYS"
          },
          {
            "system" : "http://snomed.info/sct",
            "version" : "http://snomed.info/sct/11000274103",
            "code" : "271649006",
            "display" : "Systolischer Blutdruck"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8480-6"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 107,
        "unit" : "mmHg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "urn:iso:std:iso:11073:10101",
            "code" : "150018",
            "display" : "MDC_PRESS_BLD_DIA"
          },
          {
            "system" : "http://snomed.info/sct",
            "version" : "http://snomed.info/sct/11000274103",
            "code" : "271650006",
            "display" : "Diastolischer Blutdruck"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8462-4"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 60,
        "unit" : "mmHg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "urn:iso:std:iso:11073:10101",
            "code" : "150019",
            "display" : "MDC_PRESS_BLD_MEAN"
          },
          {
            "system" : "http://snomed.info/sct",
            "version" : "http://snomed.info/sct/11000274103",
            "code" : "6797001",
            "display" : "Mittlerer arterieller Druck"
          },
          {
            "system" : "http://loinc.org",
            "code" : "8478-0"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 80,
        "unit" : "mmHg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      }
    }
  ]
}

```
