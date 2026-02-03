# Example Observation - ISiKKoerperkerntemperaturMaxExample - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKKoerperkerntemperaturMaxExample**

## Example Observation: Example Observation - ISiKKoerperkerntemperaturMaxExample

Profile: [ISiKKoerperkerntemperatur](StructureDefinition-ISiKKoerperkerntemperatur.md)

**status**: Final

**category**: Vital Signs

**code**: Körperkerntemperatur - Intensivmonitoring

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 16:45:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 42.5 °C (Details: UCUM codeCel = 'Cel')

**interpretation**: High

**note**: 

> 

Hyperthermie - Ösophageale Kerntemperaturmessung bei maligner Hyperthermie


**bodySite**: Entire esophagus

**method**: Digital thermometry

**device**: [Device/ExampleDevice](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Device/ExampleDevice)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKoerperkerntemperaturMaxExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerperkerntemperatur"
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
        "code" : "8310-5"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "276885007",
        "display" : "Core body temperature"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150368",
        "display" : "MDC_TEMP_CORE"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8329-5",
        "display" : "Body temperature - Core"
      }
    ],
    "text" : "Körperkerntemperatur - Intensivmonitoring"
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "effectiveDateTime" : "2024-01-15T16:45:00+01:00",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 42.5,
    "unit" : "°C",
    "system" : "http://unitsofmeasure.org",
    "code" : "Cel"
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
      "text" : "Hyperthermie - Ösophageale Kerntemperaturmessung bei maligner Hyperthermie"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "245544008",
        "display" : "Entire esophagus"
      }
    ]
  },
  "method" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "448169003",
        "display" : "Digital thermometry"
      }
    ]
  },
  "device" : {
    "reference" : "Device/ExampleDevice"
  }
}

```
