# ISiKKalenderExample - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKKalenderExample**

## Schedule: ISiKKalenderExample

Profile: [ISiKKalender](StructureDefinition-ISiKKalender.md)

**active**: true

**serviceType**: General Practice

**specialty**: Allgemeinmedizin

**actor**: [Dr. Fleming](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/example)



## Resource Content

```json
{
  "resourceType" : "Schedule",
  "id" : "ISiKKalenderExample",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKKalender"]
  },
  "active" : true,
  "serviceType" : [{
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
  "actor" : [{
    "reference" : "Practitioner/example",
    "display" : "Dr. Fleming"
  }]
}

```
