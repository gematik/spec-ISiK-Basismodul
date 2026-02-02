# Koerpertemperatur-rektal - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Koerpertemperatur-rektal**

## Observation: Koerpertemperatur-rektal

Profile: [SD MII ICU Koerpertemperatur rektal](StructureDefinition-sd-mii-icu-koerpertemperatur-rektal.md)

**status**: Final

**category**: Vital Signs

**code**: Core body temperature measured in rectum

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 37 degree Celsius (Details: UCUM codeCel = 'Cel')

**bodySite**: Rectum structure (body structure)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Koerpertemperatur-rektal",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-rektal"
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
        "code" : "307047009",
        "display" : "Core body temperature measured in rectum"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8329-5"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8332-9",
        "display" : "Rectal temperature"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "188420",
        "display" : "Rectal temperature"
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
        "code" : "34402009",
        "display" : "Rectum structure (body structure)"
      }
    ]
  }
}

```
