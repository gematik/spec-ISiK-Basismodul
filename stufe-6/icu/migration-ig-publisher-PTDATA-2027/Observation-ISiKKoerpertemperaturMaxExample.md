#  - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKKoerpertemperatur](StructureDefinition-ISiKKoerpertemperatur.md)

**status**: Final

**category**: Vital Signs

**code**: Körpertemperatur - Fiebermessung

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 20:15:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 41.2 °C (Details: UCUM codeCel = 'Cel')

**interpretation**: High

**note**: 

> 

Hyperthermie bei schwerer Sepsis - kontinuierliches Monitoring erforderlich


**bodySite**: Tongue structure

**method**: Digital thermometry

**device**: [Device/ExampleDevice](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Device/ExampleDevice)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKoerpertemperaturMaxExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpertemperatur"
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
        "code" : "8310-5",
        "display" : "Body temperature"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "386725007",
        "display" : "Body temperature"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150364",
        "display" : "MDC_TEMP_BODY"
      }
    ],
    "text" : "Körpertemperatur - Fiebermessung"
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "effectiveDateTime" : "2024-01-15T20:15:00+01:00",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 41.2,
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
      "text" : "Hyperthermie bei schwerer Sepsis - kontinuierliches Monitoring erforderlich"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "21974007",
        "display" : "Tongue structure"
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
