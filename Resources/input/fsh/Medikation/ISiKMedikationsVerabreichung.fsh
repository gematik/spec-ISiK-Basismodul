Profile: ISiKMedikationsVerabreichung
Parent: MedicationAdministration
Id: ISiKMedikationsVerabreichung
Description: "Dieses Profil ermöglicht die Abbildung der Verabreichung von Medikamenten für einen Patienten in ISiK Szenarien. 
Hinweis zur Auswahl des Profils: In Abgrenzung zu ISiKMedikationsInformation (MedicationStatement) wird mittels des vorliegenden Profils die Verabreichung eines Medikaments an einen Patienten mit einer Zeitpunkt-genauen Angabe abgebildet (.effectiveDateTime oder .effectivePeriod auf Sekundenebene gemäß der [FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime)). D.h. die lediglich Datums-genaue Angabe  ist im vorliegenden Profil nicht erlaubt. 
Das Profil ISiKMedikationsInformation (MedicationStatement) kann ebenfalls für  die Abbildung der Verabreichung von Medikamenten für einen Patienten verwendet werden, wenn keine Zeitpunkt-genauen Angaben zur Verabreichung vorliegen, sondern lediglich Datums-genaue Angaben (einschließlich Granularität Jahr, Monat oder Tag).

Begründung zur Profil- und Nutzungsdifferenzierung:
Handelt es sich bei Erfassung um eine medizinische Verabreichungsdokumentation, dann ist ein genauer Zeitstempel zwingend. Die medizinische Verabreichungsdokumentation muss durch medizinisches Personal erfolgen. Angaben von Patienten und Angehörigen sind grundsätzlich keine medizinische Verabreichungsdokumentation und daher als MedicationStament zu erfassen(['report that such a sequence (or at least a part of it) did take place'](https://hl7.org/fhir/R4/medicationstatement.html)). 

**Hinweis zur Pausierung einer Medikation (Best-Practice):**

Für die Abbildung der Pausierung einer Medikation wird empfohlen, **mehrere `MedicationAdministration`-Ressourcen** zu verwenden, anstatt eine bestehende zu überschreiben. Dies bringt folgende Vorteile:

- **Korrekte Statusabbildung:**  
  Das `status`-Feld muss stets aktuell gepflegt werden, um den momentanen Zustand der Medikation systemweit sichtbar und durchsuchbar zu halten.

- **Effiziente Abfragen über REST API:**  
  In Kombination mit `effective[x]` ermöglicht das `status`-Feld die gezielte Abfrage aller aktuell gültigen Medikationseinträge über die REST API.  
  Wird stattdessen nur das `dosage`-Element verändert, ist keine zuverlässige Filterung möglich – alle `MedicationAdministrations` müssten abgerufen und manuell analysiert werden.

- **Erhalt von Verlaufsinformationen:**  
  Wenn z. B. auch ein `statusReason` (z. B. „pausiert wegen Nebenwirkungen“) dokumentiert wird, ginge diese Information bei einem Update der bestehenden Ressource verloren, sobald die Medikation fortgesetzt wird.  
  Durch neue `MedicationAdministration`-Einträge bleibt die Verlaufshistorie erhalten.  
  *(Dieser Anwendungsfall ist aktuell nicht gefordert, aber zukünftig denkbar.)*
"
* insert Meta
* insert CommonElements
* status MS
  * ^short = "Status der Verabreichungsinformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard"
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
* effectiveDateTime MS
  * ^short = "Zeitpunkt der Verabreichung"
  * ^comment = "Begründung des Must-Support: Basisinformation
  
  Festlegung zur Nutzung: eine Zeitpunkt-genaue Angabe (.effectiveDateTime oder .effectivePeriod auf Sekundenebene gemäß der [FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime)) MUSS hier seitens eines bestätigungsrelevanten Systems unterstützt werden.

  Für grobgranularere Angaben (z.B. nur Jahr, Monat oder Tag) SOLL das Profil ISiKMedikationsInformation (MedicationStatement) verwendet werden.
  "
* effectivePeriod MS
  * ^short = "Zeitraum der Verabreichung"
  * ^comment = "Begründung des Must-Support: Basisinformation
  
  Festlegung zur Nutzung: eine Zeitpunkt-genaue Angabe (.effectiveDateTime oder .effectivePeriod auf Sekundenebene gemäß der [FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime)) MUSS hier seitens eines bestätigungsrelevanten Systems unterstützt werden.
  Für grobgranularere Angaben (z.B. nur Jahr, Monat oder Tag) SOLL das Profil ISiKMedikationsInformation (MedicationStatement) verwendet werden.
  "
  * start MS
  * end MS
* performer MS
  * actor MS
    * ^short = "Referenz auf die verabreichende Person"
    * ^comment = "Begründung des Must-Support: Nachvollziehbarkeit"
    * reference 1..1 MS
* reasonCode MS
  * ^short = "Grund der Medikation (Referenz)"
  * ^comment = "  Festlegung zum MS: Die Elemente .reasonCode und .reasonReference MÜSSEN nach OR-Logik in der Ausgabe verwendet werden, d.h. nur eines MUSS geliefert werden können. Weiterhin MÜSSEN beide Elemente interpretiert werden können."
* reasonReference MS
  * ^short = "Grund der Medikation (Referenz)"
  * ^comment = "  Festlegung zum MS: Die Elemente .reasonCode und .reasonReference MÜSSEN nach OR-Logik in der Ausgabe verwendet werden, d.h. nur eines MUSS geliefert werden können. Weiterhin MÜSSEN beide Elemente interpretiert werden können."
  * reference 1..1 MS
* request MS
  * ^short = "Referenz auf die Verordnung"
  * ^comment = """**Einschränkung der übergreifenden MS-Definition:**
  Verfügt ein bestätigungsrelevantes System nicht über die Möglichkeit zur Abbildung der zugrunde liegenden Verordnung einer Verabreichung, 
  so MUSS dieses System die Information NICHT abbilden.

  Motivation zum eingeschränkten MS: Die referenzierte Verordnung (`MedicationRequest`) bildet in der Regel die Grundlage einer Verabreichung (`MedicationAdministration`). 
  Aus fachlicher Sicht ist die Verknüpfung beider Ressourcen wesentlich, da sie die Nachvollziehbarkeit der therapeutischen Maßnahme unterstützt. 
  Allerdings existieren in der Versorgungspraxis auch Systeme, die keine strukturierte Erfassung oder Referenzierung einer zugrundeliegenden Verordnung vorsehen. 
  Daher wird `MedicationAdministration.request` in ISiK als eingeschränktes Must Support definiert, um eine einheitliche  Implementierung zu fördern.
  """
* note MS
  * text MS
    * ^short = "Freitext-Notiz"
    * ^comment = "Begründung des Must-Support: Angabe zusätzlicher Informationen kann fachlich relevant sein"
* dosage MS only DosageDE
  * ^short = "Dosierungsangaben"
  * ^comment = "Begründung des Must-Support: Basisinformation. Zur vollständig strukturierten Abbildung der zahlreichen Möglichkeiten sind die hier mit Must-Support gekennzeichneten Unterelemente erforderlich gemäß Konsens der ISiK AG Medikation"
  * text
    * ^short = "Freitext-Dosierungsangabe"
    * ^comment = "Festlegung zum Must-Support: Die Verarbeitung MUSS unterstützt werden, indem empfangende Systeme  die Freitext-Dosierungsinformation entweder direkt in der Textform persistieren, ODER die Informationen in eine alternative (strukturierte) Form umwandeln (ggf. unter Einwirkung geeigneter Nutzer). Im letzteren Fall KANN auf eine Persistierung in Textform verzichtet werden, um Inkonsistenzen zu vermeiden.
        
    Ein System KANN jedoch strukturierte Dosierungsinformationen in Freitext-Dosierungsinformationen umwandeln, um sie in einem Dokument oder einer Benutzeroberfläche anzuzeigen - dabei ist auf Konsistenzwahrung zu allen strukturierten Elementen zu achten.
    
    Hinweis: Diese Festlegung folgt und spezifiziert folgende MS-Festlegung aus dem [ISiK Basismodul](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_Must-Support-Flags.page.md?version=current): 'Systeme KÖNNEN es darüber hinaus ermöglichen, dass die jeweiligen Informationen vom Anwender ergänzt oder editiert werden.' 
    
    Zum Beispiel kann die textuelle Information '1L Infusion mit Rate 50ml/h' in eine entsprechende, strukturierte Form überführt werden - d.h. in die Angabe von 'dose' und 'rateQuantity'."
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
  * dose MS
  * dose only MedicationQuantity
    * ^short = "verabreichte Dosis"
  * rateRatio MS
    * ^short = "Verabreichungs-Rate (Verhältnis)"
    * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden können. Beim Empfang und Verarbeitung der eingehenden Daten müssen dagegen beide Datentypen interpretiert werden können."
    * numerator 1.. MS
    * numerator only MedicationQuantity
    * denominator 1.. MS
    * denominator only MedicationQuantity
  * rateQuantity MS
  * rateQuantity only MedicationQuantity
    * ^short = "Verabreichungs-Rate"
    * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden können. Beim Empfang und Verarbeitung der eingehenden Daten müssen dagegen beide Datentypen interpretiert werden können."

Instance: ExampleISiKMedikationsVerabreichung
InstanceOf: ISiKMedikationsVerabreichung
Usage: #example
* status = #completed
* medicationReference.reference = "Medication/ExampleISiKMedikament1"
* subject.reference = "Patient/PatientinMusterfrau"
* context.reference = "Encounter/Fachabteilungskontakt"
* effectiveDateTime = 2021-07-01
* dosage
  * dose
    * value = 1
    * unit = "Tablette"
    * system = $cs-ucum
    * code = #1

Instance: ExampleISiKMedikationsVerabreichung2
InstanceOf: ISiKMedikationsVerabreichung
Usage: #example
* status = #completed
* medicationReference = Reference(ExampleISiKMedikament9)
* subject.reference = "Patient/PatientinMusterfrau"
* context.reference = "Encounter/Fachabteilungskontakt"
* effectiveDateTime = 2024-01-22
* dosage
  * dose
    * value = 1
    * unit = "Beutel"
    * system = $cs-ucum
    * code = #1

Instance: ExampleISiKMedikationsVerabreichung3
InstanceOf: ISiKMedikationsVerabreichung
Usage: #example
* status = #completed
* medicationReference = Reference(ExampleISiKMedikament9)
* subject.reference = "Patient/PatientinMusterfrau"
* context.reference = "Encounter/Fachabteilungskontakt"
* context.identifier.value = "0123456789"
* effectiveDateTime = 2021-07-01
* note.text = "Testnotiz"
* dosage
  * text = "1L Infusion mit Rate 50ml/h"
  * site = $cs-sct#6073002 "Structure of ligament of left superior vena cava"
  * dose
    * value = 1000
    * unit = "mL"
    * system = $cs-ucum
    * code = $cs-ucum#mL
  * rateQuantity
    * value = 50
    * unit = "mL/h"
    * system = $cs-ucum
    * code = $cs-ucum#mL/h
  * route = $cs-edqm#20045000 "Intravenous use"

Instance: ExampleISiKMedikationsVerabreichung4
InstanceOf: ISiKMedikationsVerabreichung
Usage: #example
* status = #completed
* medicationReference = Reference(ExampleISiKMedikament2)
* subject.reference = "Patient/PatientinMusterfrau"
* context.reference = "Encounter/Fachabteilungskontakt"
* context.identifier.value = "0123456789"
* effectiveDateTime = 2021-07-01
* note.text = "Testnotiz"
* dosage
  * text = "1L Infusion mit Rate 50ml/h"
  * site = $cs-sct#6073002 "Structure of ligament of left superior vena cava"
  * dose
    * value = 1000
    * unit = "mL"
    * system = $cs-ucum
    * code = $cs-ucum#mL
  * rateRatio
    * numerator
      * value = 50
      * unit = "mL"
      * system = $cs-ucum
      * code = $cs-ucum#mL
    * denominator
      * value = 1
      * unit = "h"
      * system = $cs-ucum
      * code = $cs-ucum#h
  * route = $cs-edqm#20045000 "Intravenous use"
