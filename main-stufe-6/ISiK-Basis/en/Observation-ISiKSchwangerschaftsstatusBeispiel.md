# ISiKSchwangerschaftsstatusBeispiel - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKSchwangerschaftsstatusBeispiel**

## Observation: ISiKSchwangerschaftsstatusBeispiel

Profile: [ISiK Schwangerschaftsstatus](StructureDefinition-ISiKSchwangerschaftsstatus.md)

**status**: Final

**code**: Schwangerschaftsstatus

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**effective**: 2024-01-01

**value**: Pregnant

**hasMember**: [Observation Entbindungstermin, geschätzt aus der letzten Menstruationsperiode](Observation-ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKSchwangerschaftsstatusBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "version" : "2.77",
      "code" : "82810-3",
      "display" : "Schwangerschaftsstatus"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "effectiveDateTime" : "2024-01-01",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "version" : "2.77",
      "code" : "LA15173-0",
      "display" : "Pregnant"
    }]
  },
  "hasMember" : [{
    "reference" : "Observation/ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel"
  }]
}

```
