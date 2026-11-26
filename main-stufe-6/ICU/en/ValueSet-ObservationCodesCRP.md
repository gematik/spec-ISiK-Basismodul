# ObservationCodesCRP - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesCRP**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesCRP | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationCodesCRP |

 
Enthält LOINC-Codes für die Observation CRP 

 **References** 

* [ISiKLaboruntersuchungCRP](StructureDefinition-ISiKLaboruntersuchungCRP.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationCodesCRP",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesCRP",
  "version" : "6.0.0",
  "name" : "ObservationCodesCRP",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.gematik.de"
    }]
  }],
  "description" : "Enthält LOINC-Codes für die Observation CRP",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "71426-1",
        "display" : "C reactive protein [Mass/volume] in Blood by High sensitivity method"
      },
      {
        "code" : "30522-7",
        "display" : "C-reaktives Protein [Masse/Volumen] in Serum oder Plasma mittels Hochsensitivitätsmethode"
      },
      {
        "code" : "76486-0",
        "display" : "C-reaktives Protein [Mol/Volumen] in Serum oder Plasma mittels Hochsensitivitätsmethode"
      },
      {
        "code" : "45062-7",
        "display" : "C-reaktives Protein [Masse/Volumen] in Liquor"
      },
      {
        "code" : "48421-2",
        "display" : "C-reaktives Protein [Masse/Volumen] in Kapillarblut"
      },
      {
        "code" : "11039-5",
        "display" : "C-reaktives Protein [Nachweis] in Serum oder Plasma"
      },
      {
        "code" : "76485-2",
        "display" : "C-reaktives Protein [Mol/Volumen] in Serum oder Plasma"
      },
      {
        "code" : "16503-5",
        "display" : "C-reaktives Protein [Masse/Volumen] in Körperflüssigkeit"
      },
      {
        "code" : "1988-5",
        "display" : "C-reaktives Protein [Masse/Volumen] in Serum oder Plasma"
      },
      {
        "code" : "14634-0",
        "display" : "C-reaktives Protein [Titer] in Serum oder Plasma"
      }]
    }]
  }
}

```
