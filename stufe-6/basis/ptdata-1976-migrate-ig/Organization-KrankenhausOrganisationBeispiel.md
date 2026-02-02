# Uniklinik Entenhausen - Basis Implementation Guide v6.0.0-rc

Basis Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Uniklinik Entenhausen**

## Example Organization: Uniklinik Entenhausen

Profile: [ISiKOrganisation](StructureDefinition-ISiKOrganisation.md)

**identifier**: ArgeIkIknr/260120196, `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR`/345678975, `https://gematik.de/fhir/sid/telematik-id`/1234567890

**name**: Uniklinik Entenhausen



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "KrankenhausOrganisationBeispiel",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisation"
    ]
  },
  "identifier" : [
    {
      "system" : "http://fhir.de/sid/arge-ik/iknr",
      "value" : "260120196"
    },
    {
      "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR",
      "value" : "345678975"
    },
    {
      "system" : "https://gematik.de/fhir/sid/telematik-id",
      "value" : "1234567890"
    }
  ],
  "name" : "Uniklinik Entenhausen"
}

```
