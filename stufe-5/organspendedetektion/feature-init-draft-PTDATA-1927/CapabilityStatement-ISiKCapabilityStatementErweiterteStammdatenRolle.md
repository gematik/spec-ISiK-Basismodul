# CapabilityStatement für Rolle "ISiKCapabilityStatementErweiterteStammdatenRolle" - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CapabilityStatement für Rolle &quot;ISiKCapabilityStatementErweiterteStammdatenRolle&quot;**

## CapabilityStatement: CapabilityStatement für Rolle "ISiKCapabilityStatementErweiterteStammdatenRolle" 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementErweiterteStammdatenRolle | *Version*:0.0.1 |
| Active as of 2025-12-17 | *Computable Name*:ISiKCapabilityStatementErweiterteStammdatenRolle |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert. 
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. 

 
CapabilityStatement für die Rolle "ISiKCapabilityStatementErweiterteStammdatenRolle". Diese Rolle stellt erweiterte Interaktionen zur Abfrage von Stammdaten bereit. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementErweiterteStammdatenRolle",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementErweiterteStammdatenRolle",
  "version" : "0.0.1",
  "name" : "ISiKCapabilityStatementErweiterteStammdatenRolle",
  "title" : "CapabilityStatement für Rolle &quot;ISiKCapabilityStatementErweiterteStammdatenRolle&quot;",
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
  "purpose" : "\nCapabilityStatement für die Rolle &quot;ISiKCapabilityStatementErweiterteStammdatenRolle&quot;.\nDiese Rolle stellt erweiterte Interaktionen zur Abfrage von Stammdaten bereit.\n",
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
          "type" : "Patient",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
          ],
          "interaction" : [
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
          "searchRevInclude" : ["Encounter:patient", "Encounter:subject"],
          "_searchRevInclude" : [
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
                  "valueCode" : "SHALL"
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
              "name" : "name",
              "definition" : "http://hl7.org/fhir/SearchParameter/Patient-name",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Patient?name=Erika`    \n        `GET [base]/Patient?name=Erika`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "address",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Patient?address=Berlin`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  \n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "address-city",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-city",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Patient?address-city=Berlin`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  \n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "address-country",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-country",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Patient?address-country=DE`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  \n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "address-postalcode",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-postalcode",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Patient?address-postalcode=10117`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  \n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "active",
              "definition" : "http://hl7.org/fhir/SearchParameter/Patient-active",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Patient?active=true`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  \n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "telecom",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-telecom",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Patient?telecom=phone|+49152236898`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  \n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
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
          "type" : "Encounter",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
          ],
          "interaction" : [
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
            "Encounter:subject",
            "Encounter:part-of",
            "Encounter:diagnosis",
            "Encounter:account"
          ],
          "_searchInclude" : [
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
                  "valueCode" : "SHALL"
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
                  "valueCode" : "SHALL"
                }
              ]
            }
          ],
          "searchRevInclude" : ["Encounter:part-of"],
          "_searchRevInclude" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
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
              "name" : "location",
              "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-location",
              "type" : "reference",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Encounter?location=Location/test`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "service-provider",
              "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-service-provider",
              "type" : "reference",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Encounter?service-provider=Organization/test`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
            }
          ]
        }
      ]
    }
  ]
}

```
