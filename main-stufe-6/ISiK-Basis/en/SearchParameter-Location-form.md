# form - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **form**

## SearchParameter: form 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/SearchParameter/Location-form | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:form |



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "Location-form",
  "url" : "https://gematik.de/fhir/isik/SearchParameter/Location-form",
  "version" : "6.0.0",
  "name" : "form",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "Die Location-Ressource kann für ein breites Spektrum an UseCases verwendet werden.\n        Im Kontext von ISiK ist speziell die Suche nach Stationen, Zimmern und Bettplätzen relevant, \n        es ist jedoch nicht auszuschließen, dass Systeme die Location-Ressource auch für die Abbildung von Örtlichkeiten \n        außerhalb des ISiK-Scopes verwenden, z.B. Gebäude, Standorte, Etagen, Lagerorte. \n        Der Suchparameter `form` ist notwendig um die Suche auf relevante Locations eingrenzen zu können. \n        Bei der Namensgebung des Suchparameters wurde bereits berücksichtigt, \n        dass das durchsuchte Element `physicalType` in FHIR R6 zu `form` umbenannt wurde. \n        Durch die Prä-Adoption der Namensänderung im Suchparameter soll vorausschauend die Migration auf FHIR R6 erleichtert werden\n        und einen Breaking Change in der API verhindern.  \n        Zum Zeitpunkt der Publikation dieses Suchparameters ist für das Element `form` in R6 zwar bereits ein Suchparameter \n        namens `characteristic` definiert. Hier scheint es sich jedoch um eine Verwechslung mit dem gleichnamigen Element zu handeln, \n        weshalb auf die Prä-Adoption dieses Parameters verzichtet wurde. \n        Ein entsprechender Change Request liegt vor: https://jira.hl7.org/browse/FHIR-57431",
  "code" : "form",
  "base" : ["Location"],
  "type" : "token",
  "expression" : "Location.physicalType",
  "xpathUsage" : "normal"
}

```
