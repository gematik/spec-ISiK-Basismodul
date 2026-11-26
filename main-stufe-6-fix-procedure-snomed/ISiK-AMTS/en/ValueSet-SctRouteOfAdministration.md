# SctRouteOfAdministration - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SctRouteOfAdministration**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/SctRouteOfAdministration | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:SctRouteOfAdministration |

 
Enthaelt alle SNOMED CT Administrationsarten 

 **References** 

* [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md)
* [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md)
* [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "SctRouteOfAdministration",
  "url" : "https://gematik.de/fhir/isik/ValueSet/SctRouteOfAdministration",
  "version" : "6.0.0",
  "name" : "SctRouteOfAdministration",
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
  "description" : "Enthaelt alle SNOMED CT Administrationsarten",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "filter" : [{
        "property" : "concept",
        "op" : "is-a",
        "value" : "284009009"
      }]
    }]
  }
}

```
