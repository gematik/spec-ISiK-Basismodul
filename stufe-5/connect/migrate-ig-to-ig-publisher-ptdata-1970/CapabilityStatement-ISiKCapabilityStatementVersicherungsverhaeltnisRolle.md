# CapabilityStatement für Rolle "ISiKCapabilityStatementVersicherungsverhaeltnisRolle" - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CapabilityStatement für Rolle &quot;ISiKCapabilityStatementVersicherungsverhaeltnisRolle&quot;**

## CapabilityStatement: CapabilityStatement für Rolle "ISiKCapabilityStatementVersicherungsverhaeltnisRolle" 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVersicherungsverhaeltnisRolle | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:ISiKCapabilityStatementVersicherungsverhaeltnisRolle |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert. 
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. 

 
CapabilityStatement für die Rolle "ISiKCapabilityStatementVersicherungsverhaeltnisRolle". Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf von ISiKVersicherungsverhaeltnis-Ressourcen. 

## CapabilityStatement für Rolle &quot;ISiKCapabilityStatementVersicherungsverhaeltnisRolle&quot;

* Implementation Guide Version: 0.0.1 
* FHIR Version: 4.0.1 
* Supported Formats: `application/fhir+xml`, `application/fhir+json`
* Published on: 2025-10-23 

> **Note to Implementers: FHIR Capabilities**Any FHIR capability may be 'allowed' by the system unless explicitly marked as 'SHALL NOT'. A few items are marked as MAY in the Implementation Guide to highlight their potential relevance to the use case.

### SHALL Support the Following Implementation Guides

* https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul

## FHIR RESTful Capabilities

### Mode: server

### Capabilities by Resource/Profile

#### Summary

The summary table lists the resources that are part of this configuration, and for each resource it lists:

* The relevant profiles (if any)
* The interactions supported by each resource (**R**ead, **S**earch, **U**pdate, and **C**reate, are always shown, while **VR**ead, **P**atch, **D**elete, **H**istory on **I**nstance, or **H**istory on **T**ype are only present if at least one of the resources has support for them.
* The required, recommended, and some optional search parameters (if any).
* The linked resources enabled for `_include`
* The other resources enabled for `_revinclude`
* The operations on the resource (if any)

| | | | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| [Coverage](#Coverage1-1) | Supported Profiles  [ISiKVersicherungsverhaeltnisGesetzlich](StructureDefinition-ISiKVersicherungsverhaeltnisGesetzlich.md)  [ISiKVersicherungsverhaeltnisSelbstzahler](StructureDefinition-ISiKVersicherungsverhaeltnisSelbstzahler.md)  [ISiKVersicherungsverhaeltnisSonstige](StructureDefinition-ISiKVersicherungsverhaeltnisSonstige.md) | **Y** | **Y** |  |  | _id, _tag, _count, _has, status, type, beneficiary, payor, subscriber | `Coverage:subscriber`,`Coverage:patient`,`Coverage:payor`,`Coverage:beneficiary` |  |  |
| [RelatedPerson](#RelatedPerson1-2) | Supported Profiles  [ISiKAngehoeriger](StructureDefinition-ISiKAngehoeriger.md) | **Y** | **Y** |  |  | _id, _tag, _count, _has, patient, name, address, address-city, address-country, address-postalcode | `RelatedPerson:patient` | `Coverage:subscriber`,`Coverage:payor` |  |
| [Account](#Account1-3) | Supported Profiles  [ISiKAbrechnungsfall](StructureDefinition-ISiKAbrechnungsfall.md) | **Y** | **Y** |  |  | _id, _tag, _count, _has, identifier, status, type, patient |  |  |  |

-------

#### Resource Conformance: SHALL Coverage

Core FHIR Resource

[Coverage](http://hl7.org/fhir/R4/coverage.html)

Reference Policy

Interaction summary

* **SHALL** support `read`, `search-type`.

Supported Profiles
[ISiKVersicherungsverhaeltnisGesetzlich](StructureDefinition-ISiKVersicherungsverhaeltnisGesetzlich.md)
[ISiKVersicherungsverhaeltnisSelbstzahler](StructureDefinition-ISiKVersicherungsverhaeltnisSelbstzahler.md)
[ISiKVersicherungsverhaeltnisSonstige](StructureDefinition-ISiKVersicherungsverhaeltnisSonstige.md)

Search Parameters


 

#### Resource Conformance: SHALL RelatedPerson

Core FHIR Resource

[RelatedPerson](http://hl7.org/fhir/R4/relatedperson.html)

Reference Policy

Interaction summary

* **SHALL** support `read`, `search-type`.

Supported Profiles
[ISiKAngehoeriger](StructureDefinition-ISiKAngehoeriger.md)

Search Parameters


 

#### Resource Conformance: SHALL Account

Core FHIR Resource

[Account](http://hl7.org/fhir/R4/account.html)

Reference Policy

Interaction summary

* **SHALL** support `read`, `search-type`.

Supported Profiles
[ISiKAbrechnungsfall](StructureDefinition-ISiKAbrechnungsfall.md)

Search Parameters


 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementVersicherungsverhaeltnisRolle",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVersicherungsverhaeltnisRolle",
  "version" : "0.0.1",
  "name" : "ISiKCapabilityStatementVersicherungsverhaeltnisRolle",
  "title" : "CapabilityStatement für Rolle &quot;ISiKCapabilityStatementVersicherungsverhaeltnisRolle&quot;",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
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
  "purpose" : "CapabilityStatement für die Rolle &quot;ISiKCapabilityStatementVersicherungsverhaeltnisRolle&quot;.\nDiese Rolle beschreibt verpflichtende Interaktionen zum Abruf von ISiKVersicherungsverhaeltnis-Ressourcen.",
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
              "valueCode" : "SHALL"
            }
          ],
          "type" : "Coverage",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich",
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler",
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSonstige"
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
          "searchInclude" : [
            "Coverage:subscriber",
            "Coverage:patient",
            "Coverage:payor",
            "Coverage:beneficiary"
          ],
          "_searchInclude" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ]
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ]
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ]
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ]
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
              "name" : "status",
              "definition" : "http://hl7.org/fhir/SearchParameter/Coverage-status",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Coverage?status=active`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "type",
              "definition" : "http://hl7.org/fhir/SearchParameter/Coverage-type",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Coverage?type=http://fhir.de/CodeSystem/versicherungsart-de-basis|GKV`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "beneficiary",
              "definition" : "http://hl7.org/fhir/SearchParameter/Coverage-beneficiary",
              "type" : "reference",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Coverage?beneficiary=Patient/123`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "payor",
              "definition" : "http://hl7.org/fhir/SearchParameter/Coverage-payor",
              "type" : "reference",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Coverage?payor:identifier=0123456789`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "subscriber",
              "definition" : "http://hl7.org/fhir/SearchParameter/Coverage-subscriber",
              "type" : "reference",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Coverage?subscriber=Patient/123`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "type" : "RelatedPerson",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
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
          "searchInclude" : ["RelatedPerson:patient"],
          "_searchInclude" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ]
            }
          ],
          "searchRevInclude" : ["Coverage:subscriber", "Coverage:payor"],
          "_searchRevInclude" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ]
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ]
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
              "name" : "patient",
              "definition" : "http://hl7.org/fhir/SearchParameter/RelatedPerson-patient",
              "type" : "reference",
              "documentation" : "**Beispiel:**    \n        `GET [base]/RelatedPerson?patient=Patient/123`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "name",
              "definition" : "http://hl7.org/fhir/SearchParameter/RelatedPerson-name",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/RelatedPerson?name=Heidi`  \n        `GET [base]/RelatedPerson?name=Alpenzauber`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "address",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/RelatedPerson?address=Berlin`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "address-city",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-city",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/RelatedPerson?address-city=Berlin`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "address-country",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-country",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/RelatedPerson?address-country=DE`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "address-postalcode",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-postalcode",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/RelatedPerson?address-postalcode=10117`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "type" : "Account",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
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
              "name" : "identifier",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-identifier",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Account?identifier=http://test.krankenhaus.de/fhir/sid/fallnr|123456`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "status",
              "definition" : "http://hl7.org/fhir/SearchParameter/Account-status",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Account?status=active`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "type",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-type",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Account?type=http://terminology.hl7.org/CodeSystem/v3-ActCode|AMB`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "patient",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
              "type" : "reference",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Account?patient=Patient/123`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
            }
          ]
        }
      ]
    }
  ]
}

```
