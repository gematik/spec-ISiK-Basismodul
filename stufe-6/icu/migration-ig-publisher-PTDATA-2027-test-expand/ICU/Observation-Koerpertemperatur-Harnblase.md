# Koerpertemperatur-Harnblase - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Koerpertemperatur-Harnblase**

## Observation: Koerpertemperatur-Harnblase

Profile: [SD MII ICU Koerpertemperatur Harnblase](StructureDefinition-sd-mii-icu-koerpertemperatur-harnblase.md)

**status**: Final

**category**: Vital Signs

**code**: Core body temperature measured at urinary bladder

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-12-23 09:30:10+0100 --> 2019-12-23 10:30:10+0100

**value**: 37 degree Celsius (Details: UCUM codeCel = 'Cel')

**bodySite**: Urinary bladder structure (body structure)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Koerpertemperatur-Harnblase",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-harnblase"
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
        "code" : "698832009",
        "display" : "Core body temperature measured at urinary bladder"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8329-5"
      },
      {
        "system" : "http://loinc.org",
        "code" : "8334-5",
        "display" : "Body temperature - Urinary bladder"
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
        "code" : "89837001",
        "display" : "Urinary bladder structure (body structure)"
      }
    ]
  }
}

```
