# Klinik für Intensivmedizin und Anästhesiologie - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Klinik für Intensivmedizin und Anästhesiologie**

## Organization: Klinik für Intensivmedizin und Anästhesiologie

Profile: [ISiKOrganisation](StructureDefinition-ISiKOrganisation.md)

**identifier**: ArgeIkIknr/260120196, `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR`/345678975

**type**: Hospital Department, Intensivmedizin

**name**: Klinik für Intensivmedizin und Anästhesiologie

**partOf**: [Organization Uniklinik Entenhausen](Organization-KrankenhausOrganisationBeispiel.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "KlinikIntensivAnaesthesieOrganisationBeispiel",
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
      "code" : "3600",
      "display" : "Intensivmedizin"
    }]
  }],
  "name" : "Klinik für Intensivmedizin und Anästhesiologie",
  "partOf" : {
    "reference" : "Organization/KrankenhausOrganisationBeispiel"
  }
}

```
