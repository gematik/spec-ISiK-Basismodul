# ISiKCoding - ISiK Labor Implementierungsleitfaden v6.0.0

ISiK Labor Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKCoding**

## Data Type Profile: ISiKCoding 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKCoding | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKCoding |

 
Data Type profile for Codings in ISiK 

**Usages:**

* Derived from this DataType Profile: [ISiKLoincCoding](StructureDefinition-ISiKLoincCoding.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/labor|current/StructureDefinition/StructureDefinition-ISiKCoding.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKCoding.csv), [Excel](../StructureDefinition-ISiKCoding.xlsx), [Schematron](../StructureDefinition-ISiKCoding.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKCoding",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKCoding",
  "version" : "6.0.0",
  "name" : "ISiKCoding",
  "title" : "ISiKCoding",
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
  "description" : "Data Type profile for Codings in ISiK",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Coding",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Coding",
      "path" : "Coding"
    },
    {
      "id" : "Coding.system",
      "path" : "Coding.system",
      "short" : "System",
      "comment" : "Motivation MS: URL des CodeSystems des kodierten Wertes.",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Coding.code",
      "path" : "Coding.code",
      "short" : "Code",
      "comment" : "Motivation MS: Kodierter Wert aus einem CodeSystem.",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Coding.display",
      "path" : "Coding.display",
      "short" : "Display",
      "comment" : "Motivation MS: Anzeigename des kodierten Wertes.",
      "mustSupport" : true
    }]
  }
}

```
