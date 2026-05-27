RuleSet: ISiKDosageDE(path)
* {path} only DosageDE
* {path} obeys isik-dosage-as-needed-for
  * text
    * ^comment = "Festlegung zum Must-Support: Die Verarbeitung MUSS unterstützt werden, indem empfangende Systeme die Freitext-Dosierungsinformation entweder direkt in der Textform persistieren, ODER die Informationen in eine alternative (strukturierte) Form umwandeln (ggf. unter Einwirkung geeigneter Nutzer). Im letzteren Fall KANN auf eine Persistierung in Textform verzichtet werden, um Inkonsistenzen zu vermeiden.

    Ein System KANN jedoch strukturierte Dosierungsinformationen in Freitext-Dosierungsinformationen umwandeln, um sie in einem Dokument oder einer Benutzeroberfläche anzuzeigen - dabei ist auf Konsistenzwahrung zu allen strukturierten Elementen zu achten.

    Hinweis: Diese Festlegung folgt und spezifiziert folgende MS-Festlegung aus dem [ISiK Basismodul](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/Index_Festlegungen.html/UebergreifendeFestlegungen_Must-Support-Flags): 'Systeme KÖNNEN es darüber hinaus ermöglichen, dass die jeweiligen Informationen vom Anwender ergänzt oder editiert werden.'

    Zum Beispiel könnte ein empfangendes System die Freitext-Dosierungsinformation in strukturierte Dosierungsinformation umwandeln, um sie in einer Medikationsverwaltung anzuzeigen oder später zu exponieren. Geht es zum Beispiel um eine Angabe zu Tageszeiten der Einnahme in der freitextlichen Dosierungsinformation als 'Morgens, Mittags, Abends', so könnte das empfangende System diese Angabe in strukturierte Dosierungsinformationen umwandeln, die die Einnahmezeiten in kodierter Form mit 'MORN', 'NOON', 'EVE' deklariert."
  * patientInstruction MS
    * ^short = "besondere Anweisungen für den Patienten"
  * asNeeded[x] only boolean
    * ^short = "Bedarfsmedikation"
    * ^comment = "Begründung Einschränkung auf boolean: Für die Angabe der Bedingung wird die R5 Backport-Extension genutzt, um mehrere ODER verknüpfte Bedarfsbedingungen angeben zu können."
  * asNeededBoolean MS
    * ^short = "Bedarfsmedikation (ja/nein)"
    * ^comment = "Begründung des Must-Support: Abbildung einer Bedarfsmedikation."
  * extension contains $ext-dosage-as-needed-for named asNeededFor 0..* MS
    * ^short = "Indikation für die Bedarfsmedikation"
    * ^comment = "Begründung des Must-Support: Ermöglicht die Angabe mehrerer Indikationen für die Bedarfsmedikation, z.B. 'Schmerzen', 'Fieber', 'Hustenreiz' etc. Diese Bedingungen sind ODER verknüpft, d.h. die Bedarfsmedikation soll bei Vorliegen einer ODER mehrerer dieser Bedingungen angewendet werden."
    * valueCodeableConcept.text MS
      * ^short = "Indikation für die Bedarfsmedikation (Freitext)"
      * ^comment = "Begründung des Must-Support: Ermöglicht die Angabe einer Indikation für die Bedarfsmedikation in Freitextform, eine Kodierung ist nicht verpflichtend. Es wird jedoch empfohlen, die Indikation zusätzlich in kodierter Form anzugeben, um die Interoperabilität zu erhöhen."
  * timing
    * event MS
      * ^short = "fester Zeitpunkt"
    * repeat
      * ^short = "Wiederholungs-Angaben"
      * boundsDuration MS
        * ^short = "Begrenzung der Dauer"
        * ^patternDuration.system = $cs-ucum
        * value 1..1 MS
        * unit MS
        * system 1..1 MS
        * code 1..1 MS
      * boundsRange MS
        * ^short = "Bereich für die Begrenzung"
        * low MS
          * ^patternQuantity.system = $cs-ucum
          * value 1..1 MS
          * unit MS
          * system 1..1 MS
          * code 1..1 MS
        * high MS
          * ^patternQuantity.system = $cs-ucum
          * value 1..1 MS
          * unit MS
          * system 1..1 MS
          * code 1..1 MS
      * boundsPeriod MS
        * ^short = "begrenzender Zeitraum"
        * start MS
        * end MS
      * count MS
        * ^short = "Anzahl Wiederholungen"
      * countMax MS
        * ^short = "maximale Anzahl Wiederholungen"
      * duration MS
        * ^short = "Dauer der Verabreichung"
      * durationMax MS
        * ^short = "maximale Dauer der Verabreichung"
      * durationUnit MS
        * ^short = "Einheit der Dauer"
      * frequency
        * ^short = "Frequenz (Anzahl der Gaben pro Periode)"
      * frequencyMax MS
        * ^short = "maximale Frequenz"
      * period
        * ^short = "Zeitperiode zur Frequenz"
      * periodMax MS
        * ^short = "maximale Zeitperiode zur Frequenz"
      * periodUnit
        * ^short = "Einheit der Zeitperiode"
      * dayOfWeek
        * ^short = "Wochentag"
      * timeOfDay
        * ^short = "Tageszeit"
      * when
        * ^short = "Tageszeitpunkt codiert"
      * offset MS
        * ^short = "zeitlicher Abstand der Gabe zum beschriebenen Zeitpunkt"
  * site MS
    * ^short = "Körperstelle der Verabreichung"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        SNOMED-CT 0..1 MS
    * coding[SNOMED-CT] only ISiKSnomedCTCoding
      * ^patternCoding.system = $cs-sct
    * text MS
  * route MS
    * ^short = "Route"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        EDQM 0..1 MS and
        SNOMED-CT 0..1 MS
    * coding[EDQM] from $vs-edqm-route (required)
    * coding[EDQM] only ISiKCoding
      * ^patternCoding.system = $cs-edqm
    * coding[SNOMED-CT] from SctRouteOfAdministration (required)
    * coding[SNOMED-CT] only ISiKSnomedCTCoding
      * ^patternCoding.system = $cs-sct
    * text MS
  * doseAndRate
    * doseQuantity MS
      * ^short = "Dosis"
      * ^comment = "Das Must-Support-Flag auf doseQuantity bedeutet, dass produzierende Systeme zur Kodierung der Dosisangaben nach eigenem Ermessen entweder den Datentyp Quantity oder Ratio verwenden können. Beim Empfang und Verarbeitung der eingehenden Daten müssen dagegen beide Datentypen interpretiert werden können."
      * value MS
        * ^short = "Dosiswert"
        * ^comment = "**Begründung MS:** Der Dosiswert ist notwendig, um die Dosisangabe korrekt interpretieren zu können."
      * unit MS
        * ^short = "Menschenlesbare Dosis-Einheit"
        * ^comment = "**Begründung MS:** Die menschenlesbare Dosis-Einheit ist notwendig, um die Dosisangabe korrekt interpretieren zu können."
      * system MS
        * ^short = "CodeSystem der Dosisangabe"
        * ^comment = "**Begründung MS:** Das CodeSystem der Dosisangabe ist notwendig, um die Dosisangabe korrekt interpretieren zu können."
      * code MS
        * ^short = "Code der Dosisangabe"
        * ^comment = "**Begründung MS:** Der Code der Dosisangabe ist notwendig, um die Dosisangabe korrekt interpretieren zu können."
    * doseRange MS
      * ^short = "Dosisbereich"
      * low MS
      * low only MedicationQuantityDoseForm
      * high MS
      * high only MedicationQuantityDoseForm
    * rateRatio MS
      * ^short = "Raten-Verhältnis"
      * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden können. Beim Empfang und Verarbeitung der eingehenden Daten müssen dagegen beide Datentypen interpretiert werden können."
      * numerator 1.. MS
      * numerator only MedicationQuantityDoseForm
      * denominator 1.. MS
      * denominator only MedicationQuantity
    * rateRange MS
      * ^short = "Raten-Bereich"
      * low MS
      * low only MedicationQuantityDoseForm
      * high MS
      * high only MedicationQuantityDoseForm
    * rateQuantity MS
    * rateQuantity only MedicationQuantity
      * ^short = "Rate"
      * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden können. Beim Empfang und Verarbeitung der eingehenden Daten müssen dagegen beide Datentypen interpretiert werden können."
  * maxDosePerPeriod MS
    * ^short = "Maximaldosis (Zähler) pro Zeitraum (Nenner)"
    * numerator 1.. MS
    * numerator only MedicationQuantityDoseForm
    * denominator 1.. MS
    * denominator only MedicationQuantity
  * maxDosePerAdministration MS
  * maxDosePerAdministration only MedicationQuantityDoseForm
    * ^short = "Maximaldosis pro Verabreichung"

Invariant: isik-dosage-as-needed-for
Description: "Wenn Indikationen für eine Bedarfsmedikation angegeben sind, MUSS asNeededBoolean vorhanden und true sein."
Severity: #error
Expression: "extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-Dosage.asNeededFor').empty() or asNeededBoolean = true"