# ISiKAngehoeriger - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKAngehoeriger**

## Resource Profile: ISiKAngehoeriger 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKAngehoeriger |

 
Dieses Profil ermöglicht die Darstellung von Angehörigen in ISiK Szenarien. 

### Motivation

 
Der Angehörige wird vor allem im Zusammenhang mit Anwendungsszenarien verwendet, in denen das Versicherungsverhältnis eine Rolle spielt. Hier können Angehörige, bspw. der hauptversicherte Elternteil eines minderjährigen Kindes, in der Familienversicherung sein. In Selbstzahler-Szenarien können Angehörige die Zahler für eine im Krankenhaus erbrachte Leistung sein. In FHIR werden Angehörige von Patienten mit der RelatedPerson-Ressource repräsentiert. 

### Kompatibilität

 
Für das Profil ISiKAngehoeriger wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt. 
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. 

**Usages:**

* Examples for this Profile: [RelatedPerson/ISiKAngehoerigerMustermann](RelatedPerson-ISiKAngehoerigerMustermann.md) and [RelatedPerson/SZ1Mutter](RelatedPerson-SZ1Mutter.md)
* CapabilityStatements using this Profile: [Akteur ISiKCapabilityStatementBasisServerAkteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) and [CapabilityStatement für Rolle ISiKCapabilityStatementVersicherungsverhaeltnisRolle](CapabilityStatement-ISiKCapabilityStatementVersicherungsverhaeltnisRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/basis|current/StructureDefinition/ISiKAngehoeriger)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKAngehoeriger.csv), [Excel](StructureDefinition-ISiKAngehoeriger.xlsx), [Schematron](StructureDefinition-ISiKAngehoeriger.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKAngehoeriger",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger",
  "version" : "6.0.0-rc",
  "name" : "ISiKAngehoeriger",
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
  "description" : "Dieses Profil ermöglicht die Darstellung von Angehörigen in ISiK Szenarien.  \n### Motivation\nDer Angehörige wird vor allem im Zusammenhang mit Anwendungsszenarien verwendet,\n in denen das Versicherungsverhältnis eine Rolle spielt. \n Hier können Angehörige, bspw. der hauptversicherte Elternteil \n eines minderjährigen Kindes, in der Familienversicherung sein. \n In Selbstzahler-Szenarien können Angehörige die Zahler für eine \n im Krankenhaus erbrachte Leistung sein.\nIn FHIR werden Angehörige von Patienten mit der RelatedPerson-Ressource repräsentiert.\n\n### Kompatibilität\nFür das Profil ISiKAngehoeriger wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.",
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
  "type" : "RelatedPerson",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/RelatedPerson",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "RelatedPerson",
        "path" : "RelatedPerson",
        "constraint" : [
          {
            "key" : "relatedp-de-1",
            "severity" : "error",
            "human" : "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden",
            "expression" : "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
          }
        ]
      },
      {
        "id" : "RelatedPerson.id",
        "path" : "RelatedPerson.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.meta.versionId",
        "path" : "RelatedPerson.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "RelatedPerson.meta.lastUpdated",
        "path" : "RelatedPerson.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "RelatedPerson.active",
        "path" : "RelatedPerson.active",
        "short" : "Status des Datensatzes",
        "comment" : "**Einschränkung der übergreifenden MS-Definition:** Die Implementierung dieses Elements ist für Server optional. Die Kennzeichnung als Must-Support erfolgt, da es sich um ein als Modifier-Element markiertes Feld in der Kernspezifikation handelt. \n\n  **Hinweis zur Verwendung:**\n  * `true` = Der Datensatz befindet sich in Verwendung/kann verwendet werden  \n  * `false`= Der Datensatz wurde storniert (z.B. bei Dubletten, Merge) oder archiviert  \n  \n    **WICHTIGER Hinweis für Implementierer:**  \n    * Alle server-seitigen Implementierungen SOLLEN in der Lage sein, die systemintern möglichen Statuswerte korrekt in FHIR abzubilden.\n    * Alle client-seitigen Implementierungen SOLLEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können.",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.patient",
        "path" : "RelatedPerson.patient",
        "short" : "Patientenbezug",
        "comment" : "Motivation Kardinalität und Must-Support: Referenz auf den Patienten, zu dem diese angehörige Person in Beziehung steht. Diese Verlinkung ist essentiell für die Dokumentation der Beziehung zwischen Patient und Angehörigem.",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.patient.reference",
        "path" : "RelatedPerson.patient.reference",
        "short" : "Patienten-Link",
        "comment" : "**Begründung Pflichtfeld:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.relationship",
        "path" : "RelatedPerson.relationship",
        "short" : "Verwandtschaftsverhältnis",
        "comment" : "**Begründung MS:** Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.name",
        "path" : "RelatedPerson.name",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Offizieller Name der angehörigen Person",
        "comment" : "Aufgrund der primären Nutzung von Angehörigen-Informationen im ISiK-Kontext als Brief- und Rechnungsempfänger, \n  ist die Angabe des offiziellen Namens relevant.\n  Wenn kein Name vorliegt, MUSS die [data-absent-reason-Extension](https://www.hl7.org/fhir/R4/extension-data-absent-reason.html) eingesetzt werden.   \n  **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-Patient?version=current#ig-markdown-Ressourcen-Patient-Name)",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.name:Name",
        "path" : "RelatedPerson.name",
        "sliceName" : "Name",
        "short" : "Slice für den offiziellen Namen der angehörigen Person",
        "comment" : "Basierend auf dem Pattern .use = official wird dieser Slice gewählt.\n  **Begründung MS:** Siehe untergeordnete Elemente",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "HumanName",
            "profile" : ["http://fhir.de/StructureDefinition/humanname-de-basis"]
          }
        ],
        "patternHumanName" : {
          "use" : "official"
        },
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.name:Name.use",
        "path" : "RelatedPerson.name.use",
        "short" : "Verwendungszweck",
        "comment" : "Verwendungszweck des Namens. Der präferierte Namen für die Brief- und Rechnungszustellung SOLLTE als `official`\n    gekennzeichnet werden und mindestens über einen Vor- und Nachnamen verfügen.    \n    **Begründung MS:** Dient als Unterscheidungs- und Auswahlkriterium",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.name:Name.family",
        "path" : "RelatedPerson.name.family",
        "short" : "Nachname",
        "comment" : "Vollständiger Nachname bzw. Familienname der Person, einschließlich Vor- und Zusätze.  \n      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind.",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.name:Name.given",
        "path" : "RelatedPerson.name.given",
        "comment" : "Kann mehrfach verwendet werden, um den Rufnamen sowie weitere Vornamen, Mittelnamen oder Mittel-Initialen abzubilden.\n      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind.",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.name:Name.prefix",
        "path" : "RelatedPerson.name.prefix",
        "short" : "Präfix",
        "comment" : "Präfix, z.B. akademischer Titel od. militärischer Rang",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.telecom",
        "path" : "RelatedPerson.telecom",
        "short" : "Telekommunikationsverbindung",
        "comment" : "Telekommunikationsverbindung (z.B. Telefonnummer, eMail-Adresse)  \n  **Begründung MS:** Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.telecom.system",
        "path" : "RelatedPerson.telecom.system",
        "short" : "Art der Telekommunikationsverbindung",
        "comment" : "**Begründung Pflichtfeld:** Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.telecom.value",
        "path" : "RelatedPerson.telecom.value",
        "short" : "Telekommunikations-Endpunkt",
        "comment" : "**Begründung Pflichtfeld:** Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address",
        "path" : "RelatedPerson.address",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Offizielle Adresse der angehörigen Person",
        "comment" : "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification.",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift",
        "path" : "RelatedPerson.address",
        "sliceName" : "Strassenanschrift",
        "short" : "Straßenanschrift",
        "comment" : "Wohn- oder Aufenthaltsort des Angehörigen",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Address",
            "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
          }
        ],
        "patternAddress" : {
          "type" : "both"
        },
        "constraint" : [
          {
            "key" : "address-cnt-2or3-char",
            "severity" : "warning",
            "human" : "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2.",
            "expression" : "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.extension:Stadtteil",
        "path" : "RelatedPerson.address.extension",
        "sliceName" : "Stadtteil",
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.type",
        "path" : "RelatedPerson.address.type",
        "short" : "Adresstyp",
        "comment" : "Hier ist stets der Wert `both` anzugeben.  \n    **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.line",
        "path" : "RelatedPerson.address.line",
        "short" : "Adresszeile",
        "comment" : "Diese Komponente kann Straßennamen, Hausnummer, Appartmentnummer, c/o \n    sowie weitere Zustellungshinweise enthalten. \n    Die Informationen können in mehrere line-Komponenten aufgeteilt werden. \n    Bei Verwendung der Extensions, um Straße, Hausnnummer und Postleitzahl strukturiert zu übermitteln, \n    müssen diese Informationen stets vollständig auch in der line-Komponente, \n    die sie erweitern, enthalten sein, um es Systemen, die diese Extensions nicht verwenden zu ermöglichen, \n    auf diese Informationen zugreifen zu können.  \n    **Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.  \n    **Begründung für Reduktion der max. Kardinalität:** Die maximale Kardinalität wurde in Übereinstimmung mit der \n    DIN-Norm 5008 (Schreib- und Gestaltungsregeln für die Text- und Informationsverarbeitung) auf 3 beschränkt.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.line.extension:Strasse",
        "path" : "RelatedPerson.address.line.extension",
        "sliceName" : "Strasse",
        "short" : "Strassenname",
        "comment" : "Strassenname (ohne Hausnummer).\n        Bei Angabe einer Strasse in dieser Extension muss diese auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.line.extension:Hausnummer",
        "path" : "RelatedPerson.address.line.extension",
        "sliceName" : "Hausnummer",
        "comment" : "Hausnummer, sowie Zusätze (Appartmentnummer, Etage...). \n        Bei Angabe einer Hausnummer in dieser Extension muss diese auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.   \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.line.extension:Adresszusatz",
        "path" : "RelatedPerson.address.line.extension",
        "sliceName" : "Adresszusatz",
        "comment" : "Zusätzliche Informationen, wie z.B. '3. Etage', 'Appartment C'.\n        Bei Angabe einer Zusatzinformation in dieser Extension muss diese auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.line.extension:Postfach",
        "path" : "RelatedPerson.address.line.extension",
        "sliceName" : "Postfach",
        "short" : "Postfachnummer",
        "comment" : "Postfach-Adresse. Bei Angabe eines Postfaches in dieser Extension muss das Postfach auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden. \n        Eine Postfach-Adresse darf nicht in Verbindung mit Address.type `physical` oder `both` verwendet werden.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "max" : "0"
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.city",
        "path" : "RelatedPerson.address.city",
        "short" : "Stadt",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.postalCode",
        "path" : "RelatedPerson.address.postalCode",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Strassenanschrift.country",
        "path" : "RelatedPerson.address.country",
        "short" : "Land",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Postfach",
        "path" : "RelatedPerson.address",
        "sliceName" : "Postfach",
        "short" : "Postfachadresse",
        "comment" : "Adresse, die nur für postalische Zustellung genutzt werden kann.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Address",
            "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
          }
        ],
        "patternAddress" : {
          "type" : "postal"
        },
        "constraint" : [
          {
            "key" : "address-cnt-2or3-char",
            "severity" : "warning",
            "human" : "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2.",
            "expression" : "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Postfach.type",
        "path" : "RelatedPerson.address.type",
        "short" : "Adresstyp",
        "comment" : "Hier ist stets der Wert `postal` anzugeben.  \n    **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Postfach.line",
        "path" : "RelatedPerson.address.line",
        "short" : "Adresszeile",
        "comment" : "Diese Komponente enthält die Postfachadresse als String der Form 'Postfach: 12345'.\n    Bei Verwendung der Postfach-Extension, um die Postfachnummer strukturiert zu übermitteln, \n    müssen diese Informationen stets vollständig auch in der line-Komponente, \n    die sie erweitern, enthalten sein, um es Systemen, die diese Extensions nicht verwenden zu ermöglichen, \n    auf diese Informationen zugreifen zu können.  \n    **Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.  \n    **Begründung für Reduktion der max. Kardinalität:** Die maximale Kardinalität wurde in Übereinstimmung mit der \n    DIN-Norm 5008 (Schreib- und Gestaltungsregeln für die Text- und Informationsverarbeitung) auf 3 beschränkt.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Postfach.line.extension:Strasse",
        "path" : "RelatedPerson.address.line.extension",
        "sliceName" : "Strasse",
        "max" : "0"
      },
      {
        "id" : "RelatedPerson.address:Postfach.line.extension:Hausnummer",
        "path" : "RelatedPerson.address.line.extension",
        "sliceName" : "Hausnummer",
        "max" : "0"
      },
      {
        "id" : "RelatedPerson.address:Postfach.line.extension:Adresszusatz",
        "path" : "RelatedPerson.address.line.extension",
        "sliceName" : "Adresszusatz",
        "max" : "0"
      },
      {
        "id" : "RelatedPerson.address:Postfach.line.extension:Postfach",
        "path" : "RelatedPerson.address.line.extension",
        "sliceName" : "Postfach",
        "short" : "Postfachnummer",
        "comment" : "Postfach-Adresse. Bei Angabe eines Postfaches in dieser Extension muss das Postfach auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden. \n        Eine Postfach-Adresse darf nicht in Verbindung mit Address.type `physical` oder `both` verwendet werden.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
      },
      {
        "id" : "RelatedPerson.address:Postfach.city",
        "path" : "RelatedPerson.address.city",
        "short" : "Stadt",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Postfach.postalCode",
        "path" : "RelatedPerson.address.postalCode",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "RelatedPerson.address:Postfach.country",
        "path" : "RelatedPerson.address.country",
        "short" : "Land",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
