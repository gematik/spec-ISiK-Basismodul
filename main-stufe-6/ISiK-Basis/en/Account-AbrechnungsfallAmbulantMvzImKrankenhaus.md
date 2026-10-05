# AbrechnungsfallAmbulantMvzImKrankenhaus - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **AbrechnungsfallAmbulantMvzImKrankenhaus**

## Account: AbrechnungsfallAmbulantMvzImKrankenhaus

Profile: [ISiKAbrechnungsfallAmbulant](StructureDefinition-ISiKAbrechnungsfallAmbulant.md)

**Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren**: [Condition/DiagnoseSelteneErkrankung](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Condition/DiagnoseSelteneErkrankung)

**identifier**: Account number/0123456789, ASN/987654310

**status**: Active

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**servicePeriod**: 2024-01-01 08:00:00+0100 --> 2024-01-01 12:00:00+0100

### Coverages

| | | |
| :--- | :--- | :--- |
| - | **Extension** | **Coverage** |
| * |  | [Coverage: status = active; type = gesetzliche Krankenversicherung](Coverage-CoverageGesetzlich.md) |

**owner**: Hochschulambulanz für irgendetwas Dr. Musterfrau



## Resource Content

```json
{
  "resourceType" : "Account",
  "id" : "AbrechnungsfallAmbulantMvzImKrankenhaus",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfallAmbulant"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant",
    "valueReference" : {
      "reference" : "Condition/DiagnoseSelteneErkrankung"
    }
  }],
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "AN"
      }]
    },
    "system" : "https://test.krankenhaus.de/fhir/sid/abrechnungsnummer",
    "value" : "0123456789"
  },
  {
    "type" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKIdentifierTypeErweiterungCS",
        "code" : "ASN"
      }]
    },
    "system" : "https://test.krankenhaus.de/fhir/sid/scheinnummer",
    "value" : "987654310"
  }],
  "status" : "active",
  "subject" : [{
    "reference" : "Patient/PatientinMusterfrau"
  }],
  "servicePeriod" : {
    "start" : "2024-01-01T08:00:00+01:00",
    "end" : "2024-01-01T12:00:00+01:00"
  },
  "coverage" : [{
    "extension" : [{
      "url" : "http://fhir.de/StructureDefinition/ExtensionAbrechnungsart",
      "valueCoding" : {
        "system" : "http://fhir.de/CodeSystem/dkgev/Abrechnungsart",
        "code" : "HSA",
        "display" : "Hochschulambulanz"
      }
    }],
    "coverage" : {
      "reference" : "Coverage/CoverageGesetzlich"
    }
  }],
  "owner" : {
    "display" : "Hochschulambulanz für irgendetwas Dr. Musterfrau"
  }
}

```
