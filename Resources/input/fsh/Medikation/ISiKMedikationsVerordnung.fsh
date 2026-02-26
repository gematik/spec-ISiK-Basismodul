Profile: ISiKMedikationsVerordnung
Parent: MedicationRequest
Id: ISiKMedikationsVerordnung
Description: "Dieses Profil ermöglicht die Abbildung von Medikationsverordnungen eines Patienten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* extension MS
* extension contains
    ExtensionISiKAcceptedRisk named acceptedRisk 0..1 MS and
    ExtensionISiKMedikationsart named medikationsart 0..1 MS and
    ExtensionISiKBehandlungsziel named behandlungsziel 0..1 MS and
    ExtensionISiKMedicationRequestReplaces named medicationRequestReplaces 0..1 MS
* extension[acceptedRisk]
  * ^short = "akzeptiertes (in Kauf genommenes) Risiko"
  * ^comment = "Begründung des Must-Support: Folgeinformation der AMTS-Bewertung, sollte auch an nachfolgende Behandelnde übermittelbar sein

  Hinweis: Hier kann ein im Rahmen der Medikation festgestelltes, aber in Kauf genommenes Risiko dokumentiert werden, speziell auch die Begründung und ggf. erforderliche Begleitmaßnahmen."
  * valueString MS
* extension[medikationsart]
  * ^short = "Therapieart der Medikation"
  * ^comment = "Begründung des Must-Support: von der Fachseite gewünschte Angabe

  Hinweis: Angabe Akut- oder Dauermedikation." 
  * valueCoding
    * system MS
    * code MS
    * display MS
* extension[behandlungsziel]
  * ^short = "Behandlungsziel (textuell)"
  * ^comment = "Begründung des Must-Support: von der Fachseite gewünschte Angabe

  Hinweis: Freitext-Beschreibung des Behandlungsziels."
  * valueString MS
* extension[medicationRequestReplaces]
  * ^short = "Welche Medikationsverordnung wird ersetzt?"
  * ^comment = "Begründung des Must-Support: historische Nachvollziehbarkeit ersetzter Verordnungen.

    Hinweis: Diese Extension dient der Abbildung einer Verordnung, die eine vorherige Medikation ersetzt - z.B. bei Unverträglichkeit, mangelnder Wirksamkeit oder Wechsel des Wirkstoffs.
    Abgrenzung: Im Gegensatz zum Feld 'priorPrescription', das eine Folgeverordnung bei fortgesetzter Therapie beschreibt, kennzeichnet diese Extension eine bewusste Ablösung der ursprünglichen Verordnung."
  * valueReference MS
    * reference MS
* status MS
  * ^short = "Status der Verordnungsinformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard.
  
  Hinweis für Implementierende: Im Falle einer create-Operation kann der Server den .code in .status zunächst auf 'on-hold' setzen, z. B. im Falle einer asynchronen Prüfung, die im Rahmen einer textuellen Übergabe möglich ist. Ggf. kann hier zusätzlich ein Mechanismus etabliert werden, der eine anschließende Änderung des Status an den Client kommuniziert. Der Server kann zusätzlich den .code in .statusReason auf 'clarif' setzen ('Clarification is required before the order can be acted upon.'), um anzuzeigen, dass eine Klärung erforderlich ist, bevor die Verordnung ausgeführt werden kann.
  "
* intent MS
  * ^short = "Ziel der Verordnungsinformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard

  Hinweis: i.d.R. 'order'"
* doNotPerform ..0
  * ^comment = "Begründung der Kardinalitätsänderung: Use Case für dieses Feld ist nicht im Scope"
* medicationCodeableConcept MS
  * ^short = "Medikament in codierter Form oder ggf. als Freitext"
  * ^comment = "Begründung des Must-Support: Basisinformation

  Hinweis: kann verwendet werden, wenn keine detaillierten Informationen zum Medikament (z.B. Rezepturen) existieren."
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      PZN 0..* MS and
      ATC-DE 0..* MS and
      SCT 0..1 MS
  * coding[PZN] only ISiKPZNCoding
    * ^patternCoding.system = $cs-pzn
    * insert ISiKMedikament-CodingPZNComment
  * coding[ATC-DE] only ISiKATCCoding
    * ^patternCoding.system = $cs-atc-de
    * insert ISiKMedikament-CodingATCComment
  * coding[SCT] only ISiKSnomedCTCoding
    * ^patternCoding.system = $cs-sct
  * text MS
* medicationReference MS
  * ^short = "Referenz auf das Medikament (Medication-Ressource)"
  * ^comment = "Begründung des Must-Support: Basisinformation

  Hinweis: wird verwendet, wenn detaillierte Informationen zum Medikament vorliegen"
  * reference 1..1 MS
* subject MS
  * ^short = "Referenz auf den Patienten"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* subject only Reference(Patient)
  * reference 1..1 MS
    * ^short = "Patienten-Link"
    * insert Comment-Reference-Subject(Begründung MS)
* encounter MS
  * ^short = "Referenz auf den Abteilungskontakt"
  * ^comment = "Begründung des Must-Support: Basisinformation im Krankenhaus-Kontext"
  * reference 1..1 MS
    * insert Comment-Reference-Encounter(Begründung MS)
* authoredOn MS
  * ^short = "Erstellungsdatum der Verordnung"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* requester MS
  * ^short = "Referenz auf die verordnende Person"
  * ^comment = "Begründung des Must-Support: Nachvollziehbarkeit"
  * reference 1..1 MS
* reasonCode MS
  * ^short = "Grund der Medikation (codiert)"
  * ^comment = "Festlegung zum MS: Die Elemente .reasonCode und .reasonReference MÜSSEN nach OR-Logik in der Ausgabe verwendet werden, d.h. nur eines MUSS geliefert werden können. Weiterhin MÜSSEN beide Elemente interpretiert werden können.
Begründung zu Must-Support: Konsolidierung mit MII Profil: https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/MedicationRequest"
  * coding MS
    * ^comment = "Begründung des Must-Support: Falls der Grund kodierbar ist, sollte er auch kodiert werden."
    * system 1.. MS
      * ^comment = "Begründung des Must-Support und Kardinalität: Ein Coding Element benötigt immer ein System um die Bedeutung des Codes zu definieren."
    * code 1.. MS
      * ^comment = "Begründung des Must-Support und Kardinalität: Ein Coding Element benötigt immer einen Code um die Bedeutung des Codes zu definieren."
    * display MS
      * ^comment = "Begründung des Must-Support: Ein Display Element ist für die Lesbarkeit der Information notwendig."
  * text MS
* reasonReference MS
  * ^short = "Grund der Medikation (Referenz)"
  * ^comment = "Festlegung zum MS: Die Elemente .reasonCode und .reasonReference MÜSSEN nach OR-Logik in der Ausgabe verwendet werden, d.h. nur eines MUSS geliefert werden können. Weiterhin MÜSSEN beide Elemente interpretiert werden können.
  Begründung zu Must-Support: Konsolidierung mit MII."
  * reference 1..1 MS
    * ^comment = "Begründung des Must-Support: Referenz auf die Diagnose oder Untersuchung, die die Medikation begründet."
* note MS
  * ^short = "Zusätzliche Anmerkungen zur Medikation"
  * ^comment = "Begründung des Must-Support: Fachlich relevante Zusatzinformationen"
  * text MS
    * ^short = "Freitext-Notiz"
    * ^comment = "Begründung des Must-Support: Angabe zusätzlicher Informationen kann fachlich relevant sein"
* dosageInstruction MS
  * ^short = "Dosierungsangaben"
  * ^comment = "Begründung des Must-Support: Basisinformation. Zur vollständig strukturierten Abbildung der zahlreichen Möglichkeiten sind die hier mit Must-Support gekennzeichneten Unterelemente erforderlich gemäß Konsens der ISiK AG Medikation.
  
  **Hinweis:** Zahlreiche [Beispiele zur Dosierungsanweisung sind im Implementierungsleitfaden Medikament von HL7 Deutschland](https://ig.fhir.de/igs/medication/dosierung-beispiele.html) dokumentiert.
  "
* dosageInstruction only DosageDE
  * text 
    * ^comment = "Festlegung zum Must-Support: Die Verarbeitung MUSS unterstützt werden, indem empfangende Systeme  die Freitext-Dosierungsinformation entweder direkt in der Textform persistieren, ODER die Informationen in eine alternative (strukturierte) Form umwandeln (ggf. unter Einwirkung geeigneter Nutzer). Im letzteren Fall KANN auf eine Persistierung in Textform verzichtet werden, um Inkonsistenzen zu vermeiden.
        
    Ein System KANN jedoch strukturierte Dosierungsinformationen in Freitext-Dosierungsinformationen umwandeln, um sie in einem Dokument oder einer Benutzeroberfläche anzuzeigen - dabei ist auf Konsistenzwahrung zu allen strukturierten Elementen zu achten.
    
    Hinweis: Diese Festlegung folgt und spezifiziert folgende MS-Festlegung aus dem [ISiK Basismodul](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_Must-Support-Flags): 'Systeme KÖNNEN es darüber hinaus ermöglichen, dass die jeweiligen Informationen vom Anwender ergänzt oder editiert werden.'
    
    Zum Beispiel könnte ein empfangendes System die Freitext-Dosierungsanweisungen in strukturierte Dosierungsanweisungen umwandeln, um sie in einer Medikationsverwaltung anzuzeigen oder später zu exponieren. Geht es zum Beispiel um eine Angabe zu Tageszeiten der Einnahme in der freitextlichen Dosierungsanweisung als 'Morgens, Mittags, Abends', so könnte das empfangende System diese Angabe in strukturierte Dosierungsanweisungen umwandeln, die die Einnahmezeiten in kodierter Form mit 'MORN', 'NOON', 'EVE' deklariert."
  * patientInstruction MS
    * ^short = "besondere Anweisungen für den Patienten"
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
  * asNeededBoolean MS
    * ^short = "Bedarfsmedikation"
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
    * doseRange MS
      * ^short = "Dosisbereich"
      * low MS
      * low only MedicationQuantity
      * high MS
      * high only MedicationQuantity
    * doseQuantity MS
      * ^short = "Dosis"
    * rateRatio MS
      * ^short = "Raten-Verhältnis"
      * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden KÖNNEN. Beim Empfang und Verarbeitung der eingehenden Daten MÜSSEN dagegen beide Datentypen interpretiert werden können."
      * numerator 1.. MS
      * numerator only MedicationQuantity
      * denominator 1.. MS
      * denominator only MedicationQuantity
    * rateRange MS
      * ^short = "Raten-Bereich"
      * low MS
      * low only MedicationQuantity
      * high MS
      * high only MedicationQuantity
    * rateQuantity MS
    * rateQuantity only MedicationQuantity
      * ^short = "Rate"
      * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden KÖNNEN. Beim Empfang und Verarbeitung der eingehenden Daten MÜSSEN dagegen beide Datentypen interpretiert werden können."
  * maxDosePerPeriod MS
    * ^short = "Maximaldosis (Zähler) pro Zeitraum (Nenner)"
    * numerator 1.. MS
    * numerator only MedicationQuantity
    * denominator 1.. MS
    * denominator only MedicationQuantity
  * maxDosePerAdministration MS
  * maxDosePerAdministration only MedicationQuantity
    * ^short = "Maximaldosis pro Verabreichung"
* dispenseRequest MS
  * ^short = "angeforderte Abgabemenge"
  * ^comment = "Begründung des Must-Support: Basisinformation"
  * quantity MS
  * quantity only MedicationQuantity
    * ^short = "angeforderte Abgabemenge"
    * ^comment = "Begründung des Must-Support: Basisinformation"
* substitution MS
  * ^short = "Ersatz zulässig"
  * ^comment = "Begründung des Must-Support: Alignment mit dem (E-)Rezept"
  * allowedBoolean MS
* priorPrescription 
  * ^short = "Vorherige Verordnung bei fortgesetzter Therapie" 
  * ^comment = "Hinweis: Dieses Feld dient der Referenz auf eine frühere Verordnung, auf deren Basis die aktuelle Verschreibung fortgeführt wird - z.B. bei Folgerezepten.

  Abgrenzung: Im Gegensatz zur Extension 'medicationRequestReplaces', die das Ersetzen einer Verordnung (z.B. bei Unverträglichkeit) abbildet, beschreibt 'priorPrescription' eine Fortführung einer bestehenden Medikation."

Instance: ExampleISiKMedikationsVerordnung
InstanceOf: ISiKMedikationsVerordnung
Usage: #example
* extension[acceptedRisk].valueString = "Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar."
* extension[medikationsart].valueCoding = ISiKMedikationsartCS#akut
* extension[behandlungsziel].valueString = "Schmerztherapie postoperativ"
* status = #active
* intent = #order
* medicationReference.reference = "Medication/ExampleISiKMedikament1"
* subject = Reference(PatientinMusterfrau)
* encounter.reference = "Encounter/Fachabteilungskontakt"
* authoredOn = 2021-07-01
* requester.reference = "Practitioner/PractitionerWalterArzt"
* reasonReference.reference = "Condition/BehandlungsDiagnoseFreitext"
* dosageInstruction
  * timing.repeat
    * when[0] = #MORN
    * when[1] = #NOON
    * when[2] = #EVE
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "Brausetablette"
    * system = $cs-ucum
    * code = #1

Instance: ExampleISiKMedikationsVerordnung2
InstanceOf: ISiKMedikationsVerordnung
Usage: #example
* extension[medicationRequestReplaces].valueReference.reference = "MedicationRequest/77777"
* status = #active
* intent = #order
* medicationReference = Reference(ExampleISiKMedikament8)
* subject = Reference(PatientinMusterfrau)
* encounter.reference = "Encounter/Fachabteilungskontakt"
* authoredOn = 2024-01-17
* requester.reference = "Practitioner/PractitionerWalterArzt"
* dosageInstruction
  * timing.repeat
    * count = 6
    * frequency = 1
    * duration = 6
    * durationUnit = #wk
    * period = 1
    * periodUnit = #wk
  * doseAndRate.doseQuantity
    * value = 500
    * unit = "ml Infusionslösung"
    * system = $cs-ucum
    * code = #mL
