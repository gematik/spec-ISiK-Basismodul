# SD MII ICU Koerpertemperatur Generisch - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SD MII ICU Koerpertemperatur Generisch**

## Resource Profile: SD MII ICU Koerpertemperatur Generisch 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-generisch | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Koerpertemperatur_Generisch |

 
Dieses Profil bietet eine abstrahierte Schicht zur Körpertemperaturmessung in der Akutmedizin. Es ist generisch im Sinne der Profil-Abstraktion, allerdings explizit nicht im Sinne einer KörperKERNtemperatur zu verwenden (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter). 

**Usages:**

* Derived from this Profile: [SD MII ICU Koerpertemperatur Atemwege](StructureDefinition-sd-mii-icu-koerpertemperatur-atemwege.md), [SD MII ICU Koerpertemperatur Brust](StructureDefinition-sd-mii-icu-koerpertemperatur-brust.md), [SD MII ICU Koerpertemperatur Brustwirbelsaeule](StructureDefinition-sd-mii-icu-koerpertemperatur-brustwirbelsaeule.md), [SD MII ICU Koerpertemperatur Gelenk](StructureDefinition-sd-mii-icu-koerpertemperatur-gelenk.md)... Show 6 more, [SD MII ICU Koerpertemperatur Halswirbelsaeule](StructureDefinition-sd-mii-icu-koerpertemperatur-halswirbelsaeule.md), [SD MII ICU Koerpertemperatur Lendenwirbelsaeule](StructureDefinition-sd-mii-icu-koerpertemperatur-lendenwirbelsaeule.md), [SD MII ICU Koerpertemperatur Myokard](StructureDefinition-sd-mii-icu-koerpertemperatur-myokard.md), [SD MII ICU Koerpertemperatur nasal](StructureDefinition-sd-mii-icu-koerpertemperatur-nasal.md), [SD MII ICU Koerpertemperatur Nasen-Rachen-Raum](StructureDefinition-sd-mii-icu-koerpertemperatur-nasen-rachen-raum.md) and [SD MII ICU Koerpertemperatur Stirn](StructureDefinition-sd-mii-icu-koerpertemperatur-stirn.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/sd-mii-icu-koerpertemperatur-generisch)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-koerpertemperatur-generisch.csv), [Excel](StructureDefinition-sd-mii-icu-koerpertemperatur-generisch.xlsx), [Schematron](StructureDefinition-sd-mii-icu-koerpertemperatur-generisch.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-koerpertemperatur-generisch",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-generisch",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Koerpertemperatur_Generisch",
  "title" : "SD MII ICU Koerpertemperatur Generisch",
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
  "description" : "Dieses Profil bietet eine abstrahierte Schicht zur Körpertemperaturmessung in der Akutmedizin. Es ist generisch im Sinne der Profil-Abstraktion, allerdings explizit nicht im Sinne einer KörperKERNtemperatur zu verwenden (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter).",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "sct-concept",
      "uri" : "http://snomed.info/conceptdomain",
      "name" : "SNOMED CT Concept Domain Binding"
    },
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
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "sct-attr",
      "uri" : "http://snomed.org/attributebinding",
      "name" : "SNOMED CT Attribute Binding"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "8310-5"
        }
      },
      {
        "id" : "Observation.code.coding:specific-loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "specific-loinc",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKSpecificGenericTempLoincVS"
        }
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "patternQuantity" : {
          "system" : "http://unitsofmeasure.org",
          "code" : "Cel"
        }
      },
      {
        "id" : "Observation.value[x].unit",
        "path" : "Observation.value[x].unit",
        "min" : 1
      }
    ]
  }
}

```
