# ISiKSnomedCTCoding - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKSnomedCTCoding**

## Data Type Profile: ISiKSnomedCTCoding 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKSnomedCTCoding | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKSnomedCTCoding |

 
Data Type profile for Snomed-CT Codings in ISiK 

**Usages:**

* Use this DataType Profile: [ISiKAtemfrequenz](StructureDefinition-ISiKAtemfrequenz.md), [ISiKBlutdruckSystemischArteriell](StructureDefinition-ISiKBlutdruckSystemischArteriell.md), [ISiKEKG](StructureDefinition-ISiKEKG.md), [ISiKGCS](StructureDefinition-ISiKGCS.md)... Show 7 more, [ISiKHerzfrequenz](StructureDefinition-ISiKHerzfrequenz.md), [ISiKKoerpergewicht](StructureDefinition-ISiKKoerpergewicht.md), [ISiKKoerpergroesse](StructureDefinition-ISiKKoerpergroesse.md), [ISiKKoerperkerntemperatur](StructureDefinition-ISiKKoerperkerntemperatur.md), [ISiKKopfumfang](StructureDefinition-ISiKKopfumfang.md), [ISiKProzedur](StructureDefinition-ISiKProzedur.md) and [ISiKSauerstoffsaettigungArteriell](StructureDefinition-ISiKSauerstoffsaettigungArteriell.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/icu|current/StructureDefinition/StructureDefinition-ISiKSnomedCTCoding.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKSnomedCTCoding.csv), [Excel](../StructureDefinition-ISiKSnomedCTCoding.xlsx), [Schematron](../StructureDefinition-ISiKSnomedCTCoding.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKSnomedCTCoding",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSnomedCTCoding",
  "version" : "6.0.0",
  "name" : "ISiKSnomedCTCoding",
  "title" : "ISiKSnomedCTCoding",
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
  "description" : "Data Type profile for Snomed-CT Codings in ISiK",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "orim",
    "uri" : "http://hl7.org/orim",
    "name" : "Ontological RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Coding",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKCoding",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Coding.system",
      "path" : "Coding.system",
      "patternUri" : "http://snomed.info/sct"
    },
    {
      "id" : "Coding.version",
      "path" : "Coding.version",
      "short" : "Version",
      "comment" : "Motivation MS: Version des kodierten Wertes.",
      "constraint" : [{
        "key" : "sct-version-de",
        "severity" : "error",
        "human" : "Die SnomedCT-Version muss sich auf eine konkrete deutsche Edition beziehen",
        "expression" : "startsWith('http://snomed.info/sct/11000274103/')",
        "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSnomedCTCoding"
      }],
      "mustSupport" : true
    }]
  }
}

```
