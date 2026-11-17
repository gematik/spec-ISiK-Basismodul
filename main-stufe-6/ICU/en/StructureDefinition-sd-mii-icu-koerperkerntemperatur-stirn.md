# SD MII ICU Koerperkerntemperatur Stirn - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SD MII ICU Koerperkerntemperatur Stirn**

## Resource Profile: SD MII ICU Koerperkerntemperatur Stirn 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerperkerntemperatur-stirn | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:SD_MII_ICU_Koerperkerntemperatur_Stirn |

 
Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen an der Stirn in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Koerperkerntemperatur-stirn](Observation-Koerperkerntemperatur-stirn.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Vitalparameter Server Extended (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md), [ISiK CapabilityStatement VitalSign ICU Source Minimal Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/icu|current/StructureDefinition/StructureDefinition-sd-mii-icu-koerperkerntemperatur-stirn.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-sd-mii-icu-koerperkerntemperatur-stirn.csv), [Excel](../StructureDefinition-sd-mii-icu-koerperkerntemperatur-stirn.xlsx), [Schematron](../StructureDefinition-sd-mii-icu-koerperkerntemperatur-stirn.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-koerperkerntemperatur-stirn",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerperkerntemperatur-stirn",
  "version" : "6.0.0",
  "name" : "SD_MII_ICU_Koerperkerntemperatur_Stirn",
  "title" : "SD MII ICU Koerperkerntemperatur Stirn",
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
  "description" : "Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen an der Stirn in der Akutmedizin.",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerperkerntemperatur",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "min" : 3
    },
    {
      "id" : "Observation.code.coding:snomed",
      "path" : "Observation.code.coding",
      "sliceName" : "snomed",
      "min" : 1,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "1366425007"
      }
    },
    {
      "id" : "Observation.code.coding:specific-loinc",
      "path" : "Observation.code.coding",
      "sliceName" : "specific-loinc",
      "max" : "0",
      "patternCoding" : {
        "system" : "http://loinc.org"
      }
    },
    {
      "id" : "Observation.code.coding:specific-IEEE-11073",
      "path" : "Observation.code.coding",
      "sliceName" : "specific-IEEE-11073",
      "min" : 0,
      "max" : "0",
      "patternCoding" : {
        "system" : "urn:iso:std:iso:11073:10101"
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.bodySite",
      "path" : "Observation.bodySite",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "52795006"
        }]
      }
    }]
  }
}

```
