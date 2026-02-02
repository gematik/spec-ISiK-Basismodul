# ObservationCodesSerumkreatinin - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesSerumkreatinin**

## ValueSet: ObservationCodesSerumkreatinin 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesSerumkreatinin | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ObservationCodesSerumkreatinin |

 
Enthält LOINC-Codes für die Observation Serumkreatinin 

 **References** 

* [ISiKLaboruntersuchungSerumkreatinin](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.md)

### Logical Definition (CLD)

 

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
  "id" : "ObservationCodesSerumkreatinin",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesSerumkreatinin",
  "version" : "6.0.0-rc",
  "name" : "ObservationCodesSerumkreatinin",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Enthält LOINC-Codes für die Observation Serumkreatinin",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "39802-4",
            "display" : "Creatinin in Dialyseflüssigkeit/Creatinin in Serum oder Plasma"
          },
          {
            "code" : "70266-2",
            "display" : "Creatinin in Peritonealflüssigkeit/Creatinin in Serum"
          },
          {
            "code" : "70264-7",
            "display" : "Creatinin in Pleuraflüssigkeit/Creatinin in Serum"
          },
          {
            "code" : "2160-0",
            "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma"
          },
          {
            "code" : "14682-9",
            "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma"
          },
          {
            "code" : "40248-7",
            "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --Basislinie"
          },
          {
            "code" : "40264-4",
            "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --Basislinie"
          },
          {
            "code" : "44784-7",
            "display" : "Creatinin [Masse/Volumen] (Maximalwert während der Untersuchung) in Serum oder Plasma"
          },
          {
            "code" : "11042-9",
            "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --vor Dialyse"
          },
          {
            "code" : "51619-5",
            "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --vor Dialyse"
          },
          {
            "code" : "40112-5",
            "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --vor XXX Stimulation"
          },
          {
            "code" : "11041-1",
            "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --nach Dialyse"
          },
          {
            "code" : "72271-0",
            "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --vor Kontrastmittelgabe"
          },
          {
            "code" : "77140-2",
            "display" : "Creatinin [Mol/Volumen] in Serum, Plasma oder Blut"
          },
          {
            "code" : "40116-6",
            "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --30 Minuten vor XXX Stimulation"
          },
          {
            "code" : "2164-2",
            "display" : "Creatinin-Clearance renal in 24-Stunden-Urin und Serum oder Plasma"
          },
          {
            "code" : "40250-3",
            "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --1 Stunde nach XXX Stimulation"
          },
          {
            "code" : "40254-5",
            "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --2,5 Stunden nach XXX Stimulation"
          },
          {
            "code" : "40252-9",
            "display" : "Creatinin [Masse/Volumen] in Serum oder Plasma --2 Stunden nach XXX Stimulation"
          },
          {
            "code" : "26752-6",
            "display" : "Creatinin-Clearance renal in 2-Stunden-Urin und Serum oder Plasma"
          },
          {
            "code" : "40267-7",
            "display" : "Creatinin [Mol/Volumen] in Serum oder Plasma --1,5 Stunden nach XXX Stimulation"
          }
        ]
      }
    ]
  }
}

```
