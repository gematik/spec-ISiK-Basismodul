# SD MII ICU Koerpertemperatur Harnblase - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SD MII ICU Koerpertemperatur Harnblase**

## Resource Profile: SD MII ICU Koerpertemperatur Harnblase 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-harnblase | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Koerpertemperatur_Harnblase |

 
Dieses Profil bietet eine spezialisierte Abbildung der geschätzten Körperkerntemperatur gemessen in der Harnblase in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Koerpertemperatur-Harnblase](Observation-Koerpertemperatur-Harnblase.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/sd-mii-icu-koerpertemperatur-harnblase)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-koerpertemperatur-harnblase.csv), [Excel](StructureDefinition-sd-mii-icu-koerpertemperatur-harnblase.xlsx), [Schematron](StructureDefinition-sd-mii-icu-koerpertemperatur-harnblase.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-koerpertemperatur-harnblase",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-harnblase",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Koerpertemperatur_Harnblase",
  "title" : "SD MII ICU Koerpertemperatur Harnblase",
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
  "description" : "Dieses Profil bietet eine spezialisierte Abbildung der geschätzten Körperkerntemperatur gemessen in der Harnblase in der Akutmedizin.",
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
          "code" : "698832009"
        }
      },
      {
        "id" : "Observation.code.coding:specific-loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "specific-loinc",
        "min" : 1,
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "8334-5"
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
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "89837001"
            }
          ]
        }
      }
    ]
  }
}

```
