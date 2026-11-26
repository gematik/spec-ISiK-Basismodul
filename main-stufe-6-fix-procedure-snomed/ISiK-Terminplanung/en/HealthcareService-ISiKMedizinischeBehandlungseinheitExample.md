# Allgemeine Beratungsstelle der Fachabteilung 0100 - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Allgemeine Beratungsstelle der Fachabteilung 0100**

## HealthcareService: Allgemeine Beratungsstelle der Fachabteilung 0100

Profile: [ISiKMedizinischeBehandlungseinheit](StructureDefinition-ISiKMedizinischeBehandlungseinheit.md)

**active**: true

**type**: General Practice

**specialty**: Allgemeinmedizin

**name**: Allgemeine Beratungsstelle der Fachabteilung 0100



## Resource Content

```json
{
  "resourceType" : "HealthcareService",
  "id" : "ISiKMedizinischeBehandlungseinheitExample",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKMedizinischeBehandlungseinheit"]
  },
  "active" : true,
  "type" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/service-type",
      "code" : "124"
    }]
  }],
  "specialty" : [{
    "coding" : [{
      "system" : "http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen",
      "code" : "ALLG"
    }]
  }],
  "name" : "Allgemeine Beratungsstelle der Fachabteilung 0100"
}

```
