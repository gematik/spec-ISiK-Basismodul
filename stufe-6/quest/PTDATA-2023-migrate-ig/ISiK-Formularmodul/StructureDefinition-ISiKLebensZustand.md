# ISiKLebensZustand - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKLebensZustand**

## Resource Profile: ISiKLebensZustand ( Abstract ) 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKLebensZustand | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKLebensZustand |

 
Basisprofil für ISiKLebensZustand Observation 

### Motivation

 
Viele medizinischen Entscheidungen benötigen Informationen zu den Lebensumständen eines Patienten. Hierzu gehören eine aktuelle Schwangerschaft, Raucherstatus sowie der Alkoholabususstatus. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS). 
In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. 
Dieses Profil ist eine generische, ISiK-spezifische Observation für die Abbildung von Lebenszuständen.
 Die folgenden Profile vom Typ `Observation` sind spezifische Profile im oben genannten Sinn: 
* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus
* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin
* https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus
* https://gematik.de/fhir/isik/StructureDefinition/ISiKAlkoholAbusus
* https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus
 

### Kompatibilität

 
Für Schwangerschaftsstatus & Erwarteter Geburtstermin wird eine Kompatibilität mit folgenden **IPS** Profilen angestrebt: 
* [IPS Resource Profile: Observation - Pregnancy: EDD](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-edd-uv-ips.html).
* [IPS Resource Profile: Observation - Pregnancy: status](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-status-uv-ips.html)
 
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. 

**Usages:**

* Derived from this Profile: [ISiK Alkohol Abusus](StructureDefinition-ISiKAlkoholAbusus.md), [ISiK Raucherstatus](StructureDefinition-ISiKRaucherStatus.md), [ISiK Schwangerschaft - Erwarteter Entbindungstermin](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.md), [ISiK Schwangerschaftsstatus](StructureDefinition-ISiKSchwangerschaftsstatus.md) and [ISiKStillstatus](StructureDefinition-ISiKStillstatus.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur-expanded.md) and [CapabilityStatement für Rolle ISiKCapabilityStatementGesundheitsstatusRolle](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/ISiKLebensZustand)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKLebensZustand.csv), [Excel](StructureDefinition-ISiKLebensZustand.xlsx), [Schematron](StructureDefinition-ISiKLebensZustand.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKLebensZustand",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLebensZustand",
  "version" : "6.0.0-rc",
  "name" : "ISiKLebensZustand",
  "title" : "ISiKLebensZustand",
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
  "description" : "Basisprofil für ISiKLebensZustand Observation \n\n### Motivation\n\nViele medizinischen Entscheidungen benötigen Informationen zu den Lebensumständen eines Patienten. Hierzu gehören eine aktuelle Schwangerschaft, Raucherstatus sowie der Alkoholabususstatus.\nMotivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).\n\nIn FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert.\n\nDieses Profil ist eine generische, ISiK-spezifische Observation für die Abbildung von Lebenszuständen.  \nDie folgenden Profile vom Typ `Observation` sind spezifische Profile im oben genannten Sinn:  \n* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus\n* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin\n* https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus\n* https://gematik.de/fhir/isik/StructureDefinition/ISiKAlkoholAbusus\n* https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus\n\n### Kompatibilität\n\nFür Schwangerschaftsstatus & Erwarteter Geburtstermin wird eine Kompatibilität mit folgenden **IPS** Profilen angestrebt:\n* [IPS Resource Profile: Observation - Pregnancy: EDD](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-edd-uv-ips.html). \n* [IPS Resource Profile: Observation - Pregnancy: status](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-status-uv-ips.html)\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.",
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
  "abstract" : true,
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
        "id" : "Observation.status",
        "path" : "Observation.status",
        "short" : "Status",
        "comment" : "Bedeutung: Der Status MUSS insbesondere zur Differenzierung von abgeschlossenen, \n  vorläufigen oder korrigierten Beobachtungen angegeben werden.   \n  **WICHTIGER Hinweis für Implementierer:**    \n  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, \n  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch 'final'.\n  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, \n  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.category",
        "path" : "Observation.category",
        "short" : "Kategorie",
        "comment" : "Bedeutung: Kategorie-Code, der die Untersuchung kategorisiert.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
        "short" : "Code",
        "comment" : "Bedeutung: Code, der die Untersuchung repräsentiert und kodiert.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "system"
            }
          ],
          "rules" : "open"
        },
        "comment" : "Motivation: Jede Lebenszustanduntersuchung MUSS einen LOINC Code enthalten, SnomedCT ist optional",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:snomed-ct",
        "path" : "Observation.code.coding",
        "sliceName" : "snomed-ct",
        "min" : 0,
        "max" : "*",
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
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "min" : 1,
        "max" : "*",
        "type" : [
          {
            "code" : "Coding",
            "profile" : [
              "https://gematik.de/fhir/isik/StructureDefinition/ISiKLoincCoding"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.subject",
        "path" : "Observation.subject",
        "short" : "Patientenbezug",
        "comment" : "**Begründung Must-Support:** Ein Patientenbezug der Beobachtung MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.subject.reference",
        "path" : "Observation.subject.reference",
        "short" : "Patienten-Link",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.encounter",
        "path" : "Observation.encounter",
        "short" : "Aufenthaltsbezug",
        "comment" : "**Begründung Must-Support:** Ein Aufenthaltsbezug der Beobachtung MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.encounter.reference",
        "path" : "Observation.encounter.reference",
        "short" : "Encounter-Link",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.effective[x]",
        "path" : "Observation.effective[x]",
        "short" : "Zeitpunkt/-raum der Beobachtung",
        "comment" : "Bedeutung: Klinisch relevanter Zeitpunkt/Zeitspanne für die Observation.",
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
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
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
        "short" : "Wert der Beobachtung",
        "comment" : "**Begründung Must-Support:** Erfasster Wert der Observation.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueDateTime",
        "path" : "Observation.value[x]",
        "sliceName" : "valueDateTime",
        "comment" : "**Begründung Must-Support:** Zeitpunktbezogene Lebenszustände (z. B. erwarteter Entbindungstermin) benötigen eine eindeutige Datumsangabe als Wert.",
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
        "id" : "Observation.value[x]:valueCodeableConcept",
        "path" : "Observation.value[x]",
        "sliceName" : "valueCodeableConcept",
        "comment" : "**Begründung Must-Support:** Viele Lebenszustände (z. B. Schwangerschaftsstatus, Alkoholabusus, Raucherstatus) werden als kategorisierte Angaben kodiert und erfordern daher ein CodeableConcept.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.hasMember",
        "path" : "Observation.hasMember",
        "comment" : "Bedeutung: Weitere Observation, die mit dieser Observation gemeinsam zu betrachten ist."
      },
      {
        "id" : "Observation.component",
        "path" : "Observation.component",
        "comment" : "Bedeutung: Bei Vitalparametern, die aus mehreren Einzelnen Messpunkten bestehen (Blutdruck, EKG, GCS), werden die gemessenen Einzelwerte jeweils mit einem separaten LOINC-Code in Observation.component.code versehen und der entsprechende Messwert in Observation.component.value erfasst."
      }
    ]
  }
}

```
