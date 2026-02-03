# Example Observation - ISiKKoerpertemperaturExample - ISiK Vitalparameter Implementierungsleitfaden v6.0.0-rc

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0-rc - 6.0.0-rc 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKKoerpertemperaturExample**

## Example Observation: Example Observation - ISiKKoerpertemperaturExample

Profile: [ISiKKoerpertemperatur](StructureDefinition-ISiKKoerpertemperatur.md)

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
  "id" : "ISiKKoerpertemperaturExample",
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
          "code" : "vital-signs"
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
