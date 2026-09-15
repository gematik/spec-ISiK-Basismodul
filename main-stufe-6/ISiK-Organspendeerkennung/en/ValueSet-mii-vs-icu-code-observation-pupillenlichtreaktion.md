# MII VS ICU Code Observation Pupillenlichtreaktion - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **MII VS ICU Code Observation Pupillenlichtreaktion**

## ValueSet: MII VS ICU Code Observation Pupillenlichtreaktion 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-pupillenlichtreaktion | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Code_Observation_Pupillenlichtreaktion |

 
Subset der LOINC AnswerList LL3762-3 fuer die Pupillen-Lichtreaktion: reaktiv, traege reaktiv, nicht reaktiv. 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Code_Observation_Pupillenlichtreaktion.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026 

 **References** 

* [MII PR ICU Untersuchung Pupillenlichtreaktion Direkt](StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt.md)
* [MII PR ICU Untersuchung Pupillenlichtreaktion Indirekt](StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-indirekt.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-code-observation-pupillenlichtreaktion",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-pupillenlichtreaktion",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Code_Observation_Pupillenlichtreaktion",
  "title" : "MII VS ICU Code Observation Pupillenlichtreaktion",
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
  "description" : "Subset der LOINC AnswerList LL3762-3 fuer die Pupillen-Lichtreaktion: reaktiv, traege reaktiv, nicht reaktiv.\n\nDie Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Code_Observation_Pupillenlichtreaktion.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "LA25441-9",
        "display" : "Reactive to light"
      },
      {
        "code" : "LA24899-9",
        "display" : "Sluggishly reactive to light"
      },
      {
        "code" : "LA25442-7",
        "display" : "Not reactive to light"
      }]
    }]
  }
}

```
