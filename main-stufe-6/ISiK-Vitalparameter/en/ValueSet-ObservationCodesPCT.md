# ObservationCodesPCT - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesPCT**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesPCT | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationCodesPCT |

 
Enthält LOINC-Codes für die Observation PCT 

 **References** 

* [ISiKLaboruntersuchungPCT](StructureDefinition-ISiKLaboruntersuchungPCT.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationCodesPCT",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesPCT",
  "version" : "6.0.0",
  "name" : "ObservationCodesPCT",
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
  "description" : "Enthält LOINC-Codes für die Observation PCT",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "33959-8",
        "display" : "Procalcitonin [Mass/volume] in Serum or Plasma"
      },
      {
        "code" : "75241-0",
        "display" : "Procalcitonin [Masse/Volumen] in Serum oder Plasma mittels Immunoassay"
      },
      {
        "code" : "51637-7",
        "display" : "Thrombokrit [Volumenfraktion] in Blut"
      }]
    }]
  }
}

```
