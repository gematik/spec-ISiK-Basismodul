# ISiKSchwangerschaftsstatusBeispiel - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKSchwangerschaftsstatusBeispiel**

## Observation: ISiKSchwangerschaftsstatusBeispiel

Profile: [ISiK Schwangerschaftsstatus](StructureDefinition-ISiKSchwangerschaftsstatus.md)

**status**: Final

**code**: Schwangerschaftsstatus

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**effective**: 2024-01-01

**value**: Schwanger

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
      "system" : "http://snomed.info/sct",
      "version" : "http://snomed.info/sct/11000274103/version/20251115",
      "code" : "77386006",
      "display" : "Schwanger"
    }]
  },
  "hasMember" : [{
    "reference" : "Observation/ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel"
  }]
}

```
