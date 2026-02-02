# SD MII ICU Sonstige pulsatile Druecke Generisch - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SD MII ICU Sonstige pulsatile Druecke Generisch**

## Resource Profile: SD MII ICU Sonstige pulsatile Druecke Generisch 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-sonstige-pulsatile-druecke-generisch | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Sonstige_Pulsatile_Druecke_Generisch |

 
Dieses Profil bietet eine abstrahierte Schicht zur Abbildung sonstiger pulsatiler Drücke in der Akutmedizin. Es ist generisch im Sinne der Profil-Abstraktion, allerdings explizit nicht im Sinne einer Blutdruckmessung (siehe dafür Profile zu Blutdruck im generischen Modul Vitalparameter). 

**Usages:**

* Derived from this Profile: [SD MII ICU Linksatrialer Druck](StructureDefinition-sd-mii-icu-linksatrialer-druck.md), [SD MII ICU Linksventrikulaerer Druck](StructureDefinition-sd-mii-icu-linksventrikulaerer-druck.md), [SD MII ICU Pulmonalarterieller Blutdruck](StructureDefinition-sd-mii-icu-pulmonalarterieller-blutdruck.md), [SD MII ICU Rechtsatrialer Druck](StructureDefinition-sd-mii-icu-rechtsatrialer-druck.md) and [SD MII ICU Rechtsventrikulaerer Druck](StructureDefinition-sd-mii-icu-rechtsventrikulaerer-druck.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/sd-mii-icu-sonstige-pulsatile-druecke-generisch)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-sonstige-pulsatile-druecke-generisch.csv), [Excel](StructureDefinition-sd-mii-icu-sonstige-pulsatile-druecke-generisch.xlsx), [Schematron](StructureDefinition-sd-mii-icu-sonstige-pulsatile-druecke-generisch.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-sonstige-pulsatile-druecke-generisch",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-sonstige-pulsatile-druecke-generisch",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Sonstige_Pulsatile_Druecke_Generisch",
  "title" : "SD MII ICU Sonstige pulsatile Druecke Generisch",
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
  "description" : "Dieses Profil bietet eine abstrahierte Schicht zur Abbildung sonstiger pulsatiler Drücke in der Akutmedizin. Es ist generisch im Sinne der Profil-Abstraktion, allerdings explizit nicht im Sinne einer Blutdruckmessung (siehe dafür Profile zu Blutdruck im generischen Modul Vitalparameter).",
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
        "max" : "1"
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
        "mustSupport" : true
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
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
        "min" : 2,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding.system",
        "path" : "Observation.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding.code",
        "path" : "Observation.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding.display",
        "path" : "Observation.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:sct-generic",
        "path" : "Observation.code.coding",
        "sliceName" : "sct-generic",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "75367002"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:sct",
        "path" : "Observation.code.coding",
        "sliceName" : "sct",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Observation.subject",
        "path" : "Observation.subject",
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
        "max" : "0",
        "mustSupport" : true
      },
      {
        "id" : "Observation.dataAbsentReason",
        "path" : "Observation.dataAbsentReason",
        "max" : "0",
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
          "description" : "Codes describing anatomical locations. May include laterality. Subset of ValueSet for Monitoring und Vitaldaten.",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-bodysite-observation-blutdruck"
        }
      },
      {
        "id" : "Observation.method",
        "path" : "Observation.method",
        "mustSupport" : true,
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-method-observation-blutdruck"
        }
      },
      {
        "id" : "Observation.method.coding",
        "path" : "Observation.method.coding",
        "mustSupport" : true
      },
      {
        "id" : "Observation.method.coding.system",
        "path" : "Observation.method.coding.system",
        "mustSupport" : true
      },
      {
        "id" : "Observation.method.coding.code",
        "path" : "Observation.method.coding.code",
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
        "max" : "0",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component",
        "path" : "Observation.component",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "code"
            }
          ],
          "rules" : "open"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.code",
        "path" : "Observation.component.code",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP",
        "path" : "Observation.component",
        "sliceName" : "SystolicBP",
        "min" : 0,
        "max" : "1",
        "constraint" : [
          {
            "key" : "vs-de-3",
            "severity" : "error",
            "human" : "If there is no value a data absent reason must be present",
            "expression" : "value.exists() xor dataAbsentReason.exists()",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-sonstige-pulsatile-druecke-generisch"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://loinc.org",
              "code" : "8480-6"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding",
        "path" : "Observation.component.code.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:loinc",
        "path" : "Observation.component.code.coding",
        "sliceName" : "loinc",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "8480-6"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:loinc.system",
        "path" : "Observation.component.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:loinc.code",
        "path" : "Observation.component.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:loinc.display",
        "path" : "Observation.component.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:sct",
        "path" : "Observation.component.code.coding",
        "sliceName" : "sct",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "271649006"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:sct.system",
        "path" : "Observation.component.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:sct.code",
        "path" : "Observation.component.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:sct.display",
        "path" : "Observation.component.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:IEEE-11073",
        "path" : "Observation.component.code.coding",
        "sliceName" : "IEEE-11073",
        "min" : 0,
        "max" : "*",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:IEEE-11073.system",
        "path" : "Observation.component.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:IEEE-11073.code",
        "path" : "Observation.component.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.code.coding:IEEE-11073.display",
        "path" : "Observation.component.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          }
        ],
        "patternQuantity" : {
          "unit" : "millimeter Mercury column",
          "system" : "http://unitsofmeasure.org",
          "code" : "mm[Hg]"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.value[x].value",
        "path" : "Observation.component.value[x].value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.value[x].unit",
        "path" : "Observation.component.value[x].unit",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.value[x].system",
        "path" : "Observation.component.value[x].system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.value[x].code",
        "path" : "Observation.component.value[x].code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:SystolicBP.dataAbsentReason",
        "path" : "Observation.component.dataAbsentReason",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP",
        "path" : "Observation.component",
        "sliceName" : "DiastolicBP",
        "min" : 0,
        "max" : "1",
        "constraint" : [
          {
            "key" : "vs-de-3",
            "severity" : "error",
            "human" : "If there is no value a data absent reason must be present",
            "expression" : "value.exists() xor dataAbsentReason.exists()",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-sonstige-pulsatile-druecke-generisch"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://loinc.org",
              "code" : "8462-4"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding",
        "path" : "Observation.component.code.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:loinc",
        "path" : "Observation.component.code.coding",
        "sliceName" : "loinc",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "8462-4"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:loinc.system",
        "path" : "Observation.component.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:loinc.code",
        "path" : "Observation.component.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:loinc.display",
        "path" : "Observation.component.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:sct",
        "path" : "Observation.component.code.coding",
        "sliceName" : "sct",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "271650006"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:sct.system",
        "path" : "Observation.component.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:sct.code",
        "path" : "Observation.component.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:sct.display",
        "path" : "Observation.component.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:IEEE-11073",
        "path" : "Observation.component.code.coding",
        "sliceName" : "IEEE-11073",
        "min" : 0,
        "max" : "*",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:IEEE-11073.system",
        "path" : "Observation.component.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:IEEE-11073.code",
        "path" : "Observation.component.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.code.coding:IEEE-11073.display",
        "path" : "Observation.component.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          }
        ],
        "patternQuantity" : {
          "unit" : "millimeter Mercury column",
          "system" : "http://unitsofmeasure.org",
          "code" : "mm[Hg]"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.value[x].value",
        "path" : "Observation.component.value[x].value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.value[x].unit",
        "path" : "Observation.component.value[x].unit",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.value[x].system",
        "path" : "Observation.component.value[x].system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.value[x].code",
        "path" : "Observation.component.value[x].code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:DiastolicBP.dataAbsentReason",
        "path" : "Observation.component.dataAbsentReason",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP",
        "path" : "Observation.component",
        "sliceName" : "meanBP",
        "min" : 0,
        "max" : "1",
        "constraint" : [
          {
            "key" : "vs-de-3",
            "severity" : "error",
            "human" : "If there is no value a data absent reason must be present",
            "expression" : "value.exists() xor dataAbsentReason.exists()",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-sonstige-pulsatile-druecke-generisch"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code",
        "path" : "Observation.component.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://loinc.org",
              "code" : "8478-0"
            }
          ]
        }
      },
      {
        "id" : "Observation.component:meanBP.code.coding",
        "path" : "Observation.component.code.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:loinc",
        "path" : "Observation.component.code.coding",
        "sliceName" : "loinc",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "8478-0"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:loinc.system",
        "path" : "Observation.component.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:loinc.code",
        "path" : "Observation.component.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:loinc.display",
        "path" : "Observation.component.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:sct",
        "path" : "Observation.component.code.coding",
        "sliceName" : "sct",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "6797001"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:sct.system",
        "path" : "Observation.component.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:sct.code",
        "path" : "Observation.component.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:sct.display",
        "path" : "Observation.component.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:IEEE-11073",
        "path" : "Observation.component.code.coding",
        "sliceName" : "IEEE-11073",
        "min" : 0,
        "max" : "*",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:IEEE-11073.system",
        "path" : "Observation.component.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:IEEE-11073.code",
        "path" : "Observation.component.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.code.coding:IEEE-11073.display",
        "path" : "Observation.component.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.value[x]",
        "path" : "Observation.component.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          }
        ],
        "patternQuantity" : {
          "unit" : "millimeter Mercury column",
          "system" : "http://unitsofmeasure.org",
          "code" : "mm[Hg]"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.value[x].value",
        "path" : "Observation.component.value[x].value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.value[x].unit",
        "path" : "Observation.component.value[x].unit",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.value[x].system",
        "path" : "Observation.component.value[x].system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:meanBP.value[x].code",
        "path" : "Observation.component.value[x].code",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
