# MII PR ICU Untersuchung Pupillenlichtreaktion Direkt - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **MII PR ICU Untersuchung Pupillenlichtreaktion Direkt**

## Resource Profile: MII PR ICU Untersuchung Pupillenlichtreaktion Direkt 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt |

 
Dieses Profil dient der Abbildung der direkten Pupillenlichtreaktion. 
In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung. 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 13.3.2026. 

**Usages:**

* Refer to this Profile: [MII PR ICU Untersuchung Pupillenbefund](StructureDefinition-mii-pr-icu-untersuchung-pupillenbefund.md)
* Examples for this Profile: [Observation/ExampleOrganPupilLightReactionLeft20200311](Observation-ExampleOrganPupilLightReactionLeft20200311.md), [Observation/ExampleOrganPupilLightReactionLeftPrompt20200311](Observation-ExampleOrganPupilLightReactionLeftPrompt20200311.md), [Observation/ExampleOrganPupilLightReactionLeftVerzogert20200311](Observation-ExampleOrganPupilLightReactionLeftVerzogert20200311.md), [Observation/ExampleOrganPupilLightReactionRight20200311](Observation-ExampleOrganPupilLightReactionRight20200311.md) and [Observation/ExampleOrganPupilLightReactionRightKeine20200311](Observation-ExampleOrganPupilLightReactionRightKeine20200311.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Organspendeerkennung Server (Expanded)](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceAkteur-expanded.md) and [ISiK CapabilityStatement Organspendeerkennung Source Rolle](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/organspendeerkennung|current/StructureDefinition/StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt.csv), [Excel](../StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt.xlsx), [Schematron](../StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt",
  "version" : "6.0.0",
  "name" : "MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt",
  "title" : "MII PR ICU Untersuchung Pupillenlichtreaktion Direkt",
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
  "description" : "Dieses Profil dient der Abbildung der direkten Pupillenlichtreaktion.\n\nIn ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.\n\nDie Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 13.3.2026.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.id",
      "path" : "Observation.id",
      "short" : "serverseitige, interne ID des Datensatzes",
      "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
      "mustSupport" : true
    },
    {
      "id" : "Observation.meta",
      "path" : "Observation.meta",
      "mustSupport" : true
    },
    {
      "id" : "Observation.meta.versionId",
      "path" : "Observation.meta.versionId",
      "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
      "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
    },
    {
      "id" : "Observation.meta.lastUpdated",
      "path" : "Observation.meta.lastUpdated",
      "short" : "Zeitpunkt der letzten Änderung",
      "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
    },
    {
      "id" : "Observation.implicitRules",
      "path" : "Observation.implicitRules",
      "short" : "Verweis auf die Regeln, nach denen die Ressource erstellt wurde",
      "comment" : "Begründung Constraint: In ISiK existiert kein Use-Case für dieses Element. Da es sich um ein Modifying Element handelt, wird es daher ausgeschlossen.\n  Darüber hinaus werden die Regeln als URI vorgehalten. Dies führt dazu, dass sich hinter der URI eine beliebige Menge an Regeln befinden kann; wodurch  nicht sichergestellt werden kann, dass alle Clients die Regeln korrekt interpretieren können.",
      "max" : "0"
    },
    {
      "id" : "Observation.identifier",
      "path" : "Observation.identifier",
      "mustSupport" : true
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "mustSupport" : true
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Observation.category.coding.system",
      "path" : "Observation.category.coding.system",
      "patternUri" : "http://terminology.hl7.org/CodeSystem/observation-category"
    },
    {
      "id" : "Observation.category.coding.code",
      "path" : "Observation.category.coding.code",
      "patternCode" : "exam"
    },
    {
      "id" : "Observation.category.coding.display",
      "path" : "Observation.category.coding.display",
      "patternString" : "Exam"
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.coding.system",
      "path" : "Observation.code.coding.system",
      "fixedUri" : "http://snomed.info/sct"
    },
    {
      "id" : "Observation.code.coding.code",
      "path" : "Observation.code.coding.code",
      "fixedCode" : "45832002"
    },
    {
      "id" : "Observation.code.coding.display",
      "path" : "Observation.code.coding.display",
      "patternString" : "Pupil afferent light reaction"
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x].coding",
      "path" : "Observation.value[x].coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "closed"
      },
      "min" : 1
    },
    {
      "id" : "Observation.value[x].coding:Loinc",
      "path" : "Observation.value[x].coding",
      "sliceName" : "Loinc",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-pupillenlichtreaktion"
      }
    },
    {
      "id" : "Observation.dataAbsentReason",
      "path" : "Observation.dataAbsentReason",
      "mustSupport" : true
    },
    {
      "id" : "Observation.bodySite",
      "path" : "Observation.bodySite",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-bodysite-observation-pupillenbefund"
      }
    }]
  }
}

```
