# ExampleISiKMedikationsVerordnungBedarfsmedikation - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleISiKMedikationsVerordnungBedarfsmedikation**

## MedicationRequest: ExampleISiKMedikationsVerordnungBedarfsmedikation

Profile: [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

**ISiK Medikationsart**: [ISiK Medikationsart: akut](CodeSystem-ISiKMedikationsartCS.md#ISiKMedikationsartCS-akut) (Akutmedikation)

**status**: Active

**intent**: Order

**medication**: [Medication Acetylcystein](Medication-ExampleISiKMedikament1.md)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**authoredOn**: 2026-04-24

**requester**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

> **dosageInstruction****Dosage AsNeededFor**: Starke Schmerzen**Dosage AsNeededFor**: Moderate Schmerzen**timing**: Once per 6 hours**asNeeded**: true

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 1 Tablette (Details: standardterms.edqm.eu code15054000 = 'Tablet') |




## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "ExampleISiKMedikationsVerordnungBedarfsmedikation",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerordnung"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedikationsart",
    "valueCoding" : {
      "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKMedikationsartCS",
      "code" : "akut"
    }
  }],
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament1"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "authoredOn" : "2026-04-24",
  "requester" : {
    "reference" : "Practitioner/PractitionerWalterArzt"
  },
  "dosageInstruction" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Dosage.asNeededFor",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "version" : "http://snomed.info/sct/11000274103/version/20251115",
          "code" : "76948002",
          "display" : "Starke Schmerzen"
        }]
      }
    },
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Dosage.asNeededFor",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "version" : "http://snomed.info/sct/11000274103/version/20251115",
          "code" : "50415004",
          "display" : "Moderate Schmerzen"
        }]
      }
    }],
    "timing" : {
      "repeat" : {
        "frequency" : 1,
        "period" : 6,
        "periodUnit" : "h"
      }
    },
    "asNeededBoolean" : true,
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 1,
        "unit" : "Tablette",
        "system" : "http://standardterms.edqm.eu",
        "code" : "15054000"
      }
    }]
  }]
}

```
