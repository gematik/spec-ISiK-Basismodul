# ISiKFormularDefinition - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKFormularDefinition**

## Resource Profile: ISiKFormularDefinition 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKFormularDefinition |

 
Im Profil `ISiKFormularDefinition` sind Mindestanforderungen an ISiK kompatible Formulare definiert. Die verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben. 

**Usages:**

* Examples for this Profile: [DemoTemplatebasedExtractionQuestionnaire](Questionnaire-DemoTemplatebasedExtractionQuestionnaire.md), [ExampleConditionalItem](Questionnaire-ExampleConditionalItem.md), [ExampleEntryValidationDecimal](Questionnaire-ExampleEntryValidationDecimal.md), [ExampleEntryValidationText](Questionnaire-ExampleEntryValidationText.md)... Show 6 more, [ExampleExtractWithUnit](Questionnaire-ExampleExtractWithUnit.md), [ExampleInputPatternValidation](Questionnaire-ExampleInputPatternValidation.md), [ExampleMdrRelevant](Questionnaire-ExampleMdrRelevant.md), [ExamplePrePopDemo](Questionnaire-ExamplePrePopDemo.md), [ExamplePrePopDemoEnc](Questionnaire-ExamplePrePopDemoEnc.md) and [ExamplePrePopObservation](Questionnaire-ExamplePrePopObservation.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementFormularDefinitionsVerwalterAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementFormularDefinitionsVerwalterAkteur-expanded.md) and [CapabilityStatement für Rolle "FormularDefinitionsVerwalterRolle"](CapabilityStatement-ISiKCapabilityStatementFormularDefinitionsVerwalterRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/ISiKFormularDefinition)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKFormularDefinition.csv), [Excel](StructureDefinition-ISiKFormularDefinition.xlsx), [Schematron](StructureDefinition-ISiKFormularDefinition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKFormularDefinition",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition",
  "version" : "6.0.0-rc",
  "name" : "ISiKFormularDefinition",
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
  "description" : "Im Profil `ISiKFormularDefinition` sind Mindestanforderungen an ISiK kompatible Formulare definiert.\nDie verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben.",
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
    },
    {
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Questionnaire",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Questionnaire",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Questionnaire",
        "path" : "Questionnaire"
      },
      {
        "id" : "Questionnaire.id",
        "path" : "Questionnaire.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.meta.versionId",
        "path" : "Questionnaire.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "Questionnaire.meta.lastUpdated",
        "path" : "Questionnaire.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "Questionnaire.modifierExtension",
        "path" : "Questionnaire.modifierExtension",
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
        "id" : "Questionnaire.modifierExtension:MDR-Relevant",
        "path" : "Questionnaire.modifierExtension",
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
        "id" : "Questionnaire.url",
        "path" : "Questionnaire.url",
        "short" : "CanoncialURL des Formulars",
        "comment" : "Weltweit eindeutiger Name des Formulars.\n  **Begründung Pflichtfeld:**\n  Wird für eindeutige Bezugnahme von FormularDaten auf FormularDefinition benötigt.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.version",
        "path" : "Questionnaire.version",
        "short" : "Version",
        "comment" : "Versionsnummer des Formulars. Sollte gem. semVer-Regeln inkrementiert werden, je nach Schweregrad der Änderungen.\n  **Begründung MS:**  \n  Wird benötigt, um FormularDefinitionen in unterschiedlichen Versionen zu differenzieren. ",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.title",
        "path" : "Questionnaire.title",
        "short" : "Titel/Überschrift",
        "comment" : "Dem Anwender angezeigter Titel des Formulars.  \n  **Begründung MS:**  \n  Wird für die Darstellung und Auffindbarkeit der FormularDefinition benötigt.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.derivedFrom",
        "path" : "Questionnaire.derivedFrom",
        "short" : "Abgeleitet von",
        "comment" : "Verweis auf ein Questionnaire, von dem abgeleitet wurde, welches erweitert wurde oder welches als Grundlage diente.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.status",
        "path" : "Questionnaire.status",
        "short" : "active | retired",
        "comment" : "Die im ISiK-Kontext bereitgestellten Formulare sollten final ausspezifiziert sein und daher den Status 'active' haben. \n  Formulare, die zurückgezogen oder durch neuere Versionen ersetzt wurden, können mit 'retired' gekennzeichnet werden.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.subjectType",
        "path" : "Questionnaire.subjectType",
        "short" : "Subject, über das in diesem Formular berichtet wird.",
        "comment" : "**Begründung Pflichtfeld:**  \n  Zur Vereinfachung des Workflows werden zunächst nur Formulare mit Patientenbezug zugelassen. \n  Dabei ist stets davon auszugehen, dass der Patient, für den dieses Formular ausgefüllt wird, \n  identisch ist, mit dem Patient, der im Launch-Kontext übergeben wird. \n  Diese Anforderung kann in künftigen Ausbaustufen gelockert werden.",
        "min" : 1,
        "max" : "1",
        "patternCode" : "Patient",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.description",
        "path" : "Questionnaire.description",
        "short" : "Formularbeschreibung",
        "comment" : "**Begründung Pflichtfeld:**  \n  Ausführliche Beschreibung des Formulars zur Verbesserung der Auffindbarkeit und Interpretation der Nutzung",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item",
        "path" : "Questionnaire.item",
        "short" : "Formularfeld",
        "comment" : "Formularfeld oder Einstiegspunkt für eine Gruppe von Formularfeldern",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.linkId",
        "path" : "Questionnaire.item.linkId",
        "short" : "innerhalb dieses Formulars eindeutige ID dieses Feldes",
        "comment" : "**Begründung Pflichtfeld:**  \n    Erforderlich für die Verlinkung der Antworten in der QuestionnaireRespons mit der Definition des Formularfeldes.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.code",
        "path" : "Questionnaire.item.code",
        "short" : "Code für dieses Formularfeld",
        "comment" : "**Begründung MS:**  \n    Zur eindeutigen Identifikation des Formularfeldes. Ohne Code ist Observation-based-extraction nicht möglich.\n    Wenn kein Code zur Verfügung steht, besteht weiterhin die Möglichkeit ein Item ohne Code zu definieren.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.prefix",
        "path" : "Questionnaire.item.prefix",
        "short" : "Feld für bspw. Nummerierung von Elementen",
        "comment" : "**Begründung MS:**\n    Falls bspw. eine Gruppierung oder Nummerierung nicht über die Verschachtelung von Items erfolgt, kann über das Prefix eine solche erfolgen. Aus dem Grund MUSS es in der Darstellung beim Rendern mit verarbeitet werden.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.text",
        "path" : "Questionnaire.item.text",
        "short" : "Fragestellung, Anzeigetext oder Gruppenname",
        "comment" : "**Begründung MS:**  \n    Je nach 'type' des items: Fragestellung, Anzeigetext oder Gruppenname",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.type",
        "path" : "Questionnaire.item.type",
        "comment" : "Time is handled using \"string\".  File is handled using Attachment.  (Content can be sent as a contained binary).",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.enableWhen",
        "path" : "Questionnaire.item.enableWhen",
        "comment" : "**Begründung MS:** Bedingungen, die erfüllt sein müssen, damit das Item dargestellt wird. Dieses Feld ist ein modifier-Element, weshalb MS obligatorisch ist, es muss interpretiert werden.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.enableWhen.question",
        "path" : "Questionnaire.item.enableWhen.question",
        "comment" : "LinkId der Frage, bei der die Bedingung zu erfüllen ist.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.enableWhen.operator",
        "path" : "Questionnaire.item.enableWhen.operator",
        "comment" : "Operator, mittels dem die Value der .question mit dem in answer[x] angegeben Element vergleichen wird.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.enableWhen.answer[x]",
        "path" : "Questionnaire.item.enableWhen.answer[x]",
        "comment" : "Rechter Wert des Bedingungsvergleich",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.required",
        "path" : "Questionnaire.item.required",
        "short" : "Pflichtfeld?",
        "comment" : "**Begründung MS:**  \n    FormularRenderer sollen sicherstellen können, dass Formulare vom Anwender vollständig ausgefüllt werden.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.repeats",
        "path" : "Questionnaire.item.repeats",
        "short" : "Mehrfachangaben erlaubt?",
        "comment" : "**Begründung MS:**  FormularRenderer sollen in der Lage sein zwischen Einfach- und Mehrfachangaben unterscheiden zu können.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.readOnly",
        "path" : "Questionnaire.item.readOnly",
        "short" : "Keine Eingabe erlaubt?",
        "comment" : "Antwort wird automatisch vorbelegt/berechnet und darf nicht vom Anwender editiert/überschrieben werden.\n    **Begründung MS:** Automatisch vorbelegte Items sollen gegen Veränderung durch den Benutzer geschützt werden können (z.B. für Patientenstammdaten).",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.maxLength",
        "path" : "Questionnaire.item.maxLength",
        "short" : "Längenbegrenzung",
        "comment" : "Maximale Anzahl zulässiger Zeichen für die Beantwortung der Frage.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.answerValueSet",
        "path" : "Questionnaire.item.answerValueSet",
        "short" : "Festlegung der Antwortmöglichkeiten durch Verweis auf ValueSet",
        "comment" : "**Begründung MS:**  Wo geeignete ValueSets vorhanden sind, die die Antwortmöglichkeiten hinreichend repräsentieren, sollte auf diese verwiesen werden.",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.answerOption",
        "path" : "Questionnaire.item.answerOption",
        "short" : "Festlegung der Antwortmöglichkeiten durch Aufzählung",
        "comment" : "**Begründung MS:**  Wo *keine* geeignete ValueSets vorhanden sind, die die Antwortmöglichkeiten hinreichen repräsentieren, \n    können Antworten alternativ in der FormularDefinition explizit aufgezählt werden..",
        "mustSupport" : true
      },
      {
        "id" : "Questionnaire.item.item",
        "path" : "Questionnaire.item.item",
        "short" : "Untergeordnetes Item",
        "comment" : "**Begründung MS:**  \n   Items können beliebig verschachtelt und zu Gruppen zusammengefasst werden, um komplexere und umfangreichere Formulare zu strukturieren.",
        "mustSupport" : true
      }
    ]
  }
}

```
