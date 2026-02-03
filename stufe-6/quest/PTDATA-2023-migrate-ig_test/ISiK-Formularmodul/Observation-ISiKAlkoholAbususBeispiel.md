# Example Observation - ISiKAlkoholAbususBeispiel - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Observation - ISiKAlkoholAbususBeispiel**

## Example Observation: Example Observation - ISiKAlkoholAbususBeispiel

Profile: [ISiK Alkohol Abusus](StructureDefinition-ISiKAlkoholAbusus.md)

**status**: Final

**code**: Schädlicher Gebrauch von Alkohol

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**effective**: 2024-01-01

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: Yes



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKAlkoholAbususBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAlkoholAbusus"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "version" : "http://snomed.info/sct/11000274103/version/20231115",
        "code" : "15167005",
        "display" : "Schädlicher Gebrauch von Alkohol"
      },
      {
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "74043-1",
        "display" : "Alcohol use disorder"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "effectiveDateTime" : "2024-01-01",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueCodeableConcept" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0532",
        "code" : "Y",
        "display" : "Yes"
      }
    ]
  }
}

```
