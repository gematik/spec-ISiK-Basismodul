Profile: ISiKMedikationsVerordnung
Parent: MedicationRequest
Id: ISiKMedikationsVerordnung
Description: "Dieses Profil ermöglicht die Abbildung von Medikationsverordnungen eines Patienten in ISiK Szenarien."
// * insert CompliesWith(http://hl7.eu/fhir/mpd/StructureDefinition/MedicationRequest-eu-mpd)
* insert Meta
* insert CommonElements
* extension MS
* extension contains
    ExtensionISiKAcceptedRisk named acceptedRisk 0..1 MS and
    ExtensionISiKMedikationsart named medikationsart 0..1 MS and
    ExtensionISiKBehandlungsziel named behandlungsziel 0..1 MS
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
* status MS
  * ^short = "Status der Verordnungsinformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard.
  
  Hinweis für Implementierende: Im Falle einer create-Operation kann der Server den .code in .status zunächst auf 'on-hold' setzen, z. B. im Falle einer asynchronen Prüfung, die im Rahmen einer textuellen Übergabe möglich ist. Ggf. kann hier zusätzlich ein Mechanismus etabliert werden, der eine anschließende Änderung des Status an den Client kommuniziert. Der Server kann zusätzlich den .code in .statusReason auf 'clarif' setzen ('Clarification is required before the order can be acted upon.'), um anzuzeigen, dass eine Klärung erforderlich ist, bevor die Verordnung ausgeführt werden kann.
  "
* intent MS
  * ^short = "Ziel der Verordnungsinformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard

  Hinweis: i.d.R. 'order'"
* doNotPerform MS
  * ^short = "Nicht durchführen"
  * ^comment = "**Begründung MS:** Die Kennzeichnung als Must-Support erfolgt, da es sich um ein als Modifier-Element markiertes Feld in der Kernspezifikation handelt. Und wegen der Kompatibilität mit eRezept und ePA Profilen, welche die Angabe von 'doNotPerform' nicht verbieten." 
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
* insert ISiKDosageDE(dosageInstruction)
* dispenseRequest MS
  * ^short = "angeforderte Abgabemenge"
  * ^comment = "Begründung des Must-Support: Basisinformation"
  * quantity MS
  * quantity only MedicationQuantityDoseForm
    * ^short = "angeforderte Abgabemenge"
    * ^comment = "Begründung des Must-Support: Basisinformation"
* substitution MS
  * ^short = "Ersatz zulässig"
  * ^comment = "Begründung des Must-Support: Alignment mit dem (E-)Rezept"
  * allowedBoolean MS
* priorPrescription MS 
  * ^short = "Vorherige Verordnung mit Bezug zur aktuellen Verordnung"
  * ^comment = "Begründung des Must-Support: Erforderlich zur Abbildung des fachlichen Zusammenhangs zwischen Verordnungen (z. B. Fortführung, Änderung oder Ersetzung) und zur Nachvollziehbarkeit der Medikationshistorie."

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
* priorPrescription = Reference(ExampleISiKMedikationsVerordnung)
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

Instance: ExampleISiKMedikationsVerordnungBedarfsmedikation
InstanceOf: ISiKMedikationsVerordnung
Usage: #example
* extension[medikationsart].valueCoding = ISiKMedikationsartCS#akut
* status = #active
* intent = #order
* medicationReference.reference = "Medication/ExampleISiKMedikament1"
* subject = Reference(PatientinMusterfrau)
* encounter.reference = "Encounter/Fachabteilungskontakt"
* authoredOn = 2026-04-24
* requester.reference = "Practitioner/PractitionerWalterArzt"
* dosageInstruction
  * asNeededBoolean = true
  * timing.repeat
    * frequency = 1
    * period = 6
    * periodUnit = #h
  * extension[asNeededFor][+]
    * valueCodeableConcept.coding[0]
      * system = $cs-sct
      * version = "http://snomed.info/sct/11000274103/version/20251115"
      * code = #76948002
      * display = "Starke Schmerzen"
  * extension[asNeededFor][+]
    * valueCodeableConcept.coding[0]
      * system = $cs-sct
      * version = "http://snomed.info/sct/11000274103/version/20251115"
      * code = #50415004
      * display = "Moderate Schmerzen"
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "Tablette"
    * system = $cs-edqm
    * code = #15054000
