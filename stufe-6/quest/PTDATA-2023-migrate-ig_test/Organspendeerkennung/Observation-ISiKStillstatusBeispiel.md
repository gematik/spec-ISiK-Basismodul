#  - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKStillstatus](StructureDefinition-ISiKStillstatus.md)

**status**: Final

**code**: Breastfeeding (mother)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**effective**: 2024-01-01

**performer**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**value**: Currently breastfeeding



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKStillstatusBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "version" : "http://snomed.info/sct/11000274103/version/20231115",
        "code" : "413712001",
        "display" : "Breastfeeding (mother)"
      },
      {
        "system" : "http://loinc.org",
        "version" : "2.77",
        "code" : "63895-7",
        "display" : "Breastfeeding status"
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
        "code" : "LA29252-6",
        "display" : "Currently breastfeeding"
      }
    ]
  }
}

```
