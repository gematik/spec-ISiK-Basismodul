# Example Observation - ISiKKoerperkerntemperaturExample - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - ISiKKoerperkerntemperaturExample**

## Example Observation: Example Observation - ISiKKoerperkerntemperaturExample

Profile: [ISiKKoerperkerntemperatur](StructureDefinition-ISiKKoerperkerntemperatur.md)

**status**: Final

**category**: Vital Signs

**code**: Körpertemperatur

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2020-10-11

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 36.8 °C (Details: UCUM codeCel = 'Cel')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKoerperkerntemperaturExample",
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
          "code" : "vital-signs"
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
    "text" : "Körpertemperatur"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2020-10-11",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 36.8,
    "unit" : "°C",
    "system" : "http://unitsofmeasure.org",
    "code" : "Cel"
  }
}

```
