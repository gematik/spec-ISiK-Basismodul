# ISiK CapabilityStatement AMTS Rolle - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK CapabilityStatement AMTS Rolle**

## CapabilityStatement: ISiK CapabilityStatement AMTS Rolle 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementAMTSRolle | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKCapabilityStatementAMTSRolle |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert. 
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. 

 
Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘AMTS’ zu bestehen. 
**HISTORIE:** 
* `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.
 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementAMTSRolle",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementAMTSRolle",
  "version" : "6.0.0-rc",
  "name" : "ISiKCapabilityStatementAMTSRolle",
  "title" : "ISiK CapabilityStatement AMTS Rolle",
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
  "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \n  \nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.",
  "purpose" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'AMTS' zu bestehen.\n  \n**HISTORIE:**    \n\n* `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.   \n* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.  \n",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : [
    "application/fhir+xml",
    "application/fhir+json",
    "application/fhir+xml",
    "application/fhir+json"
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
          "type" : "RiskAssessment",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKAMTSBewertung"
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "create"
            },
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
              "code" : "update"
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
            "RiskAssessment:condition",
            "RiskAssessment:encounter",
            "RiskAssessment:patient"
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
              "documentation" : "**Beispiel:**  \n        `GET [base]/RiskAssessment?_id=103270`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach '_id' finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Parameters for all resources'](https://hl7.org/fhir/R4/search.html#all).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "date",
              "definition" : "http://hl7.org/fhir/SearchParameter/conformance-date",
              "type" : "date",
              "documentation" : "**Beispiel:**  \n        `GET [base]/RiskAssessment?date=2022-03-21`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Date-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Date'](https://hl7.org/fhir/R4/search.html#date).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "encounter",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-encounter",
              "type" : "reference",
              "documentation" : "**Beispiel:**  \n        `GET [base]/RiskAssessment?encounter=Encounter/123`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).\n\n        "
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
              "documentation" : "**Beispiel:**  \n        `GET [base]/RiskAssessment?patient=Patient/123`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "risk",
              "definition" : "http://hl7.org/fhir/SearchParameter/RiskAssessment-risk",
              "type" : "token",
              "documentation" : "**Beispiel:**  \n        `GET [base]/RiskAssessment?risk=http://terminology.hl7.org/CodeSystem/risk-probability|high`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).\n\n        "
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
          "type" : "AllergyIntolerance",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKAllergieUnvertraeglichkeit"
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "create"
            },
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
              "code" : "update"
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
          "searchInclude" : ["AllergyIntolerance:patient"],
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
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "clinical-status",
              "definition" : "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-clinical-status",
              "type" : "token"
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
              "type" : "reference"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "onset",
              "definition" : "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-onset",
              "type" : "date"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "date",
              "definition" : "http://hl7.org/fhir/SearchParameter/conformance-date",
              "type" : "date"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "_profile",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
              "type" : "uri"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "category",
              "definition" : "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-category",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "type",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-type",
              "type" : "token"
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
          "type" : "Observation",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergewicht",
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergroesse"
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "create"
            },
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
              "code" : "update"
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
          "searchInclude" : ["Observation:encounter", "Observation:patient"],
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
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "code",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
              "type" : "token",
              "documentation" : "**Beispiel:**  \n        `GET [base]/Medication?code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23`\n\n        **Anwendungshinweise**: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token)."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "condition.code",
              "definition" : "http://hl7.org/fhir/SearchParameter/RiskAssessment-condition",
              "type" : "reference",
              "documentation" : "**Beispiel:**  \n        `GET [base]/RiskAssessment?condition.code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|F71.0`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).\n\n        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "encounter.identifier",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-encounter",
              "type" : "reference",
              "documentation" : "**Beispiele:**  \n        `GET [base]/RiskAssessment?encounter.identifier=http://mein-krankenhaus.example/fhir/sid/fallnummern|7567867`\n\n        `GET [base]/RiskAssessment?encounter.identifier=7567867`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).\n\n        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "patient.identifier",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
              "type" : "reference",
              "documentation" : "**Beispiele:**  \n        `GET [base]/RiskAssessment?patient.identifier=http://mein-krankenhaus.example/fhir/sid/patienten|1032702`\n\n        `GET [base]/RiskAssessment?patient.identifier=1032702`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).\n\n        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "date",
              "definition" : "http://hl7.org/fhir/SearchParameter/conformance-date",
              "type" : "date"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "encounter",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-encounter",
              "type" : "reference"
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
              "type" : "reference"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "status",
              "definition" : "http://hl7.org/fhir/SearchParameter/Observation-status",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "value-concept",
              "definition" : "http://hl7.org/fhir/SearchParameter/Observation-value-concept",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "value-quantity",
              "definition" : "http://hl7.org/fhir/SearchParameter/Observation-value-quantity",
              "type" : "quantity"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "_profile",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
              "type" : "uri"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "category",
              "definition" : "http://hl7.org/fhir/SearchParameter/Observation-category",
              "type" : "token"
            }
          ]
        }
      ],
      "interaction" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "code" : "transaction",
          "documentation" : "Transaktions-Bundle gemäß Profil https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransaction - Transaktions-Antwort-Bundle gemäß Profil https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransactionResponse"
        }
      ]
    }
  ]
}

```
