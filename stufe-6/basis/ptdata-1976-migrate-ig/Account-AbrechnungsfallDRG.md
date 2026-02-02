# Example Account - AbrechnungsfallDRG - Basis Implementation Guide v6.0.0-rc

Basis Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Account - AbrechnungsfallDRG**

## Example Account: Example Account - AbrechnungsfallDRG

Profile: [ISiKAbrechnungsfall](StructureDefinition-ISiKAbrechnungsfall.md)

> **Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren**
* Use: [KontaktDiagnoseProzedur: hospital-main-diagnosis](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/KontaktDiagnoseProzedur#KontaktDiagnoseProzedur-hospital-main-diagnosis) (Krankenhaus Hauptdiagnose)
* Referenz: [Condition/DiagnoseSelteneErkrankung](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Condition/DiagnoseSelteneErkrankung)

**identifier**: Account number/0123456789

**status**: Active

**type**: inpatient encounter

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

### Coverages

| | | |
| :--- | :--- | :--- |
| - | **Extension** | **Coverage** |
| * |  | [Coverage: status = active; type = gesetzliche Krankenversicherung](Coverage-CoverageGesetzlich.md) |



## Resource Content

```json
{
  "resourceType" : "Account",
  "id" : "AbrechnungsfallDRG",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
    ]
  },
  "extension" : [
    {
      "extension" : [
        {
          "url" : "Use",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/KontaktDiagnoseProzedur",
            "code" : "hospital-main-diagnosis",
            "display" : "Krankenhaus Hauptdiagnose"
          }
        },
        {
          "url" : "Referenz",
          "valueReference" : {
            "reference" : "Condition/DiagnoseSelteneErkrankung"
          }
        }
      ],
      "url" : "http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur"
    }
  ],
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "AN"
          }
        ]
      },
      "system" : "https://test.krankenhaus.de/fhir/sid/abrechnungsnummer",
      "value" : "0123456789"
    }
  ],
  "status" : "active",
  "type" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code" : "IMP"
      }
    ]
  },
  "subject" : [
    {
      "reference" : "Patient/PatientinMusterfrau"
    }
  ],
  "coverage" : [
    {
      "extension" : [
        {
          "url" : "http://fhir.de/StructureDefinition/ExtensionAbrechnungsart",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/Abrechnungsart",
            "code" : "DRG",
            "display" : "Diagnosebezogene Fallgruppen"
          }
        }
      ],
      "coverage" : {
        "reference" : "Coverage/CoverageGesetzlich"
      }
    }
  ]
}

```
