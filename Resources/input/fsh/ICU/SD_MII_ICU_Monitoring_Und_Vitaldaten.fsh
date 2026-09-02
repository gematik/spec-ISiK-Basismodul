Profile: SD_MII_ICU_Monitoring_Und_Vitaldaten
Parent: Observation
Id: sd-mii-icu-monitoring-und-vitaldaten
Title: "SD MII ICU Monitoring und Vitaldaten"
Description: "Dieses Profil dient als Abstraktionsprofil für verschiedene spezialisierte Beobachtungen in der Akutmedizin zur Abbildung von Monitoring- und Vitaldaten."
* insert Meta
* insert CommonElements
* obeys vs-de-2
* identifier MS
* basedOn
  * ^comment = "Hinweis: maximale Kardinalität bei Übernahme aus MII-Kerndatensatz-ICU entfernt.
  
  Auch ein MS erscheint an dieser Stelle nicht sinnvoll, da eine Befüllung zunächst weiterer Profil-Definitionen bedürfte."
* partOf only Reference(Procedure)
* status MS
  * ^comment = "Motivation MS: Observation.status ist bereits durch die Kardinalität der Basisklasse Observation erzwungen. Dieses Feld dient der Präzisierung des Status der Untersuchung"
* category MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
* category contains
    vs-cat 1..1 MS
* category[vs-cat] = $observation-category#vital-signs
  * coding MS
    * system 1.. MS
    * code 1.. MS
* code MS
  * obeys code-coding-icu
  * coding 1..
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      sct 0..* MS and
      loinc 0..* MS and
      IEEE-11073 0..* MS
  * coding[sct] from VS_MII_ICU_Code_Monitoring_und_Vitaldaten_SNOMED (required)
    * ^patternCoding.system = $sct
    * system 1.. MS
    * code 1.. MS
  * coding[loinc] from VS_MII_ICU_Code_Monitoring_und_Vitaldaten_LOINC (required)
    * ^patternCoding.system = $loinc
    * system 1.. MS
    * code 1.. MS
  * coding[IEEE-11073] from VS_MII_ICU_Code_Monitoring_und_Vitaldaten_ISO11073 (required)
    * ^patternCoding.system = $IEEE11073
    * system 1.. MS
    * code 1.. MS
* subject 1.. MS
* subject only Reference(Patient)
* encounter MS
* effective[x] 1.. MS
* effective[x] only dateTime or Period
* value[x] only Quantity
* valueQuantity MS
  * system = "http://unitsofmeasure.org"
  * value 1.. MS
  * unit MS
  * system 1.. MS
  * code 1.. MS
* dataAbsentReason MS
  * obeys mii-icu-1
* interpretation MS
* bodySite MS
  * ^comment = "Hinweis für Implementierende: In wenigen abgeleiteten Profilen ist dieses Element nicht sinnvoll befüllbar. Für diese Einzelfälle werden keine Testvorgaben gemacht."
* bodySite from VS_MII_ICU_BodySite_Observation_Monitoring_und_Vitaldaten (extensible)
* device MS
  * ^comment = "**Bedingtes MS:** Geräteangaben sind relevante Informationen, die persistiert und exponiert werden SOLLEN, sofern sie verfügbar sind. Das Must-Support gilt ausschließlich für Systeme, die
  Geräteangaben persistieren."
* referenceRange MS
* component 
  * ^comment = "Das Must-Support wurde an dieser Stelle entfernt, da es im Wesentlichen für die sonstigen pulsatilen Drücke relevant ist."
  * code MS
  * value[x] only Quantity
  * valueQuantity MS
  * dataAbsentReason MS
  * interpretation MS
  * referenceRange MS
* performer MS
  * ^comment = "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit"
* method MS
  * ^comment = "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit"