# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

Es handelt sich um ein **Support Modul**, was nicht eigenständig funktionsfähig ist (eigene Use Cases bedient) oder bestätigtigungsrelevant ist.

## Version 5.1.1

Datum: tbd

* `improve` Ressourcen Referenzen in den FSH Dateien wurden auf das Format
  `Reference(RessourcenNamen)` vereinheitlicht. Hierdurch wurden teilweise das Referenzziel
  angepasst (falls es keine Instanz der Zielinstanz gab). https://github.com/gematik/spec-ISiK-Basismodul/pull/929

----

## Version 5.1.0

Datum: 23.10.2025

* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799
* `documentation` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802
* `fix` Dokumentation der Suchparameter (Beispiele) in CpS überführt. Darüber hinaus wurden einige Suchparameter, aus Stufe 3 in Stufe 5 übernommen https://github.com/gematik/spec-ISiK-Basismodul/pull/809

## Version 5.0.0

Datum: 26.06.2025

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

## Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

- `improve` Erlaubte referenzierbare Profile von Element Subject auf Patient reduziert https://github.com/gematik/spec-ISiK-Basismodul/pull/727
- `improve` Die Mindestkardinalität für den SCT-Slice in ISiKLaboruntersuchung wurde von 1 auf 0
  reduziert. Das Pattern auf code.coding[snomed].system wurde entfernt um Mehrfachkodierungen in
  SnomedCT nicht zu verhindern. https://github.com/gematik/spec-ISiK-Basismodul/pull/730
- `improve` Einschränkung des MS-Flag auf .specimen und .method für alle Profile aus dem Labormodul https://github.com/gematik/spec-ISiK-Basismodul/pull/735 
- `improve` Neue Anforderungen zur Implementierung von .status im ISiK Profil Laboruntersuchung und Erweiterung der Dokumentation zum Profil https://github.com/gematik/spec-ISiK-Basismodul/pull/698/files


---

## Version 5.0.0-rc

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025

---
## Version: 4.0.0-rc


- Entfernen von MS von .id der Ressourcen https://github.com/gematik/spec-ISiK-Labor/pull/6
- `fix` "C-reaktives Protein [Mol/Volumen] in Serum oder Plasma mittels Hochsensitivitätsmethode" loinc code war falsch. War: 78486-0 , wurde korrigiert auf: 76486-0 https://github.com/gematik/spec-ISiK-Labor/pull/8
- `fix` ISiKLaboruntersuchungGFR enthielt ein falsches VS binding auf .referenceRange https://github.com/gematik/spec-ISiK-Labor/pull/8
- allen Untersuchungsbeispielen wurden effective & performer hinzugefügt https://github.com/gematik/spec-ISiK-Labor/pull/8

----

**Release Candidate zur Kommentierung**

* Es handelt sich um ein Support Modul, was nicht eigenständig funktionsfähig ist (eigene Use Cases bedient) oder bestätigtigungsrelevant ist
* ISiKLaboruntersuchung als generisches Profil von Observation
  * Davon abgeleitet 8 als besonders relevant identifizierte Untersuchungen: CRP, GFR, Hb, PCT, Serumkreatinin, TSH, Thrombozyten, Troponin.
  * Die Angaben zu Messart (z.B. im Serum) und Einheiten (z.B. umol/L ) für die jeweilige Untersuchung in den gängigsten Varianten. Coding in der Regel in LOINC und UCUM
  * Alle notwendigen CodeSystems und ValueSets. Jeweils 2 Profile pro Beobachtungswert
* Teil des Übergreifenden Use Case AMTS, inklusive mini-IG und Auszügen aus IOP-Arbeitskreis. Dieser Übergreifende Use Case nutzt auch (insbesondere) weitere neue Profile aus dem Modul Basis und Medikation
  * Risikobewertung aus Medikation (ISiKAMTSBewertung)
  * Diagnose aus Basis (ISiKAllergieUnvertraeglichkeit, chr. Krankheit wie Parkinson, usw.)
  * Observation aus Basis (Schwangerschaft, AlkoholAbusus usw.)
  * Observation aus Labor oder Vital (SerumKreatinin, GFR, Blutbild, Gewicht usw.)
* Teil des Übergreifenden Use Case bzw. Konzept Überleitung Normal- und Intensivversorgung. Dieser Use Case ist insbesondere Teil des Moduls Vitalparameter

**Full Changelog**: initial Release
