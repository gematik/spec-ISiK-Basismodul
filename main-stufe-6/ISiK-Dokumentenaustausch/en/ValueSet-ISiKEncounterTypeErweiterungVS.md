# ISiKEncounterTypeErweiterungVS - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKEncounterTypeErweiterungVS**

## ValueSet: ISiKEncounterTypeErweiterungVS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKEncounterTypeErweiterungVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKEncounterTypeErweiterungVS |

 
ISiK vereint hierbei das ValueSet [KontaktArtDe](http://fhir.de/CodeSystem/kontaktart-de) aus dem deutschen Basisprofil und die übergangsweise hinzugefügten Codes für den ambulanten Kontakt im Krankenhaus. Dieses ValueSet ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen. 

 **References** 

* [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKEncounterTypeErweiterungVS",
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKEncounterTypeErweiterungVS",
  "version" : "6.0.0",
  "name" : "ISiKEncounterTypeErweiterungVS",
  "title" : "ISiKEncounterTypeErweiterungVS",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.gematik.de"
    }]
  }],
  "description" : "ISiK vereint hierbei das ValueSet [KontaktArtDe](http://fhir.de/CodeSystem/kontaktart-de) aus dem deutschen Basisprofil und die übergangsweise hinzugefügten Codes für den ambulanten Kontakt im Krankenhaus. Dieses ValueSet ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen.",
  "compose" : {
    "include" : [{
      "system" : "http://fhir.de/CodeSystem/kontaktart-de",
      "version" : "1.6.0"
    },
    {
      "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKEncounterTypeErweiterungCS"
    }]
  }
}

```
