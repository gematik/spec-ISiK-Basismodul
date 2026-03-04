Profile: ISiKLaborbefund
Parent: DiagnosticReport
Id: ISiKLaborbefund
Description: "Dieses Profil ermöglicht die Abbildung von Laborbefunden eines Patienten in ISiK Szenarien. Es dient der strukturierten Dokumentation und Gruppierung von Laboruntersuchungen, ihren Ergebnissen und zugehörigen Informationen, um eine konsistente und maschinenlesbare Darstellung von Laborbefunden zu gewährleisten."
* insert Meta
* insert CommonElements
* identifier MS
  * ^short = "Eindeutiger Identifier des Laborbefunds"
  * ^definition = "**Begründung MS**: Ein eindeutiger Identifier ermöglicht die zuverlässige Referenzierung und Nachverfolgung von Laborbefunden über verschiedene Systeme hinweg."
  * type 1.. MS
    * ^short = "Art des Identifiers"
    * ^comment = "**Begründung MS**: Der Identifier-Typ dient zur fachlichen Unterscheidung verschiedener Identifikatoren eines Laborbefunds."  
  * system 1.. MS
    * ^short = "Namensraum des Identifiers"
    * ^definition = "**Begründung MS**: Das System gibt den Kontext oder die Quelle des Identifiers an"
  * value 1.. MS
    * ^short = "Der eigentliche Identifier-Wert"
    * ^definition = "**Begründung MS**: Der Wert ist die konkrete Kennung der Laborbefunde und muss in ihrem Namensraum eindeutig sein."
* insert Translation(identifier ^short, de-DE, Identifikator)
* insert Translation(identifier ^short, en-US, Identifier)
* insert Translation(identifier ^definition, de-DE, [[Eindeutige Identifikatoren, unter denen dieser Laborbefund geführt wird.]])
* insert Translation(identifier ^definition, en-US, [[Identifier(s) by which this laboratory report is known.]])
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains befund 1..1 MS
* identifier[befund] ^short = "Filler-Identifikator"
* identifier[befund] ^definition = "Identifikator, der vom Laborinformationssystem (Filler) vergeben wurde."
* insert Translation(identifier[befund] ^short, de-DE, Filler-Identifikator)
* insert Translation(identifier[befund] ^short, en-US, Filler identifier)
* insert Translation(identifier[befund] ^definition, de-DE, [[Identifikator, der vom Laborinformationssystem (Filler) vergeben wurde.]])
* insert Translation(identifier[befund] ^definition, en-US, [[Identifier assigned by the laboratory information system (Filler).]])
* identifier[befund].type 1.. MS
* identifier[befund].type = $v2-0203#FILL
* identifier[befund].type.coding MS
* identifier[befund].type.coding ^slicing.discriminator.type = #value
* identifier[befund].type.coding ^slicing.discriminator.path = "system"
* identifier[befund].type.coding ^slicing.rules = #open
* identifier[befund].type.coding contains fillerV2 1..1 MS
* identifier[befund].type.coding[fillerV2].system 1.. MS
* identifier[befund].type.coding[fillerV2].system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
* identifier[befund].type.coding[fillerV2].code 1.. MS
* identifier[befund].type.coding[fillerV2].code = #FILL (exactly)
* identifier[befund].system 1.. MS
* identifier[befund].value 1.. MS
* identifier[befund].assigner 1.. MS
* basedOn 1.. MS
  * ^short = "basiert auf"
  * ^definition = "Bezug zum Laborauftrag, auf dem dieser Laborbefund basiert."
  * reference MS
  * identifier MS
* insert Translation(basedOn ^short, de-DE, Basiert auf)
* insert Translation(basedOn ^short, en-US, Based on)
* insert Translation(basedOn ^definition, de-DE, [[Bezug zum Laborauftrag, auf dem dieser Laborbefund basiert.]])
* insert Translation(basedOn ^definition, en-US, Reference to the laboratory order on which this laboratory report is based.)
* status MS
  * ^short = "Status"
  * ^definition = "registriert | teilweise | vorläufig | final"
* insert Translation(status ^short, de-DE, Status)
* insert Translation(status ^short, en-US, Status)
* insert Translation(status ^definition, de-DE, registriert | teilweise | vorläufig | final)
* insert Translation(status ^definition, en-US, registered | partial | preliminary | final)
* category 1.. MS
  * ^short = "Kategorie"
  * ^definition = "Klassifikation des Befunds"
* insert Translation(category ^short, de-DE, Kategorie)
* insert Translation(category ^short, en-US, Category)
* insert Translation(category ^definition, de-DE, Klassifikation des Befunds)
* insert Translation(category ^definition, en-US, Classification of the report)
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains lab-category 1..1 MS
* category[lab-category] ^short = "Labor-Kategorie"
* category[lab-category] ^definition = "Kategorie-Slice für Laborbefunde"
* category[lab-category] ^patternCodeableConcept.coding[0] = $loinc#26436-6
* category[lab-category] ^patternCodeableConcept.coding[+] = $v2-0074#LAB
* category[lab-category].coding 2.. MS
  * system 1.. MS
  * code 1.. MS
  * display MS
* code MS
  * ^short = "Code"
  * ^definition = "LOINC Code zur Identifikation des Befunds als Laborbefund."
  * coding MS
    * system 1.. MS
    * code 1.. MS
    * display MS
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^short, en-US, Code)
* insert Translation(code ^definition, de-DE, LOINC Code zur Identifikation des Befunds als Laborbefund.)
* insert Translation(code ^definition, en-US, A LOINC code identifying the report as laboratory report.)
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains loinc-labReport 1..1 MS
* code.coding[loinc-labReport] = $loinc#11502-2
* subject 1.. MS
  * reference MS
  * identifier MS
* subject ^short = "Subjekt"
* subject ^definition = "Subjekt, auf welches sich der Laborbefund bezieht"
* insert Translation(subject ^short, de-DE, Subjekt)
* insert Translation(subject ^short, en-US, Subject)
* insert Translation(subject ^definition, de-DE, [[Subjekt, auf welches sich der Laborbefund bezieht]])
* insert Translation(subject ^definition, en-US, [[Subject to whom the laboratory report refers]])
* encounter MS
  * reference MS
  * identifier MS
* encounter ^short = "Fall oder Kontakt"
* encounter ^definition = "Fall oder Kontakt, in dem der Laborbefund erstellt wurde."
* insert Translation(encounter ^short, de-DE, Fall oder Kontakt)
* insert Translation(encounter ^short, en-US, Encounter)
* insert Translation(encounter ^definition, de-DE, [[Fall oder Kontakt, in dem der Laborbefund erstellt wurde.]])
* insert Translation(encounter ^definition, en-US, [[Encounter during which the laboratory report was created.]])
* effective[x] 1.. MS
  * ^short = "Klinisches Bezugsdatum"
  * ^definition = """
    Zeitpunkt, zu dem die gemessene Eigenschaft im Probenmaterial (e.g. Analytkonzentration) mutmaßlich der Eigenschaft im Patienten entsprach. 
    Wenn der Zeitpunkt der Probenentnahme angegeben ist, wird meist dieser Zeitpunkt verwendet. 
    Andernfalls wird zumeist behelfsmäßig der Probeneingang im Labor gewählt. 
    Dieses Element ist wichtig um verschiedene Analysen im Zeitverlauf sortieren zu können.
    """
* insert Translation(effective[x] ^short, de-DE, Klinisches Bezugsdatum)
* insert Translation(effective[x] ^short, en-US, Clinical reference Date)
* insert Translation(effective[x] ^definition, de-DE, [[Zeitpunkt, zu dem die gemessene Eigenschaft im Probenmaterial e.g. Analytkonzentration mutmaßlich der Eigenschaft im Patienten entsprach.]])
* insert Translation(effective[x] ^definition, en-US, [[The time when the measured property in the specimen material e.g. analyte concentration is presumed to pertain to the patient.]])
* effective[x] only dateTime
* effective[x].extension contains mii-ex-labor-quelle-klinisches-bezugsdatum named QuelleKlinischesBezugsdatum 0..1 MS
* effective[x].extension[QuelleKlinischesBezugsdatum] ^short = "Quelle des klinischen Bezugsdatums"
* effective[x].extension[QuelleKlinischesBezugsdatum] ^definition = "Datum der Probenentnahme | Datum des Eingangs der Probe im Labor"
* insert Translation(effective[x].extension[QuelleKlinischesBezugsdatum] ^short, de-DE, Quelle des klinischen Bezugsdatums)
* insert Translation(effective[x].extension[QuelleKlinischesBezugsdatum] ^short, en-US, Source of clinical reference date)
* insert Translation(effective[x].extension[QuelleKlinischesBezugsdatum] ^definition, de-DE, Datum der Probenentnahme | Datum des Eingangs der Probe im Labor)
* insert Translation(effective[x].extension[QuelleKlinischesBezugsdatum] ^definition, en-US, Specimen collection date | Date sample received in laboratory)
* issued 1.. MS
  * ^short = "Dokumentationsdatum"
  * ^definition = "Zeitpunkt, an dem der Laborbefund dokumentiert wurde."
* insert Translation(issued ^short, de-DE, Dokumentationsdatum)
* insert Translation(issued ^short, en-US, Issued)
* insert Translation(issued ^definition, de-DE, [[Zeitpunkt, an dem der Laborbefund dokumentiert wurde.]])
* insert Translation(issued ^definition, en-US, [[The time when the laboratory report was documented.]])
* performer MS
  * ^short = "Ausführende*r"
  * ^definition = "Verantwortliche Person oder Organisation, die für die Ausstellung des Befunds verantwortlich ist."
  * reference MS
  * identifier MS
* insert Translation(performer ^short, de-DE, Ausführende*r)
* insert Translation(performer ^short, en-US, Performer)
* insert Translation(performer ^definition, de-DE, [[Verantwortliche Person oder Organisation, die für die Ausstellung des Befunds verantwortlich ist.]])
* insert Translation(performer ^definition, en-US, [[Person or organization responsible for issuing the report.]])
* specimen MS
  * ^short = "Probenmaterial"
  * ^definition = "Bioproben, auf denen dieser Laborbefund basiert."
  * reference MS
  * identifier MS
* insert Translation(specimen ^short, de-DE, Probenmaterial)
* insert Translation(specimen ^short, en-US, Specimen)
* insert Translation(specimen ^definition, de-DE, [[Bioproben, auf denen dieser Laborbefund basiert.]])
* insert Translation(specimen ^definition, en-US, [[Details about the specimen on which this diagnostic report is based.]])
* result 1.. MS
  * ^short = "Ergebnis"
  * ^definition = "Laborergebnisse, die Teil dieses Laborbefunds sind."
  * reference MS
* insert Translation(result ^short, de-DE, Ergebnis)
* insert Translation(result ^short, en-US, Result)
* insert Translation(result ^definition, de-DE, [[Laborergebnisse, die Teil dieses Laborbefunds sind.]])
* insert Translation(result ^definition, en-US, [[Laboratory test results that are part of this diagnostic report.]])
* conclusion MS
  * ^short = "Schlussfolgerung"
  * ^definition = "Klinische Schlussfolgerung/Interpretation der Testergebnisse"
* insert Translation(conclusion ^short, de-DE, Schlussfolgerung)
* insert Translation(conclusion ^short, en-US, Conclusion)
* insert Translation(conclusion ^definition, de-DE, [[Klinische Schlussfolgerung/Interpretation der Testergebnisse]])
* insert Translation(conclusion ^definition, en-US, [[Clinical conclusion/interpretation of test results]])