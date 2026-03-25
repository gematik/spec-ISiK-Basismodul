Profile: ISiKLaborbefund
Parent: DiagnosticReport
Id: ISiKLaborbefund
Description: "Dieses Profil ermöglicht die Abbildung von Laborbefunden eines Patienten in ISiK Szenarien. Es dient der strukturierten Dokumentation und Gruppierung von Laboruntersuchungen, ihren Ergebnissen und zugehörigen Informationen, um eine konsistente und maschinenlesbare Darstellung von Laborbefunden zu gewährleisten."
* insert Meta
* insert CommonElements
* identifier MS
  * ^short = "Eindeutiger Identifier des Laborbefunds"
  * ^comment = "**Begründung MS**: Ein eindeutiger Identifier ermöglicht die zuverlässige Referenzierung und Nachverfolgung von Laborbefunden über verschiedene Systeme hinweg."
  * type 1.. MS
    * ^short = "Art des Identifiers"
    * ^comment = "**Begründung MS**: Der Identifier-Typ dient zur fachlichen Unterscheidung verschiedener Identifikatoren eines Laborbefunds."  
  * system 1.. MS
    * ^short = "Namensraum des Identifiers"
    * ^comment = "**Begründung MS**: Das System gibt den Kontext oder die Quelle des Identifiers an"
  * value 1.. MS
    * ^short = "Der eigentliche Identifier-Wert"
    * ^comment = "**Begründung MS**: Der Wert ist die konkrete Kennung der Laborbefunde und muss in ihrem Namensraum eindeutig sein."
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains befund 1..1 MS
* identifier[befund] ^short = "Filler-Identifikator"
* identifier[befund] ^comment = "**Begründung MS**: Der Filler-Identifikator ist der vom Labor (Filler) vergebene, eindeutige Identifier eines Laborbefunds und dient zur zuverlässigen Zuordnung und Nachverfolgung dieses Befunds in anderen Systemen (z. B. LIS)."
* identifier[befund].type 1.. MS
* identifier[befund].type = $v2-0203#FILL
* status MS
  * ^short = "Status des Befunds"
  * ^comment = "**Begründung MS**: Der Status ist unerlässlich für die korrekte Interpretation eines Befunds. **WICHTIGER Hinweis für Implementierer**:  
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch die Werte `final` und `unknown`.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Befunden mit dem status `entered-in-error`"
* category 1.. MS
  * ^short = "Befund-Kategorie"
  * ^comment = "**Begründung MS**: Die Kategorisierung eines Befunds dient der fachlichen Einordnung und erleichtert die Suche und Filterung von Befunden."
  * coding MS
    * ^short = "Codierte Darstellung der Befund-Kategorie"
    * ^comment = "**Begründung MS**: Eine codierte Darstellung ermöglicht die maschinelle Verarbeitung und erleichtert die Suche und Filterung von Befunden."
    * system 1.. MS
      * ^short = "Kodiersystem für die Kategorie"
      * ^comment = "**Begründung MS**: Das System gibt den Kontext oder die Quelle des Kategoriecodes an."
    * code 1.. MS
      * ^short = "Kategoriecode"
      * ^comment = "**Begründung MS**: Der Code dient zur fachlichen Unterscheidung verschiedener Kategorien eines Befunds."
    * display MS
      * ^short = "Anzeigename der Kategorie"
      * ^comment = "**Begründung MS**: Der Anzeigename bietet eine lesbare Darstellung der Kategorie für Benutzer."
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains lab-category 1..1 MS
* category[lab-category] ^short = "Labor-Kategorie"
* category[lab-category] ^comment = "**Begründung MS**: Kategorie-Slice für Laborbefunde"
* category[lab-category] = $v2-0074#LAB
* code MS
  * ^short = "Code"
  * ^comment = "**Begründung MS**: Der Code ist unerlässlich für die korrekte Interpretation eines Befunds, da er die Art des Befunds angibt."
  * coding MS
    * ^short = "Codierte Darstellung des Befunds"
    * ^comment = "**Begründung MS**: Eine codierte Darstellung ermöglicht die maschinelle Verarbeitung und erleichtert die Suche und Filterung von Befunden."
    * system 1.. MS
      * ^short = "Kodiersystem für den Befundcode"
      * ^comment = "**Begründung MS**: Das System gibt den Kontext oder die Quelle des Befundcodes an."
    * code 1.. MS
      * ^short = "Befundcode"
      * ^comment = "**Begründung MS**: Der Code dient zur fachlichen Unterscheidung verschiedener Befunde."
    * display MS
      * ^short = "Anzeigename des Befunds"
      * ^comment = "**Begründung MS**: Der Anzeigename bietet eine lesbare Darstellung des Befundcodes für Benutzer."
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains loinc-labReport 1..1 MS
* code.coding[loinc-labReport] = $loinc#11502-2
  * ^short = "LOINC-Code für Laborbefund"
  * ^comment = "**Begründung MS**: Der LOINC-Code 11502-2 ist der etablierte Standardcode für die Kategorie 'Laborbefund' und ermöglicht eine konsistente und interoperable Kennzeichnung von Laborbefunden über verschiedene Systeme hinweg."
* subject only Reference(Patient)
* subject 1..1 MS
  * ^short = "Patientenbezug"
  * ^comment = "**Begründung Pflichtfeld:** Ein Patientenbezug des Falls muss stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen."
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * insert Comment-Reference-Subject(Begründung Pflichtfeld)
* encounter MS
  * ^short = "Aufenthaltsbezug"
  * ^comment = "**Begründung Must-Support:** Ein Aufenthaltsbezug der Diagnose MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen."
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * insert Comment-Reference-Encounter-with-hint(Begründung Pflichtfeld)
* effective[x] MS
  * ^short = "Klinisches Bezugsdatum"
  * ^comment = "**Begründung Must Support**: Das Datum und die Uhrzeit der Untersuchungen des Befundes sind für die Interpretation der Untersuchungsergebnisse relevant. Sie ermöglichen die zeitliche Einordnung der Ergebnisse, was insbesondere bei Verlaufsauswertungen, Trendanalysen und zeitabhängiger Entscheidungsunterstützung von großer Bedeutung ist."
* effectiveDateTime MS
  * ^short = "Zeitpunkt (Datum oder Datum + Uhrzeit)"
  * ^comment = "**Begründung MS**: Das Element `effectiveDateTime` ermöglicht die Angabe eines konkreten Zeitpunkts (Datum oder Datum + Uhrzeit) für das klinische Bezugsdatum eines Befunds. Es ist von zentraler Bedeutung, um die Beobachtung - insbesondere bei Laborbefunden - zeitlich korrekt einzuordnen und die klinische Relevanz der Ergebnisse zu bewerten."
* issued MS
  * ^short = "Zeitpunkt der Verfügbarkeit des Befunds"
  * ^comment = "**Begründung MS**: Relevant zur Nachvollziehbarkeit und Validierung von Befunden."
* performer MS
  * ^short = "Ausführende*r"
  * ^comment = "**Begründung MS**: Die durchführende Person oder Organisation ist für die Validität und Verantwortlichkeit des Befunds maßgeblich."
  * reference MS
    * ^short = "Performer-Link"
    * ^comment = "**Begründung MS**: Die Referenz ermöglicht die Verknüpfung mit der ausführenden Person oder Organisation"
* specimen MS
  * ^short = "Probenmaterial"
  * ^comment = "**Begründung MS**: Das Probenmaterial, auf dem die Laboruntersuchungen basieren, ist für die Interpretation der Ergebnisse von großer Bedeutung. Es ermöglicht die Nachvollziehbarkeit und Validierung der Befunde, da bestimmte Ergebnisse nur in Bezug auf spezifische Probenmaterialien korrekt interpretiert werden können."
  * reference MS
    * ^short = "Specimen-Link"
    * ^comment = "**Begründung MS**: Die Referenz ermöglicht die Verknüpfung mit dem Probenmaterial."
* result 1.. MS
  * ^short = "Ergebnis"
  * ^comment = "**Begründung MS**: Die Laboruntersuchungen eines Befunds müssen mit ihren Ergebnissen verknüpft werden, um eine vollständige und aussagekräftige Dokumentation der Befunde zu gewährleisten."
  * reference MS
    * ^short = "Ergebnis-Link"
    * ^comment = "**Begründung MS**: Die Referenz ermöglicht die Verknüpfung mit den Laborergebnissen, die Teil dieses Laborbefunds sind."

Instance: ExampleISiKLaborbefund1
InstanceOf: ISiKLaborbefund
Usage: #example
* identifier[befund].type = $v2-0203#FILL
* identifier[befund].system = "https://example.org/fhir/sid/laborberichte"
* identifier[befund].value = "0987654321"
* status = #final
* category[lab-category] = $v2-0074#LAB
* code.coding[loinc-labReport] = $loinc#11502-2
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* effectiveDateTime = "2021-09-01T12:00:00Z"
* issued = "2021-09-01T12:30:00Z"
* performer = Reference(PractitionerWalterArzt)
* result[0] = Reference(ExampleISiKLaboruntersuchungCRP1)
* result[1] = Reference(ExampleISiKLaboruntersuchungHb1)
* result[2] = Reference(ExampleISiKLaboruntersuchungThrombozyten1)
* result[3] = Reference(ExampleISiKLaboruntersuchungSerumkreatinin1)
* result[4] = Reference(ExampleISiKLaboruntersuchungGFR1)