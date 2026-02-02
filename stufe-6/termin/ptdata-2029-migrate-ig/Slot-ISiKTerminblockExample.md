# Example Slot - ISiKTerminblockExample - ISiK Terminplanung Implementierungsleitfaden v6.0.0-rc

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Slot - ISiKTerminblockExample**

## Example Slot: Example Slot - ISiKTerminblockExample

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
