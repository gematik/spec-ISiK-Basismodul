# Einführung - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Einführung**

## Einführung

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ImplementationGuide/basis | *Version*:6.0.0-rc |
| Draft as of 2026-02-02 | *Computable Name*:ISiKBasisImplementationGuide |

Status: Aktiv

Realm: Deutschland

Historische oder abgekündigte Versionen sowie Zwischenveröffentlichungen der Implementierungsleitfäden zur Basis finden Sie [hier](https://gematik.github.io/spec-ISiK-Basismodul/index.html).

Unterschiedliche [Versionen zur Stufe 6 können Sie gemSpec abrufen](https://gemspec.gematik.de/fhir/ig/).

-------

### Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen, verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. Dieser FHIR ImplementationGuide (IG) beschreibt die für diesen Zweck entwickelten FHIR Profile und das [REST](https://de.wikipedia.org/wiki/Representational_State_Transfer)-basierte Application Programming Interface (API). Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html). Dieser Leitfaden konkretisiert die ISiK-relevanten Funktionen der Standard-REST-API und trifft inhaltliche Festlegungen zu den ISiK-relevanten Ressourcen in Form von Ressourcen-Profilen.

Hersteller bestätigungsrelevanter Systeme sollen durch diesen IG in die Lage versetzt werden, eine konforme Implementierung zu erstellen und das Bestätigungsverfahren der gematik erfolgreich zu absolvieren.

Weitere Informationen siehe [§373 SGB V](https://www.gesetze-im-internet.de/sgb_5/__373.html).

Hinweis: Sowohl für die Implementierung der ISiK-Spezifikation als auch für den Betrieb eines Produktes, das die ISiK-Spezifikation implementiert, ist eine SNOMED-CT-Lizenz notwendig. Diese kann beim [National Release Center für SNOMED CT in Deutschland](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) beantragt werden.

**Kontakt**

Bringen Sie Allgemeine Fragen und Anmerkungen gerne über unser Anfrageportal ein: [Anfragen ISiK + ISiP](https://service.gematik.de/servicedesk/customer/portal/16)

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
  "id" : "basis",
  "url" : "https://gematik.de/fhir/isik/ImplementationGuide/basis",
  "version" : "6.0.0-rc",
  "name" : "ISiKBasisImplementationGuide",
  "title" : "ISiK Basis Implementierungsleitfaden",
  "status" : "draft",
  "date" : "2026-02-02T10:21:24+00:00",
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
  "description" : "Implementation guide for the Basis module based on ISiK specifications.",
  "packageId" : "basis",
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
            "valueString" : "ci-build"
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
            "valueString" : "ci-build"
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
            "valueString" : "Account"
          }
        ],
        "reference" : {
          "reference" : "Account/AbrechnungsfallDRG"
        },
        "name" : "Example Account - AbrechnungsfallDRG",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Account"
          }
        ],
        "reference" : {
          "reference" : "Account/AbrechnungsfallGonarthrose"
        },
        "name" : "Example Account - AbrechnungsfallGonarthrose",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Account"
          }
        ],
        "reference" : {
          "reference" : "Account/SZ1DRGFall"
        },
        "name" : "Example Account - SZ1DRGFall",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Account"
          }
        ],
        "reference" : {
          "reference" : "Account/SZ2DRGFall"
        },
        "name" : "Example Account - SZ2DRGFall",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "AllergyIntolerance"
          }
        ],
        "reference" : {
          "reference" : "AllergyIntolerance/ISiKAllergieUnvertraeglichkeitBeispiel1"
        },
        "name" : "Example AllergyIntolerance - ISiKAllergieUnvertraeglichkeitBeispiel1",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAllergieUnvertraeglichkeit"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Bundle"
          },
          {
            "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ImplementationGuide.definition.resource.profile",
            "valueCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
          },
          {
            "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ImplementationGuide.definition.resource.profile",
            "valueCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBlutdruckSystemischArteriell"
          },
          {
            "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ImplementationGuide.definition.resource.profile",
            "valueCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtSubSysteme"
          },
          {
            "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ImplementationGuide.definition.resource.profile",
            "valueCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
          }
        ],
        "reference" : {
          "reference" : "Bundle/BundleExampleIntensivstation"
        },
        "name" : "Verlegungsbericht für Patient Herrn Thomas Müller (1234567890) - Intensivstation 0100 (Bundle)",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Bundle"
          },
          {
            "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ImplementationGuide.definition.resource.profile",
            "valueCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtSubSysteme"
          }
        ],
        "reference" : {
          "reference" : "Bundle/ISiKBundle-Example"
        },
        "name" : "Blutdruckmessung vom 3.5.2022 (Bundle)",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/ISiKCapabilityStatementAufbaustrukturRolle"
        },
        "name" : "CapabilityStatement für Rolle AufbaustrukturRolle",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementBasisServerAkteur-expanded"
        },
        "name" : "Akteur ISiKCapabilityStatementBasisServerAkteur (Expanded)",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementBasisServerAkteur"
        },
        "name" : "Akteur ISiKCapabilityStatementBasisServerAkteur",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementCompositionKonsumentenRolle"
        },
        "name" : "CapabilityStatement für Rolle ISiKCapabilityStatementCompositionKonsumentenRolle",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementErweiterteStammdatenRolle"
        },
        "name" : "CapabilityStatement für Rolle ISiKCapabilityStatementErweiterteStammdatenRolle",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementGesundheitsstatusRolle"
        },
        "name" : "CapabilityStatement für Rolle ISiKCapabilityStatementGesundheitsstatusRolle",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementKlinischeRolle"
        },
        "name" : "CapabilityStatement für Rolle ISiKCapabilityStatementKlinischeRolle",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementLeistungserbringerRolle"
        },
        "name" : "CapabilityStatement für Rolle LeistungserbringerRolle",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementTerminologieRolle"
        },
        "name" : "CapabilityStatement für Rolle ISiKCapabilityStatementTerminologieRolle",
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
          "reference" : "CapabilityStatement/ISiKCapabilityStatementVersicherungsverhaeltnisRolle"
        },
        "name" : "CapabilityStatement für Rolle ISiKCapabilityStatementVersicherungsverhaeltnisRolle",
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
        "name" : "TestKatalog",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKCodeSystem"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/AltersbedingteKreislaufstoerung"
        },
        "name" : "Example Condition - AltersbedingteKreislaufstoerung",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/BehandlungsDiagnoseFreitext"
        },
        "name" : "Example Condition - BehandlungsDiagnoseFreitext",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/Example-condition-ausrufezeichen-primaer"
        },
        "name" : "Example Condition - Example-condition-ausrufezeichen-primaer",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/Example-condition-ausrufezeichen-sekundaer"
        },
        "name" : "Example Condition - Example-condition-ausrufezeichen-sekundaer",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/Example-condition-kreuz-stern-primaer"
        },
        "name" : "Example Condition - Example-condition-kreuz-stern-primaer",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/Example-condition-kreuz-stern-sekundaer"
        },
        "name" : "Example Condition - Example-condition-kreuz-stern-sekundaer",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/MittelgradigeIntelligenzminderung"
        },
        "name" : "Example Condition - MittelgradigeIntelligenzminderung",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/PrimaereGonarthroseMinimal"
        },
        "name" : "Example Condition - PrimaereGonarthroseMinimal",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/PrimaereGonarthroseNormal"
        },
        "name" : "Example Condition - PrimaereGonarthroseNormal",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/SZ2Primaerdiagnose"
        },
        "name" : "Example Condition - SZ2Primaerdiagnose",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/SZ2Sekundaerdiagnose"
        },
        "name" : "Example Condition - SZ2Sekundaerdiagnose",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Coverage"
          }
        ],
        "reference" : {
          "reference" : "Coverage/CoverageGesetzlich"
        },
        "name" : "Example Coverage - CoverageGesetzlich",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Coverage"
          }
        ],
        "reference" : {
          "reference" : "Coverage/CoveragePrivat"
        },
        "name" : "Example Coverage - CoveragePrivat",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Coverage"
          }
        ],
        "reference" : {
          "reference" : "Coverage/CoverageSonstige"
        },
        "name" : "Example Coverage - CoverageSonstige",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSonstige"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Coverage"
          }
        ],
        "reference" : {
          "reference" : "Coverage/SZ1VersicherungGesetzlich"
        },
        "name" : "Example Coverage - SZ1VersicherungGesetzlich",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Coverage"
          }
        ],
        "reference" : {
          "reference" : "Coverage/SZ1VersicherungSelbstzahler"
        },
        "name" : "Example Coverage - SZ1VersicherungSelbstzahler",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Coverage"
          }
        ],
        "reference" : {
          "reference" : "Coverage/SZ2VersicherungGesetzlich"
        },
        "name" : "Example Coverage - SZ2VersicherungGesetzlich",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich"
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
            "valueString" : "Location"
          }
        ],
        "reference" : {
          "reference" : "Location/BettenstellplatzStandortBeispiel"
        },
        "name" : "Example Location - BettenstellplatzStandortBeispiel",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortBettenstellplatz"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Location"
          }
        ],
        "reference" : {
          "reference" : "Location/RaumStandortBeispiel"
        },
        "name" : "Example Location - RaumStandortBeispiel",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortRaum"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Location"
          }
        ],
        "reference" : {
          "reference" : "Location/StationStandortBeispiel"
        },
        "name" : "Station A",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKAlkoholAbususBeispiel"
        },
        "name" : "Example Observation - ISiKAlkoholAbususBeispiel",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAlkoholAbusus"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKRaucherStatusBeispiel"
        },
        "name" : "Example Observation - ISiKRaucherStatusBeispiel",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel"
        },
        "name" : "Example Observation - ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKSchwangerschaftsstatusBeispiel"
        },
        "name" : "Example Observation - ISiKSchwangerschaftsstatusBeispiel",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/ISiKStillstatusBeispiel"
        },
        "name" : "Example Observation - ISiKStillstatusBeispiel",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/AbteilungAllgemeinchirurgieOrganisationBeispiel"
        },
        "name" : "Allgemeinchirurgie",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/KrankenhausOrganisationBeispiel"
        },
        "name" : "Uniklinik Entenhausen",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisation"
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
            "valueString" : "Practitioner"
          }
        ],
        "reference" : {
          "reference" : "Practitioner/PractitionerWalterArzt"
        },
        "name" : "Example Practitioner - PractitionerWalterArzt",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPersonImGesundheitsberuf"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Procedure"
          }
        ],
        "reference" : {
          "reference" : "Procedure/Appendektomie"
        },
        "name" : "Example Procedure - Appendektomie",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedur"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "RelatedPerson"
          }
        ],
        "reference" : {
          "reference" : "RelatedPerson/ISiKAngehoerigerMustermann"
        },
        "name" : "Example RelatedPerson - ISiKAngehoerigerMustermann",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "RelatedPerson"
          }
        ],
        "reference" : {
          "reference" : "RelatedPerson/SZ1Mutter"
        },
        "name" : "Example RelatedPerson - SZ1Mutter",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
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
          "reference" : "StructureDefinition/ISiKAbrechnungsfall"
        },
        "name" : "ISiKAbrechnungsfall",
        "description" : "Dieses Profil ermöglicht die Gruppierung von medizinischen Leistungen zu einem gemeinsamen Abrechnungskontext.  \nZugleich dient es im Kontext von ISiK derzeit im Wesentlichen der Abbildung einer Fallnummer, über die im Krankenhaus unterschiedliche Prozesse - auch administrativer Natur - abgewickelt werden. Das Profil wurde *nicht* primär zum Zweck der Abbildung von Abrechnungsprozessen definiert. \n\n### Motivation\nKomplementär zum Datenobjekt 'Kontakt - Encounter' können Fälle, im Sinne einer Gruppierung von medizinischen Leistungen \ninnerhalb eines gemeinsamen Kontextes, zu einem Abrechnungsfall zusammengefasst werden.\nEin solcher Abrechnungsfall kann mehrere Kontakte umfassen (z.B. vorstationärer Besuch, stationärer Aufenthalt und nachstationärer Besuch).  \n\nGemeinsam mit dem Einrichtungskontakt bildet der Abrechnungsfall einen wichtigen Einstiegspunkt in die Dokumentation der Behandlungsleistungen der Patienten.\nAls Bindeglied zwischen den Kontakten und dem Versicherungsverhältnis erfolgt eine feingranulare Auflistung, \nin welchen Zeiträumen ein Behandlungskontext zwischen einer Gesundheitseinrichtung und der Patienten bestand.\nZudem werden Diagnosen abschließend / nachträglich dokumentiert, sodass eine Übersicht von relevanten (DRG)-Diagnosen ermöglicht wird, \nohne die Gesamtheit aller Kontakte betrachten zu müssen.\n\nIn FHIR wird der Abrechnungsfall mit der `Account`-Ressource repräsentiert.\n\nWeitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter {{pagelink: Fall, text: Fall-Begriff in ISiK}}.\n\n### Kompatibilität\n* zum Zeitpunkt der Veröffentlichung sind keine abweichenden Modellierungen der Account-Ressource bekannt.\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKAlkoholAbusus"
        },
        "name" : "ISiK Alkohol Abusus",
        "description" : "Dieses Profil dient der Abbildung des schädlichen Gebrauchs von Alkohol."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKAllergieUnvertraeglichkeit"
        },
        "name" : "ISiKAllergieUnvertraeglichkeit",
        "description" : "Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien.\n### Motivation\n\nDie Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit.\nMotivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).\n\nIn FHIR werden Allergien und Unverträglichkeiten mit der [AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.\n\n### Kompatibilität\n\nFür das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:\n* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)\n* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)\n* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKAngehoeriger"
        },
        "name" : "ISiKAngehoeriger",
        "description" : "Dieses Profil ermöglicht die Darstellung von Angehörigen in ISiK Szenarien.  \n### Motivation\nDer Angehörige wird vor allem im Zusammenhang mit Anwendungsszenarien verwendet,\n in denen das Versicherungsverhältnis eine Rolle spielt. \n Hier können Angehörige, bspw. der hauptversicherte Elternteil \n eines minderjährigen Kindes, in der Familienversicherung sein. \n In Selbstzahler-Szenarien können Angehörige die Zahler für eine \n im Krankenhaus erbrachte Leistung sein.\nIn FHIR werden Angehörige von Patienten mit der RelatedPerson-Ressource repräsentiert.\n\n### Kompatibilität\nFür das Profil ISiKAngehoeriger wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKBerichtBundle"
        },
        "name" : "ISiKBerichtBundle",
        "description" : "Das Document-Bundle dient dem Transport von Berichten zwischen Subsystemen im Krankenhaus. \nDas Bundle entspricht den Anforderungen an ein [FHIR Document Bundle](https://hl7.org/fhir/R4/documents.html) : Alle referenzierten Ressourcen müssen als Einträge im Bundle enthalten sein. \nDas Bundle unterstützt die Übermittlung einer menschenlesbaren Dokumentation (Narrative) und erlaubt zudem die Übernahme wichtiger Ressourcen (z. B. Diagnosen und Prozeduren), die einem Patienten und Fall (Patient, Encounter) zugeordnet sind."
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
        "description" : "Dieses Profil beschreibt die maschinenlesbare Repräsentation von \nsystem-spezifischen Kodierungen in ISiK-Szenarien.  \n\n### Motivation\n\nISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte. \n\nEine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten.\n\nEin Codesystem eignet sich auch dazu, auf dessen Basis definierte ValueSets zu expandieren (https://hl7.org/fhir/R4/valueset-operation-expand.html).\nDa ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich.\nDarüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKDiagnose"
        },
        "name" : "ISiKDiagnose",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen \nüber die Diagnosen eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.  \n### Motivation\nDie Möglichkeit, auf eine Übersicht der Diagnosen eines Patienten zuzugreifen, Patienten anhand ihrer Diagnose zu suchen oder zu prüfen, \nob eine konkrete Diagnose bei einem Patienten vorliegt, sind wichtige Funktionen im klinischen Behandlungsablauf.  \n\nIn FHIR werden Diagnosen mit der Condition-Ressource repräsentiert.  \n\nDa die Diagnosen in klinischen Primärsystemen in der Regel in ICD-10-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. \nFalls eine Diagnose zwar dokumentiert, aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), \nist alternativ eine Repräsentation als Freitext-Diagnose möglich.\n\n### Kompatibilität\nFür das Profil ISiKDiagnose wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKDiagnose valide sind, auch valide sind gegen:\n* das [Profil ProfileConditionDiagnose der Medizininformatik-Initative](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)\n* das [Profil KBV_PR_Base_Condition_Diagnosis der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Condition_Diagnosis)]  \nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
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
            "valueString" : "StructureDefinition:resource:abstract"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKLebensZustand"
        },
        "name" : "ISiKLebensZustand",
        "description" : "Basisprofil für ISiKLebensZustand Observation \n\n### Motivation\n\nViele medizinischen Entscheidungen benötigen Informationen zu den Lebensumständen eines Patienten. Hierzu gehören eine aktuelle Schwangerschaft, Raucherstatus sowie der Alkoholabususstatus.\nMotivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).\n\nIn FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert.\n\nDieses Profil ist eine generische, ISiK-spezifische Observation für die Abbildung von Lebenszuständen.  \nDie folgenden Profile vom Typ `Observation` sind spezifische Profile im oben genannten Sinn:  \n* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus\n* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin\n* https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus\n* https://gematik.de/fhir/isik/StructureDefinition/ISiKAlkoholAbusus\n* https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus\n\n### Kompatibilität\n\nFür Schwangerschaftsstatus & Erwarteter Geburtstermin wird eine Kompatibilität mit folgenden **IPS** Profilen angestrebt:\n* [IPS Resource Profile: Observation - Pregnancy: EDD](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-edd-uv-ips.html). \n* [IPS Resource Profile: Observation - Pregnancy: status](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-status-uv-ips.html)\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKOrganisation"
        },
        "name" : "ISiKOrganisation",
        "description" : "Dieses Profil beschreibt die Nutzung von Organisationseinheiten innerhalb eines Krankenhauses oder eines Krankenhauses als ganzem in ISiK-Szenarien."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKOrganisationFachabteilung"
        },
        "name" : "ISiKOrganisationFachabteilung",
        "description" : "Dieses Profil beschreibt die Organisationseinheit Fachabteilung innerhalb eines Krankenhauses.\n### Motivation\n\nDie Abbildung der Aufbauorganisation eines Krankenhauses dient der Festlegung von Zuständigkeiten und (Entscheidungs-)Verantwortungen von Organisationseinheiten (z.B. Fachkliniken, Fachabteilungen und -bereichen etc.) in strukturierter Form. \n\nIn FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.\n\nDie Erfassung der Organisation in strukturierter Form ermöglicht u.a.:\n- Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation im Rahmen des Terminmanagements\n- Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär)\n\nAuch die Erfassung des Krankenhauses als Ganzem ist relevant.\nEntsprechend fokussieren die folgenden Profile zur Organisation auf das Krankenhaus als Ganzes und die Fachabteilung als Organisation.  \n### Kompatibilität\n\nFür das Profil ISiKOrganisationFachabteilung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:\n* [Profil TIOrganization der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-organization)  \n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
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
          "reference" : "StructureDefinition/ISiKPersonImGesundheitsberuf"
        },
        "name" : "ISiKPersonImGesundheitsberuf",
        "description" : "Dieses Profil ermöglicht die Nutzung von in Gesundheitsberufen tätigen Personen in ISiK Szenarien.\n### Motivation\n\nDas Profil ISIKPersonImGesundheitsberuf bildet alle denkbaren medizinischen Leistungserbringer und Fachexperten  ab. In den ISiK-FHIR-Profilen können PersonImGesundheitsberuf bspw. als Ausführende einer Prozedur auftreten, im Element `performer` der Procedure Ressource, oder als die Person, die eine Diagnose stellt, im Element `asserter` der Condition Ressource.\n\nIn FHIR werden PersonImGesundheitsberuf mit der [`Practitioner`](https://hl7.org/fhir/R4/practitioner.html)-Ressource\n repräsentiert.  \n Für das Profil ISIKPersonImGesundheitsberuf wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:\n* [Profil KBV_PR_Base_Practitioner der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner). \n* [Profil HiGHmed_IC_Practitioner, MI Initiative - HiGHmed Use Case Infection Control der  Medizininformatik Initiative ](https://simplifier.net/medizininformatikinitiative-highmed-ic/highmed-ic-practitioner)\n* [Profil TIPractitioner der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner)  \n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKProzedur"
        },
        "name" : "ISiKProzedur",
        "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Behandlungen/Prozeduren eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.\n### Motivation\nDie Möglichkeit auf eine Übersicht der Prozeduren eines Patienten zuzugreifen, Patienten anhand durchgeführter oder geplanter Prozeduren zu suchen, oder zu prüfen, ob eine konkrete Prozedur bei einem Patienten durchgeführt wurde, sind wichtige Funktionen im klinischen Behandlungsablauf.\n\nIn FHIR werden Prozeduren mit der Procedure-Ressource repräsentiert.\n\nDa die Prozeduren in klinischen Primärsystemen, in der Regel, in OPS-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Prozedur zwar dokumentiert aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Prozedur möglich.\n\n### Kompatibilität\nFür das Profil ISIKProzedur wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKProzedur valide sind, auch valide sind gegen:\n\n* [Profil Prozedur](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) der Medizininformatik Initiative  \nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKRaucherStatus"
        },
        "name" : "ISiK Raucherstatus",
        "description" : "Dieses Profil dient der Abbildung des Raucherstatus von Patienten."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin"
        },
        "name" : "ISiK Schwangerschaft - Erwarteter Entbindungstermin",
        "description" : "Dieses Profil dient der Abbildung des erwarteten Entbindungstermins bei einer Schwangerschaft."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKSchwangerschaftsstatus"
        },
        "name" : "ISiK Schwangerschaftsstatus",
        "description" : "Dieses Profil bildet den Schwangerschaftsstatus einer Patientin ab."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKStandort"
        },
        "name" : "ISiKStandort",
        "description" : "Dieses Profil dient der strukturierten Erfassung von Standortangaben eines \nKrankenhauses oder von Organisationseinheiten innerhalb eines Krankenhauses in ISiK-Szenarien.  \n### Motivation\nIn FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.\n\nDie Abbildung von Standorten in einem Krankenhaus unterstützt u.a. die Raum- und Bettenbelegung in strukturierter Form. \n\nDie Erfassung des Standortes in strukturierter Form soll u.a. ermöglichen:\n- Zuweisungen von Diensten an bestimmte Standorte im Rahmen des Terminmanagements\n- Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär) - u.a. für \n    - Patientenportale im Rahmen der Terminbuchung, z.B. um den Wunsch nach Einzelbett, bzw. 1 oder 2 Betten abzubilden\n    - KIS und weitere Subsysteme:\n      - zur Patientenabholung und Information für den Transportdienst\n      - Abbildung der Verfügbarkeit eines spezifischen Bettenstellplatzes (z.B. mit spezifischem Monitoring-Device) \n- Im Rahmen der Versorgung kann eine der folgenden Beispiel-Fragen beantworten werden:\n    - Handelt es sich um ein Isolationszimmer?\n    - Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte?\n    - etc.\n\nDafür werden Standort-Profile in unterschiedlicher Granularität definiert. \n\n### Kompatibilität\nFür das Profil ISiKStandort wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der \nKompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.  \nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKStandortBettenstellplatz"
        },
        "name" : "ISiKStandortBettenstellplatz",
        "description" : "Dieses Profil dient der strukturierten Erfassung von Bettenstellplätzen (als Standorten) \neines Krankenhauses.  \n### Hinweis  \nEin einzelnes Bett als Gegenstand kann als FHIR-Ressource 'Device' abgebildet werden, \ndas einen Bettenstellplatz referenziert."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKStandortRaum"
        },
        "name" : "ISiKStandortRaum",
        "description" : "Dieses Profil dient der strukturierten Erfassung von Räumen (als Standorten) eines Krankenhauses."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKStillstatus"
        },
        "name" : "ISiKStillstatus",
        "description" : "Dieses Profil dient der Abbildung des Stillstatus, d.h ob gestillt/Muttermilch abgepumpt und gefüttert wird."
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
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich"
        },
        "name" : "ISiKVersicherungsverhaeltnisGesetzlich",
        "description" : "Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien.  \n### Motivation\nISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden.\nIn diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.  \nIn FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKVersicherungsverhaeltnisGesetzlich basiert auf dem [GKV-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis). \nInstanzen, die gegen ISiKVersicherungsverhaeltnisGesetzlich valide sind, sind auch valide gegen\n\n* [GKV-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis)\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler"
        },
        "name" : "ISiKVersicherungsverhaeltnisSelbstzahler",
        "description" : "Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien.  \n### Motivation\nISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden.\nIn diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.  \nIn FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKVersicherungsverhaeltnisSelbstzahler basiert auf dem [Selbstzahler-Profil der deutschen Basisprofile](https://fhir.de/StructureDefinition/coverage-de-sel). \nInstanzen, die gegen ISiKVersicherungsverhaeltnisSelbstzahler valide sind, sind auch valide gegen\n\n* [Selbstzahler-Profil der deutschen Basisprofile](https://fhir.de/StructureDefinition/coverage-de-sel)\n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ISiKVersicherungsverhaeltnisSonstige"
        },
        "name" : "ISiKVersicherungsverhaeltnisSonstige",
        "description" : "Dieses Profil ermöglicht die Darstellung sonstiger Versicherungsverhältnisses in ISiK Szenarien.  \n### Motivation\nISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden, \nbei denen es sich *weder* um gesetzliche Versicherungen noch Selbstzahlerverhältnisse handelt.\nIn diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.  \nIn FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKVersicherungsverhaeltnisSonstige basiert auf dem [Basis-Coverage-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis). \n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/DiagnosesSCT"
        },
        "name" : "DiagnosesSCT",
        "description" : "Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes"
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
          "reference" : "ValueSet/ISiKValueSetExample"
        },
        "name" : "TestValueSet",
        "exampleCanonical" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKValueSet"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ProzedurenCodesSCT"
        },
        "name" : "ProzedurenCodesSCT",
        "description" : "Enthaelt alle SNOMED Procedure Codes"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/ProzedurenKategorieSCT"
        },
        "name" : "ProzedurenKategorieSCT",
        "description" : "Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/SchwangerschaftEtMethodeVS"
        },
        "name" : "Schwangerschaft Erwarteter Entbindungstermin Methode",
        "description" : "Dieses Valueset enthält die Codes zur Beschreibung der Methode zur Bestimmung des erwarteten Entbindungstermins bei einer Schwangerschaft."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/SchwangerschaftsstatusVS"
        },
        "name" : "Schwangerschaftsstatus Valueset",
        "description" : "Dieses Valueset enthält die Codes zur Beschreibung des Schwangerschaftsstatus einer Patientin."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/StillstatusVS"
        },
        "name" : "Stillstatus LOINC Antwortoptionen",
        "description" : "Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC."
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/current-smoking-status-uv-ips"
        },
        "name" : "Current Smoking Status - IPS",
        "description" : "HL7 LOINC value set for smoking status.  Based on the HL7 Vocab and Structured Doc WG (formerly TC) consensus - per US CDC submission 7/12/2012 for smoking status terms."
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
              "valueUrl" : "Motivation.html"
            }
          ],
          "nameUrl" : "Motivation.html",
          "title" : "Motivation",
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
              "valueUrl" : "Abbildung-des-Konstrukts-Fall.html"
            }
          ],
          "nameUrl" : "Abbildung-des-Konstrukts-Fall.html",
          "title" : "Abbildung des Konstrukts \"Fall\"",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Datenuebermittlung-aus-Subsystemen.html"
            }
          ],
          "nameUrl" : "Datenuebermittlung-aus-Subsystemen.html",
          "title" : "Datenübermittlung aus Subsystemen",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Erlaeuterung-Akteurs-und-Rollenmodell.html"
            }
          ],
          "nameUrl" : "Erlaeuterung-Akteurs-und-Rollenmodell.html",
          "title" : "Akteurs- und Rollenmodell",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Index_Beispielszenarien.html"
            }
          ],
          "nameUrl" : "Index_Beispielszenarien.html",
          "title" : "Beispielszenarien",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Szenario-1-DRG-Fall-Kind-mit-Wahlleistung.html"
            }
          ],
          "nameUrl" : "Szenario-1-DRG-Fall-Kind-mit-Wahlleistung.html",
          "title" : "Szenario 1: DRG-Fall, Kind mit Wahlleistung",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Szenario-2-Kreuz-Stern-Diagnose.html"
            }
          ],
          "nameUrl" : "Szenario-2-Kreuz-Stern-Diagnose.html",
          "title" : "Szenario 2: Kreuz-Stern-Diagnose",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Index_Festlegungen.html"
            }
          ],
          "nameUrl" : "Index_Festlegungen.html",
          "title" : "Festlegungen",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UebergreifendeFestlegungen_Methodik.html"
            }
          ],
          "nameUrl" : "UebergreifendeFestlegungen_Methodik.html",
          "title" : "Methodik",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme.html"
            }
          ],
          "nameUrl" : "UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme.html",
          "title" : "Bestätigungsrelevante Systeme",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "KompatibilitaetDerGematikSpezifikation_Andere.html"
            }
          ],
          "nameUrl" : "KompatibilitaetDerGematikSpezifikation_Andere.html",
          "title" : "Kompatibilität der gematik-Spezifikation",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "KompatibilitaetDerGematikSpezifikation_IHE.html"
            }
          ],
          "nameUrl" : "KompatibilitaetDerGematikSpezifikation_IHE.html",
          "title" : "Kompatibilität der gematik-Spezifikation IHE",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UebergreifendeFestlegungen_Must-Support-Flags.html"
            }
          ],
          "nameUrl" : "UebergreifendeFestlegungen_Must-Support-Flags.html",
          "title" : "Must-Support-Flags",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UebergreifendeFestlegungen_Repraesentationsformate.html"
            }
          ],
          "nameUrl" : "UebergreifendeFestlegungen_Repraesentationsformate.html",
          "title" : "Repräsentationsformate",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UebergreifendeFestlegungen_Suchparameter.html"
            }
          ],
          "nameUrl" : "UebergreifendeFestlegungen_Suchparameter.html",
          "title" : "Allgemeine Hinweise zu Suchparametern",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UebergreifendeFestlegungen_Rest.html"
            }
          ],
          "nameUrl" : "UebergreifendeFestlegungen_Rest.html",
          "title" : "REST-API",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "Patient-Besuch-Kontext.html"
            }
          ],
          "nameUrl" : "Patient-Besuch-Kontext.html",
          "title" : "Herstellung von Patienten- und Besuchskontext",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UebergreifendeFestlegungen_UmgangFehlendeDaten.html"
            }
          ],
          "nameUrl" : "UebergreifendeFestlegungen_UmgangFehlendeDaten.html",
          "title" : "Umgang mit fehlenden Daten",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "UebergreifendeFestlegungen_FHIR_Artefakte.html"
            }
          ],
          "nameUrl" : "UebergreifendeFestlegungen_FHIR_Artefakte.html",
          "title" : "Umgang mit FHIR-Artefakten",
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
