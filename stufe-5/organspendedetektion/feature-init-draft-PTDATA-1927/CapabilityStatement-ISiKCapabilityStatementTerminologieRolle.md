# CapabilityStatement für Rolle "ISiKCapabilityStatementTerminologieRolle" - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CapabilityStatement für Rolle &quot;ISiKCapabilityStatementTerminologieRolle&quot;**

## CapabilityStatement: CapabilityStatement für Rolle "ISiKCapabilityStatementTerminologieRolle" 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementTerminologieRolle | *Version*:0.0.1-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKCapabilityISiKCapabilityStatementTerminologieRolle |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert. 
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. 

 
CapabilityStatement für die Rolle "ISiKCapabilityStatementTerminologieRolle". Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von Terminologie-Ressourcen. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementTerminologieRolle",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementTerminologieRolle",
  "version" : "0.0.1-rc",
  "name" : "ISiKCapabilityISiKCapabilityStatementTerminologieRolle",
  "title" : "CapabilityStatement für Rolle &quot;ISiKCapabilityStatementTerminologieRolle&quot;",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.gematik.de"
        }
      ]
    }
  ],
  "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \n  \nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.",
  "purpose" : "\nCapabilityStatement für die Rolle &quot;ISiKCapabilityStatementTerminologieRolle&quot;.\nDiese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von Terminologie-Ressourcen.\n",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "implementationGuide" : [
    "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
  ],
  "rest" : [
    {
      "mode" : "server",
      "resource" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "MAY"
            }
          ],
          "type" : "CodeSystem",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKCodeSystem"
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "code" : "read"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_id",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
              "type" : "token",
              "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_id=103270`\n        **Anwendungshinweis:**\n        Der Parameter `_id` wird selten alleinstehend verwendet, da sich zum Abruf einer Ressource\n        anhand der `id`  die `READ`-Interaktion besser anbietet. Der Parameter kann jedoch verwendet werden,\n        um den Abruf einer Ressource bspw. mit einem `_include` weiterer Ressourcen zu verbinden,\n        z.B. zum Abruf eines Encounters in Verbindung mit dem zugehörigen Patienten:\n        `GET [base]/Encounter?_id=103270&_include=Encounter:patient`\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all).\n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_tag",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-tag",
              "type" : "token",
              "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_tag=https://example.org/codes|needs-review`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)\n        sowie Abschnitt [Tags](https://www.hl7.org/fhir/R4/resource.html#simple-tags).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_count",
              "type" : "number",
              "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_count=100`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Page Count](https://www.hl7.org/fhir/R4/search.html#count).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "_has",
              "type" : "string",
              "documentation" : "**Beispiel:** Suche nach allen Patienten, die eine Observation  mit dem Code '1234-5' haben\n        `GET [base]/Patient?_has:Observation:patient:code=1234-5`\n        **Beispiel:** Suche nach allen Encountern, bei denen die Diagnose 'A12.3' gestellt wurde\n        `GET [base]/Encounter?_has:Condition:encounter:code=A12.3`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "url",
              "definition" : "http://hl7.org/fhir/SearchParameter/conformance-url",
              "type" : "uri",
              "documentation" : "**Beispiel:**    \n        `GET [base]/CodeSystem?url=http://example.org/fhir/CodeSystem/test`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri).  "
            }
          ]
        },
        {
          "type" : "ValueSet",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKValueSet"
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "read"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_id",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
              "type" : "token",
              "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_id=103270`\n        **Anwendungshinweis:**\n        Der Parameter `_id` wird selten alleinstehend verwendet, da sich zum Abruf einer Ressource\n        anhand der `id`  die `READ`-Interaktion besser anbietet. Der Parameter kann jedoch verwendet werden,\n        um den Abruf einer Ressource bspw. mit einem `_include` weiterer Ressourcen zu verbinden,\n        z.B. zum Abruf eines Encounters in Verbindung mit dem zugehörigen Patienten:\n        `GET [base]/Encounter?_id=103270&_include=Encounter:patient`\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all).\n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_tag",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-tag",
              "type" : "token",
              "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_tag=https://example.org/codes|needs-review`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)\n        sowie Abschnitt [Tags](https://www.hl7.org/fhir/R4/resource.html#simple-tags).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_count",
              "type" : "number",
              "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_count=100`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Page Count](https://www.hl7.org/fhir/R4/search.html#count).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "_has",
              "type" : "string",
              "documentation" : "**Beispiel:** Suche nach allen Patienten, die eine Observation  mit dem Code '1234-5' haben\n        `GET [base]/Patient?_has:Observation:patient:code=1234-5`\n        **Beispiel:** Suche nach allen Encountern, bei denen die Diagnose 'A12.3' gestellt wurde\n        `GET [base]/Encounter?_has:Condition:encounter:code=A12.3`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "url",
              "definition" : "http://hl7.org/fhir/SearchParameter/conformance-url",
              "type" : "uri",
              "documentation" : "**Beispiel:**    \n        `GET [base]/ValueSet?url=http://example.org/fhir/ValueSet/test`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "name",
              "definition" : "http://hl7.org/fhir/SearchParameter/conformance-name",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/ValueSet?name=TestValueSet`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "status",
              "definition" : "http://hl7.org/fhir/SearchParameter/conformance-status",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/ValueSet?status=active`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "version",
              "definition" : "http://hl7.org/fhir/SearchParameter/conformance-version",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/ValueSet?version=1.0.0`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "context-type-value",
              "definition" : "http://hl7.org/fhir/SearchParameter/conformance-context-type-value",
              "type" : "composite",
              "documentation" : "**Beispiel:**    \n        `GET [base]/ValueSet?context-type-value=http://terminology.hl7.org/CodeSystem/usage-context-type|focus$http://hl7.org/fhir/resource-types|Encounter`    \n        **Anwendungshinweis:**  \n        Mit dieser Abfrage können hausinterne Kataloge anhand des Ressource-Typs ermittelt werden. Diese Informationen sind u.a. relevant im Kontext von:  \n        * Hausinternen Prozeduren/Diagnosen-Codes\n        * Kodierung von Encounter-Informationen (z.B. Wahlleistungen, Orttypen)  \n        Use Cases im Zusammenhang:    \n        (A) Zur Konfigurationszeit können passende ValueSets von einem Server spezifisch für einen Ressourcentyp abgerufen und vorbereitend auf eine Systemintegration begutachtet \n        bzw. in Client-Systeme eingebunden werden. In diesem Sinne wird die Abfrage im Kontext der [Terminvereinbarung durch einen Termin-Requestor](https://simplifier.net/guide/isik-terminplanung-v4/ImplementationGuide-markdown-Datenobjekte-Operations?version=current) genutzt.  \n        (B) Zur Laufzeit können spezifische ValueSets synchronisiert bzw. direkt in die Eingabemasken von Clients eingebunden werden.  \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#composite).  "
            }
          ]
        }
      ]
    }
  ]
}

```
