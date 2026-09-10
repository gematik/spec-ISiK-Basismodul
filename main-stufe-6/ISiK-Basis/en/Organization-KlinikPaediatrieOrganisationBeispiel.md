# Klinik Pädiatrie - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Klinik Pädiatrie**

## Organization: Klinik Pädiatrie

Profile: [ISiKOrganisation](StructureDefinition-ISiKOrganisation.md)

**identifier**: ArgeIkIknr/260120196, `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR`/345678975

**type**: Hospital Department, Pädiatrie

**name**: Klinik Pädiatrie

**partOf**: [Organization Uniklinik Entenhausen](Organization-KrankenhausOrganisationBeispiel.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "KlinikPaediatrieOrganisationBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisation"]
  },
  "identifier" : [{
    "system" : "http://fhir.de/sid/arge-ik/iknr",
    "value" : "260120196"
  },
  {
    "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR",
    "value" : "345678975"
  }],
  "type" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/organization-type",
      "code" : "dept"
    }]
  },
  {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert",
      "code" : "1000",
      "display" : "Pädiatrie"
    }]
  }],
  "name" : "Klinik Pädiatrie",
  "partOf" : {
    "reference" : "Organization/KrankenhausOrganisationBeispiel"
  }
}

```
