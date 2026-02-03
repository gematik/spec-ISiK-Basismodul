# ObservationCodesGFR - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ObservationCodesGFR**

## ValueSet: ObservationCodesGFR 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesGFR | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ObservationCodesGFR |

 
Enthält LOINC-Codes für die Observation GFR 

 **References** 

* [ISiKLaboruntersuchungGFR](StructureDefinition-ISiKLaboruntersuchungGFR.md)

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
  "id" : "ObservationCodesGFR",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesGFR",
  "version" : "6.0.0-rc",
  "name" : "ObservationCodesGFR",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "Enthält LOINC-Codes für die Observation GFR",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "98980-6",
            "display" : "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin- und Cystatin-C-basierte Formel (CKD-EPI 2021)"
          },
          {
            "code" : "98979-8",
            "display" : "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin-basierte Formel (CKD-EPI 2021)"
          },
          {
            "code" : "94677-2",
            "display" : "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin- und Cystatin-C-basierte Formel (CKD-EPI)"
          },
          {
            "code" : "62238-1",
            "display" : "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin-basierte Formel (CKD-EPI)"
          },
          {
            "code" : "77147-7",
            "display" : "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin-basierte Formel (MDRD)"
          },
          {
            "code" : "50384-7",
            "display" : "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin-basierte Formel (Schwartz)"
          }
        ]
      }
    ]
  }
}

```
