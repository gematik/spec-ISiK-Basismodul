Profile: ISiKKoerpergroesse
Parent: VitalSignDE_Koerpergroesse
Id: ISiKKoerpergroesse
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpergröße eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der Körpergröße ist essenziell für die Beurteilung von Wachstumsprozessen, die Berechnung wichtiger Indizes wie des Body-Mass-Index (BMI) sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.

In FHIR wird die Körpergröße mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKKoerpergroesse ist vom Profil [VitalSignDE_Koerpergroesse](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergroesse) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Height Profile](http://hl7.org/fhir/StructureDefinition/bodyheight) aus der FHIR R4 Spezifikation."
* insert Meta
* insert CommonElements
* insert ISiKVitalsignCommons
* insert ISiKVitalsignCommonsValue
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
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 174 'cm' "centimeter"

Instance: ISiKKoerpergroesseMinExample
InstanceOf: ISiKKoerpergroesse
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 48 'cm' "centimeter"

Instance: ISiKKoerpergroesseMaxExample
InstanceOf: ISiKKoerpergroesse
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#8302-2 "Body height"
* code.coding[snomed] = $sct#1153637007 "Body height"
* code.coding[IEEE11073] = $IEEE11073#188740 "MDC_LEN_BODY_ACTUAL"
* code.text = "Körpergröße - Klinische Messung"
* subject = Reference(PatientinNormal)
* effectiveDateTime = "2024-01-15T09:00:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 205 'cm' "centimeter"
* method = $sct#414135002 "Estimated"
* bodySite = $sct#38266002 "Entire body as a whole"
* note.text = "Körpergröße geschätzt aufgrund der Bettlägerigkeit des Patienten"
