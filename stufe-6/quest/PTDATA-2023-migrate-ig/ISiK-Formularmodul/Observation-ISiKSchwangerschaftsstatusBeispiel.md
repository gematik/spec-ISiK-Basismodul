# Example Observation - ISiKSchwangerschaftsstatusBeispiel - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKSchwangerschaftsstatusBeispiel**

## Example Observation: Example Observation - ISiKSchwangerschaftsstatusBeispiel

Profile: [ISiK Schwangerschaftsstatus](StructureDefinition-ISiKSchwangerschaftsstatus.md)

**status**: Final

**code**: Pregnancy status

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**effective**: 2024-01-01

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: Pregnant

**hasMember**: [Observation Delivery date Estimated from last menstrual period](Observation-ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKSchwangerschaftsstatusBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "82810-3",
        "display" : "Pregnancy status"
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
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "LA15173-0",
        "display" : "Pregnant"
      }
    ]
  },
  "hasMember" : [
    {
      "reference" : "Observation/ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel"
    }
  ]
}

```
