# Home - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Home**

## Home

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/test-termin-ig/ImplementationGuide/terminplanung.test.ig | *Version*:0.0.1 |
| Draft as of 2025-12-04 | *Computable Name*:TestImplementationGuide |

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/main-stufe-4/Material/images/Gematik_Logo_Flag.svg)

-------

Version: 5.1.0

Datum: 23.10.2025

Status: Aktiv

Realm: Deutschland

-------

# Motivation Terminplanung

Die Vereinbarung von Terminen für Behandlungsleistungen repräsentiert oftmals für Patienten oder für sie zuständige Leistungserbringer den Einstieg in den Versorgungsablauf im Krankenhaus. Die Terminplanung agiert somit als kritische Schnittstelle zwischen diversen Akteuren im Gesundheitswesen, inklusive der zu behandelnden Personen. Informationen zu notwendigen bzw. gewünschten Behandlungen, Verfügbarkeiten der involvierten Personen und abrechnungsrelevante Details zur Krankenversicherung müssen potenziell ausgetauscht werden, um einen optimierten Ablauf des Aufenthaltes im Krankenhaus zu ermöglichen.

Das Krankenhauszukunftsgesetz (KHZG) hebt die zentrale Rolle der Terminvereinbarung hervor in dem in den dazugehörigen Fördertatbeständen Vorgaben für die Terminplanung im digitalen Aufnahmemanagement bzw. für die Terminplanung mittels Patientenportalen gemacht werden (vgl. §19 Abs. 1 Satz 1 Nr. 2 KHSFV bzw. §21 Abs. 2 KHSFV).

Angelehnt an diese Vorgaben soll mittels ISiK die Grundlage geschaffen werden, um die beschriebenen oder ähnliche Use Cases durchzuführen und die fachlich-inhaltlichen Informationen in einer interoperablen Art und Weise auszutauschen. ISiK versteht sich somit als Schnittstellenbeschreibung, um eine einheitliche API zu dokumentieren, durch die ein Termin vereinbart und verwaltet werden kann. Das vorliegende ISiK-Modul bietet somit explizit KEIN umfassendes Datenmodell für die krankenhausinterne Ressourcenplanung. Hingegen werden durch ISiK Minimalvorgaben für bestätigungsrelevante Systeme spezifiziert, auf die komplexere Workflows ausgestaltet werden können.

Durch ISiK Terminplanung sollen folgende Möglichkeiten eröffnet werden:

* Abruf von Abbildungen von verfügbaren teil- und voll- stationären Behandlungsleistungen durch ein Krankenhaus
* Abfrage von Terminen und Verfügbarkeiten
* Buchungsmanagement von verfügbaren Terminen
* Benachrichtigungen bei Terminänderungen
* Anlage eines neuen Patienten im terminführenden System (Übermittlung Patient/Versicherungsinformationen)

# Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen, verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. Dieser FHIR ImplementationGuide (IG) beschreibt die für diesen Zweck entwickelten FHIR Profile und das [REST](https://de.wikipedia.org/wiki/Representational_State_Transfer)-basierte Application Programming Interface (API). Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html). Dieser Leitfaden konkretisiert die ISiK-relevanten Funktionen der Standard-REST-API und trifft inhaltliche Festlegungen zu den ISiK-relevanten Ressourcen in Form von Ressourcen-Profilen.

Hersteller bestätigungsrelevanter Systeme sollen durch diesen IG in die Lage versetzt werden, eine konforme Implementierung zu erstellen und das Bestätigungsverfahren der gematik erfolgreich zu absolvieren.

Weitere Informationen siehe [§373 SGB V](https://www.gesetze-im-internet.de/sgb_5/__373.html).

Hinweis: Sowohl für die Implementierung der ISiK-Spezifikation als auch für den Betrieb eines Produktes, das die ISiK-Spezifikation implementiert, ist eine SNOMED-CT-Lizenz notwendig. Diese kann beim [National Release Center für SNOMED CT in Deutschland](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) beantragt werden.

**Kontakt**

Bringen Sie allgemeine Fragen und Anmerkungen gerne über unser Anfrageportal ein: [Anfragen ISiK + ISiP](https://service.gematik.de/servicedesk/customer/portal/16)

Falls Sie keinen Zugang zum Anfrageportal haben und dieses nutzen wollen, senden Sie uns bitte eine Nachricht an die Adresse isik [ at ] gematik.de mit dem Betreff “Portalzugang”.

**Herausgeber**

gematik GmbH

[Impressum](https://www.gematik.de/impressum/)

**Gender-Hinweis**

Zugunsten des Leseflusses wird in dieser Publikation meist die männliche Form verwendet. Wir bitten, dies nicht als Zeichen einer geschlechtsspezifischen Wertung zu deuten. Diese Variante deckt auch alle weiteren Geschlechter, neben männlich und weiblich, ab.



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "terminplanung.test.ig",
  "url" : "http://example.org/fhir/test-termin-ig/ImplementationGuide/terminplanung.test.ig",
  "version" : "0.0.1",
  "name" : "TestImplementationGuide",
  "title" : "Test Implementation Guide",
  "status" : "draft",
  "date" : "2025-12-04T18:17:34+00:00",
  "description" : "A test implementation guide for validating the local FHIR IG Publisher environment",
  "packageId" : "example.test.ig",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [
    {
      "id" : "hl7tx",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
        }
      ],
      "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
      "packageId" : "hl7.terminology.r4",
      "version" : "7.0.0"
    },
    {
      "id" : "hl7ext",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
        }
      ],
      "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
      "packageId" : "hl7.fhir.uv.extensions.r4",
      "version" : "5.2.0"
    },
    {
      "id" : "hl7_fhir_uv_ips",
      "uri" : "http://hl7.org/fhir/uv/ips/ImplementationGuide/hl7.fhir.uv.ips",
      "packageId" : "hl7.fhir.uv.ips",
      "version" : "1.1.0"
    },
    {
      "id" : "de_basisprofil_r4",
      "uri" : "http://fhir.org/packages/de.basisprofil.r4/ImplementationGuide/de.basisprofil.r4",
      "packageId" : "de.basisprofil.r4",
      "version" : "1.5.4"
    },
    {
      "id" : "de_ihe_d_terminology",
      "uri" : "http://fhir.de/packages/de.ihe-d.terminology",
      "packageId" : "de.ihe-d.terminology",
      "version" : "3.0.1"
    },
    {
      "id" : "dvmd_kdl_r4",
      "uri" : "http://fhir.org/packages/dvmd.kdl.r4/ImplementationGuide/dvmd.kdl.r4",
      "packageId" : "dvmd.kdl.r4",
      "version" : "2025.0.1"
    },
    {
      "id" : "ihe_formatcode_fhir",
      "uri" : "https://profiles.ihe.net/fhir/ihe.formatcode.fhir/ImplementationGuide/ihe.formatcode.fhir",
      "packageId" : "ihe.formatcode.fhir",
      "version" : "1.4.0"
    },
    {
      "id" : "hl7_fhir_uv_sdc",
      "uri" : "http://hl7.org/fhir/uv/sdc/ImplementationGuide/hl7.fhir.uv.sdc",
      "packageId" : "hl7.fhir.uv.sdc",
      "version" : "3.0.0"
    },
    {
      "id" : "de_gematik_terminology",
      "uri" : "https://gematik.de/fhir/terminology/ImplementationGuide/de.gematik.terminology",
      "packageId" : "de.gematik.terminology",
      "version" : "1.0.6"
    }
  ],
  "definition" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "copyrightyear"
          },
          {
            "url" : "value",
            "valueString" : "2025+"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "releaselabel"
          },
          {
            "url" : "value",
            "valueString" : "STU1"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "no-validate"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "autoload-resources"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "template/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "input/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-qa"
          },
          {
            "url" : "value",
            "valueString" : "temp/qa"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-temp"
          },
          {
            "url" : "value",
            "valueString" : "temp/pages"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-output"
          },
          {
            "url" : "value",
            "valueString" : "output"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-suppressed-warnings"
          },
          {
            "url" : "value",
            "valueString" : "input/ignoreWarnings.txt"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-history"
          },
          {
            "url" : "value",
            "valueString" : "http://example.org/fhir/test-termin-ig/history.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "template-html"
          },
          {
            "url" : "value",
            "valueString" : "template-page.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "template-md"
          },
          {
            "url" : "value",
            "valueString" : "template-page-md.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-contact"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-context"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-copyright"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-jurisdiction"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-license"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-publisher"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-version"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-wg"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "active-tables"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "fmm-definition"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/versions.html#maturity"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "propagate-status"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "excludelogbinaryformat"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "tabbed-snapshots"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
        "valueCode" : "hl7.fhir.uv.tools.r4#0.8.0"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "copyrightyear"
          },
          {
            "url" : "value",
            "valueString" : "2025+"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "releaselabel"
          },
          {
            "url" : "value",
            "valueString" : "STU1"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "no-validate"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "autoload-resources"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "template/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "input/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-qa"
          },
          {
            "url" : "value",
            "valueString" : "temp/qa"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-temp"
          },
          {
            "url" : "value",
            "valueString" : "temp/pages"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-output"
          },
          {
            "url" : "value",
            "valueString" : "output"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-suppressed-warnings"
          },
          {
            "url" : "value",
            "valueString" : "input/ignoreWarnings.txt"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-history"
          },
          {
            "url" : "value",
            "valueString" : "http://example.org/fhir/test-termin-ig/history.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "template-html"
          },
          {
            "url" : "value",
            "valueString" : "template-page.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "template-md"
          },
          {
            "url" : "value",
            "valueString" : "template-page-md.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-contact"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-context"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-copyright"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-jurisdiction"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-license"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-publisher"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-version"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-wg"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "active-tables"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "fmm-definition"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/versions.html#maturity"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "propagate-status"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "excludelogbinaryformat"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "tabbed-snapshots"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      }
    ],
    "resource" : [
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Appointment"
          }
        ],
        "reference" : {
          "reference" : "Appointment/ISiKTerminExample"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Appointment"
          }
        ],
        "reference" : {
          "reference" : "Appointment/ISiKTerminExampleExtendedICU"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/ISiKCapabilityStatementStammdatenRolle"
        },
        "name" : "CapabilityStatement für Rolle &quot;StammdatenRolle&quot;",
        "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \n  \nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/ISiKCapabilityStatementTerminRepositoryAkteur-expanded"
        },
        "name" : "ISiK CapabilityStatement Termin-Repository Akteur (Expanded)",
        "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diesen Akteur implementiert.   \n\n  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.\nHierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. \nDer `MODE`-Parameter kann ignoriert werden.  \nDas CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten 'SHALL' (=MUSS)  'SHOULD' (=SOLL)  'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet.  \n\nEine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen \nund die Versionsnummer angeben.   \nDarüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden.\nDie mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per 'imports'). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.\n\nDas CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe 'imports') mit `SHALL` gekennzeichnet sind. \nDas CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, \nsofern diese in der Instanz implementiert wurden.  \n\nDie Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/ISiKCapabilityStatementTerminRepositoryAkteur"
        },
        "name" : "ISiK CapabilityStatement Termin-Repository Akteur",
        "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diesen Akteur implementiert.   \n\n  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.\nHierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. \nDer `MODE`-Parameter kann ignoriert werden.  \nDas CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten 'SHALL' (=MUSS)  'SHOULD' (=SOLL)  'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet.  \n\nEine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen \nund die Versionsnummer angeben.   \nDarüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden.\nDie mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per 'imports'). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.\n\nDas CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe 'imports') mit `SHALL` gekennzeichnet sind. \nDas CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, \nsofern diese in der Instanz implementiert wurden.  \n\nDie Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/ISiKCapabilityStatementTerminRepositoryRolle"
        },
        "name" : "ISiK CapabilityStatement Termin-Repository Rolle",
        "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \n  \nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/ISiKCapabilityStatementTerminologieRolle"
        },
        "name" : "CapabilityStatement für Rolle &quot;ISiKCapabilityStatementTerminologieRolle&quot;",
        "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \n  \nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/CodeSystemExample"
        },
        "name" : "TestKatalog"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/Fachabteilungskontakt"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/FachabteilungskontaktBettenverlegung"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/FachabteilungskontaktEntlassung"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/FachabteilungskontaktFachbereichswechsel1"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/FachabteilungskontaktFachbereichswechsel2"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/FachabteilungskontaktMinimal2"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/FachabteilungskontaktNormal"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/FachabteilungskontaktStationaereAufnahme"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/FachabteilungskontaktStationswechsel1"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/FachabteilungskontaktStationswechsel2"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/SZ1Nachstationaer"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/SZ1Stationaer"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/SZ1Vorstationaer"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/SZ2Encounter"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "HealthcareService"
          }
        ],
        "reference" : {
          "reference" : "HealthcareService/ISiKMedizinischeBehandlungseinheitExample"
        },
        "name" : "Allgemeine Beratungsstelle der Fachabteilung 0100"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "OperationDefinition"
          }
        ],
        "reference" : {
          "reference" : "OperationDefinition/ISiKAppointmentBookOperation"
        },
        "name" : "Book",
        "description" : "OperationDefinition für die Buchung eines Termins. Die Operation überprüft ob der Termin noch verfügbar ist im Termin-Repository."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/DorisQuelle"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/DorisZiel"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/PatientinMinimal"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/PatientinMusterfrau"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/PatientinNormal"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/SZ1Patient"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/SZ2Patient"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Schedule"
          }
        ],
        "reference" : {
          "reference" : "Schedule/ISiKKalenderExample"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "SearchParameter"
          }
        ],
        "reference" : {
          "reference" : "SearchParameter/Encounter-date-start"
        },
        "name" : "DateStart",
        "description" : "The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "SearchParameter"
          }
        ],
        "reference" : {
          "reference" : "SearchParameter/Encounter-end-date"
        },
        "name" : "EndDate",
        "description" : "The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Slot"
          }
        ],
        "reference" : {
          "reference" : "Slot/ISiKTerminblockExample"
        }
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation"
        },
        "name" : "ISiK CapabilityStatement Imports Expectation",
        "description" : "Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to *not* support a feature."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKCodeSystem"
        },
        "name" : "ISiKCodeSystem",
        "description" : "Dieses Profil beschreibt die maschinenlesbare Repräsentation von \nsystem-spezifischen Kodierungen in ISiK-Szenarien.  \n\n### Motivation\n\nISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte. \n\nEine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten.\n\nEin Codesystem eignet sich auch dazu, auf dessen Basis definierte [ValueSets zu expandieren](https://hl7.org/fhir/R4/valueset-operation-expand.html).\nDa ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich.\nDarüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKKalender"
        },
        "name" : "ISiKKalender",
        "description" : "Das Datenobjekt ISiKKalender bietet die Möglichkeit Kalender für verschiedene Akteure (Practitioner, Device, HealthcareService) zu exponieren, sodass für die Ressourcen Termine gebucht werden können."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKKontaktGesundheitseinrichtung"
        },
        "name" : "ISiKKontaktGesundheitseinrichtung",
        "description" : "Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung.\n### Motivation\nInformationen über die Besuche des Patienten entlang seines \nBehandlungspfades im Krankenhaus sind ein wichtiger Bestandteil \ndes einrichtungsinternen Datenaustausches. \nSie ermöglichen die Unterscheidung von stationären und ambulanten \nsowie aufgenommenen und entlassenen Patienten. \nWeiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort \ndes Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. \nKlinische Ressourcen werden in FHIR durch Verlinkung auf die \nEncounter-Ressource in einen Kontext zum Besuch gestellt. \nDieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen \nund Abrechnungsprozessen.  \n\nZu Beginn der meisten klinischen Workflows steht die Auswahl \ndes Besuchskontextes. \nDies geschieht bspw. durch das Suchen der Encounter-Ressource \nanhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. \nDaraufhin werden die zutreffenden Suchergebnisse angezeigt \nund der gewünschte Besuch ausgewählt.\n\nIn FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der `Encounter`-Ressource repräsentiert.\n\nWeitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter {{pagelink: Fall, text: Fall-Begriff in ISiK}}\n\n### Kompatibilität\nFür das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität \nmit folgenden Profilen angestrebt; \nallerdings kann nicht sichergestellt werden, dass Instanzen, \ndie gegen ISiKKontaktGesundheitseinrichtung valide sind, \nauch valide sind gegen:\n\n* Profil [Kontakt mit einer Gesundheitseinrichtung \nder Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKMedizinischeBehandlungseinheit"
        },
        "name" : "ISiKMedizinischeBehandlungseinheit",
        "description" : "Unter einer medizinischen Behandlungseinheit wird hier im weiteren Sinne eine Dienstleistung (diagnostisch, therapeutisch, im weiten Sinne gesundheitsfördernd etc.) zum Zweck einer Terminbuchung verstanden. Hierfür können von der Fachabteilung (Organization) unabhängige Kalender gepflegt werden. Im Kontext der Terminplanung können somit angebotene Leistungen (z.B. CT/MRT-Untersuchungen, chirurgische Eingriffe, Beratungsstunden zur Geburt etc.) abgebildet werden.\n\nDer Kontext zu diesem Profil wird mit folgender User Story veranschaulicht: \n\n**User Story**: Ein Patient erhält von seiner Hausärztin einen Überweisungsschein für eine weitere diagnostische Untersuchung in Form einer Kapselendoskopie der Speiseröhre. Der Patient nutzt ein Patientenportal, um unter Angabe der benötigten diagnostische Leistung nach einem verfügbaren Termin zu suchen und findet einen passenden Termin bei der Fachabteilung für Gastroenterologie eines örtlichen Krankenhauses.\n\nHintergrund: Die Suche nach verfügbaren Terminenblöcken (Slot) unter Einbeziehung der Dienstleistung entspricht der Angabe des Überweisungsscheins, ermöglicht hier zugleich eine präzisere Suche und vergrößert darüber hinaus den Raum möglicher Termine über verschiedene Abteilungen (und Institutionen im Patientenportal) hinweg."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKPatient"
        },
        "name" : "ISiKPatient",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik.\n### Motivation  \nDer Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung.  \nIn FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource 'Patient' in einen Patientenkontext gestellt.  \nDie Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, \ndie Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.  \n\n### Kompatibilität\nFür das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:\n\n* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)\n* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)\n* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)\n* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)\n\nEs ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:\n\n* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKTermin"
        },
        "name" : "ISiKTermin",
        "description" : "Das Datenobjekte ISiKTermin repräsentiert einen gebuchten Termin, sowie einen Terminvorschlag."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKTerminblock"
        },
        "name" : "ISiKTerminblock",
        "description" : "Die Slot-Ressource repräsentiert die Verbindung eines Termins (Appointment) und den dazugehörigen Ressourcen (z.B. HealthcareService, Device, Practitioner). Für diese Ressourcen können separate Kalender (Schedules) verwaltet werden. Der Slot agiert als Verbindungsstück zwischen diesen Ressourcen."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKValueSet"
        },
        "name" : "ISiKValueSet",
        "description" : "Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes \nfür die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien.\n### Motivation\n\nISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus- / System-interne Kodierungen.\nMittels der Veröffentlichung von ValueSets können Auswahllisten für externe Clients bereitgestellt werden, sodass diese entsprechende Kodierungen ebenfalls anbieten können.\n### Kompatibilität\n\nFür das Profil ISiKValueSet wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ISiKLocationPhysicalType"
        },
        "name" : "ISiKLocationPhysicalType"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ISiKTerminCancelationReason"
        },
        "name" : "ISiKTerminCancelationReason",
        "description" : "Enthaelt alle erlaubten Gruende fuer eine Stornierung eines ISiKTermins"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ISiKValueSetExample"
        },
        "name" : "TestValueSet"
      }
    ],
    "page" : {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "toc.html"
        }
      ],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "index.html"
            }
          ],
          "nameUrl" : "index.html",
          "title" : "Home",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "ReleaseNotes.html"
            }
          ],
          "nameUrl" : "ReleaseNotes.html",
          "title" : "Release Notes",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UseCases.html"
            }
          ],
          "nameUrl" : "UseCases.html",
          "title" : "UseCases",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Akteure.html"
            }
          ],
          "nameUrl" : "Akteure.html",
          "title" : "Akteure",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Interaktionen.html"
            }
          ],
          "nameUrl" : "Interaktionen.html",
          "title" : "Interaktionen",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Kompatibilitaet.html"
            }
          ],
          "nameUrl" : "Kompatibilitaet.html",
          "title" : "Kompatibilität",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Prozesse.html"
            }
          ],
          "nameUrl" : "Prozesse.html",
          "title" : "Prozesse",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Informationsmodell.html"
            }
          ],
          "nameUrl" : "Informationsmodell.html",
          "title" : "Informationsmodell",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Architekturoptionen.html"
            }
          ],
          "nameUrl" : "Architekturoptionen.html",
          "title" : "Architekturoptionen",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Festlegungen.html"
            }
          ],
          "nameUrl" : "Festlegungen.html",
          "title" : "Festlegungen",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UebergreifendeFestlegungen.html"
            }
          ],
          "nameUrl" : "UebergreifendeFestlegungen.html",
          "title" : "Übergreifende Festlegungen",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Operations.html"
            }
          ],
          "nameUrl" : "Operations.html",
          "title" : "Operation $book",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "artifacts.html"
            }
          ],
          "nameUrl" : "artifacts.html",
          "title" : "FHIR-Artefakte",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "profiles.html"
            }
          ],
          "nameUrl" : "profiles.html",
          "title" : "Profile",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "terminology.html"
            }
          ],
          "nameUrl" : "terminology.html",
          "title" : "Terminology",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "capabilitystatements.html"
            }
          ],
          "nameUrl" : "capabilitystatements.html",
          "title" : "Capability Statements",
          "generation" : "markdown"
        }
      ]
    },
    "parameter" : [
      {
        "code" : "path-resource",
        "value" : "input/capabilities"
      },
      {
        "code" : "path-resource",
        "value" : "input/examples"
      },
      {
        "code" : "path-resource",
        "value" : "input/extensions"
      },
      {
        "code" : "path-resource",
        "value" : "input/models"
      },
      {
        "code" : "path-resource",
        "value" : "input/operations"
      },
      {
        "code" : "path-resource",
        "value" : "input/profiles"
      },
      {
        "code" : "path-resource",
        "value" : "input/resources"
      },
      {
        "code" : "path-resource",
        "value" : "input/vocabulary"
      },
      {
        "code" : "path-resource",
        "value" : "input/maps"
      },
      {
        "code" : "path-resource",
        "value" : "input/testing"
      },
      {
        "code" : "path-resource",
        "value" : "input/history"
      },
      {
        "code" : "path-resource",
        "value" : "fsh-generated/resources"
      },
      {
        "code" : "path-pages",
        "value" : "template/config"
      },
      {
        "code" : "path-pages",
        "value" : "input/images"
      },
      {
        "code" : "path-tx-cache",
        "value" : "input-cache/txcache"
      }
    ]
  }
}

```
