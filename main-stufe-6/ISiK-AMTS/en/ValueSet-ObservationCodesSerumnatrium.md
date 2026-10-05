# ObservationCodesSerumnatrium - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesSerumnatrium**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesSerumnatrium | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationCodesSerumnatrium |

 
Enthält LOINC-Codes für die Observation Serumnatrium 

 **References** 

* [ISiKLaboruntersuchungSerumnatrium](StructureDefinition-ISiKLaboruntersuchungSerumnatrium.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationCodesSerumnatrium",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesSerumnatrium",
  "version" : "6.0.0",
  "name" : "ObservationCodesSerumnatrium",
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
  "description" : "Enthält LOINC-Codes für die Observation Serumnatrium",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "2951-2",
        "display" : "Sodium [Moles/volume] in Serum or Plasma"
      }]
    }]
  }
}

```
