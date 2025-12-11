# ObservationCodesTSH - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesTSH**

## ValueSet: ObservationCodesTSH 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesTSH | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:ObservationCodesTSH |

 
Enthält LOINC-Codes für die Observation TSH 

 **References** 

* [ISiKLaboruntersuchungTSH](StructureDefinition-ISiKLaboruntersuchungTSH.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationCodesTSH",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesTSH",
  "version" : "0.0.1",
  "name" : "ObservationCodesTSH",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "description" : "Enthält LOINC-Codes für die Observation TSH",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "3015-5",
            "display" : "Thyreotropin [Einheiten/Volumen] in Blut"
          },
          {
            "code" : "26998-5",
            "display" : "Thyreotropin [Einheiten/Volumen] in Speichel"
          },
          {
            "code" : "3016-3",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma"
          },
          {
            "code" : "14999-7",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --Basislinie"
          },
          {
            "code" : "50533-9",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1. Probenmaterial"
          },
          {
            "code" : "50534-7",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --2. Probenmaterial"
          },
          {
            "code" : "50535-4",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --3. Probenmaterial"
          },
          {
            "code" : "50536-2",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --4. Probenmaterial"
          },
          {
            "code" : "50537-0",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --5. Probenmaterial"
          },
          {
            "code" : "50538-8",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --6. Probenmaterial"
          },
          {
            "code" : "50539-6",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --7. Probenmaterial"
          },
          {
            "code" : "50540-4",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --8. Probenmaterial"
          },
          {
            "code" : "5385-0",
            "display" : "Thyreotropin-Rezeptor-Antikörper [Einheiten/Volumen] in Serum"
          },
          {
            "code" : "15000-3",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --vor Dosis TRH intravenös"
          },
          {
            "code" : "11580-8",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma mittels Nachweisgrenze <= 0,005 mIU/L"
          },
          {
            "code" : "11579-0",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma mittels Nachweisgrenze <= 0,05 mIU/L"
          },
          {
            "code" : "57416-0",
            "display" : "Thyreotropin-Rezeptor-Antikörper [Einheiten/Volumen] in Serum mittels Immunoassay"
          },
          {
            "code" : "33260-1",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1,5 Stunden nach Dosis TRH"
          },
          {
            "code" : "12934-6",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --15 Minuten nach XXX Stimulation"
          },
          {
            "code" : "33259-3",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1 Stunde nach Dosis TRH"
          },
          {
            "code" : "25789-9",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1. Probenmaterial nach XXX Stimulation"
          },
          {
            "code" : "50541-2",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --20 Minuten nach Dosis TRH"
          },
          {
            "code" : "33261-9",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --2 Stunden nach Dosis TRH"
          },
          {
            "code" : "12941-1",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --2. Probenmaterial nach XXX Stimulation"
          },
          {
            "code" : "33258-5",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --30 Minuten nach Dosis TRH"
          },
          {
            "code" : "12940-3",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --30 Minuten vor XXX Stimulation"
          },
          {
            "code" : "12942-9",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --3. Probenmaterial nach XXX Stimulation"
          },
          {
            "code" : "12937-9",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --45 Minuten nach XXX Stimulation"
          },
          {
            "code" : "12943-7",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --4. Probenmaterial nach XXX Stimulation"
          },
          {
            "code" : "12944-5",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --5. Probenmaterial nach XXX Stimulation"
          },
          {
            "code" : "12945-2",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --6. Probenmaterial nach XXX Stimulation"
          },
          {
            "code" : "12946-0",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --7. Probenmaterial nach XXX Stimulation"
          },
          {
            "code" : "12947-8",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --8. Probenmaterial nach XXX Stimulation"
          },
          {
            "code" : "12948-6",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --9. Probenmaterial nach XXX Stimulation"
          },
          {
            "code" : "34054-7",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --vor oder nach Dosis TRH"
          },
          {
            "code" : "44935-5",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --15 Minuten nach Dosis TRH intravenös"
          },
          {
            "code" : "44936-3",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --15 Minuten vor Dosis TRH intravenös"
          },
          {
            "code" : "14998-9",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1 Stunde nach Dosis TRH intravenös"
          },
          {
            "code" : "14997-1",
            "display" : "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --30 Minuten nach Dosis TRH intravenös"
          }
        ]
      }
    ]
  }
}

```
