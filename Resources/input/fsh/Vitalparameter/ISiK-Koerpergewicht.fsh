Profile: ISiKKoerpergewicht
Parent: VitalSignDE_Koerpergewicht
Id: ISiKKoerpergewicht
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über das Körpergewicht eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.

**Motivation**

Die Erfassung und Überwachung des Körpergewichts ist essenziell für die Beurteilung des Ernährungszustands, die Überwachung von Veränderungen im Rahmen der Therapie sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.

In FHIR wird das Körpergewicht mit der Observation-Ressource repräsentiert.

**Kompatibilität**

Das Profil ISiKKoerpergewicht ist vom Profil [VitalSignDE_Koerpergewicht](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergewicht) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Weight Profile](http://hl7.org/fhir/StructureDefinition/bodyweight) aus der FHIR R4 Spezifikation."
* insert Meta
* insert CommonElements
* insert ISiKVitalsignCommons
* insert ISiKVitalsignCommonsValue
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#188736

Instance: ISiKKoerpergewichtExample
InstanceOf: ISiKKoerpergewicht
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.coding[snomed] = $sct#27113001 "Body weight"
* code.coding[IEEE11073] = $IEEE11073#188736 "MDC_MASS_BODY_ACTUAL"
* code.text = "Körpergewicht"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2020-10-11"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 79 'kg' "kilogram"

Instance: ISiKKoerpergewichtMinExample
InstanceOf: ISiKKoerpergewicht
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 2.1 'kg' "kilogram"

Instance: ISiKKoerpergewichtMaxExample
InstanceOf: ISiKKoerpergewicht
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#29463-7 "Body weight"
* code.coding[snomed] = $sct#27113001 "Body weight"
* code.coding[IEEE11073] = $IEEE11073#188736 "MDC_MASS_BODY_ACTUAL"
* code.text = "Körpergewicht - Bettwaage"
* subject = Reference(PatientinNormal)
* effectiveDateTime = "2024-01-15T08:00:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 185 'kg' "kilogram"
* method = $sct#786458005 "Measurement using bed scale"
* bodySite = $sct#38266002 "Entire body as a whole"
* note.text = "Gewichtsmessung mit kalibrierten Bettwaage bei bettlägerigem Patienten"
* device = Reference(ExampleDevice)