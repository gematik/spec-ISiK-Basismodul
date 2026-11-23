Profile: SD_MII_ICU_Linksventrikulaeres_Herzzeitvolumen_Durch_Indikatorverduennung
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-lv-herzzeitvolumen-durch-indikator
Title: "SD MII ICU Linksventrikulaeres Herzzeitvolumen Durch Indikatorverduennung"
Description: "Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Herzzeitvolumens durch Indikatorverdünnung in der Akutmedizin."
// pw 23.03.26: fixed url and changed id to fix ig publisher error: Error generating combined package: file name 'package/StructureDefinition-sd-mii-icu-linksventri-herzzeitvolumen-durch-indikatorverd-6.0.0-rc.json' is too long ( > 100 bytes) (00:34.570 / 07:16.127, 1Gb)
* ^url = "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventri-herzzeitvolumen-durch-indikatorverd"
* insert Meta
* insert CommonElements
* code
  * coding[sct] ..0
    * ^patternCoding.system = "http://snomed.info/sct"
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8737-9
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* valueQuantity
  * ^patternQuantity.unit = "liter per minute"
  * unit 1..
  * code = #L/min

Instance: Linksventrikulaeres-Herzzeitvolumen-durch-Indikatorverduennung
InstanceOf: SD_MII_ICU_Linksventrikulaeres_Herzzeitvolumen_Durch_Indikatorverduennung
Usage: #example
* status = #final
* code = $loinc#8737-9 "Left ventricular Cardiac output by Indicator dilution"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 5 'L/min' "liter per minute"