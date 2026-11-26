# Erweiterung von Encounter.type in ISiK - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Erweiterung von Encounter.type in ISiK**

## CodeSystem: Erweiterung von Encounter.type in ISiK 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CodeSystem/ISiKEncounterTypeErweiterungCS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKEncounterTypeErweiterung |

 
ISiK definiert an dieser Stelle eigene Encounter Typen. Dieses CodeSystem ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen. 

This Code system is referenced in the definition of the following value sets:

* [ISiKEncounterTypeErweiterungVS](ValueSet-ISiKEncounterTypeErweiterungVS.md)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ISiKEncounterTypeErweiterungCS",
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/CodeSystem/ISiKEncounterTypeErweiterungCS",
  "version" : "6.0.0",
  "name" : "ISiKEncounterTypeErweiterung",
  "title" : "Erweiterung von Encounter.type in ISiK",
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
  "description" : "ISiK definiert an dieser Stelle eigene Encounter Typen. Dieses CodeSystem ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "ambulant",
    "display" : "Ambulanter Kontakt"
  },
  {
    "code" : "virtuell",
    "display" : "Virtueller Kontakt"
  }]
}

```
