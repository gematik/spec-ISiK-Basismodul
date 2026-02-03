# Example Observation - ISiKKoerpergewichtExample - ISiK Vitalparameter Implementierungsleitfaden v6.0.0-rc

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0-rc - 6.0.0-rc 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKKoerpergewichtExample**

## Example Observation: Example Observation - ISiKKoerpergewichtExample

Profile: [ISiKKoerpergewicht](StructureDefinition-ISiKKoerpergewicht.md)

**status**: Final

**category**: Vital Signs

**code**: Körpergewicht

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2020-10-11

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 79 kilogram (Details: UCUM codekg = 'kg')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKoerpergewichtExample",
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
          "code" : "vital-signs"
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
    "text" : "Körpergewicht"
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
    "value" : 79,
    "unit" : "kilogram",
    "system" : "http://unitsofmeasure.org",
    "code" : "kg"
  }
}

```
