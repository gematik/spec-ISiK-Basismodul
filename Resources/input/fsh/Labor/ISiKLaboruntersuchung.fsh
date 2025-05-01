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
    * ^short = "Kodierung des Laborparameters"
    * system 1.. MS
      * ^short = "System, aus dem der Code für den Laborparameter stammt (z. B. LOINC)"
    * code 1.. MS
      * ^short = "Code des Laborparameters entsprechend dem verwendeten System"
    * display MS
      * ^short = "Anzeige-/Bezeichnungstext für den Laborparameter-Code"
  * text MS
    * ^short = "Freitextbeschreibung des Laborparameters"
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
  * ^short = "Messwert in quantitativer Form"
  * value 1.. MS
    * ^short = "Der numerische Messwert"
  * unit MS
    * ^short = "Einheit des Messwertes (z. B. mg/dL)"
  * system 1.. MS
    * ^short = "Kodiersystem für die Einheit (UCUM)"
  * system = $cs-ucum
  * code 1.. MS
    * ^short = "UCUM-Code der Einheit"
* dataAbsentReason MS
  * ^short = "Angabe eines Grundes weshalb kein Ergebniss der Laboruntersuchung vorliegt"
* interpretation MS
  * ^short = "Interpretation oder Bewertung des Messergebnisses (z. B. „hoch“, „niedrig“, „normal“)"
* note MS
  * ^short = "Freitextnotiz oder Kommentar zur Beobachtung (z. B. Hinweise des Labors)"
* method MS
  * ^short = "Verwendete Methode oder Technik zur Durchführung der Untersuchung"
* specimen MS
  * ^short = "Referenz auf die entnommene Probe"
  * reference MS
  * identifier MS
    * system 1.. MS
    * value 1.. MS
* device MS
  * ^short = "Verwendetes Gerät oder Instrument zur Durchführung der Untersuchung"
* referenceRange MS
  * ^short = "Referenzbereich zur Interpretation des Messergebnisses (z. B. Normalwerte)"
  * low MS
    * ^short = "Untergrenze des Referenzbereichs"
    * value 1.. MS
    * unit MS
    * system 1.. MS
    * system = $cs-ucum
    * code 1.. MS
  * high MS
    * ^short = "Obergrenze des Referenzbereichs"
    * value 1.. MS
    * unit MS
    * system 1.. MS
    * system = $cs-ucum
    * code 1.. MS
  * type MS
    * ^short = "Art des Referenzbereichs (z. B. normal, kritisch)"
    * coding MS
      * system 1.. MS
      * code 1.. MS
      * display MS
    * text MS
  * appliesTo MS
    * ^short = "Für wen der Referenzbereich gilt (z. B. Geschlecht, Alter)"
    * coding MS
      * ^short = "Kodierte Angabe zur Zielgruppe"
      * system 1.. MS
      * code 1.. MS
      * display MS
    * text MS
  * age MS
    * ^short = "Altersbereich, für den der Referenzbereich gilt"
    * low MS
    * high MS
  * text MS
    * ^short = "Freitextbeschreibung des Referenzbereichs"
