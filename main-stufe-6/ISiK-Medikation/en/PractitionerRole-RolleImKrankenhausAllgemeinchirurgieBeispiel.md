# RolleImKrankenhausAllgemeinchirurgieBeispiel - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **RolleImKrankenhausAllgemeinchirurgieBeispiel**

## PractitionerRole: RolleImKrankenhausAllgemeinchirurgieBeispiel

Profile: [ISiKRolleImKrankenhaus](StructureDefinition-ISiKRolleImKrankenhaus.md)

**active**: true

**practitioner**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**organization**: [Organization/AbteilungAllgemeinchirurgieOrganisationBeispiel](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Organization/AbteilungAllgemeinchirurgieOrganisationBeispiel)

**code**: Fachärzt:in

**specialty**: Allgemeinmedizin



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "RolleImKrankenhausAllgemeinchirurgieBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKRolleImKrankenhaus"]
  },
  "active" : true,
  "practitioner" : {
    "reference" : "Practitioner/PractitionerWalterArzt"
  },
  "organization" : {
    "reference" : "Organization/AbteilungAllgemeinchirurgieOrganisationBeispiel"
  },
  "code" : [{
    "coding" : [{
      "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_Base_Role_Care",
      "code" : "FA",
      "display" : "Fachärzt:in"
    }]
  }],
  "specialty" : [{
    "coding" : [{
      "system" : "http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen",
      "code" : "ALLG",
      "display" : "Allgemeinmedizin"
    },
    {
      "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert",
      "code" : "1500",
      "display" : "Allgemeine Chirurgie"
    }]
  }]
}

```
