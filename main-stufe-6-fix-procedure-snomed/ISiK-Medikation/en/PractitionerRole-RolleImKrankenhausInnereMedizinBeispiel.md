# RolleImKrankenhausInnereMedizinBeispiel - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **RolleImKrankenhausInnereMedizinBeispiel**

## PractitionerRole: RolleImKrankenhausInnereMedizinBeispiel

Profile: [ISiKRolleImKrankenhaus](StructureDefinition-ISiKRolleImKrankenhaus.md)

**active**: false

**practitioner**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**organization**: [Organization/KrankenhausOrganisationBeispiel](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Organization/KrankenhausOrganisationBeispiel)

**code**: Assistenzärzt:in

**specialty**: Intensivmedizin



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "RolleImKrankenhausInnereMedizinBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKRolleImKrankenhaus"]
  },
  "active" : false,
  "practitioner" : {
    "reference" : "Practitioner/PractitionerWalterArzt"
  },
  "organization" : {
    "reference" : "Organization/KrankenhausOrganisationBeispiel"
  },
  "code" : [{
    "coding" : [{
      "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_Base_Role_Care",
      "code" : "AA",
      "display" : "Assistenzärzt:in"
    }]
  }],
  "specialty" : [{
    "coding" : [{
      "system" : "http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen",
      "code" : "INTM",
      "display" : "Intensivmedizin"
    },
    {
      "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert",
      "code" : "3600",
      "display" : "Intensivmedizin"
    }]
  }]
}

```
