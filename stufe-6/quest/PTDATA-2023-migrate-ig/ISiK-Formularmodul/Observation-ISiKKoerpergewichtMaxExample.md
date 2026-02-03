# Example Observation - ISiKKoerpergewichtMaxExample - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKKoerpergewichtMaxExample**

## Example Observation: Example Observation - ISiKKoerpergewichtMaxExample

Profile: [ISiKKoerpergewicht](StructureDefinition-ISiKKoerpergewicht.md)

**status**: Final

**category**: Vital Signs

**code**: Körpergewicht - Bettwaage

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 08:00:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 185 kilogram (Details: UCUM codekg = 'kg')

**note**: 

> 

Gewichtsmessung mit kalibrierten Bettwaage bei bettlägerigem Patienten


**bodySite**: Entire body as a whole

**method**: Measurement using bed scale

**device**: [Device/ExampleDevice](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Device/ExampleDevice)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKoerpergewichtMaxExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergewicht"
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
        "code" : "29463-7",
        "display" : "Body weight"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "27113001",
        "display" : "Body weight"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "188736",
        "display" : "MDC_MASS_BODY_ACTUAL"
      }
    ],
    "text" : "Körpergewicht - Bettwaage"
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "effectiveDateTime" : "2024-01-15T08:00:00+01:00",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 185,
    "unit" : "kilogram",
    "system" : "http://unitsofmeasure.org",
    "code" : "kg"
  },
  "note" : [
    {
      "text" : "Gewichtsmessung mit kalibrierten Bettwaage bei bettlägerigem Patienten"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "38266002",
        "display" : "Entire body as a whole"
      }
    ]
  },
  "method" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "786458005",
        "display" : "Measurement using bed scale"
      }
    ]
  },
  "device" : {
    "reference" : "Device/ExampleDevice"
  }
}

```
