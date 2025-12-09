#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiK Schwangerschaft - Erwarteter Entbindungstermin](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.md)

**status**: Final

**code**: Delivery date Estimated from last menstrual period

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**effective**: 2024-01-01

**performer**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**value**: 2024-08-01



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "11779-6",
        "display" : "Delivery date Estimated from last menstrual period"
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
  "valueDateTime" : "2024-08-01"
}

```
