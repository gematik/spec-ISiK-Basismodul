# ISiKSnomedCTCoding - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

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

* Use this DataType Profile: [ISiKAllergieUnvertraeglichkeit](StructureDefinition-ISiKAllergieUnvertraeglichkeit.md), [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md), [ISiKKoerpergewicht](StructureDefinition-ISiKKoerpergewicht.md), [ISiKKoerpergroesse](StructureDefinition-ISiKKoerpergroesse.md)... Show 6 more, [ISiKLebensZustand](StructureDefinition-ISiKLebensZustand.md), [ISiKMedikament](StructureDefinition-ISiKMedikament.md), [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md), [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md), [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md) and [ISiKProzedur](StructureDefinition-ISiKProzedur.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/amts|current/StructureDefinition/StructureDefinition-ISiKSnomedCTCoding.json)

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
      "value" : "https://gematik.de"
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
