Profile: ISiKLaboruntersuchung
Parent: Observation
Id: ISiKLaboruntersuchung
Description: "Dieses Profil ermöglicht die Abbildung von Informationen zur Laboruntersuchungen eines Patienten in ISiK Szenarien. Es dient primär als Vorlage, von der spezifische Laboruntersuchungs-Profile abgeleitet werden, kann aber grundsätzlich auch zur Repräsentation von nicht weiter ausspezifizierten Laboruntersuchungen genutzt werden.

Viele medizinischen Entscheidungen benötigen Informationen zu den Laboruntersuchungen eines Patienten. Hierzu gehören z.B. aktuelle Nierenfunktionswerte, Leberwerte, Blutbildwerte oder Hormone aus Schilddrüse.
Jede dieser Untersuchungen wird durch bestimmte [[https://loinc.org/ LOINC]] oder [[http://snomed.info/sct SNOMED CT]] Codes bezeichnet. Der angegebene Wert ist durch genaue Einheitenangaben in [[http://unitsofmeasure.org UCUM]] zu konkretitiseren.
Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UseCases-AMTS?version=current).

In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. Zugehörige Codes und Einheiten sind den entsprechenden Valuessets zu entnehmen."
* insert Meta
* status MS
  * ^short = "Status der Laboruntersuchung"
* category 1.. MS
  * ^short = "Kategorie der Laboruntersuchung"
* category = $cs-observation-category#laboratory 
* code MS
  * ^short = "Gegenstand der Untersuchung (Laborparameter)"  
  * coding
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding 1.. MS
    * system 1.. MS
    * code 1.. MS
    * display MS
  * text MS
  * coding contains loinc 1.. MS and snomed 1..1
  * coding[loinc] ^patternCoding.system = $loinc
  * coding[snomed] ^patternCoding.system = $sct
* subject 1.. MS
  * ^short = "Referenz auf den Patienten"
* encounter MS
  * ^short = "Referenz auf den Abteilungskontakt"
* effective[x] MS
  * ^short = "Zeitpunkt der Untersuchung"
* effectiveDateTime MS
* issued MS
  * ^short = "Zeitpunkt der Verfügbarkeit des Untersuchungsergebnisses"
* value[x] MS
  * ^short = "Festgestellter (Mess)Wert für den Laborparameter"
* valueQuantity MS
  * value 1.. MS
  * unit MS
  * system 1.. MS
  * system = $cs-ucum
  * code 1.. MS
* dataAbsentReason MS
* interpretation MS
* note MS
* method MS
* specimen MS
  * reference MS
  * identifier MS
    * system 1.. MS
    * value 1.. MS
* device MS
* referenceRange MS
  * low MS
    * value 1.. MS
    * unit MS
    * system 1.. MS
    * system = $cs-ucum
    * code 1.. MS
  * high MS
    * value 1.. MS
    * unit MS
    * system 1.. MS
    * system = $cs-ucum
    * code 1.. MS
  * type MS
    * coding MS
      * system 1.. MS
      * code 1.. MS
      * display MS
    * text MS
  * appliesTo MS
    * coding MS
      * system 1.. MS
      * code 1.. MS
      * display MS
    * text MS
  * age MS
    * low MS
    * high MS
  * text MS
