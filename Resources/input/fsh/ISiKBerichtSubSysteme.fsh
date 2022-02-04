Profile: ISiKBerichtSubSysteme
Parent: Composition
Id: ISiKBerichtSubSysteme
Description: "Dieses Profil ermöglicht die Krankenhaus-interne Übermittlung eines Berichtes in Form eines Dokumentes, die in ISiK Szenarien von Subsystemen an Primärsysteme gesendet werden."
* insert Meta
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
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains
    LOINC 0..1 and
    KDL 0..1 and
    IHE 0..1
* type.coding[LOINC] = $loinc#55112-7
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
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category.coding contains
    LOINC 0..1 and
    IHE 0..1
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

Instance: CompositionBlutdruck
InstanceOf: ISiKBerichtSubSysteme
Usage: #example
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b> Systolisch</b></td><td><b> Diastolisch</b></td><td><b> Einheit</b></td><td><b> Uhrzeit</b></td></tr><tr><td> \r\n\t\t\t\t\t\t\t140\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t110\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\tmmHG\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t17:15h\r\n\t\t\t\t\t\t</td></tr></table></div>"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:oid:2.16.840.1.113883.6.96"
* status = #final
* type = $loinc#55112-7
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(BeispielKontakt)
* date = "2020-10-19"
* author.type = "Device"
* author.display = "Gerät XY, Fa. Z, Modell T"
* title = "Blutdruckmessung vom 19.10.2020"
* section.title = "Messung"
* section.text.status = #generated
* section.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b> Systolisch</b></td><td><b> Diastolisch</b></td><td><b> Einheit</b></td><td><b> Uhrzeit</b></td></tr><tr><td> \r\n\t\t\t\t\t\t\t140\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t110\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\tmmHG\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t17:15h\r\n\t\t\t\t\t\t</td></tr></table></div>"

Invariant: kdl-1
Description: "KDL-Code ungültig"
Severity: #warning
Expression: "matches('[A-Z]{2}[0-9]{6}')"