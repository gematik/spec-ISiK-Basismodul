#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKAtemfrequenz](StructureDefinition-ISiKAtemfrequenz.md)

**status**: Final

**category**: Vital Signs

**code**: Atemfrequenz - Intensivüberwachung

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 14:30:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 35 Atemzüge pro Minute(Details: UCUM code/min = '/min')

**interpretation**: High

**note**: 

> 

Tachypnoe bei akuter respiratorischer Insuffizienz


**bodySite**: Entire chest

**method**: Auscultation



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKAtemfrequenzMaxExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAtemfrequenz"
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
        "code" : "9279-1",
        "display" : "Respiratory rate"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "86290005",
        "display" : "Respiratory rate"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "151562",
        "display" : "MDC_RESP_RATE"
      }
    ],
    "text" : "Atemfrequenz - Intensivüberwachung"
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
  "valueQuantity" : {
    "value" : 35,
    "unit" : "Atemzüge pro Minute",
    "system" : "http://unitsofmeasure.org",
    "code" : "/min"
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
  ],
  "note" : [
    {
      "text" : "Tachypnoe bei akuter respiratorischer Insuffizienz"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "181216001",
        "display" : "Entire chest"
      }
    ]
  },
  "method" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "37931006",
        "display" : "Auscultation"
      }
    ]
  }
}

```
