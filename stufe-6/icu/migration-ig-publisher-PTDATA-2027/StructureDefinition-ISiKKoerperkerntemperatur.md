# ISiKKoerperkerntemperatur - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKKoerperkerntemperatur**

## Resource Profile: ISiKKoerperkerntemperatur 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerperkerntemperatur | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKKoerperkerntemperatur |

 
Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körperkerntemperatur eines Patienten im Rahmen der interoperablen Kommunikation gemäß den ISiK Vorgaben.
 Dieses Profil repräsentiert sowohl direkte als auch indirekte Messungen der Körperkerntemperatur. 

### Motivation

 
Die Erfassung und Überwachung der Körpertemperatur ist essenziell für die frühzeitige Erkennung von Infektionen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung. In FHIR wird die Körpertemperatur mit der Observation-Ressource repräsentiert. 

### Kompatibilität

 
Das Profil ISiKKoerperkerntemperatur ist vom Profil [VitalSignDE_Koerpertemperatur](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpertemperatur) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [OObservation Body Temperature Profile](http://hl7.org/fhir/StructureDefinition/bodytemp) aus der FHIR R4 Spezifikation. 

**Usages:**

* Derived from this Profile: [SD MII ICU Koerpertemperatur Achsel](StructureDefinition-sd-mii-icu-koerpertemperatur-achsel.md), [SD MII ICU Koerpertemperatur Blut](StructureDefinition-sd-mii-icu-koerpertemperatur-blut.md), [SD MII ICU Koerpertemperatur Harnblase](StructureDefinition-sd-mii-icu-koerpertemperatur-harnblase.md), [SD MII ICU Koerpertemperatur Kern](StructureDefinition-sd-mii-icu-koerpertemperatur-kern.md)... Show 6 more, [SD MII ICU Koerpertemperatur Leiste](StructureDefinition-sd-mii-icu-koerpertemperatur-leiste.md), [SD MII ICU Koerpertemperatur rektal](StructureDefinition-sd-mii-icu-koerpertemperatur-rektal.md), [SD MII ICU Koerpertemperatur Speiseroehre](StructureDefinition-sd-mii-icu-koerpertemperatur-speiseroehre.md), [SD MII ICU Koerpertemperatur Trommelfell](StructureDefinition-sd-mii-icu-koerpertemperatur-trommelfell.md), [SD MII ICU Koerpertemperatur unter der Zunge](StructureDefinition-sd-mii-icu-koerpertemperatur-unter-der-zunge.md) and [SD MII ICU Koerpertemperatur vaginal](StructureDefinition-sd-mii-icu-koerpertemperatur-vaginal.md)
* Examples for this Profile: [Observation/ISiKKoerperkerntemperaturExample](Observation-ISiKKoerperkerntemperaturExample.md), [Observation/ISiKKoerperkerntemperaturMaxExample](Observation-ISiKKoerperkerntemperaturMaxExample.md) and [Observation/ISiKKoerperkerntemperaturMinExample](Observation-ISiKKoerperkerntemperaturMinExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ICU|current/StructureDefinition/ISiKKoerperkerntemperatur)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKKoerperkerntemperatur.csv), [Excel](StructureDefinition-ISiKKoerperkerntemperatur.xlsx), [Schematron](StructureDefinition-ISiKKoerperkerntemperatur.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKKoerperkerntemperatur",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerperkerntemperatur",
  "version" : "6.0.0-rc",
  "name" : "ISiKKoerperkerntemperatur",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körperkerntemperatur eines Patienten im Rahmen der interoperablen Kommunikation gemäß den ISiK Vorgaben.  \nDieses Profil repräsentiert sowohl direkte als auch indirekte Messungen der Körperkerntemperatur.\n### Motivation\nDie Erfassung und Überwachung der Körpertemperatur ist essenziell für die frühzeitige Erkennung von Infektionen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.\nIn FHIR wird die Körpertemperatur mit der Observation-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKKoerperkerntemperatur ist vom Profil [VitalSignDE_Koerpertemperatur](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpertemperatur) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [OObservation Body Temperature Profile](http://hl7.org/fhir/StructureDefinition/bodytemp) aus der FHIR R4 Spezifikation.",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpertemperatur",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "min" : 2
      },
      {
        "id" : "Observation.code.coding:snomed",
        "path" : "Observation.code.coding",
        "sliceName" : "snomed",
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKKernTempSctVS"
        }
      },
      {
        "id" : "Observation.code.coding:coretemp-IEEE11073",
        "path" : "Observation.code.coding",
        "sliceName" : "coretemp-IEEE11073",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101",
          "code" : "150368"
        }
      },
      {
        "id" : "Observation.code.coding:coretemp-loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "coretemp-loinc",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "8329-5"
        }
      },
      {
        "id" : "Observation.code.coding:specific-loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "specific-loinc",
        "min" : 0,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKSpecificKernTempLoincVS"
        }
      }
    ]
  }
}

```
