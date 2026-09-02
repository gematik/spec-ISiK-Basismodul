# ISiKMpFormularExtension - ISiK Formularmodul Implementation Guide v6.0.0

ISiK Formularmodul Implementation Guide

Version 6.0.0 - ballot 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKMpFormularExtension**

## Extension: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKMpFormularExtension | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKMpFormularExtension |

Mit dieser Extension besteht die Möglichkeit anzugeben, dass das Formular innerhalb eines Medizinproduktes eingesetzt wird und eine Zweckbestimmung anzugeben ist. Die Interpretation der Zweckbestimmung und der daraus folgenden Konsequenzen für die eingesetzte Software liegt im Verantwortungsbereich des Software-Hersteller!

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Ausgefülltes ISiK-Formular](StructureDefinition-ISiKFormularDaten.md) and [ISiKFormularDefinition](StructureDefinition-ISiKFormularDefinition.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/formular|current/StructureDefinition/StructureDefinition-ISiKMpFormularExtension.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKMpFormularExtension.csv), [Excel](../StructureDefinition-ISiKMpFormularExtension.xlsx), [Schematron](../StructureDefinition-ISiKMpFormularExtension.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKMpFormularExtension",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKMpFormularExtension",
  "version" : "6.0.0",
  "name" : "ISiKMpFormularExtension",
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
  "description" : "Mit dieser Extension besteht die Möglichkeit anzugeben, dass das Formular innerhalb eines Medizinproduktes eingesetzt wird und eine Zweckbestimmung anzugeben ist. Die Interpretation der Zweckbestimmung und der daraus folgenden Konsequenzen für die eingesetzte Software liegt im Verantwortungsbereich des Software-Hersteller!",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Questionnaire"
  },
  {
    "type" : "element",
    "expression" : "QuestionnaireResponse"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "isModifier" : true,
      "isModifierReason" : "Ein Formularrenderer, der sich nicht mit dem Thema MDR und Medizinprodukte auseinandergesetzt hat, sollte hier auf das im FHIR-Standard festgelegte Verhalten bei [modifierExtension](http://hl7.org/fhir/extensibility.html#modifierExtension) zurückgreifen."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKMpFormularExtension"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Zweckbestimmung",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
