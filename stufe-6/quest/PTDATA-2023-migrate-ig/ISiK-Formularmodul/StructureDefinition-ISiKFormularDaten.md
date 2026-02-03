# Ausgefülltes ISiK-Formular - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Ausgefülltes ISiK-Formular**

## Resource Profile: Ausgefülltes ISiK-Formular 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDaten | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKFormularDaten |

 
Im Profil `ISiKFormularDaten` sind Mindestanforderungen an ISiK kompatible, ausgefüllte Formulare definiert. Die verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben. 

**Usages:**

* Examples for this Profile: [QuestionnaireResponse/ExampleEntryValidationDecimalResponse](QuestionnaireResponse-ExampleEntryValidationDecimalResponse.md), [QuestionnaireResponse/ExampleExtractWithUnitResponse](QuestionnaireResponse-ExampleExtractWithUnitResponse.md), [QuestionnaireResponse/TestMaxDecimal0](QuestionnaireResponse-TestMaxDecimal0.md), [QuestionnaireResponse/TestMaxDecimal1](QuestionnaireResponse-TestMaxDecimal1.md)... Show 2 more, [QuestionnaireResponse/TestMaxDecimal2](QuestionnaireResponse-TestMaxDecimal2.md) and [QuestionnaireResponse/TestMaxDecimal3](QuestionnaireResponse-TestMaxDecimal3.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur-expanded.md) and [CapabilityStatement für Rolle "FormularDatenQuelleRolle"](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/ISiKFormularDaten)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKFormularDaten.csv), [Excel](StructureDefinition-ISiKFormularDaten.xlsx), [Schematron](StructureDefinition-ISiKFormularDaten.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKFormularDaten",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDaten",
  "version" : "6.0.0-rc",
  "name" : "ISiKFormularDaten",
  "title" : "Ausgefülltes ISiK-Formular",
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
  "description" : "Im Profil `ISiKFormularDaten` sind Mindestanforderungen an ISiK kompatible, ausgefüllte Formulare definiert.\nDie verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "QuestionnaireResponse",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "QuestionnaireResponse",
        "path" : "QuestionnaireResponse",
        "constraint" : [
          {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bestpractice",
                "valueBoolean" : true
              }
            ],
            "key" : "sdcqr-1",
            "severity" : "warning",
            "human" : "Subject SHOULD be present (searching is difficult without subject).  Almost all QuestionnaireResponses should be with respect to some sort of subject.",
            "expression" : "subject.exists()",
            "xpath" : "exists(f:subject)",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDaten"
          },
          {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bestpractice",
                "valueBoolean" : true
              }
            ],
            "key" : "sdcqr-2",
            "severity" : "error",
            "human" : "When repeats=true for a group, it'll be represented with multiple items with the same linkId in the QuestionnaireResponse.  For a question, it'll be represented by a single item with that linkId with multiple answers.",
            "expression" : "(QuestionnaireResponse|repeat(answer|item)).select(item.where(answer.value.exists()).linkId.isDistinct()).allTrue()",
            "xpath" : "not(exists(for $item in descendant::f:item[f:answer] return $item/preceding-sibling::f:item[f:linkId/@value=$item/f:linkId/@value]))",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDaten"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.id",
        "path" : "QuestionnaireResponse.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.meta.versionId",
        "path" : "QuestionnaireResponse.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "QuestionnaireResponse.meta.lastUpdated",
        "path" : "QuestionnaireResponse.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "QuestionnaireResponse.modifierExtension",
        "path" : "QuestionnaireResponse.modifierExtension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "QuestionnaireResponse.modifierExtension:MDR-Relevant",
        "path" : "QuestionnaireResponse.modifierExtension",
        "sliceName" : "MDR-Relevant",
        "short" : "MPG-Relevanz der Formulardaten",
        "comment" : "**Begründung MS:**\n  In dieser Extension wird angegeben, dass die Formulardaten MDR-relevant sind. Für die Erhebung und/oder Darstellung müssen ggf. bestimmte Voraussetzungen erfüllt sein. Ist die Extension nicht vorhanden, liegt keine MDR-relevanmt vor.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://gematik.de/fhir/isik/StructureDefinition/ISiKMDRRelevanzFormularExtension"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.modifierExtension:MDR-Relevant.value[x]",
        "path" : "QuestionnaireResponse.modifierExtension.value[x]",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.identifier",
        "path" : "QuestionnaireResponse.identifier",
        "short" : "eindeutiger Identifier der FormularDaten",
        "comment" : "**Begründung MS:**\n  Ein vom FormularRenderer vergebener, eindeutiger Identifier kann von weiterverarbeitenden Systemen genutzt werden, um Dubletten zu erkennen.",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.questionnaire",
        "path" : "QuestionnaireResponse.questionnaire",
        "short" : "Bezug zur FormularDefinition inkl. Version",
        "comment" : "Bei der Angabe der Canonical, sollte die Version der FormularDefinition, welche bei der Erstellung die Grundlage gebildet hat, angegeben sein.\n  **Begründung MS:** \n  Der Bezug zur Formulardefinition kann für die Interpretation und Darstellung der Formulardaten relevant sein.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.questionnaire.extension",
        "path" : "QuestionnaireResponse.questionnaire.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "QuestionnaireResponse.questionnaire.extension:questionnaireDisplay",
        "path" : "QuestionnaireResponse.questionnaire.extension",
        "sliceName" : "questionnaireDisplay",
        "short" : "Titel/Überschrift der zugrunde liegenden FormularDefinition",
        "comment" : "Wird für die Darstellung und Auffindbarkeit der FormularDaten benötigt.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/display"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.status",
        "path" : "QuestionnaireResponse.status",
        "short" : "Status",
        "comment" : "**Begründung Pflichtfeld:**\n  Bei der Verarbeitung von FormularDaten ist es wichtig, den Status zu beachten. Falls die Instanz noch nicht `completed` ist, sollte von einer Weiterverarbeitung abgesehen werden.",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.subject",
        "path" : "QuestionnaireResponse.subject",
        "short" : "Subject (Patient), über das in diesem Formular berichtet wird.",
        "comment" : "**Begründung Pflichtfeld:**  \n  Zur Vereinfachung des Workflows werden zunächst nur Formulare mit Patientenbezug zugelassen.  \n  Diese Anforderung kann in künftigen Ausbaustufen gelockert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.subject.reference",
        "path" : "QuestionnaireResponse.subject.reference",
        "short" : "Patienten-Link",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.authored",
        "path" : "QuestionnaireResponse.authored",
        "short" : "Datum der FormularDaten",
        "comment" : "**Begründung Pflichtfeld:** \n  Relevant für die Suche und zeitliche Einordnung der FormularDaten",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.author",
        "path" : "QuestionnaireResponse.author",
        "short" : "Ersteller des Fromulars",
        "comment" : "Auch wenn hier keine Einschränkung vorgenommen wurde, ist zu empfehlen, hier die ausfüllende Person (Patient/Practitioner) zu referenzieren und nicht nur die Software (Device), mit der das Formular ausgefüllt wurde.\n  **Begründung MS:**\n  In den meisten Fällen ist relevant, wer Formulardaten erfasst hat.",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item",
        "path" : "QuestionnaireResponse.item",
        "short" : "Formularelement",
        "comment" : "**Begründung MS:** Es können beliebig viele Formularelemente hier abgebildet werden.",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.linkId",
        "path" : "QuestionnaireResponse.item.linkId",
        "short" : "Eindeutige ID des Formularelement",
        "comment" : "**Begründung Pflichtfeld:**\n    Die LinkId ordnet die Information der Antwort einer Frage in der FormularDefinition zu und ist aus dem Grund zur Interpretation der Antwort unablässig.",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.text",
        "path" : "QuestionnaireResponse.item.text",
        "short" : "Frage, die beantwortet wurde",
        "comment" : "**Begründung Pflichtfeld:**  \n    Die FormularDaten sollte pro Antwort auch die Fragestellung mitführen, \n    damit die Daten auch von Systemen/Anwendern interpretiert werden können, \n    die *keinen* Zugriff auf die zugrunde liegende FormularDefinition haben.",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.answer",
        "path" : "QuestionnaireResponse.item.answer",
        "short" : "Antwort",
        "comment" : "**Begründung MS:**\n    Die erfasste Antwort MUSS stets vorhanden sein.",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.answer.value[x]",
        "path" : "QuestionnaireResponse.item.answer.value[x]",
        "short" : "Inhalt der Antwort",
        "comment" : "**Begründung MS:**\n      Der Inhalt der jeweilig erfassten Antwort MUSS stehts vorhanden sein.",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.answer.item",
        "path" : "QuestionnaireResponse.item.answer.item",
        "short" : "Untergeordnetes Item",
        "comment" : "**Begründung MS:**  \n   Items können beliebig verschachtelt und zu Gruppen zusammengefasst werden, um komplexere und umfangreichere Formulare zu strukturieren.",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.item",
        "path" : "QuestionnaireResponse.item.item",
        "short" : "Untergeordnetes Item",
        "comment" : "**Begründung MS:**  \n   Items können beliebig verschachtelt und zu Gruppen zusammengefasst werden, um komplexere und umfangreichere Formulare zu strukturieren.",
        "mustSupport" : true
      }
    ]
  }
}

```
