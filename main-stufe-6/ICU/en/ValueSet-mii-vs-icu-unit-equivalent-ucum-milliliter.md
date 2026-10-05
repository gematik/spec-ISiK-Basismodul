# MII VS ICU Unit equivalent UCUM milliliter - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS ICU Unit equivalent UCUM milliliter**

## ValueSet: MII VS ICU Unit equivalent UCUM milliliter 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-unit-equivalent-ucum-milliliter | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Unit_equivalent_UCUM_milliliter |

 
Dieses ValueSet enthält äquivalente Codes für Milliliter. 

 **References** 

* [MII PR ICU Bilanz Ausfuhr Blutverlust](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-blutverlust.md)
* [MII PR ICU Bilanz Ausfuhr Drainage Generisch](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-drainage-generisch.md)
* [MII PR ICU Bilanz Ausfuhr Fluessigkeit Gesamt](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-fluessigkeit-gesamt.md)
* [MII PR ICU Bilanz Ausfuhr Gallenfluessigkeit](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit.md)
* [MII PR ICU Bilanz Ausfuhr Haemofiltration Einzelmesswerte](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-haemofiltration-einzelmesswerte.md)
* [MII PR ICU Bilanz Ausfuhr Magensonde](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-magensonde.md)
* [MII PR ICU Bilanz Ausfuhr OP Drainage](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-op-drainage.md)
* [MII PR ICU Bilanz Ausfuhr Pankreasdrainage](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-pankreasdrainage.md)
* [MII PR ICU Bilanz Ausfuhr Stuhlgang](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-stuhlgang.md)
* [MII PR ICU Bilanz Ausfuhr Urin](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-urin.md)
* [MII PR ICU Bilanz Ausfuhr Wunddrainage](StructureDefinition-mii-pr-icu-bilanz-ausfuhr-wunddrainage.md)
* [MII PR ICU Bilanz Einfuhr Abgepumpte Muttermilch](StructureDefinition-mii-pr-icu-bilanz-einfuhr-abgepumpte-muttermilch.md)
* [MII PR ICU Bilanz Einfuhr Enterale Fluessigkeit](StructureDefinition-mii-pr-icu-bilanz-einfuhr-enterale-fluessigkeit.md)
* [MII PR ICU Bilanz Einfuhr Fluessigkeit Gesamt](StructureDefinition-mii-pr-icu-bilanz-einfuhr-fluessigkeit-gesamt.md)
* [MII PR ICU Bilanz Einfuhr Muttermilch](StructureDefinition-mii-pr-icu-bilanz-einfuhr-muttermilch.md)
* [MII PR ICU Bilanz Einfuhr Orale Fluessigkeit](StructureDefinition-mii-pr-icu-bilanz-einfuhr-orale-fluessigkeit.md)
* [MII PR ICU Bilanz Einfuhr Saeuglingsnahrung](StructureDefinition-mii-pr-icu-bilanz-einfuhr-saeuglingsnahrung.md)
* [MII PR ICU Bilanz Einfuhr Spendermilch](StructureDefinition-mii-pr-icu-bilanz-einfuhr-spendermilch.md)
* [MII PR ICU Bilanz Tagesbilanz Fluessigkeit](StructureDefinition-mii-pr-icu-bilanz-tagesbilanz-fluessigkeit.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-unit-equivalent-ucum-milliliter",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-unit-equivalent-ucum-milliliter",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Unit_equivalent_UCUM_milliliter",
  "title" : "MII VS ICU Unit equivalent UCUM milliliter",
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
  "description" : "Dieses ValueSet enthält äquivalente Codes für Milliliter.",
  "compose" : {
    "include" : [{
      "system" : "http://unitsofmeasure.org",
      "concept" : [{
        "code" : "mL"
      },
      {
        "code" : "ml"
      }]
    }]
  }
}

```
