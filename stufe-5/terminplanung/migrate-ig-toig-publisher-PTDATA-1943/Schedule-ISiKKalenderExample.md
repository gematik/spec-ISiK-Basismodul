#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Schedule: 

Profile: [ISiKKalender](StructureDefinition-ISiKKalender.md)

**active**: true

**serviceType**: General Practice

**specialty**: Allgemeinmedizin

**actor**: [Dr. Fleming](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/example)



## Resource Content

```json
{
  "resourceType" : "Schedule",
  "id" : "ISiKKalenderExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKalender"
    ]
  },
  "active" : true,
  "serviceType" : [
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
  "actor" : [
    {
      "reference" : "Practitioner/example",
      "display" : "Dr. Fleming"
    }
  ]
}

```
