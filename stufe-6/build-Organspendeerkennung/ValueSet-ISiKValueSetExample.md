# TestValueSet - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TestValueSet**

## ValueSet: TestValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/ValueSet/TestValueSet | *Version*:0.0.1-rc |
| Active as of 2026-01-21 | *Computable Name*:TestValueSet |
| **Usage:**Clinical Focus: Encounter | |

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

No formal definition provided for this value set

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKValueSetExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKValueSet"
    ]
  },
  "url" : "http://example.org/fhir/ValueSet/TestValueSet",
  "version" : "0.0.1-rc",
  "name" : "TestValueSet",
  "status" : "active",
  "date" : "2026-01-21T12:07:43+00:00",
  "useContext" : [
    {
      "code" : {
        "system" : "http://terminology.hl7.org/CodeSystem/usage-context-type",
        "code" : "focus"
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://hl7.org/fhir/resource-types",
            "code" : "Encounter"
          }
        ]
      }
    }
  ],
  "expansion" : {
    "timestamp" : "2022-03-30",
    "contains" : [
      {
        "system" : "http://example.org/fhir/CodeSystem/TestKatalog",
        "version" : "1.0.0",
        "code" : "test",
        "display" : "Test"
      }
    ]
  }
}

```
