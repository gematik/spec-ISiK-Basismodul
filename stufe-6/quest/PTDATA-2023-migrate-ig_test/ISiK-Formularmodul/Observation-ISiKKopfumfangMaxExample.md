# Example Observation - ISiKKopfumfangMaxExample - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - ISiKKopfumfangMaxExample**

## Example Observation: Example Observation - ISiKKopfumfangMaxExample

Profile: [ISiKKopfumfang](StructureDefinition-ISiKKopfumfang.md)

**status**: Final

**category**: Vital Signs

**code**: Kopfumfang - Pädiatrische Verlaufskontrolle

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 11:00:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 60.5 Centimeter (Details: UCUM codecm = 'cm')

**interpretation**: Normal

**note**: 

> 

Kopfumfang im normalen Bereich für Alter und Geschlecht - Wachstumsperzentile P50


**bodySite**: Head structure

**method**: Action - using tape measure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKopfumfangMaxExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKopfumfang"
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
        "code" : "9843-4",
        "display" : "Head Occipital-frontal circumference"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "363812007",
        "display" : "Head circumference"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "153856",
        "display" : "MDC_CIRCUM_HEAD"
      }
    ],
    "text" : "Kopfumfang - Pädiatrische Verlaufskontrolle"
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "effectiveDateTime" : "2024-01-15T11:00:00+01:00",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 60.5,
    "unit" : "Centimeter",
    "system" : "http://unitsofmeasure.org",
    "code" : "cm"
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
      "text" : "Kopfumfang im normalen Bereich für Alter und Geschlecht - Wachstumsperzentile P50"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "69536005",
        "display" : "Head structure"
      }
    ]
  },
  "method" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "129264002",
        "display" : "Action - using tape measure"
      }
    ]
  }
}

```
