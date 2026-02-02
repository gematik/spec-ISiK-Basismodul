# Koerpertemperatur-Nasen-Rachen-Raum - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Koerpertemperatur-Nasen-Rachen-Raum**

## Observation: Koerpertemperatur-Nasen-Rachen-Raum

Profile: [SD MII ICU Koerpertemperatur Nasen-Rachen-Raum](StructureDefinition-sd-mii-icu-koerpertemperatur-nasen-rachen-raum.md)

**status**: Final

**category**: Vital Signs

**code**: Core body temperature measured in nasopharynx

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 37 degree Celsius (Details: UCUM codeCel = 'Cel')

**bodySite**: Nasopharyngeal structure (body structure)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Koerpertemperatur-Nasen-Rachen-Raum",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-nasen-rachen-raum"
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
        "system" : "http://snomed.info/sct",
        "code" : "698831002",
        "display" : "Core body temperature measured in nasopharynx"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8310-5"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "150380",
        "display" : "MDC_TEMP_NASOPH"
      },
      {
        "system" : "http://loinc.org",
        "code" : "60838-0",
        "display" : "Nasopharyngeal temperature"
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
        "code" : "71836000",
        "display" : "Nasopharyngeal structure (body structure)"
      }
    ]
  }
}

```
