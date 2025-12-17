# ISiKVersicherungsverhaeltnisSonstige - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKVersicherungsverhaeltnisSonstige**

## Resource Profile: ISiKVersicherungsverhaeltnisSonstige 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSonstige | *Version*:0.0.1 |
| Active as of 2025-12-11 | *Computable Name*:ISiKVersicherungsverhaeltnisSonstige |

 
Dieses Profil ermöglicht die Darstellung sonstiger Versicherungsverhältnisses in ISiK Szenarien. 

### Motivation

 
ISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden, bei denen es sich**weder**um gesetzliche Versicherungen noch Selbstzahlerverhältnisse handelt. In diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.
In FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert. 

### Kompatibilität

 
Das Profil ISiKVersicherungsverhaeltnisSonstige basiert auf dem[Basis-Coverage-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis). 
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. 

**Usages:**

* Examples for this Profile: [Coverage/CoverageSonstige](Coverage-CoverageSonstige.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) and [CapabilityStatement für Rolle "ISiKCapabilityStatementVersicherungsverhaeltnisRolle"](CapabilityStatement-ISiKCapabilityStatementVersicherungsverhaeltnisRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/Organspendeerkennung.test.ig|current/StructureDefinition/ISiKVersicherungsverhaeltnisSonstige)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKVersicherungsverhaeltnisSonstige.csv), [Excel](StructureDefinition-ISiKVersicherungsverhaeltnisSonstige.xlsx), [Schematron](StructureDefinition-ISiKVersicherungsverhaeltnisSonstige.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKVersicherungsverhaeltnisSonstige",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSonstige",
  "version" : "0.0.1",
  "name" : "ISiKVersicherungsverhaeltnisSonstige",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-11",
  "description" : "Dieses Profil ermöglicht die Darstellung sonstiger Versicherungsverhältnisses in ISiK Szenarien.  \n### Motivation\nISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden, \nbei denen es sich *weder* um gesetzliche Versicherungen noch Selbstzahlerverhältnisse handelt.\nIn diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.  \nIn FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKVersicherungsverhaeltnisSonstige basiert auf dem [Basis-Coverage-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis). \n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Coverage",
  "baseDefinition" : "http://fhir.de/StructureDefinition/coverage-de-basis",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Coverage",
        "path" : "Coverage"
      },
      {
        "id" : "Coverage.status",
        "path" : "Coverage.status",
        "short" : "Status",
        "comment" : "Zeigt den aktuellen Status der Ressource an.     \n  **WICHTIGER Hinweis für Implementierer:**    \n  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, \n  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch den Wert `active`.\n  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, \n  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben.",
        "mustSupport" : true
      },
      {
        "id" : "Coverage.type",
        "path" : "Coverage.type",
        "comment" : "\n  Die Angabe der Versicherungsart dient der Abgrenzung dieser Coverage-Ressource von Selbstzahler- oder gesetzlichen Versicherungsverhältnissen.  \n  **Begründung Pflichtfeld:** Die Angabe der Versicherungsart dient der Unterscheidung, wenn zu einem Patienten mehrere Coverage-Ressourcen hinterlegt sind, \n  z.B. gesetzliche Versicherung + Sonstige und als Suchkriterium, um gezielt nach der in einem konkreten Kontext relevanten Coverage suchen zu können.  \n  **Historie:**  \n  28.07.2017 (zulip): TC Konsens bzgl. Verwendung eines eigenen ValueSets anstelle des im Standard definierten preferred bindings, da die dortigen Codes nicht passen.",
        "mustSupport" : true
      },
      {
        "id" : "Coverage.beneficiary",
        "path" : "Coverage.beneficiary",
        "comment" : "Hier handelt es ich konkret um den Patienten, für den die Kostenübernahme gilt.",
        "mustSupport" : true
      },
      {
        "id" : "Coverage.beneficiary.reference",
        "path" : "Coverage.beneficiary.reference",
        "short" : "Patienten-Link",
        "comment" : "Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten \n    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Coverage.payor",
        "path" : "Coverage.payor",
        "short" : "Kostenträger",
        "comment" : "Ein sonstiger Kostenträger kann eine Person oder eine Organisation (z.B. Botschaft/Amt) sein.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.org/fhir/StructureDefinition/Patient",
              "http://hl7.org/fhir/StructureDefinition/RelatedPerson",
              "http://hl7.org/fhir/StructureDefinition/Organization"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Coverage.payor.display",
        "path" : "Coverage.payor.display",
        "short" : "Kostenträger-Bezeichnung",
        "comment" : "Name des Kostenträgers",
        "mustSupport" : true
      }
    ]
  }
}

```
