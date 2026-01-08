#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Medication: 

Medikament als Freitext



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleISiKMedikament6",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament"
    ]
  },
  "code" : {
    "text" : "Enoxaparin-Natrium 40 mg"
  },
  "status" : "active"
}

```
