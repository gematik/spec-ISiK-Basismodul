# ISiKCoding - ISiK Medikation Implementierungsleitfaden v6.0.0-rc

ISiK Medikation Implementierungsleitfaden

Version 6.0.0-rc - release-candidate 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ISiKCoding**

## Data Type Profile: ISiKCoding 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKCoding | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKCoding |

 
Data Type profile for Codings in ISiK 

**Usages:**

* Derived from this DataType Profile: [ISiKSnomedCTCoding](StructureDefinition-ISiKSnomedCTCoding.md)
* Use this DataType Profile: [ISiKMedikament](StructureDefinition-ISiKMedikament.md), [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md), [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md) and [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/medikation|current/StructureDefinition/ISiKCoding)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKCoding.csv), [Excel](StructureDefinition-ISiKCoding.xlsx), [Schematron](StructureDefinition-ISiKCoding.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKCoding",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKCoding",
  "version" : "6.0.0-rc",
  "name" : "ISiKCoding",
  "title" : "ISiKCoding",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "Data Type profile for Codings in ISiK",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Coding",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Coding",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
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
      }
    ]
  }
}

```
