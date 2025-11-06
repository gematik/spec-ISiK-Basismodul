Instance: IsikPatientTemplate
InstanceOf: ISiKPatient
Usage: #example
Title: "Template ISiKPatient"
Description: "Template für Template-based Extraction auf Basis des (ISiKPatient)[https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient]-Profils"
* id
  * insert tbeValue([["item.where(linkId = 'resourceId').answer.value"]])
* identifier[VersichertenId]
  * value
    * insert tbeValue([["item.where(linkId = 'versichertenId').answer.value"]])
* identifier[Patientennummer]
  * insert tbeContext([["item.where(linkId = 'patientId')"]])
  * system
    * insert tbeValue([["item.where(linkId = 'patientId-system').answer.value"]])
  * value
    * insert tbeValue([["item.where(linkId = 'patientId-value').answer.value"]])
* active = true
* name[Name]
  * insert tbeContext([["item.where(linkId = 'name')"]])
  * text
    * insert tbeValue([["item.where(linkId = 'given' or linkId = 'family').answer.value.join(' ')"]])
  * family
    * insert tbeValue([["item.where(linkId = 'family').answer.value.first()"]])
  * given[+]
    * insert tbeValue([["item.where(linkId = 'given').answer.value.first()"]])
* telecom
  * insert tbeContext([["item.where(linkId = 'telecom')"]])
  * system 
    * insert tbeValue([["item.where(linkId = 'telecom-system').answer.value"]])
  * value
    * insert tbeValue([["item.where(linkId = 'telecom-value').answer.value"]])
* gender = #unknown
  * insert tbeValue([["item.where(linkId = 'gender').answer.value.first().code"]])
* birthDate
  * insert tbeValue([["item.where(linkId = 'birthDate').answer.value.first()"]])
* address[Strassenanschrift]
  * insert tbeContext([["item.where(linkId = 'address')"]])
  * line[+]
    * insert tbeValue([["item.where(linkId = 'address-line').answer.value"]])
  * city
    * insert tbeValue([["item.where(linkId = 'address-city').answer.value.first()"]])
  * postalCode
    * insert tbeValue([["item.where(linkId = 'address-postalCode').answer.value.first()"]])
  * country = "DE"
    * insert tbeValue([["item.where(linkId = 'address-country').answer.value.first()"]])