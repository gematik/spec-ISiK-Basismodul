# ISiK CapabilityStatement Medikationsverabreichung Rolle - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK CapabilityStatement Medikationsverabreichung Rolle**

## CapabilityStatement: ISiK CapabilityStatement Medikationsverabreichung Rolle 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerabreichungRolle | *Version*:0.0.1 |
| Active as of 2025-12-17 | *Computable Name*:ISiKCapabilityStatementMedikationVerabreichungRolle |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert. 
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. 

 
Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsverabreichung’ zu bestehen. 
**HISTORIE:** 
* `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.
 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementMedikationVerabreichungRolle",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerabreichungRolle",
  "version" : "0.0.1",
  "name" : "ISiKCapabilityStatementMedikationVerabreichungRolle",
  "title" : "ISiK CapabilityStatement Medikationsverabreichung Rolle",
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
  "purpose" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'Medikationsverabreichung' zu bestehen.\n  \n**HISTORIE:**    \n\n* `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.   \n* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.  \n",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
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
          "type" : "MedicationAdministration",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung"
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
            "MedicationAdministration:medication",
            "MedicationAdministration:patient",
            "MedicationAdministration:context",
            "MedicationAdministration:performer"
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
              "documentation" : "**Beispiel:**  \n        `GET [base]/MedicationAdministration?_id=103270`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach '_id' finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Parameters for all resources'](https://hl7.org/fhir/R4/search.html#all).\n\n        "
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
              "documentation" : "**Beispiel:**  \n        `GET [base]/MedicationAdministration?code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "context",
              "definition" : "http://hl7.org/fhir/SearchParameter/MedicationAdministration-context",
              "type" : "reference",
              "documentation" : "**Beispiel:**  \n        `GET [base]/MedicationAdministration?context=Encounter/123`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "effective-time",
              "definition" : "http://hl7.org/fhir/SearchParameter/MedicationAdministration-effective-time",
              "type" : "date",
              "documentation" : "**Beispiel:**  \n        `GET [base]/MedicationAdministration?effective-time=2022-03-23`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Date-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Date'](https://hl7.org/fhir/R4/search.html#date).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "medication",
              "definition" : "http://hl7.org/fhir/SearchParameter/medications-medication",
              "type" : "reference",
              "documentation" : "**Beispiel:**  \n        `GET [base]/MedicationAdministration?medication=Medication/123`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).\n\n        "
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
              "documentation" : "**Beispiel:**  \n        `GET [base]/MedicationAdministration?patient=Patient/123`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "performer",
              "definition" : "http://hl7.org/fhir/SearchParameter/MedicationAdministration-performer",
              "type" : "reference",
              "documentation" : "**Beispiel:**  \n        `GET [base]/MedicationAdministration?performer=Practitioner/101112`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "status",
              "definition" : "http://hl7.org/fhir/SearchParameter/medications-status",
              "type" : "token",
              "documentation" : "**Beispiel:**  \n        `GET [base]/MedicationAdministration?status=completed`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "context.identifier",
              "definition" : "http://hl7.org/fhir/SearchParameter/MedicationAdministration-context",
              "type" : "reference",
              "documentation" : "**Beispiele:**  \n        `GET [base]/MedicationAdministration?context.identifier=http://mein-krankenhaus.example/fhir/sid/fallnummern|7567867`\n\n        `GET [base]/MedicationAdministration?context.identifier=7567867`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).\n\n        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "medication.code",
              "definition" : "http://hl7.org/fhir/SearchParameter/medications-medication",
              "type" : "reference",
              "documentation" : "**Beispiel:**  \n        `GET [base]/MedicationAdministration?medication.code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).\n\n        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).\n\n        "
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
              "documentation" : "**Beispiele:**  \n        `GET [base]/MedicationAdministration?patient.identifier=http://mein-krankenhaus.example/fhir/sid/patienten|1032702`\n\n        `GET [base]/MedicationAdministration?patient.identifier=1032702`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).\n\n        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).\n\n        "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "performer.identifier",
              "definition" : "http://hl7.org/fhir/SearchParameter/MedicationAdministration-performer",
              "type" : "reference",
              "documentation" : "**Beispiele:**  \n        `GET [base]/MedicationAdministration?performer.identifier=http://fhir.de/sid/bundesaerztekammer/efn|123456789123456`\n\n        `GET [base]/MedicationAdministration?performer.identifier=123456789123456`\n\n        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).\n\n        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).\n\n        "
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
