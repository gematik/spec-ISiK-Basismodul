#  - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## List: 

Profile: [ISiK Medikationsliste](StructureDefinition-ISiKMedikationsListe.md)

| | | | |
| :--- | :--- | :--- | :--- |
| Date: 2021-07-04 | Mode: Working List | Status: Current | Code: Medication List |
| Subject:[Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)Encounter:[Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md) | | | |

* **Items**: [MedicationStatement: extension = Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar.,akut (ISiKMedikationsartCS#akut),true,Schmerztherapie postoperativ; status = active; medication[x] = ->Medication Acetylcystein; effective[x] = 2021-07-01 --> (ongoing); dateAsserted = 2021-07-01](MedicationStatement-ExampleISiKMedikationsInformation1.md)
  * Date: 2021-07-01
* **Items**: [MedicationStatement: extension = ->MedicationStatement: extension = Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar.,akut (ISiKMedikationsartCS#akut),true,Schmerztherapie postoperativ; status = active; medication[x] = ->Medication Acetylcystein; effective[x] = 2021-07-01 --> (ongoing); dateAsserted = 2021-07-01; status = active; medication[x] = ->Medication ; effective[x] = 2021-07-04 --> (ongoing); dateAsserted = 2021-07-03](MedicationStatement-ExampleISiKMedikationsInformation2.md)
  * Date: 2021-07-04



## Resource Content

```json
{
  "resourceType" : "List",
  "id" : "ExampleISiKMedikationsListe",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsListe"
    ]
  },
  "status" : "current",
  "mode" : "working",
  "code" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/list-example-use-codes",
        "code" : "medications"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "date" : "2021-07-04",
  "entry" : [
    {
      "date" : "2021-07-01",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformation1"
      }
    },
    {
      "date" : "2021-07-04",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformation2"
      }
    }
  ]
}

```
