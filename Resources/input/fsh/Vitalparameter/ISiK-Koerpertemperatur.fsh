Profile: ISiKKoerpertemperatur
Parent: VitalSignDE_Koerpertemperatur
Id: ISiKKoerpertemperatur
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpertemperatur eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der Körpertemperatur ist essenziell für die frühzeitige Erkennung von Infektionen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.

In FHIR wird die Körpertemperatur mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKKoerpertemperatur ist vom Profil [VitalSignDE_Koerpertemperatur](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpertemperatur) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [OObservation Body Temperature Profile](http://hl7.org/fhir/StructureDefinition/bodytemp) aus der FHIR R4 Spezifikation."
* insert Meta
* insert CommonElements
* insert ISiKVitalsignCommons
* insert ISiKVitalsignCommonsValue
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#150364

Instance: ISiKKoerpertemperaturExample
InstanceOf: ISiKKoerpertemperatur
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#8310-5 "Körpertemperatur"
* code.coding[snomed] = $sct#386725007 "Body temperature"
* code.coding[IEEE11073] = $IEEE11073#150364 "MDC_TEMP_BODY"
* code.text = "Körpertemperatur"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2020-10-11"
* performer.reference = "Practitioner/DrMustermann"
* valueQuantity = 36.8 'Cel' "°C"

Instance: ISiKKoerpertemperaturMinExample
InstanceOf: ISiKKoerpertemperatur
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#8310-5 "Körpertemperatur"
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 35.2 'Cel' "°C"

Instance: ISiKKoerpertemperaturMaxExample
InstanceOf: ISiKKoerpertemperatur
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#8310-5 "Körpertemperatur"
* code.coding[snomed] = $sct#386725007 "Body temperature"
* code.coding[IEEE11073] = $IEEE11073#150364 "MDC_TEMP_BODY"
* code.text = "Körpertemperatur - Fiebermessung"
* subject = Reference(PatientinNormal)
* effectiveDateTime = "2024-01-15T20:15:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 41.2 'Cel' "°C"
//TODO: SCT hat kein Konzept für digital Temperatur als Methode, daher hier Digital thermometer (physical object) verwendet
* method = $sct#1461000205102 "Digital thermometer"
* bodySite = $sct#21974007 "Tongue structure"
* interpretation = $v3-ObservationInterpretation#H "High"
* note.text = "Hyperthermie bei schwerer Sepsis - kontinuierliches Monitoring erforderlich"
* device = Reference(ExampleDevice)