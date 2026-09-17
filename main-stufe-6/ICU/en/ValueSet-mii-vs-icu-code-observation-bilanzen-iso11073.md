# MII VS ICU Code Observation Bilanzen ISO11073 - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS ICU Code Observation Bilanzen ISO11073**

## ValueSet: MII VS ICU Code Observation Bilanzen ISO11073 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-bilanzen-iso11073 | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Code_Observation_Bilanzen_ISO11073 |

 
Dieses ValueSet enthaelt Codes fuer die im Kontext einer Bilanz verwendeten ISO/IEEE 11073-Parameter. 

 **References** 

* [MII PR ICU Bilanz](StructureDefinition-mii-pr-icu-bilanz.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-code-observation-bilanzen-iso11073",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-bilanzen-iso11073",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Code_Observation_Bilanzen_ISO11073",
  "title" : "MII VS ICU Code Observation Bilanzen ISO11073",
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
  "description" : "Dieses ValueSet enthaelt Codes fuer die im Kontext einer Bilanz verwendeten ISO/IEEE 11073-Parameter.",
  "compose" : {
    "include" : [{
      "system" : "urn:iso:std:iso:11073:10101",
      "concept" : [{
        "code" : "157740",
        "display" : "Drainage volume in bag"
      }]
    }]
  }
}

```
