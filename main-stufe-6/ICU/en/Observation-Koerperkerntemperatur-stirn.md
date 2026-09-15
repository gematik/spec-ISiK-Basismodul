# Koerperkerntemperatur-stirn - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Koerperkerntemperatur-stirn**

## Observation: Koerperkerntemperatur-stirn

Profile: [SD MII ICU Koerperkerntemperatur Stirn](StructureDefinition-sd-mii-icu-koerperkerntemperatur-stirn.md)

**status**: Final

**category**: Vital Signs

**code**: Estimated core body temperature measured on forehead

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 39.4 degree Celsius (Details: UCUM codeCel = 'Cel')

**bodySite**: Forehead structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Koerperkerntemperatur-stirn",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerperkerntemperatur-stirn"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "vital-signs"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "8310-5"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "1366425007",
      "display" : "Estimated core body temperature measured on forehead"
    },
    {
      "system" : "http://loinc.org",
      "code" : "8329-5"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectivePeriod" : {
    "start" : "2019-12-23T09:30:10+01:00",
    "end" : "2019-12-23T10:30:10+01:00"
  },
  "valueQuantity" : {
    "value" : 39.4,
    "unit" : "degree Celsius",
    "system" : "http://unitsofmeasure.org",
    "code" : "Cel"
  },
  "bodySite" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "52795006",
      "display" : "Forehead structure"
    }]
  }
}

```
