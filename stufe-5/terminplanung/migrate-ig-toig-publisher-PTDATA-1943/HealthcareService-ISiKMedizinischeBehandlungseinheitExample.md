# Allgemeine Beratungsstelle der Fachabteilung 0100 - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
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
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedizinischeBehandlungseinheit"
    ]
  },
  "active" : true,
  "type" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/service-type",
          "code" : "124"
        }
      ]
    }
  ],
  "specialty" : [
    {
      "coding" : [
        {
          "system" : "http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen",
          "code" : "ALLG"
        }
      ]
    }
  ],
  "name" : "Allgemeine Beratungsstelle der Fachabteilung 0100"
}

```
