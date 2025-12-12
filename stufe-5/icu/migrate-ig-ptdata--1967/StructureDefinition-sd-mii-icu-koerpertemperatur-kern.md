# SD MII ICU Koerpertemperatur Kern - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SD MII ICU Koerpertemperatur Kern**

## Resource Profile: SD MII ICU Koerpertemperatur Kern 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-kern | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:SD_MII_ICU_Koerpertemperatur_Kern |

 
Dieses Profil bietet eine generische Abbildung der geschätzten KörperKERNtemperatur in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Koerpertemperatur-Kern](Observation-Koerpertemperatur-Kern.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement VitalSign ICU Source Minimal Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/icu.test.ig|current/StructureDefinition/sd-mii-icu-koerpertemperatur-kern)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-koerpertemperatur-kern.csv), [Excel](StructureDefinition-sd-mii-icu-koerpertemperatur-kern.xlsx), [Schematron](StructureDefinition-sd-mii-icu-koerpertemperatur-kern.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-koerpertemperatur-kern",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-kern",
  "version" : "0.0.1",
  "name" : "SD_MII_ICU_Koerpertemperatur_Kern",
  "title" : "SD MII ICU Koerpertemperatur Kern",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "description" : "Dieses Profil bietet eine generische Abbildung der geschätzten KörperKERNtemperatur in der Akutmedizin.",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerperkerntemperatur",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "min" : 4
      },
      {
        "id" : "Observation.code.coding:snomed",
        "path" : "Observation.code.coding",
        "sliceName" : "snomed",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "276885007"
        }
      },
      {
        "id" : "Observation.code.coding:IEEE11073",
        "path" : "Observation.code.coding",
        "sliceName" : "IEEE11073",
        "min" : 1
      },
      {
        "id" : "Observation.code.coding:specific-loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "specific-loinc",
        "max" : "0"
      },
      {
        "id" : "Observation.code.coding:specific-IEEE-11073",
        "path" : "Observation.code.coding",
        "sliceName" : "specific-IEEE-11073",
        "min" : 0,
        "max" : "0",
        "mustSupport" : true
      }
    ]
  }
}

```
