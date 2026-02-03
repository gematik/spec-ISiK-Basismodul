# ISiK Medikationsliste - ISiK Medikation Implementierungsleitfaden v6.0.0-rc

ISiK Medikation Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ISiK Medikationsliste**

## Resource Profile: ISiK Medikationsliste 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsListe | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKMedikationsListe |

 
Dieses Profil ermöglicht die Zusammenführung einzelner MedikationsInformationen eines Patienten in ISiK Szenarien. 
Die MedicationList verweist auf MedicationStatement-Ressourcen und bildet Medikationen ab, die aktuell eingenommen, im Krankenhaus verabreicht oder aus externen Quellen dokumentiert wurden - etwa durch Patientenangaben, Medikationspläne oder Entlassbriefe. Im Unterschied zum eMP der ePA ist die ISiK-MedikationsListe dynamisch generierbar und systemseitig aktualisierbar. Sie kann auch Informationen enthalten, die außerhalb des eigenen Hauses erfasst wurden – sofern diese dem System strukturiert vorliegen (z.B. durch eMP-Import). Ein Import aus dem eMP ist möglich, aber nicht verpflichtend. 

**Usages:**

* Examples for this Profile: [List/ExampleISiKMedikationsListe](List-ExampleISiKMedikationsListe.md) and [List/ExampleISiKMedikationsListeParkinson](List-ExampleISiKMedikationsListeParkinson.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Medikationsinformation Server Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementMedikationInformationAkteur-expanded.md) and [ISiK CapabilityStatement Medikation Server - Medikationsinformation](CapabilityStatement-ISiKCapabilityStatementMedikationInformationRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/medikation|current/StructureDefinition/ISiKMedikationsListe)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKMedikationsListe.csv), [Excel](StructureDefinition-ISiKMedikationsListe.xlsx), [Schematron](StructureDefinition-ISiKMedikationsListe.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKMedikationsListe",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsListe",
  "version" : "6.0.0-rc",
  "name" : "ISiKMedikationsListe",
  "title" : "ISiK Medikationsliste",
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
  "description" : "Dieses Profil ermöglicht die Zusammenführung einzelner MedikationsInformationen eines Patienten in ISiK Szenarien.\n\nDie MedicationList verweist auf MedicationStatement-Ressourcen und bildet Medikationen ab, die aktuell eingenommen, im Krankenhaus verabreicht oder aus externen Quellen dokumentiert wurden - etwa durch Patientenangaben, Medikationspläne oder Entlassbriefe.\nIm Unterschied zum eMP der ePA ist die ISiK-MedikationsListe dynamisch generierbar und systemseitig aktualisierbar. Sie kann auch Informationen enthalten, die außerhalb des eigenen Hauses erfasst wurden – sofern diese dem System strukturiert vorliegen (z.B. durch eMP-Import).\nEin Import aus dem eMP ist möglich, aber nicht verpflichtend.",
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "List",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/List",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "List",
        "path" : "List"
      },
      {
        "id" : "List.id",
        "path" : "List.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "List.meta.versionId",
        "path" : "List.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "List.meta.lastUpdated",
        "path" : "List.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "List.status",
        "path" : "List.status",
        "short" : "(Aktualitäts-)Status der Liste",
        "comment" : "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard",
        "mustSupport" : true
      },
      {
        "id" : "List.mode",
        "path" : "List.mode",
        "short" : "Listenmodus",
        "comment" : "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard\n\n  Beispiel: eingelesene Medikationspläne werden als snapshot repräsentiert. Kontinuierlich fortgeschriebene Listen, z.B. im Rahmen der hausinternen Behandlung, sind als 'working' codiert.",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/MedikationsListeListModeVS"
        }
      },
      {
        "id" : "List.code",
        "path" : "List.code",
        "short" : "Art der Liste.",
        "comment" : "Begründung des Must-Support: Dient der Differenzierung zu anderen Listen.\n\n  Hinweis: Es ist mindestens ein Coding mit dem Code 'medications' anzugeben. Weitere Codes, z.B. im Kontext anderer Spezifikationen oder Hauscodierungen sind zulässig.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "List.code.coding",
        "path" : "List.code.coding",
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
        "id" : "List.code.coding:medications",
        "path" : "List.code.coding",
        "sliceName" : "medications",
        "min" : 1,
        "max" : "*",
        "patternCoding" : {
          "system" : "http://terminology.hl7.org/CodeSystem/list-example-use-codes",
          "code" : "medications"
        },
        "mustSupport" : true
      },
      {
        "id" : "List.code.coding:medications.system",
        "path" : "List.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "List.code.coding:medications.code",
        "path" : "List.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "List.code.coding:medications.display",
        "path" : "List.code.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "List.subject",
        "path" : "List.subject",
        "short" : "Referenz auf den Patienten",
        "comment" : "Begründung des Must-Support: Basisinformation",
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
        "id" : "List.subject.reference",
        "path" : "List.subject.reference",
        "short" : "Patienten-Link",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "List.encounter",
        "path" : "List.encounter",
        "short" : "Referenz auf den Abteilungskontakt",
        "comment" : "Begründung des Must-Support: Basisinformation im Krankenhaus-Kontext",
        "mustSupport" : true
      },
      {
        "id" : "List.encounter.reference",
        "path" : "List.encounter.reference",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "List.date",
        "path" : "List.date",
        "short" : "Erstellungsdatum der Liste",
        "comment" : "Begründung des Must-Support: Basisinformation",
        "mustSupport" : true
      },
      {
        "id" : "List.entry",
        "path" : "List.entry",
        "short" : "Listeneintrag",
        "comment" : "Begründung des Must-Support: Abbildung einzelner MedikationsInformationen in der Liste",
        "mustSupport" : true
      },
      {
        "id" : "List.entry.date",
        "path" : "List.entry.date",
        "short" : "Datum des Listeneintrags",
        "comment" : "Begründung des Must-Support: Nachvollziehbarkeit\n\n    Hinweis: nur zulässig im Listenmodus 'working'",
        "mustSupport" : true
      },
      {
        "id" : "List.entry.item",
        "path" : "List.entry.item",
        "short" : "Referenz auf die MedikationsInformation",
        "comment" : "Begründung des Must-Support: Basisinformation (eigentlicher Zweck der Liste ist das Verbinden mehrerer MedikationsInformationen)",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.org/fhir/StructureDefinition/MedicationStatement"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "List.entry.item.reference",
        "path" : "List.entry.item.reference",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
