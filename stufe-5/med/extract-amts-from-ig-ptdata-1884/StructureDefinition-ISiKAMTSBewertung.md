# ISiK AMTS-Bewertung - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK AMTS-Bewertung**

## Resource Profile: ISiK AMTS-Bewertung 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKAMTSBewertung | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKAMTSBewertung |

 
Dieses Profil ermöglicht die Abbildung von Informationen zur Risikobeurteilung im Rahmen der Arzneimitteltherapiesicherheit (AMTS). 

**Usages:**

* Examples for this Profile: [RiskAssessment/ExampleISiKAMTSBewertung1](RiskAssessment-ExampleISiKAMTSBewertung1.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement AMTS Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementAMTSAkteur-expanded.md) and [ISiK CapabilityStatement AMTS Rolle](CapabilityStatement-ISiKCapabilityStatementAMTSRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/amts.ig|current/StructureDefinition/ISiKAMTSBewertung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKAMTSBewertung.csv), [Excel](StructureDefinition-ISiKAMTSBewertung.xlsx), [Schematron](StructureDefinition-ISiKAMTSBewertung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKAMTSBewertung",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAMTSBewertung",
  "version" : "6.0.0-rc",
  "name" : "ISiKAMTSBewertung",
  "title" : "ISiK AMTS-Bewertung",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil ermöglicht die Abbildung von Informationen zur Risikobeurteilung im Rahmen der Arzneimitteltherapiesicherheit (AMTS).",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
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
      "identity" : "openehr",
      "uri" : "http://openehr.org",
      "name" : "Open EHR Archetype Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "RiskAssessment",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/RiskAssessment",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "RiskAssessment",
        "path" : "RiskAssessment"
      },
      {
        "id" : "RiskAssessment.id",
        "path" : "RiskAssessment.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.meta.versionId",
        "path" : "RiskAssessment.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "RiskAssessment.meta.lastUpdated",
        "path" : "RiskAssessment.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "RiskAssessment.extension",
        "path" : "RiskAssessment.extension",
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
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.extension:acceptedRisk",
        "path" : "RiskAssessment.extension",
        "sliceName" : "acceptedRisk",
        "short" : "akzeptiertes (in Kauf genommenes) Risiko",
        "comment" : "Begründung des Must-Support: Die Möglichkeit der freitextlichen Dokumentation dieser Daten wurde von der Fachseite (AG) gewünscht.\n\n  Hinweis: Hier kann die Begründung und ggf. erforderliche Begleitmaßnahmen für ein in Kauf genommenes Risiko dokumentiert werden.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKAcceptedRisk"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.status",
        "path" : "RiskAssessment.status",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Die Angabe des Status ist im Standard vorgeschrieben.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.code",
        "path" : "RiskAssessment.code",
        "short" : "Art der Risikobeurteilung",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Es handelt sich um eine Grundinformation zur Risikobewertung.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.code.coding",
        "path" : "RiskAssessment.code.coding",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.code.coding.system",
        "path" : "RiskAssessment.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.code.coding.code",
        "path" : "RiskAssessment.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.code.coding.display",
        "path" : "RiskAssessment.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.code.text",
        "path" : "RiskAssessment.code.text",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.subject",
        "path" : "RiskAssessment.subject",
        "short" : "Referenz auf den Patienten",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Eine Risikobewertung muss sich immer auf ein Subjekt (hier: Patient) beziehen.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.subject.reference",
        "path" : "RiskAssessment.subject.reference",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.encounter",
        "path" : "RiskAssessment.encounter",
        "short" : "Referenz auf den Abteilungskontakt",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Der Encounter liefert den Kontext zur Risikobeurteilung.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.encounter.reference",
        "path" : "RiskAssessment.encounter.reference",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.occurrence[x]",
        "path" : "RiskAssessment.occurrence[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "short" : "Zeitpunkt oder Zeitraum der Beurteilung",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Die Angabe des Zeitpunkts oder Zeitraums ist essentiell für die Nachvollziehbarkeit.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.occurrence[x]:occurrenceDateTime",
        "path" : "RiskAssessment.occurrence[x]",
        "sliceName" : "occurrenceDateTime",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Die Angabe des Zeitpunkts ist essentiell für die Nachvollziehbarkeit.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "dateTime"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.occurrence[x]:occurrencePeriod",
        "path" : "RiskAssessment.occurrence[x]",
        "sliceName" : "occurrencePeriod",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Die Angabe des Zeitraums ist essentiell für die Nachvollziehbarkeit.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Period"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.condition",
        "path" : "RiskAssessment.condition",
        "short" : "Bezugsdiagnose (Referenz)",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Die Bezugsdiagnose ist eine relevante Hintergrundinformation.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.condition.reference",
        "path" : "RiskAssessment.condition.reference",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.reasonCode",
        "path" : "RiskAssessment.reasonCode",
        "short" : "Grund der Risikobewertung (codiert)",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Die Angabe einer Begründung ist fachlich üblich und angebracht.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.reasonCode.coding",
        "path" : "RiskAssessment.reasonCode.coding",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.reasonCode.coding.system",
        "path" : "RiskAssessment.reasonCode.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.reasonCode.coding.code",
        "path" : "RiskAssessment.reasonCode.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.reasonCode.coding.display",
        "path" : "RiskAssessment.reasonCode.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.reasonCode.text",
        "path" : "RiskAssessment.reasonCode.text",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.reasonReference",
        "path" : "RiskAssessment.reasonReference",
        "short" : "Grund der Risikobewertung (Referenz)",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Die Angabe einer Begründung ist fachlich üblich und angebracht.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.reasonReference.reference",
        "path" : "RiskAssessment.reasonReference.reference",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.basis",
        "path" : "RiskAssessment.basis",
        "short" : "Entscheidungsgrundlagen der Risikobewertung (Referenz)",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Die Referenz zu den Grundlagen der Beurteilung ermöglicht die Transparenz der Beurteilungs-Findung.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.basis.reference",
        "path" : "RiskAssessment.basis.reference",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction",
        "path" : "RiskAssessment.prediction",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Angaben über Outcome und Größe des Risikos.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.outcome",
        "path" : "RiskAssessment.prediction.outcome",
        "short" : "Mögliches Outcome für den Patienten",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Das erwartete Outcome ist eine Kerninformation der Risikobeurteilung.\n\n    Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.outcome.coding",
        "path" : "RiskAssessment.prediction.outcome.coding",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.outcome.coding.system",
        "path" : "RiskAssessment.prediction.outcome.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.outcome.coding.code",
        "path" : "RiskAssessment.prediction.outcome.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.outcome.coding.display",
        "path" : "RiskAssessment.prediction.outcome.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.outcome.text",
        "path" : "RiskAssessment.prediction.outcome.text",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.qualitativeRisk",
        "path" : "RiskAssessment.prediction.qualitativeRisk",
        "short" : "Risikowahrscheinlichkeit (qualitativ, codiert)",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Die Risikowahrscheinlichkeit ist eine Kerninformation der Risikobeurteilung.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true,
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://hl7.org/fhir/ValueSet/risk-probability"
        }
      },
      {
        "id" : "RiskAssessment.prediction.qualitativeRisk.coding",
        "path" : "RiskAssessment.prediction.qualitativeRisk.coding",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.qualitativeRisk.coding.system",
        "path" : "RiskAssessment.prediction.qualitativeRisk.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.qualitativeRisk.coding.code",
        "path" : "RiskAssessment.prediction.qualitativeRisk.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.qualitativeRisk.coding.display",
        "path" : "RiskAssessment.prediction.qualitativeRisk.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.prediction.qualitativeRisk.text",
        "path" : "RiskAssessment.prediction.qualitativeRisk.text",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.mitigation",
        "path" : "RiskAssessment.mitigation",
        "short" : "Hinweis zur Risikovermeidung",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): Hinweise zur Risikovermeidung sind eine Kerninformation der Risikobeurteilung.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      },
      {
        "id" : "RiskAssessment.note",
        "path" : "RiskAssessment.note",
        "short" : "Anmerkung zur Risikobewertung",
        "comment" : "Begründung des Must-Support-Support-Flag (MS): freitextliche Anmerkungen sind fachlich üblich und gewünscht.\n\n  Hintergrund: Das MS wurde im Rahmen der Ausarbeitung zur Stufe 4 des ISiK Moduls Medikation hinzugefügt und mit den Stakeholdern abgestimmt. ",
        "mustSupport" : true
      }
    ]
  }
}

```
