# SZ1DRGFall - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SZ1DRGFall**

## Account: SZ1DRGFall

Profile: [ISiKAbrechnungsfall](StructureDefinition-ISiKAbrechnungsfall.md)

**identifier**: Account number/0123456789

**status**: Active

**type**: inpatient encounter

**subject**: [Töchterchen Musterfrau (official) Female, DoB: 2010-01-01 ( Medical record number)](Patient-SZ1Patient.md)

> **coverage****Abrechnungsart**: [Abrechnungsart: DRG](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/Abrechnungsart#Abrechnungsart-DRG) (Diagnosebezogene Fallgruppen)**coverage**: [Coverage: status = active; type = gesetzliche Krankenversicherung](Coverage-SZ1VersicherungGesetzlich.md)

> **coverage****Abrechnungsart**: [Abrechnungsart: SZ](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/Abrechnungsart#Abrechnungsart-SZ) (Selbstzahlerrechnung)**coverage**: [Coverage: status = active; type = Selbstzahler](Coverage-SZ1VersicherungSelbstzahler.md)



## Resource Content

```json
{
  "resourceType" : "Account",
  "id" : "SZ1DRGFall",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
    ]
  },
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
      "reference" : "Patient/SZ1Patient"
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
        "reference" : "Coverage/SZ1VersicherungGesetzlich"
      }
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.de/StructureDefinition/ExtensionAbrechnungsart",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/Abrechnungsart",
            "code" : "SZ",
            "display" : "Selbstzahlerrechnung"
          }
        }
      ],
      "coverage" : {
        "reference" : "Coverage/SZ1VersicherungSelbstzahler"
      }
    }
  ]
}

```
