ValueSet: MII_VS_ICU_Code_Observation_Beatmung_SNOMED
Id: mii-vs-icu-code-observation-beatmung-snomed
Title: "MII VS ICU Code Observation Beatmung SNOMED"
Description: "Dieses ValueSet enthält Codes für die im Kontext einer Bilanz verwendeten Parameter."
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/ValueSet/mii-vs-icu-code-observation-beatmung-snomed"
* ^version = "2026.0.0"
* ^status = #active
* ^date = "2025-02-11"
* ^experimental = false

* include $sct#250822000 "Inspiration/expiration time ratio (observable entity)"
* include $sct#416811008 "Tidal volume setting (observable entity)"
* include $sct#250874002 "Ventilator delivered tidal volume (observable entity)"
* include $sct#250816009 "Spontaneous tidal volume (observable entity)"
* include $sct#426102006 "Inspiratory minute volume (observable entity)"
* include $sct#442720002 "Expired oxygen tension (observable entity)"
* include $sct#250823005 "Total dynamic compliance (observable entity)"
* include $sct#250854009 "Positive end expiratory pressure (observable entity)"
* include $sct#250784008 "End tidal carbon dioxide concentration (observable entity)"
* include $sct#250790007 "End tidal carbon dioxide tension (observable entity)"
* include $sct#250875001 "Ventilator delivered minute volume (observable entity)"
* include $sct#250820008 "Expiratory time (observable entity)"
* include $sct#250819002 "Inspiratory time (observable entity)"
* include $sct#27913002 "Maximum inspiratory pressure (observable entity)"
* include $sct#250876000 "Ventilator rate (observable entity)"
* include $sct#698821009 "Mean inspiratory airway pressure (observable entity)"
* include $sct#271625008 "Rate of spontaneous respiration (observable entity)"
* include $sct#250810003 "Total breath rate (observable entity)"
* include $sct#250774007 "Inspired oxygen concentration (observable entity)"