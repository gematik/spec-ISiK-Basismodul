Profile: ISiKBerichtSubSysteme
Parent: Composition
Id: ISiKBerichtSubSysteme
Description: "Dieses Profil ermöglicht die Krankenhaus-interne Übermittlung eines Berichtes in Form eines Dokumentes, die in ISiK Szenarien von Subsystemen an Primärsysteme gesendet werden."
* ^status = #active
* id 1..
* text 1.. MS
  * status = #extensions (exactly)
  * status MS
  * div MS
* identifier 1..
  * system 1..
  * value 1..
* status = #final (exactly)
* type.coding 1..
  * ^slicing.discriminator[0].type = #pattern
  * ^slicing.discriminator[0].path = "$this"
  * ^slicing.rules = #open
* type.coding contains
    LOINC ..1 and
    KDL ..1 and
    IHE ..1
* type.coding[LOINC] = $loinc#55112-7
* type.coding[LOINC]
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* type.coding[KDL] ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * system 1..
  * system = "http://dvmd.de/fhir/CodeSystem/kdl" (exactly)
  * code 1..
    * obeys kdl-1
* type.coding[IHE] ^patternCoding.system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode"
  * system 1..
  * system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode" (exactly)
  * code 1..
* category.coding ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator[0].path = "$this"
  * ^slicing.rules = #open
* category.coding ^slicing.rules = #open
* category.coding contains
    LOINC ..1 and
    IHE ..1
* category.coding[LOINC].system 1..
* category.coding[LOINC].system = "http://loinc.org" (exactly)
* category.coding[LOINC].code 1..
* category.coding[IHE].system 1..
* category.coding[IHE].system = "http://ihe-d.de/CodeSystems/IHEXDSclassCode" (exactly)
* category.coding[IHE].code 1..
* subject 1.. MS
* subject only Reference(ISiKPatient)
  * reference 1.. MS
* encounter 1.. MS
* encounter only Reference(ISiKKontaktGesundheitseinrichtung)
  * reference 1.. MS
* date MS
* author only Reference(PractitionerRole or Device or Organization or ISiKAngehoeriger or ISiKPatient or ISiKPersonImGesundheitsberuf)
  * display 1.. MS
* title MS
* section 1.. MS
  * title 1.. MS
  * text 1.. MS
  * section MS

