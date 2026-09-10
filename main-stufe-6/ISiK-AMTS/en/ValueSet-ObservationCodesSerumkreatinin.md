# ObservationCodesSerumkreatinin - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesSerumkreatinin**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesSerumkreatinin | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationCodesSerumkreatinin |

 
Enthält LOINC-Codes für die Observation Serumkreatinin 

 **References** 

* [ISiKLaboruntersuchungSerumkreatinin](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationCodesSerumkreatinin",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesSerumkreatinin",
  "version" : "6.0.0",
  "name" : "ObservationCodesSerumkreatinin",
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
  "description" : "Enthält LOINC-Codes für die Observation Serumkreatinin",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "39802-4",
        "display" : "Creatinine in dialysis fluid/Creatinine in serum or plasma"
      },
      {
        "code" : "70266-2",
        "display" : "Creatinin in Peritonealflüssigkeit/Creatinin in Serum"
      },
      {
        "code" : "70264-7",
        "display" : "Creatinin in Pleuraflüssigkeit/Creatinin in Serum"
      },
      {
        "code" : "2160-0",
        "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma"
      },
      {
        "code" : "14682-9",
        "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma"
      },
      {
        "code" : "40248-7",
        "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --Basislinie"
      },
      {
        "code" : "40264-4",
        "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --Basislinie"
      },
      {
        "code" : "44784-7",
        "display" : "Creatinin [Masse/Volumen] (Maximalwert während der Untersuchung) in Serum oder Plasma"
      },
      {
        "code" : "11042-9",
        "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --vor Dialyse"
      },
      {
        "code" : "51619-5",
        "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --vor Dialyse"
      },
      {
        "code" : "40112-5",
        "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --vor XXX Stimulation"
      },
      {
        "code" : "11041-1",
        "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --nach Dialyse"
      },
      {
        "code" : "72271-0",
        "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --vor Kontrastmittelgabe"
      },
      {
        "code" : "77140-2",
        "display" : "Creatinin [Mol/Volumen] in Serum, Plasma oder Blut"
      },
      {
        "code" : "40116-6",
        "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --30 Minuten vor XXX Stimulation"
      },
      {
        "code" : "2164-2",
        "display" : "Creatinin-Clearance renal in 24-Stunden-Urin und Serum oder Plasma"
      },
      {
        "code" : "40250-3",
        "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --1 Stunde nach XXX Stimulation"
      },
      {
        "code" : "40254-5",
        "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --2,5 Stunden nach XXX Stimulation"
      },
      {
        "code" : "40252-9",
        "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --2 Stunden nach XXX Stimulation"
      },
      {
        "code" : "26752-6",
        "display" : "Creatinin-Clearance renal in 2-Stunden-Urin und Serum oder Plasma"
      },
      {
        "code" : "40267-7",
        "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --1,5 Stunden nach XXX Stimulation"
      }]
    }]
  }
}

```
