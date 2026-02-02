# Example Observation - Koerpertemperatur-Speiseroehre - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - Koerpertemperatur-Speiseroehre**

## Example Observation: Example Observation - Koerpertemperatur-Speiseroehre

Profile: [SD MII ICU Koerpertemperatur Speiseroehre](StructureDefinition-sd-mii-icu-koerpertemperatur-speiseroehre.md)

**status**: Final

**category**: Vital Signs

**code**: Core body temperature measured in esophagus

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 37 degree Celsius (Details: UCUM codeCel = 'Cel')

**bodySite**: Esophageal structure (body structure)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Koerpertemperatur-Speiseroehre",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-speiseroehre"
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
        "code" : "431598003",
        "display" : "Core body temperature measured in esophagus"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8329-5"
      },
      {
        "system" : "http://loinc.org",
        "code" : "60836-4",
        "display" : "Esophageal temperature"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150372",
        "display" : "MDC_TEMP_ESOPH"
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
    "value" : 37,
    "unit" : "degree Celsius",
    "system" : "http://unitsofmeasure.org",
    "code" : "Cel"
  },
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "32849002",
        "display" : "Esophageal structure (body structure)"
      }
    ]
  }
}

```
