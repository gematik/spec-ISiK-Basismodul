# ReanimationBeispiel - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ReanimationBeispiel**

## Procedure: ReanimationBeispiel

Profile: [ISiK Prozedur Reanimation](StructureDefinition-ISiKProzedurReanimation.md)

**ExtensionProzedurDokumentationsdatum**: 2026-04-23

**status**: Completed

**category**: Resuscitation

**code**: Herz-Lungen-Wiederbelebung

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**performed**: 2026-04-23

**note**: 

> 

Reanimationsmaßnahme mit erfolgreichem Ausgang. Dieses Beispiel dient der Abbildung von Reanimationsmaßnahmen - insbesondere in der Akutmedizin.




## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "ReanimationBeispiel",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedurReanimation"]
  },
  "extension" : [{
    "url" : "http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum",
    "valueDateTime" : "2026-04-23"
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "439569004",
      "display" : "Resuscitation"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "version" : "http://snomed.info/sct/11000274103/version/20251115",
      "code" : "89666000",
      "display" : "Kardiopulmonale Reanimation"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2024",
      "code" : "8-771",
      "display" : "Kardiale oder kardiopulmonale Reanimation"
    }],
    "text" : "Herz-Lungen-Wiederbelebung"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "performedDateTime" : "2026-04-23",
  "note" : [{
    "text" : "Reanimationsmaßnahme mit erfolgreichem Ausgang. Dieses Beispiel dient der Abbildung von Reanimationsmaßnahmen - insbesondere in der Akutmedizin."
  }]
}

```
