# Allgemeinchirurgie - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Allgemeinchirurgie**

## Organization: Allgemeinchirurgie

Profile: [ISiKOrganisationFachabteilung](StructureDefinition-ISiKOrganisationFachabteilung.md)

**identifier**: Ward/FA-CHIR-01, `https://gematik.de/fhir/sid/telematik-id`/15-Hello-World-CHIR

**type**: Hospital Department, Allgemeine Chirurgie

**name**: Allgemeinchirurgie

**partOf**: [Organization Uniklinik Entenhausen](Organization-KrankenhausOrganisationBeispiel.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "AbteilungAllgemeinchirurgieOrganisationBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung"]
  },
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "225746001"
      }]
    },
    "system" : "https://fhir.krankenhaus.example/sid/OrgaID",
    "value" : "FA-CHIR-01"
  },
  {
    "system" : "https://gematik.de/fhir/sid/telematik-id",
    "value" : "15-Hello-World-CHIR"
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
      "code" : "1500",
      "display" : "Allgemeine Chirurgie"
    }]
  }],
  "name" : "Allgemeinchirurgie",
  "partOf" : {
    "reference" : "Organization/KrankenhausOrganisationBeispiel"
  }
}

```
