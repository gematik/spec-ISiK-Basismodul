# ISiKTerminblock - ISiK Terminplanung Implementierungsleitfaden v6.0.0-rc

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKTerminblock**

## Resource Profile: ISiKTerminblock 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminblock | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKTerminblock |

 
Die Slot-Ressource repräsentiert die Verbindung eines Termins (Appointment) und den dazugehörigen Ressourcen (z.B. HealthcareService, Device, Practitioner). Für diese Ressourcen können separate Kalender (Schedules) verwaltet werden. Der Slot agiert als Verbindungsstück zwischen diesen Ressourcen. 

**Usages:**

* Examples for this Profile: [Slot/ISiKTerminblockExample](Slot-ISiKTerminblockExample.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Termin-Repository Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.md) and [ISiK CapabilityStatement Termin-Repository Rolle](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/terminplanung|current/StructureDefinition/ISiKTerminblock)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKTerminblock.csv), [Excel](StructureDefinition-ISiKTerminblock.xlsx), [Schematron](StructureDefinition-ISiKTerminblock.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKTerminblock",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminblock",
  "version" : "6.0.0-rc",
  "name" : "ISiKTerminblock",
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
  "description" : "Die Slot-Ressource repräsentiert die Verbindung eines Termins (Appointment) und den dazugehörigen Ressourcen (z.B. HealthcareService, Device, Practitioner). Für diese Ressourcen können separate Kalender (Schedules) verwaltet werden. Der Slot agiert als Verbindungsstück zwischen diesen Ressourcen.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "ical",
      "uri" : "http://ietf.org/rfc/2445",
      "name" : "iCalendar"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Slot",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Slot",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Slot",
        "path" : "Slot",
        "constraint" : [
          {
            "key" : "ISiK-slot-1",
            "severity" : "error",
            "human" : "Der Endzeitpunkt eines Terminsblocks MUSS nach dem Startzeitpunkt liegen",
            "expression" : "start <= end",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminblock"
          }
        ]
      },
      {
        "id" : "Slot.id",
        "path" : "Slot.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "Slot.meta.versionId",
        "path" : "Slot.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "Slot.meta.lastUpdated",
        "path" : "Slot.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "Slot.schedule",
        "path" : "Slot.schedule",
        "short" : "Der Kalender dem dieser Terminblock zugeordnet ist",
        "comment" : "Begründung Kardinalität und MS: Die Kardinalität der reference-Eigenschaft wird auf 1..* festgelegt, um sicherzustellen, dass ein Kalender eindeutig referenziert und identifiziert werden kann.",
        "mustSupport" : true
      },
      {
        "id" : "Slot.schedule.reference",
        "path" : "Slot.schedule.reference",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Slot.status",
        "path" : "Slot.status",
        "short" : "Der Status des Terminblocks",
        "comment" : "Begründung Must Support: Dies ist wichtig, um die Verfügbarkeit von Terminen zu gewährleisten, eine Überbuchung zu verhindern und zudem einem Termin-Requestor die Möglichkeit zu bieten nur freie Termine bei der Terminbuchung anzuzeigen.",
        "mustSupport" : true
      },
      {
        "id" : "Slot.start",
        "path" : "Slot.start",
        "short" : "Der Startzeitpunkt des Terminblocks",
        "comment" : "Begründung Must Support: Dies ist wichtig, um den Zeitpunkt des Termins an einen Termin-Requestor / Termin-Consumer zu kommunizieren.",
        "mustSupport" : true
      },
      {
        "id" : "Slot.end",
        "path" : "Slot.end",
        "short" : "Der Endzeitpunkt des Terminblocks",
        "comment" : "Begründung Must Support: Dies ist wichtig, um die Länge des Termins an einen Termin-Requestor / Termin-Consumer zu kommunizieren.",
        "mustSupport" : true
      }
    ]
  }
}

```
