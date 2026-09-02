# ISiK Prozedur Beatmung - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiK Prozedur Beatmung**

## Resource Profile: ISiK Prozedur Beatmung 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedurBeatmung | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKProzedurBeatmung |

 
Dieses Profil dient der Abbildung von Beatmungsmaßnahmen in der Akutmedizin. 
Die verwendeten ValueSets in diesem Profil wurden dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte/MII_PR_ICU_Beatmung.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Als Parent wurde der letzte Stand des Prozedur-Profils der MII gewählt. Stand 4.3.2026. 

**Usages:**

* Examples for this Profile: [Procedure/ExampleOrganVentilationMode20200311](Procedure-ExampleOrganVentilationMode20200311.md), [Procedure/ExampleOrganVentilationModeASV](Procedure-ExampleOrganVentilationModeASV.md), [Procedure/ExampleOrganVentilationModeBiLev](Procedure-ExampleOrganVentilationModeBiLev.md), [Procedure/ExampleOrganVentilationModeNIV](Procedure-ExampleOrganVentilationModeNIV.md)... Show 5 more, [Procedure/ExampleOrganVentilationModePCMod](Procedure-ExampleOrganVentilationModePCMod.md), [Procedure/ExampleOrganVentilationModePSIMV](Procedure-ExampleOrganVentilationModePSIMV.md), [Procedure/ExampleOrganVentilationModeSPNMod](Procedure-ExampleOrganVentilationModeSPNMod.md), [Procedure/ExampleOrganVentilationModeStMod](Procedure-ExampleOrganVentilationModeStMod.md) and [Procedure/ExampleOrganVentilationModenC](Procedure-ExampleOrganVentilationModenC.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Organspendeerkennung Server (Expanded)](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceAkteur-expanded.md) and [ISiK CapabilityStatement Organspendeerkennung Source Rolle](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/organspendeerkennung|current/StructureDefinition/StructureDefinition-ISiKProzedurBeatmung.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKProzedurBeatmung.csv), [Excel](../StructureDefinition-ISiKProzedurBeatmung.xlsx), [Schematron](../StructureDefinition-ISiKProzedurBeatmung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKProzedurBeatmung",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedurBeatmung",
  "version" : "6.0.0",
  "name" : "ISiKProzedurBeatmung",
  "title" : "ISiK Prozedur Beatmung",
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
  "description" : "Dieses Profil dient der Abbildung von Beatmungsmaßnahmen in der Akutmedizin.\n\nDie verwendeten ValueSets in diesem Profil wurden dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte/MII_PR_ICU_Beatmung.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. \nAls Parent wurde der letzte Stand des Prozedur-Profils der MII gewählt. \nStand 4.3.2026.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedur",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.category",
      "path" : "Procedure.category",
      "min" : 1
    },
    {
      "id" : "Procedure.category.coding:SNOMED-CT",
      "path" : "Procedure.category.coding",
      "sliceName" : "SNOMED-CT",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-category-procedure-beatmung-snomed"
      }
    },
    {
      "id" : "Procedure.code.coding:SNOMED-CT",
      "path" : "Procedure.code.coding",
      "sliceName" : "SNOMED-CT",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-procedure-beatmung-snomed"
      }
    }]
  }
}

```
