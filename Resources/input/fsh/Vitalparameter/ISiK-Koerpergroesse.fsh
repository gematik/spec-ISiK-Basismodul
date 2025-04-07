Profile: ISiKKoerpergroesse
Parent: VitalSignDE_Koerpergroesse
Id: ISiKKoerpergroesse
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpergröße eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der Körpergröße ist essenziell für die Beurteilung von Wachstumsprozessen, die Berechnung wichtiger Indizes wie des Body-Mass-Index (BMI) sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.

In FHIR wird die Körpergröße mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKKoerpergroesse ist vom Profil [VitalSignDE_Koerpergroesse](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergroesse) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Height Profile](http://hl7.org/fhir/StructureDefinition/bodyheight) aus der FHIR R4 Spezifikation."
* insert ISiKVitalsignCommons
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#188740

Instance: ISiKKoerpergroesseExample
InstanceOf: ISiKKoerpergroesse
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.coding[snomed] = $sct#1153637007 "Body height"
* code.text = "Körpergröße"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2020-10-11"
* performer.reference = "Practitioner/DrMustermann"
* valueQuantity = 174 'cm' "centimeter"