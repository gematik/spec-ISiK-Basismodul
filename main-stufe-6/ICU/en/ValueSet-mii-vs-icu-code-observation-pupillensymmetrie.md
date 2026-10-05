# MII VS ICU Code Observation Pupillensymmetrie - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS ICU Code Observation Pupillensymmetrie**

## ValueSet: MII VS ICU Code Observation Pupillensymmetrie 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-pupillensymmetrie | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Code_Observation_Pupillensymmetrie |

 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Code_Observation_Pupillenlichtreaktion.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026 

 **References** 

* [MII PR ICU Untersuchung Pupillensymmetrie](StructureDefinition-mii-pr-icu-untersuchung-pupillensymmetrie.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-code-observation-pupillensymmetrie",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-pupillensymmetrie",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Code_Observation_Pupillensymmetrie",
  "title" : "MII VS ICU Code Observation Pupillensymmetrie",
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
  "description" : "Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Code_Observation_Pupillenlichtreaktion.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "301943000",
        "display" : "Pupils equal (finding)"
      },
      {
        "code" : "13045009",
        "display" : "Anisocoria (disorder)"
      }]
    }]
  }
}

```
