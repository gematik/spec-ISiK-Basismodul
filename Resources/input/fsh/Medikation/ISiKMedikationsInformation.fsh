Profile: ISiKMedikationsInformation
Parent: MedicationStatement
Id: ISiKMedikationsInformation
Description: "Dieses Profil ermöglicht die Abbildung von Informationen zur Medikation eines Patienten in ISiK Szenarien.

Hinweis zur Auswahl des Profils: 
In Abgrenzung zu ISiKMedikationsVerabreichung (MedicationAdministration) wird mittels des vorliegenden Profils die Verabreichung eines Medikaments an einen Patienten mit einer lediglich Datums-genauen Angabe abgebildet (einschließlich Granularität Jahr, Monat oder Tag für .effectiveDateTime oder .effectivePeriod auf Datums-Ebene gemäß der [FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime)).
Zur sekunden-genauen Angabe der Verabreichung eines Medikaments (im Sinne einer medizinischen Verabreichungsdokumentation durch medizinisches Personal) an einen Patienten SOLL das Profil ISiKMedikationsVerabreichung (MedicationAdministration) verwendet werden. Siehe entsprechende Profilseite für weitere Begründung.

**Hinweis zur Pausierung einer Medikation (Best-Practice):**

Für die Abbildung der Pausierung einer Medikation wird empfohlen, **mehrere `MedicationStatement`-Ressourcen** zu verwenden, anstatt eine bestehende zu überschreiben. Dies bringt folgende Vorteile:

- **Korrekte Statusabbildung:**  
  Das `status`-Feld muss stets aktuell gepflegt werden, um den momentanen Zustand der Medikation systemweit sichtbar und durchsuchbar zu halten.

- **Effiziente Abfragen über REST API:**  
  In Kombination mit `effective[x]` ermöglicht das `status`-Feld die gezielte Abfrage aller aktuell gültigen Medikationseinträge über die REST API.  
  Wird stattdessen nur das `dosage`-Element verändert, ist keine zuverlässige Filterung möglich – alle `MedicationStatements` müssten abgerufen und manuell analysiert werden.

- **Erhalt von Verlaufsinformationen:**  
  Wenn z. B. auch ein `statusReason` (z. B. „pausiert wegen Nebenwirkungen“) dokumentiert wird, ginge diese Information bei einem Update der bestehenden Ressource verloren, sobald die Medikation fortgesetzt wird.  
  Durch neue `MedicationStatement`-Einträge bleibt die Verlaufshistorie erhalten.  
  *(Dieser Anwendungsfall ist aktuell nicht gefordert, aber zukünftig denkbar.)*
"
* insert Meta
* insert CommonElements
* extension MS
* extension contains
    ExtensionISiKAcceptedRisk named acceptedRisk 0..1 MS and
    ExtensionISiKMedikationsart named medikationsart 0..1 MS and
    ExtensionISiKSelbstmedikation named selbstmedikation 0..1 MS and
    ExtensionISiKBehandlungsziel named behandlungsziel 0..1 MS and
    ExtensionISiKMedicationStatementReplaces named medicationStatementReplaces 0..1 MS
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
* extension[selbstmedikation]
  * ^short = "Selbstmedikation"
  * ^comment = "Begründung des Must-Support: von der Fachseite gewünschte Angabe

  Hinweis: Flag zur Selbstmedikation."
  * valueBoolean MS
* extension[behandlungsziel]
  * ^short = "Behandlungsziel (textuell)"
  * ^comment = "Begründung des Must-Support: von der Fachseite gewünschte Angabe

  Hinweis: Freitext-Beschreibung des Behandlungsziels."
  * valueString MS
* extension[medicationStatementReplaces]
  * ^short = "Welche Medikationsinformation wird ersetzt?"
  * ^comment = "Begründung des Must-Support: historische Nachvollziehbarkeit

  Hinweis: Welche Medikationsinformation wird ersetzt?"
  * valueReference MS
    * reference MS
* partOf
  * ^short = "Referenz auf andere Objekte, deren Bestandteil diese MedikationsInformation ist"
  * ^comment = "Begründung des Must-Support: Abbildung der Zusammenhänge"
* status MS
  * ^short = "Status der Medikationsinformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard"
* medication[x] MS
  * ^short = "Angabe des Medikaments"
  * ^comment = "Begründung des Must-Support: Basisinformation. Siehe Slicing-Definition zur Wahlmöglichkeit zwischen codierter Angabe und Referenz auf Medication-Ressource."
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
* context MS
  * ^short = "Referenz auf den Abteilungskontakt"
  * ^comment = "Begründung des Must-Support: Basisinformation im Krankenhaus-Kontext"
  * reference 1..1 MS
    * insert Comment-Reference-Encounter(Begründung MS)
* effective[x] 1..1 MS
  * ^short = "Zeitpunkt oder Zeitraum, für den die MedikationsInformation gilt"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* effectiveDateTime MS
  * ^short = "Zeitpunkt (Datum oder Datum + Uhrzeit)"
  * ^comment = "Begründung des Must-Support: Basisinformation
  
  Festlegung zur Nutzung: 
  An dieser Stelle KANN eine lediglich Datums-genaue Angabe (einschließlich Granularität Jahr, Monat oder Tag für .effectiveDateTime oder .effectivePeriod auf Datums-Ebene gemäß der [FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime) seitens eines bestätigungsrelevanten Systems unterstützt werden. Es KANN auch eine Uhrzeit angegeben werden.
  Für sekunden-genaue Angaben zur Verabreichung eines Medikaments an einen Patienten SOLL das Profil ISiKMedikationsVerabreichung (MedicationAdministration) verwendet werden. 
  "  
* effectivePeriod MS
  * ^short = "Zeitraum"
  * ^comment = "Begründung des Must-Support: Basisinformation
  
  Festlegung zur Nutzung: 
  An dieser Stelle KANN eine lediglich Datums-genaue Angabe (einschließlich Granularität Jahr, Monat oder Tag für .effectiveDateTime oder .effectivePeriod auf Datums-Ebene gemäß der [FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime) seitens eines bestätigungsrelevanten Systems unterstützt werden. Es KANN auch eine Uhrzeit angegeben werden.
  Für sekunden-genaue Angaben zur Verabreichung eines Medikaments an einen Patienten SOLL das Profil ISiKMedikationsVerabreichung (MedicationAdministration) verwendet werden. 
  "  
  * start MS
  * end MS
* dateAsserted MS
  * ^short = "Datum der Feststellung/des Bekanntwerdens der MedikationsInformation"
  * ^comment = "Begründung des Must-Support: Nachvollziehbarkeit"
* reasonCode MS
  * ^short = "Grund der Medikation (codiert)"
  * ^comment = "  Festlegung zum MS: Die Elemente .reasonCode und .reasonReference MÜSSEN nach OR-Logik in der Ausgabe verwendet werden, d.h. nur eines MUSS geliefert werden können. Weiterhin MÜSSEN beide Elemente interpretiert werden können.
  
  Begründung zu Must-Support: Konsolidierung mit MII."
  * coding MS
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * text MS
* reasonReference MS
  * ^short = "Grund der Medikation (Referenz)"
  * ^comment = "  Festlegung zum MS: Die Elemente .reasonCode und .reasonReference MÜSSEN nach OR-Logik in der Ausgabe verwendet werden, d.h. nur eines MUSS geliefert werden können. Weiterhin MÜSSEN beide Elemente interpretiert werden können.
  
  Begründung zu Must-Support: Konsolidierung mit MII."
  * reference 1..1 MS
* note MS
  * ^short = "Zusätzliche Anmerkungen zur Medikation"
  * ^comment = "Begründung des Must-Support: Fachlich relevante Zusatzinformationen"
  * text MS
    * ^short = "Freitext-Notiz"
    * ^comment = "Begründung des Must-Support: Angabe zusätzlicher Informationen kann fachlich relevant sein"
* dosage MS 
  * ^short = "Dosierungsangaben"
  * ^comment = "Begründung des Must-Support: Basisinformation. Zur vollständig strukturierten Abbildung der zahlreichen Möglichkeiten sind die hier mit Must-Support gekennzeichneten Unterelemente erforderlich gemäß Konsens der ISiK AG Medikation.
  
  **Hinweis:** Zahlreiche [Beispiele zur Dosierungsanweisung sind im Implementierungsleitfaden Medikament von HL7 Deutschland](https://ig.fhir.de/igs/medication/dosierung-beispiele.html) dokumentiert."
* dosage  only DosageDE  
  * text 
    * ^comment = "Festlegung zum Must-Support: Die Verarbeitung MUSS unterstützt werden, indem empfangende Systeme  die Freitext-Dosierungsinformation entweder direkt in der Textform persistieren, ODER die Informationen in eine alternative (strukturierte) Form umwandeln (ggf. unter Einwirkung geeigneter Nutzer). Im letzteren Fall KANN auf eine Persistierung in Textform verzichtet werden, um Inkonsistenzen zu vermeiden.
        
    Ein System KANN jedoch strukturierte Dosierungsinformationen in Freitext-Dosierungsinformationen umwandeln, um sie in einem Dokument oder einer Benutzeroberfläche anzuzeigen - dabei ist auf Konsistenzwahrung zu allen strukturierten Elementen zu achten.
    
    Hinweis: Diese Festlegung folgt und spezifiziert folgende MS-Festlegung aus dem [ISiK Basismodul](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_Must-Support-Flags): 'Systeme KÖNNEN es darüber hinaus ermöglichen, dass die jeweiligen Informationen vom Anwender ergänzt oder editiert werden.'
    
    Zum Beispiel könnte ein empfangendes System die Freitext-Dosierungsinformation in strukturierte Dosierungsinformation umwandeln, um sie in einer Medikationsverwaltung anzuzeigen oder später zu exponieren. Geht es zum Beispiel um eine Angabe zu Tageszeiten der Einnahme in der freitextlichen Dosierungsinformation als 'Morgens, Mittags, Abends', so könnte das empfangende System diese Angabe in strukturierte Dosierungsinformationen umwandeln, die die Einnahmezeiten in kodierter Form mit 'MORN', 'NOON', 'EVE' deklariert.
"
  * patientInstruction MS
    * ^short = "besondere Anweisungen für den Patienten"
  * timing 
    * event MS
      * ^short = "fester Zeitpunkt"
    * repeat 
      * ^short = "Wiederholungs-Angaben"
      * boundsDuration 
        * ^short = "Begrenzung der Dauer"
        * ^patternDuration.system = $cs-ucum
        * value 1..1 
        * system 1..1 
        * code 1..1 
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
    * numerator MS
    * numerator only MedicationQuantityDoseForm
    * denominator MS
    * denominator only MedicationQuantity
  * maxDosePerAdministration MS
  * maxDosePerAdministration only MedicationQuantityDoseForm
    * ^short = "Maximaldosis pro Verabreichung"

Instance: ExampleISiKMedikationsInformation1
InstanceOf: ISiKMedikationsInformation
Usage: #example
* extension[acceptedRisk].valueString = "Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar."
* extension[medikationsart].valueCoding = ISiKMedikationsartCS#akut
* extension[selbstmedikation].valueBoolean = true
* extension[behandlungsziel].valueString = "Schmerztherapie postoperativ"
* status = #active
* medicationReference.reference = "Medication/ExampleISiKMedikament1"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod.start = 2021-07-01
* dateAsserted = 2021-07-01
* reasonReference.reference = "Condition/BehandlungsDiagnoseFreitext"
* dosage
  * timing.repeat
    * when[0] = #MORN
    * when[1] = #NOON
    * when[2] = #EVE
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "Brausetablette"
    * system = $cs-ucum
    * code = #1

Instance: ExampleISiKMedikationsInformation2
InstanceOf: ISiKMedikationsInformation
Usage: #example
* extension[medicationStatementReplaces].valueReference = Reference(ExampleISiKMedikationsInformation1)
* status = #active
* medicationReference.reference = "Medication/ExampleISiKMedikament2"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod.start = 2021-07-04
* dateAsserted = 2021-07-03
* dosage
  * timing.repeat
    * count = 6
    * frequency = 1
    * period = 3
    * periodUnit = #wk
  * doseAndRate.doseQuantity
    * value = 100
    * unit = "mg"
    * system = $cs-ucum
    * code = #mg

Instance: ExampleISiKMedikationsInformation3
InstanceOf: ISiKMedikationsInformation
Usage: #example
* status = #active
* medicationReference = Reference(ExampleISiKMedikament8)
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod
  * start = 2024-01-22
  * end = 2024-02-26
* dateAsserted = 2024-01-17
* dosage
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

// Einnahme zu jeder Mahlzeit (auch Zwischenmahlzeiten)
Instance: ExampleISiKMedikationsInformation4
InstanceOf: ISiKMedikationsInformation
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Beispiel für Medikation/Einnahme zu jeder Mahlzeit (auch Zwischenmahlzeiten)</div>"""
* status = #active
* medicationCodeableConcept = $cs-pzn#10557318 "Sevelamercarbonat AL 800 mg"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod
  * start = 2024-01-22
* dateAsserted = 2024-02-16
* dosage
  * timing
    * repeat
      * when = $cs-v3-event-timing#C
  * patientInstruction = "auch zu Zwischenmahlzeiten"
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "Tabl."
    * system = $cs-ucum
    * code = #1

// Einnahme am ersten Dienstag jedes dritten Monats
Instance: ExampleISiKMedikationsInformation5
InstanceOf: ISiKMedikationsInformation
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Beispiel für Medikation/Einnahme am ersten Dienstag jedes dritten Monats</div>"""
* status = #active
* medicationCodeableConcept = $cs-pzn#07260796 "Vitamin-B12-ratiopharm® N Ampullen zur Injektion"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod
  * start = 2024-02-06
* dateAsserted = 2024-01-31
* dosage
  * timing
    * repeat
      * frequency = 1
      * period = 3
      * periodUnit = #mo
      * dayOfWeek = #tue
  * patientInstruction = "alle 3 Monate am 1. Dienstag"
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "Tabl."
    * system = $cs-ucum
    * code = #1

// Beispiel Dosierung kurzwirksames Insulin nach gemessenen Werten
Instance: ExampleISiKMedikationsInformation6
InstanceOf: ISiKMedikationsInformation
Usage: #example
* text  
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Beispiel für Dosierung kurzwirksames Insulin nach gemessenen Werten</div>"""
* status = #active
* medicationCodeableConcept = $cs-pzn#06922060 "Huminsulin® Normal KwikPen™"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod.start = 2024-02-20
* dateAsserted = 2024-02-20
* reasonReference.reference = "Condition/DiagnoseDiabetesMellitus"
* dosage
  * patientInstruction = "Dosierung nach BZ, gemäß Informationsblatt vom 20.02.2024"
  * timing
    * repeat
      * timeOfDay = 07:00:00
      * timeOfDay = 13:00:00
      * timeOfDay = 19:00:00

// Beispiel Parkinson-Medikation: Medikament 1
Instance: ExampleISiKMedikationsInformationParkinson1
InstanceOf: ISiKMedikationsInformation
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Beispiel für Parkinson-Medikation mit Medikament1</div>"""
* status = #active
* medicationCodeableConcept = $cs-pzn#00003056 "Stalevo® 100 mg/25 mg/200 mg"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod.start = 2024-02-20
* dateAsserted = 2024-02-20
* reasonReference.reference = "Condition/DiagnoseParkinson"
* dosage
  * timing
    * repeat
      * timeOfDay = 07:00:00
      * timeOfDay = 10:00:00
      * timeOfDay = 14:00:00
      * timeOfDay = 18:00:00
  * doseAndRate
    * doseQuantity
      * value = 1
      * unit = "Tbl."
      * system = $cs-ucum
      * code = #1

// Beispiel Parkinson-Medikation: Medikament 2
Instance: ExampleISiKMedikationsInformationParkinson2
InstanceOf: ISiKMedikationsInformation
Usage: #example
* status = #active
* medicationCodeableConcept = $cs-pzn#09339154 "Quetiapin HEXAL® 50 mg"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod.start = 2024-02-20
* dateAsserted = 2024-02-20
* reasonReference.reference = "Condition/DiagnoseParkinson"
* dosage
  * timing
    * repeat
      * timeOfDay = 13:00:00
      * timeOfDay = 22:00:00
  * doseAndRate
    * doseQuantity
      * value = 1
      * unit = "Tbl."
      * system = $cs-ucum
      * code = #1

// Beispiel Parkinson-Medikation: Medikament 3
Instance: ExampleISiKMedikationsInformationParkinson3
InstanceOf: ISiKMedikationsInformation
Usage: #example
* status = #active
* medicationCodeableConcept = $cs-pzn#03395803 "Madopar® 125 mg"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod.start = 2024-02-20
* dateAsserted = 2024-02-20
* reasonReference.reference = "Condition/DiagnoseParkinson"
* dosage
  * timing
    * repeat
      * timeOfDay = 14:00:00
  * doseAndRate
    * doseQuantity
      * value = 0.5
      * unit = "FTbl."
      * system = $cs-ucum
      * code = #1
* dosage
  * timing
    * repeat
      * timeOfDay = 18:00:00
  * doseAndRate
    * doseQuantity
      * value = 1
      * unit = "FTbl."
      * system = $cs-ucum
      * code = #1

// Beispiel Parkinson-Medikation: Medikament 4
Instance: ExampleISiKMedikationsInformationParkinson4
InstanceOf: ISiKMedikationsInformation
Usage: #example
* status = #active
* medicationCodeableConcept = $cs-pzn#11119856 "Entacapon HEC 200 mg"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod.start = 2024-02-20
* dateAsserted = 2024-02-20
* reasonReference.reference = "Condition/DiagnoseParkinson"
* dosage
  * timing
    * repeat
      * timeOfDay = 14:00:00
      * timeOfDay = 22:00:00
  * doseAndRate
    * doseQuantity
      * value = 1
      * unit = "Tbl."
      * system = $cs-ucum
      * code = #1

// Beispiel Parkinson-Medikation: Medikament 5
Instance: ExampleISiKMedikationsInformationParkinson5
InstanceOf: ISiKMedikationsInformation
Usage: #example
* status = #active
* medicationCodeableConcept = $cs-pzn#04855419 "LevoCarb 200/50 ret - 1 A Pharma®"
* subject = Reference(PatientinMusterfrau)
* context = Reference(FachabteilungskontaktMinimal)
* effectivePeriod.start = 2024-02-20
* dateAsserted = 2024-02-20
* reasonReference.reference = "Condition/DiagnoseParkinson"
* dosage
  * timing
    * repeat
      * timeOfDay = 22:00:00
  * doseAndRate
    * doseQuantity
      * value = 1
      * unit = "Tbl."
      * system = $cs-ucum
      * code = #1
