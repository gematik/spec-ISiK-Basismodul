# SZ2DRGFall - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SZ2DRGFall**

## Account: SZ2DRGFall

Profile: [ISiKAbrechnungsfall](StructureDefinition-ISiKAbrechnungsfall.md)

> **Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren**
* Use: [KontaktDiagnoseProzedur: hospital-main-diagnosis](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/KontaktDiagnoseProzedur#KontaktDiagnoseProzedur-hospital-main-diagnosis) (Krankenhaus Hauptdiagnose)
* Referenz: [Condition Diabetes mellitus, Typ 1: Mit Augenkomplikationen: Nicht als entgleist bezeichnet](Condition-SZ2Primaerdiagnose.md)

**identifier**: Account number/22222222222

**status**: Active

**type**: inpatient encounter

**subject**: [Friedlinde Musterfrau (official) Female, DoB: 1924-01-01 ( Medical record number)](Patient-SZ2Patient.md)

### Coverages

| | | |
| :--- | :--- | :--- |
| - | **Extension** | **Coverage** |
| * |  | [Coverage: status = active; type = gesetzliche Krankenversicherung](Coverage-SZ2VersicherungGesetzlich.md) |



## Resource Content

```json
{
  "resourceType" : "Account",
  "id" : "SZ2DRGFall",
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
            "code" : "hospital-main-diagnosis"
          }
        },
        {
          "url" : "Referenz",
          "valueReference" : {
            "reference" : "Condition/SZ2Primaerdiagnose"
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
      "system" : "http://beispiel-krankenhaus.de/sid/fallnummern",
      "value" : "22222222222"
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
      "reference" : "Patient/SZ2Patient"
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
        "reference" : "Coverage/SZ2VersicherungGesetzlich"
      }
    }
  ]
}

```
