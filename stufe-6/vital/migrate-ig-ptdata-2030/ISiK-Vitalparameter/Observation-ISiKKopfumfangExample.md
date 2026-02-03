# Example Observation - ISiKKopfumfangExample - ISiK Vitalparameter Implementierungsleitfaden v6.0.0-rc

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0-rc - 6.0.0-rc 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKKopfumfangExample**

## Example Observation: Example Observation - ISiKKopfumfangExample

Profile: [ISiKKopfumfang](StructureDefinition-ISiKKopfumfang.md)

**status**: Final

**category**: Vital Signs

**code**: Kopfumfang

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2019-07-02

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 38 Centimeter (Details: UCUM codecm = 'cm')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKopfumfangExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKopfumfang"
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
        "code" : "9843-4",
        "display" : "Head Occipital-frontal circumference"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "363812007",
        "display" : "Head circumference"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "153856",
        "display" : "MDC_CIRCUM_HEAD"
      }
    ],
    "text" : "Kopfumfang"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2019-07-02",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 38,
    "unit" : "Centimeter",
    "system" : "http://unitsofmeasure.org",
    "code" : "cm"
  }
}

```
