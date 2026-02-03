#  - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKBlutdruckSystemischArteriell](StructureDefinition-ISiKBlutdruckSystemischArteriell.md)

**status**: Final

**category**: Vital Signs

**code**: Blutdruck - Intensivmonitoring

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 14:30:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**interpretation**: Hypertensive Krise

**note**: 

> 

Arterielle Blutdruckmessung über arteriellen Katheter


**bodySite**: Left arm

**method**: Palpation

**device**: [Device/ExampleDevice](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Device/ExampleDevice)

> **component****code**: MDC_PRESS_BLD_SYS**value**: 200 mmHg (Details: UCUM codemm[Hg] = 'mm[Hg]')**interpretation**: High

> **component****code**: MDC_PRESS_BLD_DIA**value**: 120 mmHg (Details: UCUM codemm[Hg] = 'mm[Hg]')**interpretation**: High

> **component****code**: MDC_PRESS_BLD_MEAN**value**: 147 mmHg (Details: UCUM codemm[Hg] = 'mm[Hg]')**interpretation**: High



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKBlutdruckSystemischArteriellMaxExample",
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
    "text" : "Blutdruck - Intensivmonitoring"
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "effectiveDateTime" : "2024-01-15T14:30:00+01:00",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "interpretation" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
          "code" : "H",
          "display" : "High"
        }
      ],
      "text" : "Hypertensive Krise"
    }
  ],
  "note" : [
    {
      "text" : "Arterielle Blutdruckmessung über arteriellen Katheter"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "368208008",
        "display" : "Left arm"
      }
    ]
  },
  "method" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "113011001",
        "display" : "Palpation"
      }
    ]
  },
  "device" : {
    "reference" : "Device/ExampleDevice"
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
        "value" : 200,
        "unit" : "mmHg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      },
      "interpretation" : [
        {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
              "code" : "H",
              "display" : "High"
            }
          ]
        }
      ]
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
        "value" : 120,
        "unit" : "mmHg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      },
      "interpretation" : [
        {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
              "code" : "H",
              "display" : "High"
            }
          ]
        }
      ]
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
        "value" : 147,
        "unit" : "mmHg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      },
      "interpretation" : [
        {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
              "code" : "H",
              "display" : "High"
            }
          ]
        }
      ]
    }
  ]
}

```
