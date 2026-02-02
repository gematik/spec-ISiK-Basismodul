# SD MII ICU Monitoring und Vitaldaten - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SD MII ICU Monitoring und Vitaldaten**

## Resource Profile: SD MII ICU Monitoring und Vitaldaten 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Monitoring_Und_Vitaldaten |

 
Dieses Profil dient als Abstraktionsprofil für verschiedene spezialisierte Beobachtungen in der Akutmedizin zur Abbildung von Monitoring- und Vitaldaten. 

**Usages:**

* Derived from this Profile: [SD MII ICU Herzzeitvolumen](StructureDefinition-sd-mii-icu-herzzeitvolumen.md), [SD MII ICU Ideales Koerpergewicht](StructureDefinition-sd-mii-icu-ideales-koerpergewicht.md), [SD MII ICU Intrakranieller Druck ICP](StructureDefinition-sd-mii-icu-intrakranieller-druck-icp.md), [SD MII ICU Koerpergewicht Percentil Altersabhaengig](StructureDefinition-sd-mii-icu-koerpergewicht-percentil-altersabhaengig.md)... Show 17 more, [SD MII ICU Koerpergroesse Percentil](StructureDefinition-sd-mii-icu-koerpergroesse-percentil-altersabhaengig.md), [SD MII ICU Koerpertemperatur Generisch](StructureDefinition-sd-mii-icu-koerpertemperatur-generisch.md), [SD MII ICU Linksventrikulaerer Herzindex durch Indikatorverduennung](StructureDefinition-sd-mii-icu-linksventri-herzindex-durch-indikatorverduennung.md), [SD MII ICU Linksventrikulaeres Herzzeitvolumen Durch Indikatorverduennung](StructureDefinition-sd-mii-icu-linksventri-herzzeitvolumen-durch-indikatorverd.md), [SD MII ICU Linksventrikulaeres Schlagvolumen Durch Indikatorverduennung](StructureDefinition-sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung.md), [SD MII ICU Linksventrikulaerer Schlagvolumenindex Durch Indikatorverduennung](StructureDefinition-sd-mii-icu-linksventri-schlagvolumenindex-durch-indikatorverd.md), [SD MII ICU Linksventrikulaerer Herzindex](StructureDefinition-sd-mii-icu-linksventrikulaerer-herzindex.md), [SD MII ICU Linksventrikulaeres Schlagvolumen](StructureDefinition-sd-mii-icu-linksventrikulaeres-schlagvolumen.md), [SD MII ICU Linksventrikulaeres Schlagvolumenindex](StructureDefinition-sd-mii-icu-linksventrikulaeres-schlagvolumenindex.md), [SD MII ICU Sauerstoffsaettigung Im Arteriellen Blut Durch Pulsoxymetrie](StructureDefinition-sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie.md), [SD MII ICU Sauerstoffsaettigung Im Blut Postduktal Durch Pulsoxymetrie](StructureDefinition-sd-mii-icu-o2saettigung-im-blut-postduktal-durch-pulsoxymetrie.md), [SD MII ICU Sauerstoffsaettigung Im Blut Preduktal Durch Pulsoxymetrie](StructureDefinition-sd-mii-icu-o2saettigung-im-blut-preduktal-durch-pulsoxymetrie.md), [SD MII ICU Pulmonalarterieller Wedge Druck](StructureDefinition-sd-mii-icu-pulmonalarterieller-wedge-druck.md), [SD MII ICU Pulmonalvaskulaerer Widerstandsindex](StructureDefinition-sd-mii-icu-pulmonalvaskulaerer-widerstandsindex.md), [SD MII ICU Puls](StructureDefinition-sd-mii-icu-puls.md), [SD MII ICU Systemischer Vaskulaerer Widerstandsindex](StructureDefinition-sd-mii-icu-systemischer-vaskulaerer-widerstandsindex.md) and [SD MII ICU Zentralvenoeser Blutdruck](StructureDefinition-sd-mii-icu-zentralvenoeser-blutdruck.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-monitoring-und-vitaldaten.csv), [Excel](StructureDefinition-sd-mii-icu-monitoring-und-vitaldaten.xlsx), [Schematron](StructureDefinition-sd-mii-icu-monitoring-und-vitaldaten.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-monitoring-und-vitaldaten",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Monitoring_Und_Vitaldaten",
  "title" : "SD MII ICU Monitoring und Vitaldaten",
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
  "description" : "Dieses Profil dient als Abstraktionsprofil für verschiedene spezialisierte Beobachtungen in der Akutmedizin zur Abbildung von Monitoring- und Vitaldaten.",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation",
        "constraint" : [
          {
            "key" : "vs-de-2",
            "severity" : "error",
            "human" : "If there is no component or hasMember element then either a value[x] or a data absent reason must be present",
            "expression" : "(component.empty() and hasMember.empty()) implies (dataAbsentReason.exists() or value.exists())",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten"
          }
        ]
      },
      {
        "id" : "Observation.id",
        "path" : "Observation.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
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
        "id" : "Observation.identifier",
        "path" : "Observation.identifier",
        "mustSupport" : true
      },
      {
        "id" : "Observation.basedOn",
        "path" : "Observation.basedOn",
        "short" : "maximal Kardinalität bei Übernahme aus MII-Kerndatensatz-ICU entfernt",
        "mustSupport" : true
      },
      {
        "id" : "Observation.partOf",
        "path" : "Observation.partOf",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Procedure"]
          }
        ]
      },
      {
        "id" : "Observation.status",
        "path" : "Observation.status",
        "comment" : "Motivation MS: Observation.status ist bereits durch die Kardinalität der Basisklasse Observation erzwungen. Dieses Feld dient der Präzisierung des Status der Untersuchung",
        "mustSupport" : true
      },
      {
        "id" : "Observation.category",
        "path" : "Observation.category",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.category:vs-cat",
        "path" : "Observation.category",
        "sliceName" : "vs-cat",
        "min" : 1,
        "max" : "1",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
              "code" : "vital-signs"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.category:vs-cat.coding",
        "path" : "Observation.category.coding",
        "mustSupport" : true
      },
      {
        "id" : "Observation.category:vs-cat.coding.system",
        "path" : "Observation.category.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.category:vs-cat.coding.code",
        "path" : "Observation.category.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
        "constraint" : [
          {
            "key" : "code-coding-icu",
            "severity" : "error",
            "human" : "Es muss mindestens ein snomed oder loinc code vorhanden sein",
            "expression" : "coding.exists() implies coding.where(system = 'http://snomed.info/sct').exists() or coding.where(system = 'http://loinc.org').exists()",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Observation.code.coding:sct",
        "path" : "Observation.code.coding",
        "sliceName" : "sct",
        "min" : 0,
        "max" : "*",
        "patternCoding" : {
          "system" : "http://snomed.info/sct"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-snomed"
        }
      },
      {
        "id" : "Observation.code.coding:sct.system",
        "path" : "Observation.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:sct.code",
        "path" : "Observation.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "min" : 0,
        "max" : "*",
        "patternCoding" : {
          "system" : "http://loinc.org"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-loinc"
        }
      },
      {
        "id" : "Observation.code.coding:loinc.system",
        "path" : "Observation.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:loinc.code",
        "path" : "Observation.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:IEEE-11073",
        "path" : "Observation.code.coding",
        "sliceName" : "IEEE-11073",
        "min" : 0,
        "max" : "*",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-iso11073"
        }
      },
      {
        "id" : "Observation.code.coding:IEEE-11073.system",
        "path" : "Observation.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:IEEE-11073.code",
        "path" : "Observation.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.subject",
        "path" : "Observation.subject",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.encounter",
        "path" : "Observation.encounter",
        "mustSupport" : true
      },
      {
        "id" : "Observation.effective[x]",
        "path" : "Observation.effective[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "dateTime"
          },
          {
            "code" : "Period"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.performer",
        "path" : "Observation.performer",
        "comment" : "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x].value",
        "path" : "Observation.value[x].value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x].unit",
        "path" : "Observation.value[x].unit",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x].system",
        "path" : "Observation.value[x].system",
        "min" : 1,
        "patternUri" : "http://unitsofmeasure.org",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x].code",
        "path" : "Observation.value[x].code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.dataAbsentReason",
        "path" : "Observation.dataAbsentReason",
        "constraint" : [
          {
            "key" : "mii-icu-1",
            "severity" : "error",
            "human" : "If there is no Observation.value, a dataAbsentReason must be given.",
            "expression" : "value.exists().not() implies dataAbsentReason.exists()",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.interpretation",
        "path" : "Observation.interpretation",
        "mustSupport" : true
      },
      {
        "id" : "Observation.bodySite",
        "path" : "Observation.bodySite",
        "mustSupport" : true,
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-bodysite-observation-monitoring-und-vitaldaten"
        }
      },
      {
        "id" : "Observation.method",
        "path" : "Observation.method",
        "comment" : "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit",
        "mustSupport" : true
      },
      {
        "id" : "Observation.device",
        "path" : "Observation.device",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange",
        "path" : "Observation.referenceRange",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component",
        "path" : "Observation.component",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.code",
        "path" : "Observation.component.code",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.dataAbsentReason",
        "path" : "Observation.component.dataAbsentReason",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.interpretation",
        "path" : "Observation.component.interpretation",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.referenceRange",
        "path" : "Observation.component.referenceRange",
        "mustSupport" : true
      }
    ]
  }
}

```
