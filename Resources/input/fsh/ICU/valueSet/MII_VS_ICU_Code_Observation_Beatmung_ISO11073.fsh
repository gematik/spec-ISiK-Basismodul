ValueSet: MII_VS_ICU_Code_Observation_Beatmung_ISO11073
Id: mii-vs-icu-code-observation-beatmung-loinc-iso11073
Title: "MII VS ICU Code Observation Beatmung ISO11073"
Description: "Dieses ValueSet enthält Codes für die im Kontext einer Bilanz verwendeten Parameter."
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/ValueSet/mii-vs-icu-code-observation-beatmung-iso11073"
* ^version = "2026.0.0"
* ^status = #active
* ^date = "2025-02-11"
* ^experimental = false

* include $ieee-11073#150656 "Oxygenation Ratio"
* include $ieee-11073#151586 "Ventilation rate"
* include $ieee-11073#152498 "Unassisted spontaneous breath rate; respiration rate"
* include $ieee-11073#152490 "Total respiratory rate; total breath rate"
* include $ieee-11073#16929632 "Inspiratory time setting"
* include $ieee-11073#151832 "Ratio inspiration expiration time"
* include $ieee-11073#16929196 "Tidal volume setting"
* include $ieee-11073#151980 "Ventilation tidal volume"
* include $ieee-11073#152004 "Ventilation inspiratory minute volume"
* include $ieee-11073#16929860 "High pressure hold time setting Ventilator"
* include $ieee-11073#16929864 "Low pressure hold time setting Ventilator"
* include $ieee-11073#151948 "Ventilation inspiratory flow"
* include $ieee-11073#151944 "Ventilation expiratory flow"
* include $ieee-11073#153132 "Expired oxygen concentration (or partial pressure) in airway gas"
* include $ieee-11073#151975 "Mean pressure Respiratory system airway --on ventilator"
* include $ieee-11073#151973 "Pressure.max Respiratory system airway --on ventilator"
* include $ieee-11073#151692 "Thoracic compliance"
* include $ieee-11073#151976 "Applied PEEP"
* include $ieee-11073#152720 "Inspiratory airway pressure relative to PEEP or BAP"
* include $ieee-11073#151708 "End tidal carbon dioxide concentration (or partial pressure) in airway gas"

