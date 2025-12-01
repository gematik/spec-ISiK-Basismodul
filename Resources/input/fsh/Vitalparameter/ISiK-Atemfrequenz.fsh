Profile: ISiKAtemfrequenz
Parent: VitalSignDE_Atemfrequenz
Id: ISiKAtemfrequenz
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Atemfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der Atemfrequenz ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.

In FHIR wird die Atemfrequenz mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKAtemfrequenz ist vom Profil [VitalSignDE_Atemfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-atemfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/resprate) aus der FHIR R4 Spezifikation."
* insert Meta
* insert CommonElements
* insert ISiKVitalsignCommons
* insert ISiKVitalsignCommonsValue
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#151562

Instance: ISiKAtemfrequenzExample
InstanceOf: ISiKAtemfrequenz
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#9279-1 "Respiratory rate"
* code.coding[snomed] = $sct#86290005 "Respiratory rate"
* code.coding[IEEE11073] = $IEEE11073#151562 "MDC_RESP_RATE"
* code.text = "Atemfrequenz"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2019-07-02"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 26 '/min' "Atemzüge pro Minute"

Instance: ISiKAtemfrequenzMinExample
InstanceOf: ISiKAtemfrequenz
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#9279-1 "Respiratory rate"
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 8 '/min' "Atemzüge pro Minute"

Instance: ISiKAtemfrequenzMaxExample
InstanceOf: ISiKAtemfrequenz
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#9279-1 "Respiratory rate"
* code.coding[snomed] = $sct#86290005 "Respiratory rate"
* code.coding[IEEE11073] = $IEEE11073#151562 "MDC_RESP_RATE"
* code.text = "Atemfrequenz - Intensivüberwachung"
* subject = Reference(PatientinNormal)
* effectiveDateTime = "2024-01-15T14:30:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 35 '/min' "Atemzüge pro Minute"
* method = $sct#37931006 "Auscultation"
* bodySite = $sct#181216001 "Entire chest"
* interpretation = $v3-ObservationInterpretation#H "High"
* note.text = "Tachypnoe bei akuter respiratorischer Insuffizienz"