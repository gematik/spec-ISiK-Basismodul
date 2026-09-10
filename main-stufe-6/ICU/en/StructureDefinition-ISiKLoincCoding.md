# ISiKLoincCoding - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKLoincCoding**

## Data Type Profile: ISiKLoincCoding 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKLoincCoding | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKLoincCoding |

 
Data Type profile for LOINC Codings in ISiK 

**Usages:**

* Use this DataType Profile: [ISiKAtemfrequenz](StructureDefinition-ISiKAtemfrequenz.md), [ISiKBlutdruckSystemischArteriell](StructureDefinition-ISiKBlutdruckSystemischArteriell.md), [ISiKEKG](StructureDefinition-ISiKEKG.md), [ISiKGCS](StructureDefinition-ISiKGCS.md)... Show 7 more, [ISiKHerzfrequenz](StructureDefinition-ISiKHerzfrequenz.md), [ISiKKoerpergewicht](StructureDefinition-ISiKKoerpergewicht.md), [ISiKKoerpergroesse](StructureDefinition-ISiKKoerpergroesse.md), [ISiKKoerperkerntemperatur](StructureDefinition-ISiKKoerperkerntemperatur.md), [ISiKKopfumfang](StructureDefinition-ISiKKopfumfang.md), [ISiKLaboruntersuchung](StructureDefinition-ISiKLaboruntersuchung.md) and [ISiKSauerstoffsaettigungArteriell](StructureDefinition-ISiKSauerstoffsaettigungArteriell.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/icu|current/StructureDefinition/StructureDefinition-ISiKLoincCoding.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKLoincCoding.csv), [Excel](../StructureDefinition-ISiKLoincCoding.xlsx), [Schematron](../StructureDefinition-ISiKLoincCoding.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKLoincCoding",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLoincCoding",
  "version" : "6.0.0",
  "name" : "ISiKLoincCoding",
  "title" : "ISiKLoincCoding",
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
  "description" : "Data Type profile for LOINC Codings in ISiK",
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
      "patternUri" : "http://loinc.org"
    },
    {
      "id" : "Coding.version",
      "path" : "Coding.version",
      "short" : "Version",
      "comment" : "Motivation MS: Version des kodierten Wertes.",
      "mustSupport" : true
    }]
  }
}

```
