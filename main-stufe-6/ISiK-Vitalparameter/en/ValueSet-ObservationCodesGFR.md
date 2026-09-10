# ObservationCodesGFR - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesGFR**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesGFR | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationCodesGFR |

 
Enthält LOINC-Codes für die Observation GFR 

 **References** 

* [ISiKLaboruntersuchungGFR](StructureDefinition-ISiKLaboruntersuchungGFR.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationCodesGFR",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesGFR",
  "version" : "6.0.0",
  "name" : "ObservationCodesGFR",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "Enthält LOINC-Codes für die Observation GFR",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "98980-6",
        "display" : "Glomerular filtration rate [Volume Rate/Area] in Serum, Plasma or Blood by Creatinine and Cystatin C-based formula (CKD-EPI 2021)/1.73 sq M"
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
      }]
    }]
  }
}

```
