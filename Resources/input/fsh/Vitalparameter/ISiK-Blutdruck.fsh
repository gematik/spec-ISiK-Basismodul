Profile: ISiKBlutdruckSystemischArteriell
Parent: VitalSignDE_Blutdruck
Id: ISiKBlutdruckSystemischArteriell
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Blutdruck eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.
### Motivation
Die Erfassung und Überwachung des Blutdrucks ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.

In FHIR wird der Blutdruck mit der Observation-Ressource repräsentiert, die einzelnen Komponenten des Blutdrucks werden als Component-Elemente abgebildet.

Hinweis: In Fällen, in denen fachlich motiviert ausschließlich ein systolischer Blutdruck erhoben wird (z.B. in der Intensivmedizin), kann für den Slice zur Diastole (DiastolicBP) das Element .dataAbsentReason (mit dem Code 'not-performed') verwendet werden.

### Kompatibilität
Das Profil ISiKBlutdruckSystemischArteriell ist vom Profil [VitalSignDE_Blutdruck](http://fhir.de/StructureDefinition/observation-de-vitalsign-blutdruck) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Blood Pressure Profile](http://hl7.org/fhir/StructureDefinition/bp) aus der FHIR R4 Spezifikation."
* insert Meta
* insert CommonElements
* insert ISiKVitalsignCommons
// should not contain ISiKVitalsignCommonsValue since it is not used in this profile
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#150016
* component MS
  * insert Component-MS
  * dataAbsentReason MS
    * ^comment = "Motivation MS: Dieses Feld erlaubt die Angabe von Gründen für fehlende Untersuchungsergebnisse"
    * ^short = "Grund für fehlendes Untersuchungsergebniss"
* component[SystolicBP] MS
  * ^comment = "Motivation MS: Kodierung des systolischen Blutdrucks."
  * ^short = "Systolischer Blutdruck"
  * insert Quantity-MS
  * insert Component-Slice-MS
  * code
    * coding 
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains 
        IEEE11073 0..1 and
        SCT 0..1 and
        LOINC 1..1
    * coding[IEEE11073] = $IEEE11073#150017
    * coding[SCT] = $sct#271649006
    * coding[LOINC] = $loinc#8480-6
* component[DiastolicBP] MS
  * ^comment = "Motivation MS: Kodierung des diastolischen Blutdrucks."
  * ^short = "Diastolischer Blutdruck"
  * insert Quantity-MS
  * insert Component-Slice-MS
  * code 
    * coding 
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains 
        IEEE11073 0..1 and
        SCT 0..1 and
        LOINC 1..1
    * coding[IEEE11073] = $IEEE11073#150018
    * coding[SCT] = $sct#271650006
    * coding[LOINC] = $loinc#8462-4
  * dataAbsentReason MS
    * ^comment = "Motivation MS: Dieses Feld erlaubt die Angabe von Gründen für fehlende Untersuchungsergebnisse"
    * ^short = "Grund für fehlendes Untersuchungsergebniss"
* component[meanBP] MS
  * ^comment = "**Einschränkung der übergreifenden MS-Definition:**  
  Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des mittleren Blutdrucks, 
  so MUSS dieses System die Information NICHT abbilden.

  Motivation zum eingeschränkten MS: Kodierung des mittleren arteriellen Drucks. Von einem medizinischen Experten im Workshop zur ISiK Kommentierung Stufe 5 wurde erläutert, dass .meanBP relevant in der Normalversorgung und üblich in bekannten Systemen sei (allein Diastole und Systole entspricht nicht mehr medizinischem Stand der Praxis). Allerdings rechtfertigt der Stand der Umsetzung in gängigen Systemen eine Implementierungspflicht (MS) für die Schnittstelle nicht.
  In der ISiK wird die Angabe des mittleren arteriellen Drucks als eingeschränktes Must Support definiert, um eine einheitliche Implementierung zu fördern.
  "
  * ^short = "Mittlerer arterieller Druck"
  * insert Quantity-MS
  * insert Component-Slice-MS
  * code
    * coding
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains 
        IEEE11073 0..1 and
        SCT 0..1 and
        LOINC 1..1
    * coding[IEEE11073] = $IEEE11073#150019
    * coding[SCT] = $sct#6797001
    * coding[LOINC] = $loinc#8478-0

Instance: ISiKBlutdruckSystemischArteriellExample
InstanceOf: ISiKBlutdruckSystemischArteriell
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
  * coding[snomed] = $sct#75367002 "Blood pressure"
  * coding[IEEE11073] = $IEEE11073#150016 "MDC_PRESS_BLD"
  * text = "Systolischer und Diastolischer Blutdruck"
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2012-09-17"
* performer.reference = "Practitioner/example"
* interpretation = $v3-ObservationInterpretation#L "low"
* interpretation.text = "Below low normal"
* bodySite = $sct#368209003 "Right arm"
* component[SystolicBP]
  * code.coding[IEEE11073] = $IEEE11073#150017 "MDC_PRESS_BLD_SYS"
  * code.coding[SCT] = $sct#271649006 "Systolischer Blutdruck"
    * version = "http://snomed.info/sct/11000274103/version/20251115"
  * valueQuantity = 107 'mm[Hg]' "mmHg"
* component[DiastolicBP]
  * code.coding[IEEE11073] = $IEEE11073#150018 "MDC_PRESS_BLD_DIA"
  * code.coding[SCT] = $sct#271650006 "Diastolischer Blutdruck"
    * version = "http://snomed.info/sct/11000274103/version/20251115"
  * valueQuantity = 60 'mm[Hg]' "mmHg"
* component[meanBP]
  * code.coding[IEEE11073] = $IEEE11073#150019 "MDC_PRESS_BLD_MEAN"
  * code.coding[SCT] = $sct#6797001 "Mittlerer arterieller Druck"
    * version = "http://snomed.info/sct/11000274103/version/20251115"
  * valueQuantity = 80 'mm[Hg]' "mmHg"

Instance: ISiKBlutdruckSystemischArteriellMinExample
InstanceOf: ISiKBlutdruckSystemischArteriell
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2024-01-15"
* component[SystolicBP].valueQuantity = 90 'mm[Hg]' "mmHg"
* component[DiastolicBP].valueQuantity = 60 'mm[Hg]' "mmHg"

Instance: ISiKBlutdruckSystemischArteriellMaxExample
InstanceOf: ISiKBlutdruckSystemischArteriell
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
  * coding[snomed] = $sct#75367002 "Blood pressure"
  * coding[IEEE11073] = $IEEE11073#150016 "MDC_PRESS_BLD"
  * text = "Blutdruck - Intensivmonitoring"
* subject = Reference(PatientinNormal)
* effectiveDateTime = "2024-01-15T14:30:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* interpretation = $v3-ObservationInterpretation#H "High"
* interpretation.text = "Hypertensive Krise"
* bodySite = $sct#368208008 "Left arm"
* method = $sct#113011001 "Palpation"
* device = Reference(ExampleDevice)
* note.text = "Arterielle Blutdruckmessung über arteriellen Katheter"
* component[SystolicBP]
  * code.coding[IEEE11073] = $IEEE11073#150017 "MDC_PRESS_BLD_SYS"
  * code.coding[SCT] = $sct#271649006 "Systolischer Blutdruck"
    * version = "http://snomed.info/sct/11000274103/version/20251115"
  * valueQuantity = 200 'mm[Hg]' "mmHg"
  * interpretation = $v3-ObservationInterpretation#H "High"
* component[DiastolicBP]
  * code.coding[IEEE11073] = $IEEE11073#150018 "MDC_PRESS_BLD_DIA"
  * code.coding[SCT] = $sct#271650006 "Diastolischer Blutdruck"
    * version = "http://snomed.info/sct/11000274103/version/20251115"
  * valueQuantity = 120 'mm[Hg]' "mmHg"
  * interpretation = $v3-ObservationInterpretation#H "High"
* component[meanBP]
  * code.coding[IEEE11073] = $IEEE11073#150019 "MDC_PRESS_BLD_MEAN"
  * code.coding[SCT] = $sct#6797001 "Mittlerer arterieller Druck"
    * version = "http://snomed.info/sct/11000274103/version/20251115"
  * valueQuantity = 147 'mm[Hg]' "mmHg"
  * interpretation = $v3-ObservationInterpretation#H "High"