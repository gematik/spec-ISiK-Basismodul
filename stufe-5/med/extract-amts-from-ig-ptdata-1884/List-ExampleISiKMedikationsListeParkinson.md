#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## List: 

Profile: [ISiK Medikationsliste](StructureDefinition-ISiKMedikationsListe.md)

| | | | |
| :--- | :--- | :--- | :--- |
| Date: 2024-02-20 | Mode: Working List | Status: Current | Code: Medication List |
| Subject:[Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)Encounter:[Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md) | | | |

* **Items**: [MedicationStatement: status = active; medication[x] = Stalevo® 100 mg/25 mg/200 mg; effective[x] = 2024-02-20 --> (ongoing); dateAsserted = 2024-02-20](MedicationStatement-ExampleISiKMedikationsInformationParkinson1.md)
  * Date: 2024-02-20
* **Items**: [MedicationStatement: status = active; medication[x] = Quetiapin HEXAL® 50 mg; effective[x] = 2024-02-20 --> (ongoing); dateAsserted = 2024-02-20](MedicationStatement-ExampleISiKMedikationsInformationParkinson2.md)
  * Date: 2024-02-20
* **Items**: [MedicationStatement: status = active; medication[x] = Madopar® 125 mg; effective[x] = 2024-02-20 --> (ongoing); dateAsserted = 2024-02-20](MedicationStatement-ExampleISiKMedikationsInformationParkinson3.md)
  * Date: 2024-02-20
* **Items**: [MedicationStatement: status = active; medication[x] = Entacapon HEC 200 mg; effective[x] = 2024-02-20 --> (ongoing); dateAsserted = 2024-02-20](MedicationStatement-ExampleISiKMedikationsInformationParkinson4.md)
  * Date: 2024-02-20
* **Items**: [MedicationStatement: status = active; medication[x] = LevoCarb 200/50 ret - 1 A Pharma®; effective[x] = 2024-02-20 --> (ongoing); dateAsserted = 2024-02-20](MedicationStatement-ExampleISiKMedikationsInformationParkinson5.md)
  * Date: 2024-02-20



## Resource Content

```json
{
  "resourceType" : "List",
  "id" : "ExampleISiKMedikationsListeParkinson",
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
  "date" : "2024-02-20",
  "entry" : [
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson1"
      }
    },
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson2"
      }
    },
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson3"
      }
    },
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson4"
      }
    },
    {
      "date" : "2024-02-20",
      "item" : {
        "reference" : "MedicationStatement/ExampleISiKMedikationsInformationParkinson5"
      }
    }
  ]
}

```
