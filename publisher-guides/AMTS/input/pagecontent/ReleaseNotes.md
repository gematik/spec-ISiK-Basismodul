Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

### Version 6.0.0-rc1 (Benehmensherstellung)

Datum: 10.06.2026

* `improve` QA-Verbesserungen: IG-Publisher-Parameter hinzugefügt, ignoreWarnings.txt eingeführt, Umstellung auf deutsche Display-Validierung <https://github.com/gematik/spec-ISiK-Basismodul/pull/1190>
* `fix` Entfernung des ISiKBasisServerAkteur aus diesem Implementation Guide <https://github.com/gematik/spec-ISiK-Basismodul/pull/1217>
* `fix` Suchparameter AllergyIntolerance.onset entfernt, aufgrund fehlerhafter Spezifikation <https://github.com/gematik/spec-ISiK-Basismodul/pull/1211>

### Version 6.0.0-rc

Datum: 02.04.2026

* Initiales release
* `improve` Performance und Paging-Anforderungen in den übergreifenden Festlegungen eingebracht (gilt für alle Module) <https://github.com/gematik/spec-ISiK-Basismodul/pull/1068>
* `fix` Schwächung der Verpflichtung zur Umsetzung des Suchparameters '_tag' von `SHALL` zu `MAY` - analog zu TC 5.1.2 <https://github.com/gematik/spec-ISiK-Basismodul/pull/1040>
* `improve` Verpflichtende Einführung des Suchparameters `_lastUpdated`  <https://github.com/gematik/spec-ISiK-Basismodul/pull/1053>
* `fix` Ersetzen der Suchparameter `combo-code` und `combo-code-value-quantity` durch die neueren Suchparameter `code-value-concept` und `code-value-date` <https://github.com/gematik/spec-ISiK-Basismodul/pull/1066>
* `improve` Implicit Rules auf 0..0 beschränkt <https://github.com/gematik/spec-ISiK-Basismodul/pull/1075>
* `documentation` Trennung der lesenden und schreibenden Interaktionen im Capability Statement als Refactoring <https://github.com/gematik/spec-ISiK-Basismodul/pull/1088>