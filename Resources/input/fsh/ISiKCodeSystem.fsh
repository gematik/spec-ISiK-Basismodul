Profile: ISiKCodeSystem
Parent: CodeSystem
Id: ISiKCodeSystem
Description: "Dieses Profil beschreibt die maschinenlesbare Repräsentation von system-sepzifischen Kodierungen in ISiK-Szenarien"
* insert Meta
* meta MS
  * tag 1..* MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * tag contains Context 1..* MS
  * tag[Context] from http://hl7.org/fhir/ValueSet/resource-types (required)
* id 1.. MS
* url 1.. MS
* version 1.. MS
* name 1.. MS
* status MS
* content MS
* concept 1.. MS
  * code MS
  * display 1.. MS