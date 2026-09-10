# Schwangerschaft Erwarteter Entbindungstermin Methode - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Schwangerschaft Erwarteter Entbindungstermin Methode**

## ValueSet: Schwangerschaft Erwarteter Entbindungstermin Methode 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/SchwangerschaftEtMethodeVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:SchwangerschaftEtMethodeVS |

 
Dieses Valueset enthält die Codes zur Beschreibung der Methode zur Bestimmung des erwarteten Entbindungstermins bei einer Schwangerschaft. 

 **References** 

* [ISiK Schwangerschaft - Erwarteter Entbindungstermin](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "SchwangerschaftEtMethodeVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/SchwangerschaftEtMethodeVS",
  "version" : "6.0.0",
  "name" : "SchwangerschaftEtMethodeVS",
  "title" : "Schwangerschaft Erwarteter Entbindungstermin Methode",
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
  "description" : "Dieses Valueset enthält die Codes zur Beschreibung der Methode zur Bestimmung des erwarteten Entbindungstermins bei einer Schwangerschaft.",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "11778-8",
        "display" : "Delivery date Estimated"
      },
      {
        "code" : "53692-0",
        "display" : "Delivery date Estimated from conception date"
      },
      {
        "code" : "11780-4",
        "display" : "Delivery date Estimated from ovulation date"
      },
      {
        "code" : "57063-0",
        "display" : "Delivery date Estimated from quickening date"
      },
      {
        "code" : "11779-6",
        "display" : "Entbindungstermin, geschätzt aus der letzten Menstruationsperiode"
      },
      {
        "code" : "11781-2",
        "display" : "Delivery date US composite estimate"
      },
      {
        "code" : "57064-8",
        "display" : "Delivery date Estimated from date fundal height reaches umb"
      },
      {
        "code" : "90368-2",
        "display" : "Delivery date Estimated from physical exam"
      }]
    }]
  }
}

```
