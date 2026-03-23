Profile: ISiKKoerperkerntemperatur
Parent: ISiKKoerpertemperatur
Id: ISiKKoerperkerntemperatur
Description: """Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körperkerntemperatur eines Patienten im Rahmen der interoperablen Kommunikation gemäß den ISiK Vorgaben.  
Dieses Profil repräsentiert sowohl direkte als auch indirekte Messungen der Körperkerntemperatur.

### **Motivation**

Die Erfassung und Überwachung der Körpertemperatur ist essenziell für die frühzeitige Erkennung von Infektionen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.
In FHIR wird die Körpertemperatur mit der Observation-Ressource repräsentiert.

### **Kompatibilität**

Das Profil ISiKKoerperkerntemperatur ist vom Profil [VitalSignDE_Koerpertemperatur](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpertemperatur) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [OObservation Body Temperature Profile](http://hl7.org/fhir/StructureDefinition/bodytemp) aus der FHIR R4 Spezifikation."""
* insert Meta
* insert CommonElements
* insert Quantity-MS
* code
  * coding contains 
    coretemp-IEEE11073 0..1 and
    coretemp-loinc 1..1 and
    specific-loinc 0..1 
  * coding[coretemp-IEEE11073] = $IEEE11073#150368 // "MDC_TEMP_CORE"
  * coding[coretemp-loinc] = $loinc#8329-5
  * coding[snomed] from ISiKKernTempSctVS
  * coding[specific-loinc] from ISiKSpecificKernTempLoincVS

Instance: ISiKKoerperkerntemperaturExample
InstanceOf: ISiKKoerperkerntemperatur
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[coretemp-loinc] = $loinc#8329-5 "Body temperature - Core"
* code.coding[snomed] = $sct#276885007 "Core body temperature"
* code.coding[coretemp-IEEE11073] = $IEEE11073#150368 "MDC_TEMP_CORE"
* code.text = "Körpertemperatur"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2020-10-11"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 36.8 'Cel' "°C"

Instance: ISiKKoerperkerntemperaturMinExample
InstanceOf: ISiKKoerperkerntemperatur
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[coretemp-loinc] = $loinc#8329-5 "Body temperature - Core"
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 34.5 'Cel' "°C"

Instance: ISiKKoerperkerntemperaturMaxExample
InstanceOf: ISiKKoerperkerntemperatur
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code.coding[coretemp-loinc] = $loinc#8329-5 "Body temperature - Core"
* code.coding[snomed] = $sct#276885007 "Core body temperature"
* code.coding[coretemp-IEEE11073] = $IEEE11073#150368 "MDC_TEMP_CORE"
* code.text = "Körperkerntemperatur - Intensivmonitoring"
* subject = Reference(PatientinNormal)
* effectiveDateTime = "2024-01-15T16:45:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 42.5 'Cel' "°C"
* method = $sct#448169003 "Digital thermometry"
* bodySite = $sct#245544008 "Entire esophagus"
* interpretation = $v3-ObservationInterpretation#H "High"
* note.text = "Hyperthermie - Ösophageale Kerntemperaturmessung bei maligner Hyperthermie"
* device = Reference(ExampleDevice)