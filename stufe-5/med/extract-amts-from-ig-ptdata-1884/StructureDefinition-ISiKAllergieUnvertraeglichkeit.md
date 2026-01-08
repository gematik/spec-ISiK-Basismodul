# ISiKAllergieUnvertraeglichkeit - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKAllergieUnvertraeglichkeit**

## Resource Profile: ISiKAllergieUnvertraeglichkeit 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKAllergieUnvertraeglichkeit | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKAllergieUnvertraeglichkeit |

 
Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien. 

### Motivation

 
Die Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit. Motivierender Use-Case zur Einführung dieser Profile ist die[Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS). 
In FHIR werden Allergien und Unverträglichkeiten mit der[AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert. 

### Kompatibilität

 
Für das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen: 
* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)
* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)
 
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. 

**Usages:**

* Examples for this Profile: [AllergyIntolerance/ISiKAllergieUnvertraeglichkeitBeispiel1](AllergyIntolerance-ISiKAllergieUnvertraeglichkeitBeispiel1.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement AMTS Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementAMTSAkteur-expanded.md), [ISiK CapabilityStatement AMTS Rolle](CapabilityStatement-ISiKCapabilityStatementAMTSRolle.md) and [CapabilityStatement für Rolle "ISiKCapabilityStatementGesundheitsstatusRolle"](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/amts.ig|current/StructureDefinition/ISiKAllergieUnvertraeglichkeit)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKAllergieUnvertraeglichkeit.csv), [Excel](StructureDefinition-ISiKAllergieUnvertraeglichkeit.xlsx), [Schematron](StructureDefinition-ISiKAllergieUnvertraeglichkeit.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKAllergieUnvertraeglichkeit",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAllergieUnvertraeglichkeit",
  "version" : "6.0.0-rc",
  "name" : "ISiKAllergieUnvertraeglichkeit",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "\nDiese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien.\n### Motivation\n\nDie Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit.\nMotivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).\n\nIn FHIR werden Allergien und Unverträglichkeiten mit der [AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.\n\n### Kompatibilität\n\nFür das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:\n* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)\n* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)\n* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "AllergyIntolerance",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/AllergyIntolerance",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "AllergyIntolerance",
        "path" : "AllergyIntolerance"
      },
      {
        "id" : "AllergyIntolerance.id",
        "path" : "AllergyIntolerance.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.meta.versionId",
        "path" : "AllergyIntolerance.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "AllergyIntolerance.meta.lastUpdated",
        "path" : "AllergyIntolerance.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "AllergyIntolerance.clinicalStatus",
        "path" : "AllergyIntolerance.clinicalStatus",
        "short" : "klinischer Status",
        "comment" : "**Begründung MS:** Der klinische Status ist notwendig, um aktive gegenüber zurückliegenden Allergien unterscheiden und in Medikations- sowie Entscheidungsunterstützungsprozessen korrekt berücksichtigen zu können.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.clinicalStatus.coding",
        "path" : "AllergyIntolerance.clinicalStatus.coding",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.clinicalStatus.coding.system",
        "path" : "AllergyIntolerance.clinicalStatus.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.clinicalStatus.coding.code",
        "path" : "AllergyIntolerance.clinicalStatus.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.verificationStatus",
        "path" : "AllergyIntolerance.verificationStatus",
        "short" : "Verifikationsstatus",
        "comment" : "**Begründung MS:** Der Verifizierungsstatus macht transparent, ob eine Meldung bestätigt, widerlegt oder noch im Verdacht ist und ist Voraussetzung für belastbare AMTS-Prüfungen.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.verificationStatus.coding",
        "path" : "AllergyIntolerance.verificationStatus.coding",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.verificationStatus.coding.system",
        "path" : "AllergyIntolerance.verificationStatus.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.verificationStatus.coding.code",
        "path" : "AllergyIntolerance.verificationStatus.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.type",
        "path" : "AllergyIntolerance.type",
        "short" : "Type (Allergie oder Unverträglichkeit)",
        "comment" : "**Begründung MS:** Gibt die Unterscheidung zwischen Allergie und Unverträglichkeit an.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.category",
        "path" : "AllergyIntolerance.category",
        "short" : "Kategorie",
        "comment" : "**Begründung MS:** Die Kategorie erlaubt das Filtern, z. B. nach Arzneimittel-, Lebensmittel- oder Umweltallergien, und unterstützt zielgerichtete Warn- und Recherchefunktionen.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.criticality",
        "path" : "AllergyIntolerance.criticality",
        "short" : "Kritikalität",
        "comment" : "**Begründung MS:** Die Kritikalität beschreibt das erwartete Risiko bei erneuter Exposition und dient der Priorisierung von Warnhinweisen.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code",
        "path" : "AllergyIntolerance.code",
        "short" : "Benennung der Allergie/Unverträglichkeit",
        "comment" : "**Begründung Pflichtfeld:** Nur mit einer codierten oder textuell benannten Auslösersubstanz lässt sich die Allergie klinisch interpretieren und für Interaktionsprüfungen nutzen.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding",
        "path" : "AllergyIntolerance.code.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "system"
            }
          ],
          "rules" : "open"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:snomed-ct",
        "path" : "AllergyIntolerance.code.coding",
        "sliceName" : "snomed-ct",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Coding",
            "profile" : [
              "https://gematik.de/fhir/isik/StructureDefinition/ISiKSnomedCTCoding"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:ask",
        "path" : "AllergyIntolerance.code.coding",
        "sliceName" : "ask",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Coding",
            "profile" : ["http://fhir.de/StructureDefinition/CodingASK"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:ask.system",
        "path" : "AllergyIntolerance.code.coding.system",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:ask.code",
        "path" : "AllergyIntolerance.code.coding.code",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:ask.display",
        "path" : "AllergyIntolerance.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:atc",
        "path" : "AllergyIntolerance.code.coding",
        "sliceName" : "atc",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Coding",
            "profile" : ["http://fhir.de/StructureDefinition/CodingATC"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:atc.system",
        "path" : "AllergyIntolerance.code.coding.system",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:atc.version",
        "path" : "AllergyIntolerance.code.coding.version",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:atc.code",
        "path" : "AllergyIntolerance.code.coding.code",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.coding:atc.display",
        "path" : "AllergyIntolerance.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.code.text",
        "path" : "AllergyIntolerance.code.text",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.patient",
        "path" : "AllergyIntolerance.patient",
        "short" : "Patientenbezug",
        "comment" : "**Begründung Must-Support:** Ein Patientenbezug der AllergieUnverträglichkeit MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.patient.reference",
        "path" : "AllergyIntolerance.patient.reference",
        "short" : "Patienten-Link",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.encounter",
        "path" : "AllergyIntolerance.encounter",
        "short" : "Aufenthaltsbezug",
        "comment" : "**Begründung Must-Support:** Ein Aufenthaltsbezug der AllergieUnverträglichkeit MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.encounter.reference",
        "path" : "AllergyIntolerance.encounter.reference",
        "short" : "Encounter-Link",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.onset[x]",
        "path" : "AllergyIntolerance.onset[x]",
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
        "short" : "Beginn-Zeitpunkt",
        "comment" : "**Begründung MS:** Der dokumentierte Beginn unterstützt die medizinische Bewertung, ob eine Allergie aktuell relevant ist, und wird in CapabilityStatements als Suchparameter gefordert.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.onset[x]:onsetDateTime",
        "path" : "AllergyIntolerance.onset[x]",
        "sliceName" : "onsetDateTime",
        "short" : "Beginn der Allergie/Unvertraeglichkeit",
        "comment" : "**Begründung MS:** Diese Variante erlaubt es, den Beginn als exakten Zeitstempel zu übertragen, wie er in Primärsystemen üblich ist.",
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
        "id" : "AllergyIntolerance.onset[x]:onsetAge",
        "path" : "AllergyIntolerance.onset[x]",
        "sliceName" : "onsetAge",
        "short" : "Alter beim Beginn der Allergie/Unvertraeglichkeit",
        "comment" : "**Begründung MS:** Für lang zurückliegende Ereignisse wird der Beginn häufig nur als Alter dokumentiert",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Age"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.onset[x]:onsetString",
        "path" : "AllergyIntolerance.onset[x]",
        "sliceName" : "onsetString",
        "short" : "Freitextinformation zum Beginn der Allergie/Unvertraeglichkeit",
        "comment" : "**Begründung MS:** Steht keine strukturierte Angabe zur Verfügung, verhindert eine Freitextbeschreibung des Beginns Informationsverlust.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.recordedDate",
        "path" : "AllergyIntolerance.recordedDate",
        "short" : "Datum an dem die Allergie/Unverträglichkeit aufgezeichnet wurde",
        "comment" : "**Begründung MS:** Der Dokumentationszeitpunkt ist wichtig für Verlauf, Audits und Suchfunktionen nach frisch erfassten Allergien.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.recorder",
        "path" : "AllergyIntolerance.recorder",
        "short" : "Person/Rolle, die die Information dokumentiert",
        "comment" : "**Begründung MS:** Die dokumentierende Person ermöglicht fachliche Rückfragen und unterstützt nachvollziehbare Verantwortungsketten.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.recorder.reference",
        "path" : "AllergyIntolerance.recorder.reference",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.recorder.display",
        "path" : "AllergyIntolerance.recorder.display",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.asserter",
        "path" : "AllergyIntolerance.asserter",
        "short" : "Person/Rolle, die die Allergie/Unverträglichkeit festgestellt hat",
        "comment" : "**Begründung MS:** Die feststellende Person oder Rolle macht die klinische Verantwortlichkeit transparent.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.asserter.reference",
        "path" : "AllergyIntolerance.asserter.reference",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.asserter.display",
        "path" : "AllergyIntolerance.asserter.display",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.note",
        "path" : "AllergyIntolerance.note",
        "short" : "Anmerkung",
        "comment" : "**Begründung MS:** Anmerkungen transportieren kontextuelle Details (z. B. individuelle Auslöser oder Maßnahmen), die in Codes nicht erfasst werden können.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.note.author[x]",
        "path" : "AllergyIntolerance.note.author[x]",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.org/fhir/StructureDefinition/Practitioner",
              "http://hl7.org/fhir/StructureDefinition/Patient",
              "http://hl7.org/fhir/StructureDefinition/RelatedPerson",
              "http://hl7.org/fhir/StructureDefinition/Organization"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.note.author[x].reference",
        "path" : "AllergyIntolerance.note.author[x].reference",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.note.author[x].display",
        "path" : "AllergyIntolerance.note.author[x].display",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.note.time",
        "path" : "AllergyIntolerance.note.time",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.note.text",
        "path" : "AllergyIntolerance.note.text",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction",
        "path" : "AllergyIntolerance.reaction",
        "short" : "Unerwünschte Reaktion",
        "comment" : "**Begründung MS:** Die beobachtete Reaktion ist für die klinische Bewertung der Gefährdung essenziell und Grundlage für Entscheidungshilfen.",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction.manifestation",
        "path" : "AllergyIntolerance.reaction.manifestation",
        "short" : "Manifestation der Reaktion",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction.manifestation.coding",
        "path" : "AllergyIntolerance.reaction.manifestation.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "system"
            }
          ],
          "rules" : "open"
        },
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction.manifestation.coding:snomed-ct",
        "path" : "AllergyIntolerance.reaction.manifestation.coding",
        "sliceName" : "snomed-ct",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Coding",
            "profile" : [
              "https://gematik.de/fhir/isik/StructureDefinition/ISiKSnomedCTCoding"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction.manifestation.text",
        "path" : "AllergyIntolerance.reaction.manifestation.text",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction.severity",
        "path" : "AllergyIntolerance.reaction.severity",
        "short" : "Schweregrad der Reaktion",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction.exposureRoute",
        "path" : "AllergyIntolerance.reaction.exposureRoute",
        "short" : "Expositionsweg",
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction.exposureRoute.coding",
        "path" : "AllergyIntolerance.reaction.exposureRoute.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "system"
            }
          ],
          "rules" : "open"
        },
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction.exposureRoute.coding:snomed-ct",
        "path" : "AllergyIntolerance.reaction.exposureRoute.coding",
        "sliceName" : "snomed-ct",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Coding",
            "profile" : [
              "https://gematik.de/fhir/isik/StructureDefinition/ISiKSnomedCTCoding"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "AllergyIntolerance.reaction.exposureRoute.text",
        "path" : "AllergyIntolerance.reaction.exposureRoute.text",
        "mustSupport" : true
      }
    ]
  }
}

```
