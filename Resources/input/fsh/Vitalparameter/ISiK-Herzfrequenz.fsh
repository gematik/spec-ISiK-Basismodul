Profile: ISiKHerzfrequenz
Parent: VitalSignDE_Herzfrequenz
Id: ISiKHerzfrequenz
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Herzfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der Herzfrequenz ist essenziell für die frühzeitige Erkennung von Herz-Kreislauf-Problemen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.

In FHIR wird die Herzfrequenz mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKHerzfrequenz ist vom Profil [VitalSignDE_Herzfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-herzfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/heartrate) aus der FHIR R4 Spezifikation."
* insert Meta
* insert CommonElements
* insert ISiKVitalsignCommons
* insert ISiKVitalsignCommonsValue
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#147842

Instance: ISiKHerzfrequenzExample
InstanceOf: ISiKHerzfrequenz
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.coding[snomed] = $sct#364075005 "Heart rate"
* code.coding[IEEE11073] = $IEEE11073#147842 "MDC_ECG_HEART_RATE"
* code.text = "Herzfrequenz"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2020-10-11"
* performer.reference = "Practitioner/DrMustermann"
* valueQuantity = 63 '/min' "per minute"

Instance: ISiKHerzfrequenzMinExample
InstanceOf: ISiKHerzfrequenz
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 45 '/min' "per minute"

Instance: ISiKHerzfrequenzMaxExample
InstanceOf: ISiKHerzfrequenz
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#8867-4 "Heart rate"
* code.coding[snomed] = $sct#364075005 "Heart rate"
* code.coding[IEEE11073] = $IEEE11073#147842 "MDC_ECG_HEART_RATE"
* code.text = "Herzfrequenz - EKG-Monitoring"
* subject = Reference(PatientinNormal)
* effectiveDateTime = "2024-01-15T14:30:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 180 '/min' "per minute"
* method = $sct#268400002 "12 lead electrocardiogram"
* bodySite = $sct#80891009 "Heart structure"
* interpretation = $v3-ObservationInterpretation#H "High"
* note.text = "Supraventrikuläre Tachykardie bei akuter Belastung"
* device = Reference(ExampleDevice)