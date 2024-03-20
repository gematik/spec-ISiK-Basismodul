Profile: ISiKAllergieUnvertraeglichkeit
Parent: AllergyIntolerance
Id: ISiKAllergieUnvertraeglichkeit
Description: "Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien."
* insert Meta
* clinicalStatus MS
  * ^short = "klinischer Status"
  * coding 1..1 MS
    * system 1..1 MS
    * code 1..1 MS
* verificationStatus MS
  * ^short = "Verifikationsstatus"
  * coding 1..1 MS
    * system 1..1 MS
    * code 1..1 MS
* type MS
  * ^short = "Type (Allergie oder Unverträglichkeit)"
* category MS
  * ^short = "Kategorie"
* criticality MS
  * ^short = "Kritikalität"
* code 1.. MS
  * ^short = "Benennung der Allergie/Unverträglichkeit"
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      snomed-ct 1..1 MS and
      ask 0..1 MS and
      atc 0..1 MS
  * coding[snomed-ct] MS
    * ^patternCoding.system = $sct
    * system MS
    * code MS
    * display MS
  * coding[ask] MS
  * coding[ask] only CodingASK
    * ^patternCoding.system = $ask
    * system MS
    * code MS
    * display MS
  * coding[atc] MS
  * coding[atc] only CodingATC
    * ^patternCoding.system = $atc
    * system MS
    * version MS
    * code MS
    * display MS
  * text MS
* patient MS
  * ^short = "Patient (Referenz)"
* encounter MS
  * ^short = "Aufenthalt, bei dem die Allergie/Unverträglichkeit festgestellt wurde (nicht notwendigerweise der aktuelle Aufenthalt!)"
* onset[x] MS
  * ^short = "Beginn-Zeitpunkt"
* onsetDateTime MS
* onsetAge MS
* onsetString MS
* recordedDate MS
  * ^short = ""
* recorder MS
  * ^short = "Person/Rolle, die die Information dokumentiert"
  * reference MS
  * display MS
* asserter MS
  * ^short = "Person/Rolle, die die Allergie/Unverträglichkeit festgestellt hat"
  * reference MS
  * display MS
* note MS
  * author[x] MS
  * author[x] only Reference
  * authorReference MS
    * reference MS
    * display MS
  * time MS
  * text MS
* reaction MS
  * ^short = "Unerwünschte Reaktion"
  * manifestation MS
    * ^short = "Manifestation der Reaktion"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        snomed-ct 0..1 MS
    * coding[snomed-ct] MS
      * system MS
      * system = $sct (exactly)
      * code MS
    * text MS
  * severity MS
    * ^short = "Schweregrad der Reaktion"
  * exposureRoute MS
    * ^short = "Expositionsweg"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        snomed-ct 0..1 MS
    * coding[snomed-ct] MS
      * system MS
      * system = $sct (exactly)
      * code MS
    * text MS

Instance: ISiKAllergieUnvertraeglichkeitBeispiel1
InstanceOf: ISiKAllergieUnvertraeglichkeit
Usage: #example
* clinicalStatus = $vsAllergyIntoleranceClinicalStatus#active
* verificationStatus = $vsAllergyIntoleranceVerificationStatus#confirmed
* type = #allergy
* category = #environment
* criticality = #low
* code = $sct#256262001 "Betula pendula pollen"
* patient = Reference(PatientinMusterfrau)
* onsetDateTime = "1987"
* recordedDate = 2011-05-12
* recorder.display = "Dr. Martin Mustermann"
* asserter.display = "Dr. Berta Beispiel"
* note
  * authorReference = Reference(PractitionerWalterArzt)
  * time = 2024-02-20T14:34:12+01:00
  * text = "Patientin berichtet von einer leichten Verschlimmerung in den letzten 3 Jahren."
* reaction
  * manifestation = $sct#162367006 "Sneezing symptom"
  * severity = #moderate
  * exposureRoute = $sct#14910006 "Inspiration"
