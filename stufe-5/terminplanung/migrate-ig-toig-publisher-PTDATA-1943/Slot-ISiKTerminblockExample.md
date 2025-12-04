#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Slot: 

Profile: [ISiKTerminblock](StructureDefinition-ISiKTerminblock.md)

**schedule**: [Schedule: serviceType = General Practice; specialty = Allgemeinmedizin](Schedule-ISiKKalenderExample.md)

**status**: Busy

**start**: 2022-12-10 09:00:00+0000

**end**: 2022-12-10 11:00:00+0000



## Resource Content

```json
{
  "resourceType" : "Slot",
  "id" : "ISiKTerminblockExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminblock"
    ]
  },
  "schedule" : {
    "reference" : "Schedule/ISiKKalenderExample"
  },
  "status" : "busy",
  "start" : "2022-12-10T09:00:00Z",
  "end" : "2022-12-10T11:00:00Z"
}

```
