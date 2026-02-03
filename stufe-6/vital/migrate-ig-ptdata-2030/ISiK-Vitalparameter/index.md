# Einführung - ISiK Vitalparameter Implementierungsleitfaden v6.0.0-rc

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0-rc - 6.0.0-rc 

* [**Table of Contents**](toc.md)
* **Einführung**

## Einführung

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ImplementationGuide/vitalparameter | *Version*:6.0.0-rc |
| Draft as of 2026-02-03 | *Computable Name*:ISiKVitalparameterImplementationGuide |

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/main-stufe-3/Material/images/Gematik_Logo_Flag.svg)

-------

Version: 5.1.1

Datum: 17.12.2025

Status: Aktiv

Realm: Deutschland

-------

# Motivation - ISiK Vitalparameter

Die Erhebung und Verarbeitung von Vitalparametern und Körpermaßen ist ein essentieller Bestandteil der medizinischen Versorgung und spielt insbesondere in Krankenhäusern eine wichtige Rolle. Durch Vitalparameter wird eine initiale Einschätzung der Gesundheit von Patienten ermöglicht und sie enthalten wichtige Hinweise auf potenzielle Krankheitsbilder. Vitalparameter können als begleitende Informationen bei der Anforderung von Untersuchungen oder der Verordnung von Medikamenten verwendet werden. Auch während der Genesung können Vitalparameter wichtige Anhaltspunkte bezüglich des Fortschritts geben. Durch die weite Verbreitung von Wearables haben Patienten heutzutage zusätzlich die Möglichkeit, ihre Vitalparameter tagesaktuell zu teilen.

Um Vitalparameter und Körpermaße in verschiedenen Systemen verwenden zu können, müssen diese einheitlich und interoperabel zur Verfügung gestellt werden. Derzeit herrscht in Krankenhäusern ein reaktiver Datenaustausch vor, meist basierend auf HL7v2, und externe Geräte lassen sich nur schwer oder gar nicht mit in die Infrastruktur der Krankenhäuser einbinden. Auch mit Hinblick auf die uneinheitliche Kodierung der Vitalparameter ist oft keine systemübergreifende Interpretation der ausgetauschten Daten möglich. Die mit Vitalparametern befasste medizinische Forschung und Versorgung ist somit inhärent limitiert und kann durch die heterogene Datenlandschaft nicht ihr volles Potenzial entfalten. Um dies zu erreichen, trifft dieser Leitfaden Festlegungen zum strukturierten, REST-basierten Austausch von Vitalparametern im Krankenhaus. Mit diesen Festlegungen werden neue, digital unterstützte Anwendungsfälle ermöglicht und die medizinische Versorgung und Forschung im Krankenhaus verbessert.

# Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. Dieser FHIR ImplementationGuide (IG) beschreibt die für diesen Zweck entwickelten FHIR Profile und das [REST](https://de.wikipedia.org/wiki/Representational_State_Transfer)-basierte Application Programming Interface (API). Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html). Dieser Leitfaden konkretisiert die ISiK-relevanten Funktionen der Standard-REST-API und trifft inhaltliche Festlegungen zu den ISiK-relevanten Ressourcen in Form von Ressourcen-Profilen.

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
  "id" : "vitalparameter",
  "url" : "https://gematik.de/fhir/isik/ImplementationGuide/vitalparameter",
  "version" : "6.0.0-rc",
  "name" : "ISiKVitalparameterImplementationGuide",
  "title" : "ISiK Vitalparameter Implementierungsleitfaden",
  "status" : "draft",
  "date" : "2026-02-03T11:42:39+00:00",
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
  "description" : "Implementation guide for the Vitalparameter module based on ISiK specifications.",
  "packageId" : "vitalparameter",
  "license" : "Apache-2.0",
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
      "version" : "7.0.1"
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
      "id" : "hl7_fhir_uv_subscriptions_backport_r4",
      "uri" : "http://hl7.org/fhir/uv/subscriptions-backport/ImplementationGuide/hl7.fhir.uv.subscriptions-backport",
      "packageId" : "hl7.fhir.uv.subscriptions-backport.r4",
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
            "valueString" : "2026+"
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
            "valueString" : "6.0.0-rc"
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
            "valueString" : "https://gematik.de/fhir/isik/history.html"
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
        "valueCode" : "hl7.fhir.uv.tools.r4#0.9.0"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "copyrightyear"
          },
          {
            "url" : "value",
            "valueString" : "2026+"
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
            "valueString" : "6.0.0-rc"
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
            "valueString" : "https://gematik.de/fhir/isik/history.html"
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
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/ISiKCapabilityStatementLaborMinimalRolle"
        },
        "name" : "ISiK CapabilityStatement Labor Minimal Rolle",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementStammdatenRolle"
        },
        "name" : "CapabilityStatement für Rolle StammdatenRolle",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementVitalSignStandardSourceAkteur-expanded"
        },
        "name" : "ISiK CapabilityStatement Vital Sign Standard Source Akteur (Expanded)",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementVitalSignStandardSourceAkteur"
        },
        "name" : "ISiK CapabilityStatement Vital Sign Standard Source Akteur",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementVitalSignStandardSourceRolle"
        },
        "name" : "ISiK CapabilityStatement VitalSign Standard Source Rolle",
        "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \n  \nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet."
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
        },
        "name" : "Example Encounter - Fachabteilungskontakt",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - FachabteilungskontaktBettenverlegung",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - FachabteilungskontaktEntlassung",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - FachabteilungskontaktFachbereichswechsel1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - FachabteilungskontaktFachbereichswechsel2",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - FachabteilungskontaktMinimal2",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - FachabteilungskontaktNormal",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - FachabteilungskontaktStationaereAufnahme",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - FachabteilungskontaktStationswechsel1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - FachabteilungskontaktStationswechsel2",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - SZ1Nachstationaer",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - SZ1Stationaer",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - SZ1Vorstationaer",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
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
        },
        "name" : "Example Encounter - SZ2Encounter",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExampleISiKLaboruntersuchungCRP1"
        },
        "name" : "Example Observation - ExampleISiKLaboruntersuchungCRP1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungCRP"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExampleISiKLaboruntersuchungGFR1"
        },
        "name" : "Example Observation - ExampleISiKLaboruntersuchungGFR1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungGFR"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExampleISiKLaboruntersuchungHb1"
        },
        "name" : "Example Observation - ExampleISiKLaboruntersuchungHb1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungHb"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExampleISiKLaboruntersuchungPCT1"
        },
        "name" : "Example Observation - ExampleISiKLaboruntersuchungPCT1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungPCT"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExampleISiKLaboruntersuchungSerumkreatinin1"
        },
        "name" : "Example Observation - ExampleISiKLaboruntersuchungSerumkreatinin1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungSerumkreatinin"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExampleISiKLaboruntersuchungTSH1"
        },
        "name" : "Example Observation - ExampleISiKLaboruntersuchungTSH1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungTSH"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExampleISiKLaboruntersuchungThrombozyten1"
        },
        "name" : "Example Observation - ExampleISiKLaboruntersuchungThrombozyten1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungThrombozyten"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExampleISiKLaboruntersuchungTroponin1"
        },
        "name" : "Example Observation - ExampleISiKLaboruntersuchungTroponin1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungTroponin"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExtractedObservationKoerpergewicht"
        },
        "name" : "Example Observation - ExtractedObservationKoerpergewicht",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergewicht"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ExtractedObservationKoerpergroesse"
        },
        "name" : "Example Observation - ExtractedObservationKoerpergroesse",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergroesse"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKAtemfrequenzExample"
        },
        "name" : "Example Observation - ISiKAtemfrequenzExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAtemfrequenz"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKAtemfrequenzMaxExample"
        },
        "name" : "Example Observation - ISiKAtemfrequenzMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAtemfrequenz"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKAtemfrequenzMinExample"
        },
        "name" : "Example Observation - ISiKAtemfrequenzMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAtemfrequenz"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKBlutdruckSystemischArteriellExample"
        },
        "name" : "Example Observation - ISiKBlutdruckSystemischArteriellExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBlutdruckSystemischArteriell"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKBlutdruckSystemischArteriellMaxExample"
        },
        "name" : "Example Observation - ISiKBlutdruckSystemischArteriellMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBlutdruckSystemischArteriell"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKBlutdruckSystemischArteriellMinExample"
        },
        "name" : "Example Observation - ISiKBlutdruckSystemischArteriellMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBlutdruckSystemischArteriell"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKEKGExample"
        },
        "name" : "Example Observation - ISiKEKGExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKEKG"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKEKGMaxExample"
        },
        "name" : "Example Observation - ISiKEKGMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKEKG"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKEKGMinExample"
        },
        "name" : "Example Observation - ISiKEKGMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKEKG"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKGCSExample"
        },
        "name" : "Example Observation - ISiKGCSExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKGCS"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKGCSMaxExample"
        },
        "name" : "Example Observation - ISiKGCSMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKGCS"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKGCSMinExample"
        },
        "name" : "Example Observation - ISiKGCSMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKGCS"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKHerzfrequenzExample"
        },
        "name" : "Example Observation - ISiKHerzfrequenzExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKHerzfrequenz"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKHerzfrequenzMaxExample"
        },
        "name" : "Example Observation - ISiKHerzfrequenzMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKHerzfrequenz"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKHerzfrequenzMinExample"
        },
        "name" : "Example Observation - ISiKHerzfrequenzMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKHerzfrequenz"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKoerpergewichtExample"
        },
        "name" : "Example Observation - ISiKKoerpergewichtExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergewicht"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKoerpergewichtMaxExample"
        },
        "name" : "Example Observation - ISiKKoerpergewichtMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergewicht"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKoerpergewichtMinExample"
        },
        "name" : "Example Observation - ISiKKoerpergewichtMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergewicht"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKoerpergroesseExample"
        },
        "name" : "Example Observation - ISiKKoerpergroesseExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergroesse"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKoerpergroesseMaxExample"
        },
        "name" : "Example Observation - ISiKKoerpergroesseMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergroesse"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKoerpergroesseMinExample"
        },
        "name" : "Example Observation - ISiKKoerpergroesseMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergroesse"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKoerpertemperaturExample"
        },
        "name" : "Example Observation - ISiKKoerpertemperaturExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpertemperatur"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKoerpertemperaturMaxExample"
        },
        "name" : "Example Observation - ISiKKoerpertemperaturMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpertemperatur"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKoerpertemperaturMinExample"
        },
        "name" : "Example Observation - ISiKKoerpertemperaturMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpertemperatur"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKopfumfangExample"
        },
        "name" : "Example Observation - ISiKKopfumfangExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKopfumfang"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKopfumfangMaxExample"
        },
        "name" : "Example Observation - ISiKKopfumfangMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKopfumfang"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKKopfumfangMinExample"
        },
        "name" : "Example Observation - ISiKKopfumfangMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKopfumfang"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKSauerstoffsaettigungArteriellExample"
        },
        "name" : "Example Observation - ISiKSauerstoffsaettigungArteriellExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSauerstoffsaettigungArteriell"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKSauerstoffsaettigungArteriellMaxExample"
        },
        "name" : "Example Observation - ISiKSauerstoffsaettigungArteriellMaxExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSauerstoffsaettigungArteriell"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKSauerstoffsaettigungArteriellMinExample"
        },
        "name" : "Example Observation - ISiKSauerstoffsaettigungArteriellMinExample",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSauerstoffsaettigungArteriell"
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
        },
        "name" : "Example Patient - DorisQuelle",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
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
        },
        "name" : "Example Patient - DorisZiel",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/IsikPatientTemplate"
        },
        "name" : "Example Patient - IsikPatientTemplate",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
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
        },
        "name" : "Example Patient - PatientinMinimal",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
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
        },
        "name" : "Example Patient - PatientinMusterfrau",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
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
        },
        "name" : "Example Patient - PatientinNormal",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
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
        },
        "name" : "Example Patient - SZ1Patient",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
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
        },
        "name" : "Example Patient - SZ2Patient",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
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
          "reference" : "StructureDefinition/ISiKAtemfrequenz"
        },
        "name" : "ISiKAtemfrequenz",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Atemfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n### Motivation\nDie Erfassung und Überwachung der Atemfrequenz ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.\n\nIn FHIR wird die Atemfrequenz mit der Observation-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKAtemfrequenz ist vom Profil [VitalSignDE_Atemfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-atemfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/resprate) aus der FHIR R4 Spezifikation."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKBlutdruckSystemischArteriell"
        },
        "name" : "ISiKBlutdruckSystemischArteriell",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Blutdruck eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n### Motivation\nDie Erfassung und Überwachung des Blutdrucks ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.\n\nIn FHIR wird der Blutdruck mit der Observation-Ressource repräsentiert, die einzelnen Komponenten des Blutdrucks werden als Component-Elemente abgebildet.\n\nHinweis: In Fällen, in denen fachlich motiviert ausschließlich ein systolischer Blutdruck erhoben wird (z.B. in der Intensivmedizin), kann für den Slice zur Diastole (DiastolicBP) das Element .dataAbsentReason (mit dem Code 'not-performed') verwendet werden.\n\n### Kompatibilität\nDas Profil ISiKBlutdruckSystemischArteriell ist vom Profil [VitalSignDE_Blutdruck](http://fhir.de/StructureDefinition/observation-de-vitalsign-blutdruck) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Blood Pressure Profile](http://hl7.org/fhir/StructureDefinition/bp) aus der FHIR R4 Spezifikation."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKEKG"
        },
        "name" : "ISiKEKG",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über kurze, relevante EKG-Ausschnitte eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Es wurde entwickelt, um spezifische klinische Fragestellungen zu unterstützen, bei denen prägnante und gezielte EKG-Daten im Vordergrund stehen. Für vollständige und längere EKG-Aufzeichnungen sind alternative Formate vorgesehen, die für umfangreiche Daten besser geeignet sind.\n### Motivation\nDie Bereitstellung kurzer EKG-Ausschnitte ermöglicht eine präzise und effiziente Unterstützung bei der Diagnose akuter kardiologischer Fragestellungen, der Überwachung von Arrhythmien oder der Beurteilung bestimmter Ereignisse wie ST-Strecken-Veränderungen. Diese fokussierte Darstellung dient der Optimierung klinischer Entscheidungen und der schnellen Verarbeitung relevanter Daten.\n\nIn FHIR wird das EKG durch die Observation-Ressource repräsentiert, wobei spezifische Anforderungen für die Darstellung und Kodierung der Daten in diesem Profil berücksichtigt werden.\n\n### Kompatibilität\nDas Profil ISiKEKG ist vom Profil [EkgDE](http://fhir.de/StructureDefinition/observation-de-ekg) aus den deutschen Basisprofilen abgeleitet."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKGCS"
        },
        "name" : "ISiKGCS",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Glasgow Coma Scale (GCS) Score eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n\n### Motivation\nDie Erfassung und Überwachung des Bewusstseinszustands anhand des GCS ist essenziell für die Beurteilung neurologischer Funktionen, die Überwachung von Patienten mit Schädel-Hirn-Trauma oder anderen neurologischen Erkrankungen sowie die Unterstützung klinischer Entscheidungen.\n\nIn FHIR wird der GCS-Score mit der Observation-Ressource repräsentiert, wobei die einzelnen Komponenten der Skala - Augenöffnung, verbale Reaktion und motorische Reaktion - als Component-Elemente abgebildet werden.\n### Kompatibilität\nDas Profil ISiKGCS ist vom Profil [ScoreDE_GCS](http://fhir.de/StructureDefinition/observation-de-score-gcs) aus den deutschen Basisprofilen abgeleitet."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKHerzfrequenz"
        },
        "name" : "ISiKHerzfrequenz",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Herzfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n### Motivation\nDie Erfassung und Überwachung der Herzfrequenz ist essenziell für die frühzeitige Erkennung von Herz-Kreislauf-Problemen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.\n\nIn FHIR wird die Herzfrequenz mit der Observation-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKHerzfrequenz ist vom Profil [VitalSignDE_Herzfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-herzfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/heartrate) aus der FHIR R4 Spezifikation."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKKoerpergewicht"
        },
        "name" : "ISiKKoerpergewicht",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über das Körpergewicht eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n### Motivation\nDie Erfassung und Überwachung des Körpergewichts ist essenziell für die Beurteilung des Ernährungszustands, die Überwachung von Veränderungen im Rahmen der Therapie sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.\n\nIn FHIR wird das Körpergewicht mit der Observation-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKKoerpergewicht ist vom Profil [VitalSignDE_Koerpergewicht](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergewicht) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Weight Profile](http://hl7.org/fhir/StructureDefinition/bodyweight) aus der FHIR R4 Spezifikation."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKKoerpergroesse"
        },
        "name" : "ISiKKoerpergroesse",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpergröße eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n### Motivation\nDie Erfassung und Überwachung der Körpergröße ist essenziell für die Beurteilung von Wachstumsprozessen, die Berechnung wichtiger Indizes wie des Body-Mass-Index (BMI) sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.\n\nIn FHIR wird die Körpergröße mit der Observation-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKKoerpergroesse ist vom Profil [VitalSignDE_Koerpergroesse](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergroesse) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Height Profile](http://hl7.org/fhir/StructureDefinition/bodyheight) aus der FHIR R4 Spezifikation."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKKoerpertemperatur"
        },
        "name" : "ISiKKoerpertemperatur",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpertemperatur eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n### Motivation\nDie Erfassung und Überwachung der Körpertemperatur ist essenziell für die frühzeitige Erkennung von Infektionen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.\n\nIn FHIR wird die Körpertemperatur mit der Observation-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKKoerpertemperatur ist vom Profil [VitalSignDE_Koerpertemperatur](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpertemperatur) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [OObservation Body Temperature Profile](http://hl7.org/fhir/StructureDefinition/bodytemp) aus der FHIR R4 Spezifikation."
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
          "reference" : "StructureDefinition/ISiKKopfumfang"
        },
        "name" : "ISiKKopfumfang",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Kopfumfang eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n### Motivation\nDie Erfassung und Überwachung des Kopfumfangs ist essenziell für die Beurteilung von Wachstumsprozessen, insbesondere bei Säuglingen und Kleinkindern, sowie für die frühzeitige Erkennung von Entwicklungsauffälligkeiten oder neurologischen Erkrankungen.\n\nIn FHIR wird der Kopfumfang mit der Observation-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKKopfumfang ist vom Profil [VitalSignDE_Kopfumfang](http://fhir.de/StructureDefinition/observation-de-vitalsign-kopfumfang) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Head Circumference Profile](\nhttp://hl7.org/fhir/StructureDefinition/headcircum) aus der FHIR R4 Spezifikation."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLaboruntersuchung"
        },
        "name" : "ISiKLaboruntersuchung",
        "description" : "Dieses Profil ermöglicht die Abbildung von Informationen zur Laboruntersuchungen eines Patienten in ISiK Szenarien. Es dient primär als Vorlage, von der spezifische Laboruntersuchungs-Profile abgeleitet werden, kann aber grundsätzlich auch zur Repräsentation von nicht weiter ausspezifizierten Laboruntersuchungen genutzt werden.\n\nViele medizinischen Entscheidungen benötigen Informationen zu den Laboruntersuchungen eines Patienten. Hierzu gehören z.B. aktuelle Nierenfunktionswerte, Leberwerte, Blutbildwerte oder Hormone aus Schilddrüse.\nJede dieser Untersuchungen wird durch bestimmte [[https://loinc.org/ LOINC]] oder [[http://snomed.info/sct SNOMED CT]] Codes bezeichnet. Der angegebene Wert ist durch genaue Einheitenangaben in [[http://unitsofmeasure.org UCUM]] zu konkretitiseren.\nMotivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UseCases-AMTS?version=current).\n\nIn FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. Zugehörige Codes und Einheiten sind den entsprechenden Valuessets zu entnehmen."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLaboruntersuchungCRP"
        },
        "name" : "ISiKLaboruntersuchungCRP",
        "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung CRP eines Patienten in ISiK Szenarien."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLaboruntersuchungGFR"
        },
        "name" : "ISiKLaboruntersuchungGFR",
        "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung GFR eines Patienten in ISiK Szenarien."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLaboruntersuchungHb"
        },
        "name" : "ISiKLaboruntersuchungHb",
        "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Hb eines Patienten in ISiK Szenarien."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLaboruntersuchungPCT"
        },
        "name" : "ISiKLaboruntersuchungPCT",
        "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung PCT eines Patienten in ISiK Szenarien."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLaboruntersuchungSerumkreatinin"
        },
        "name" : "ISiKLaboruntersuchungSerumkreatinin",
        "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumkreatinin eines Patienten in ISiK Szenarien."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLaboruntersuchungTSH"
        },
        "name" : "ISiKLaboruntersuchungTSH",
        "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung TSH eines Patienten in ISiK Szenarien."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLaboruntersuchungThrombozyten"
        },
        "name" : "ISiKLaboruntersuchungThrombozyten",
        "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Thrombozyten eines Patienten in ISiK Szenarien."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLaboruntersuchungTroponin"
        },
        "name" : "ISiKLaboruntersuchungTroponin",
        "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Troponin eines Patienten in ISiK Szenarien."
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
          "reference" : "StructureDefinition/ISiKSauerstoffsaettigungArteriell"
        },
        "name" : "ISiKSauerstoffsaettigungArteriell",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die arterielle Sauerstoffsättigung eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n### Motivation\nDie Erfassung und Überwachung der arteriellen Sauerstoffsättigung ist essenziell für die Beurteilung der respiratorischen Funktion, die Überwachung von Patienten mit Atemwegserkrankungen sowie die Unterstützung klinischer Entscheidungen, insbesondere in kritischen Versorgungssituationen.\n\nIn FHIR wird die arterielle Sauerstoffsättigung mit der Observation-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKSauerstoffsaettigungArteriell ist vom Profil [VitalSignDE_Arterielle_Sauerstoffsaettigung_Pulsoximetrie](http://fhir.de/StructureDefinition/observation-de-vitalsign-sauerstoffsaettigung-pulsoximetrie) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Oxygen Saturation Profile](http://hl7.org/fhir/StructureDefinition/oxygensat) aus der FHIR R4 Spezifikation."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKTerminPriorityExtension"
        },
        "name" : "ISiKTerminPriorityExtension",
        "description" : "Diese Extension ermöglicht die strukturierte Angabe der Dringlichkeit (Priorität) eines Termins. Dies ist wichtig, um Notfälle oder besonders dringliche Termine im Buchungs- und Verwaltungssystem deutlich zu kennzeichnen und eine priorisierte Bearbeitung zu ermöglichen."
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
        "name" : "ISiKLocationPhysicalType",
        "description" : "Dieses Valueset beinhaltet die für ISiK Kodierbaren Standort-Typen"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationCodesCRP"
        },
        "name" : "ObservationCodesCRP",
        "description" : "Enthält LOINC-Codes für die Observation CRP"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationCodesGFR"
        },
        "name" : "ObservationCodesGFR",
        "description" : "Enthält LOINC-Codes für die Observation GFR"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationCodesHb"
        },
        "name" : "ObservationCodesHb",
        "description" : "Enthält LOINC-Codes für die Observation Hb"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationCodesPCT"
        },
        "name" : "ObservationCodesPCT",
        "description" : "Enthält LOINC-Codes für die Observation PCT"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationCodesSerumkreatinin"
        },
        "name" : "ObservationCodesSerumkreatinin",
        "description" : "Enthält LOINC-Codes für die Observation Serumkreatinin"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationCodesTSH"
        },
        "name" : "ObservationCodesTSH",
        "description" : "Enthält LOINC-Codes für die Observation TSH"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationCodesThrombozyten"
        },
        "name" : "ObservationCodesThrombozyten",
        "description" : "Enthält LOINC-Codes für die Observation Thrombozyten"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationCodesTroponin"
        },
        "name" : "ObservationCodesTroponin",
        "description" : "Enthält LOINC-Codes für die Observation Troponin"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationUnitsCRP"
        },
        "name" : "ObservationUnitsCRP",
        "description" : "Enthält UCUM-Einheiten für die Observation CRP"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationUnitsGFR"
        },
        "name" : "ObservationUnitsGFR",
        "description" : "Enthält UCUM-Einheiten für die Observation GFR"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationUnitsHb"
        },
        "name" : "ObservationUnitsHb",
        "description" : "Enthält UCUM-Einheiten für die Observation Hb"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationUnitsPCT"
        },
        "name" : "ObservationUnitsPCT",
        "description" : "Enthält UCUM-Einheiten für die Observation PCT"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationUnitsSerumkreatinin"
        },
        "name" : "ObservationUnitsSerumkreatinin",
        "description" : "Enthält UCUM-Einheiten für die Observation Serumkreatinin"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationUnitsTSH"
        },
        "name" : "ObservationUnitsTSH",
        "description" : "Enthält UCUM-Einheiten für die Observation TSH"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationUnitsThrombozyten"
        },
        "name" : "ObservationUnitsThrombozyten",
        "description" : "Enthält UCUM-Einheiten für die Observation Thrombozyten"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ObservationUnitsTroponin"
        },
        "name" : "ObservationUnitsTroponin",
        "description" : "Enthält UCUM-Einheiten für die Observation Troponin"
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
          "title" : "Einführung",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "AMTS.html"
            }
          ],
          "nameUrl" : "AMTS.html",
          "title" : "AMTS",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Intensivversorgung.html"
            }
          ],
          "nameUrl" : "Intensivversorgung.html",
          "title" : "Intensivversorgung",
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
              "valueUrl" : "InteraktionenAkteure.html"
            }
          ],
          "nameUrl" : "InteraktionenAkteure.html",
          "title" : "Interaktionen und Akteure",
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
              "valueUrl" : "RestApi.html"
            }
          ],
          "nameUrl" : "RestApi.html",
          "title" : "REST-API",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Signaldaten.html"
            }
          ],
          "nameUrl" : "Signaldaten.html",
          "title" : "Signaldaten",
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
