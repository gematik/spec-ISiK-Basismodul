# AppointmentReplaces - ISiK Terminplanung Implementierungsleitfaden v6.0.0-rc

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AppointmentReplaces**

## Extension: AppointmentReplaces 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.org/fhir/5.0/StructureDefinition/extension-Appointment.replaces | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:AppointmentReplaces |

Mit dieser Erweiterung kann eine neue Appointment-Ressource auf eine frühere, ersetzte Appointment-Ressource verweisen, z. B. bei einer Terminverschiebung oder -umbuchung. Dies erleichtert die Nachverfolgung von Terminänderungen und stellt sicher, dass der Zusammenhang zwischen ursprünglichem und aktuellem Termin eindeutig dokumentiert ist.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Appointment

**Usage info**

**Usages:**

* Use this Extension: [ISiKTermin](StructureDefinition-ISiKTermin.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/terminplanung|current/StructureDefinition/AppointmentReplaces)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-AppointmentReplaces.csv), [Excel](StructureDefinition-AppointmentReplaces.xlsx), [Schematron](StructureDefinition-AppointmentReplaces.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "AppointmentReplaces",
  "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Appointment.replaces",
  "version" : "6.0.0-rc",
  "name" : "AppointmentReplaces",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "Mit dieser Erweiterung kann eine neue Appointment-Ressource auf eine frühere, ersetzte Appointment-Ressource verweisen, z. B. bei einer Terminverschiebung oder -umbuchung. Dies erleichtert die Nachverfolgung von Terminänderungen und stellt sicher, dass der Zusammenhang zwischen ursprünglichem und aktuellem Termin eindeutig dokumentiert ist.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Appointment"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Appointment.replaces"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Appointment"]
          }
        ]
      }
    ]
  }
}

```
