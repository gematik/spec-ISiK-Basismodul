Profile: ISiKKopfumfang
Parent: VitalSignDE_Kopfumfang
Id: ISiKKopfumfang
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Kopfumfang eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung des Kopfumfangs ist essenziell für die Beurteilung von Wachstumsprozessen, insbesondere bei Säuglingen und Kleinkindern, sowie für die frühzeitige Erkennung von Entwicklungsauffälligkeiten oder neurologischen Erkrankungen.

In FHIR wird der Kopfumfang mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKKopfumfang ist vom Profil [VitalSignDE_Kopfumfang](http://fhir.de/StructureDefinition/observation-de-vitalsign-kopfumfang) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Head Circumference Profile](
http://hl7.org/fhir/StructureDefinition/headcircum) aus der FHIR R4 Spezifikation."
* insert Meta
* insert CommonElements
* insert ISiKVitalsignCommons
* insert ISiKVitalsignCommonsValue
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#153856
* valueQuantity.code = #cm

Instance: ISiKKopfumfangExample
InstanceOf: ISiKKopfumfang
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#9843-4 "Kopfumfang okzipital-frontal"
* code.coding[snomed] = $sct#363812007 "Head circumference"
* code.coding[IEEE11073] = $IEEE11073#153856 "MDC_CIRCUM_HEAD"
* code.text = "Kopfumfang"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2019-07-02"
* performer.reference = "Practitioner/DrMustermann"
* valueQuantity = 38 'cm' "Centimeter"
 
Instance: ISiKKopfumfangMinExample
InstanceOf: ISiKKopfumfang
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#9843-4 "Kopfumfang okzipital-frontal"
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 32.5 'cm' "Centimeter"

Instance: ISiKKopfumfangMaxExample
InstanceOf: ISiKKopfumfang
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#9843-4 "Kopfumfang okzipital-frontal"
* code.coding[snomed] = $sct#363812007 "Head circumference"
* code.coding[IEEE11073] = $IEEE11073#153856 "MDC_CIRCUM_HEAD"
* code.text = "Kopfumfang - Pädiatrische Verlaufskontrolle"
* subject = Reference(PatientinNormal)
* effectiveDateTime = "2024-01-15T11:00:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* valueQuantity = 60.5 'cm' "Centimeter"
//TODO: SCT hat kein Konzept für Messband als Methode, daher hier Measuring tape (physical object) verwendet
* method = $sct#51791000 "Measuring tape"
* bodySite = $sct#69536005 "Head structure"
* interpretation = $v3-ObservationInterpretation#N "Normal"
* note.text = "Kopfumfang im normalen Bereich für Alter und Geschlecht - Wachstumsperzentile P50"