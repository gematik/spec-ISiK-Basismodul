# ISiK Kerntemperatur SnomedCT ValueSet - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Kerntemperatur SnomedCT ValueSet**

## ValueSet: ISiK Kerntemperatur SnomedCT ValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKKernTempSctVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKKernTempSctVS |

 
ValueSet der Körperkerntemperatur SnomedCT Konzepte 

 **References** 

* [ISiKKoerperkerntemperatur](StructureDefinition-ISiKKoerperkerntemperatur.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKKernTempSctVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKKernTempSctVS",
  "version" : "6.0.0",
  "name" : "ISiKKernTempSctVS",
  "title" : "ISiK  Kerntemperatur SnomedCT ValueSet",
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
  "description" : "ValueSet der Körperkerntemperatur SnomedCT Konzepte",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "276885007",
        "display" : "Körperkerntemperatur"
      },
      {
        "code" : "1222808002",
        "display" : "Körperkerntemperatur im Blut gemessen"
      },
      {
        "code" : "698832009",
        "display" : "Körperkerntemperatur gemessen an der Harnblase"
      },
      {
        "code" : "307047009",
        "display" : "Rektaltemperatur"
      },
      {
        "code" : "431598003",
        "display" : "Körperkerntemperatur gemessen im Ösophagus"
      },
      {
        "code" : "415974002",
        "display" : "Körperkerntemperatur gemessen am Trommelfell"
      },
      {
        "code" : "364246006",
        "display" : "Vaginaltemperatur"
      },
      {
        "code" : "415929009",
        "display" : "Groin temperature"
      },
      {
        "code" : "415945006",
        "display" : "Orale Temperatur"
      },
      {
        "code" : "415882003",
        "display" : "Axillary temperature"
      },
      {
        "code" : "1366425007",
        "display" : "Estimated core body temperature measured on forehead"
      }]
    }]
  }
}

```
