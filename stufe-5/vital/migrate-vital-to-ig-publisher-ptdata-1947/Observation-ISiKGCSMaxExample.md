#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKGCS](StructureDefinition-ISiKGCS.md)

**status**: Final

**category**: Survey

**code**: Glasgow coma score total

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 10:00:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 15 Punktwert(Details: UCUM code1 = '1')

**interpretation**: Normal

**note**: 

> 

Patient vollständig orientiert und kooperativ


> **component****code**:Glasgow coma score verbal**value**:Oriented

> **component****code**:Glasgow coma score motor**value**:Obeys commands

> **component****code**:Glasgow coma score eye opening**value**:Eyes open spontaneously



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKGCSMaxExample",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKGCS"]
  },
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "survey"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "code" : "9269-2",
        "display" : "Glasgow coma score total"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "248241002",
        "display" : "Glasgow coma score"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "153728",
        "display" : "MDC_SCORE_GLAS_COMA"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "effectiveDateTime" : "2024-01-15T10:00:00+01:00",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 15,
    "unit" : "Punktwert",
    "system" : "http://unitsofmeasure.org",
    "code" : "1"
  },
  "interpretation" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
          "code" : "N",
          "display" : "Normal"
        }
      ]
    }
  ],
  "note" : [
    {
      "text" : "Patient vollständig orientiert und kooperativ"
    }
  ],
  "component" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "9270-0",
            "display" : "Glasgow coma score verbal"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "LA6558-6",
            "display" : "Oriented"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "9268-4",
            "display" : "Glasgow coma score motor"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "LA6567-7",
            "display" : "Obeys commands"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "9267-6",
            "display" : "Glasgow coma score eye opening"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "LA6556-0",
            "display" : "Eyes open spontaneously"
          }
        ]
      }
    }
  ]
}

```
