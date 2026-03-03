Profile: ISiKGCS
Parent: ScoreDE_GCS
Id: ISiKGCS
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Glasgow Coma Scale (GCS) Score eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.

### Motivation
Die Erfassung und Überwachung des Bewusstseinszustands anhand des GCS ist essenziell für die Beurteilung neurologischer Funktionen, die Überwachung von Patienten mit Schädel-Hirn-Trauma oder anderen neurologischen Erkrankungen sowie die Unterstützung klinischer Entscheidungen.

In FHIR wird der GCS-Score mit der Observation-Ressource repräsentiert, wobei die einzelnen Komponenten der Skala - Augenöffnung, verbale Reaktion und motorische Reaktion - als Component-Elemente abgebildet werden.
### Kompatibilität
Das Profil ISiKGCS ist vom Profil [ScoreDE_GCS](http://fhir.de/StructureDefinition/observation-de-score-gcs) aus den deutschen Basisprofilen abgeleitet."
* insert Meta
* insert CommonElements
* insert Quantity-MS
* insert ISiKVitalsignCommons
* insert ISiKVitalsignCommonsValue
* category[survey] MS
  * ^comment = "Motivation MS: Dieses Feld erlaubt die Sortierung und Abfrage anhand der Kategorie der Untersuchung"
  * ^short = "Untersuchungskategorie"
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#153728
* component MS
  * insert Component-MS
  * valueCodeableConcept MS
    * ^comment = "Motivation MS: Kodierung der Ergebnisse der GCS-Komponenten."
    * ^short = "Kodiertes Ergebnis"
    * insert CodeableConcept-MS
* component[Eye] MS
  * ^comment = "Motivation MS: Kodierung des Augenöffnungsreflexes."
  * ^short = "Augenöffnungsreflex"
  * insert Component-Slice-MS  
  * valueCodeableConcept MS
    * ^comment = "Motivation MS: Kodierung der Ergebnisse der GCS-Komponenten."
    * ^short = "Kodiertes Ergebnis"
    * insert CodeableConcept-MS
* component[Motor] MS
  * ^comment = "Motivation MS: Kodierung der motorischen Reaktion."
  * ^short = "Motorische Reaktion"
  * insert Component-Slice-MS  
  * valueCodeableConcept MS
    * ^comment = "Motivation MS: Kodierung der Ergebnisse der GCS-Komponenten."
    * ^short = "Kodiertes Ergebnis"
    * insert CodeableConcept-MS
* component[Verbal] MS
  * ^comment = "Motivation MS: Kodierung der verbalen Reaktion."
  * ^short = "Verbale Reaktion"
  * insert Component-Slice-MS  
  * valueCodeableConcept MS
    * ^comment = "Motivation MS: Kodierung der Ergebnisse der GCS-Komponenten."
    * ^short = "Kodiertes Ergebnis"
    * insert CodeableConcept-MS

Instance: ISiKGCSExample
InstanceOf: ISiKGCS
Usage: #example
* code = $loinc#9269-2 "Glasgow coma score total"
* code.coding[snomed] = $sct#248241002 "Glasgow coma score"
* code.coding[IEEE11073] = $IEEE11073#153728 "MDC_SCORE_GLAS_COMA"
* valueQuantity = 11 '1' "Punktwert"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2020-10-11"
* performer = Reference(PractitionerWalterArzt)
* component[Verbal].code = $loinc#9270-0 "Glasgow coma score verbal"
* component[Verbal].valueCodeableConcept = $loinc#LA6560-2 "Confused"
* component[Motor].code = $loinc#9268-4 "Glasgow coma score motor"
* component[Motor].valueCodeableConcept = $loinc#LA6566-9 "Localizing pain"
* component[Eye].code = $loinc#9267-6 "Glasgow coma score eye opening"
* component[Eye].valueCodeableConcept = $loinc#LA6555-2 "Eye opening to verbal command"

Instance: ISiKGCSMinExample
InstanceOf: ISiKGCS
Usage: #example
* code = $loinc#9269-2 "Glasgow coma score total"
* valueQuantity = 3 '1' "Punktwert"
* status = #final
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2024-01-15"
* component[Verbal].code = $loinc#9270-0 "Glasgow coma score verbal"
* component[Verbal].valueCodeableConcept = $loinc#LA6557-8 "No verbal response"
* component[Motor].code = $loinc#9268-4 "Glasgow coma score motor"
* component[Motor].valueCodeableConcept = $loinc#LA6562-8 "No motor response"
* component[Eye].code = $loinc#9267-6 "Glasgow coma score eye opening"
* component[Eye].valueCodeableConcept = $loinc#LA6553-7 "No eye opening"

Instance: ISiKGCSMaxExample
InstanceOf: ISiKGCS
Usage: #example
* code = $loinc#9269-2 "Glasgow coma score total"
* code.coding[snomed] = $sct#248241002 "Glasgow coma score"
* code.coding[IEEE11073] = $IEEE11073#153728 "MDC_SCORE_GLAS_COMA"
* valueQuantity = 15 '1' "Punktwert"
* status = #final
* subject = Reference(PatientinNormal)
* effectiveDateTime = "2024-01-15T10:00:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* interpretation = $v3-ObservationInterpretation#N "Normal"
* note.text = "Patient vollständig orientiert und kooperativ"
* component[Verbal].code = $loinc#9270-0 "Glasgow coma score verbal"
* component[Verbal].valueCodeableConcept = $loinc#LA6558-6 "Oriented"
* component[Motor].code = $loinc#9268-4 "Glasgow coma score motor"
* component[Motor].valueCodeableConcept = $loinc#LA6567-7 "Obeys commands"
* component[Eye].code = $loinc#9267-6 "Glasgow coma score eye opening"
* component[Eye].valueCodeableConcept = $loinc#LA6556-0 "Eyes open spontaneously"