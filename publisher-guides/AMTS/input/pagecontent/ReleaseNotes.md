Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

### Version 6.0.0-rc

Datum: tbd.

* Initiales release
* `improve` Performance und Paging-Anforderungen in den übergreifenden Festlegungen eingebracht (gilt für alle Module) https://github.com/gematik/spec-ISiK-Basismodul/pull/1068
* `fix` Schwächung der Verpflichtung zur Umsetzung des Suchparameters '_tag' von `SHALL` zu `MAY` - amalog zu TC 5.1.2 https://github.com/gematik/spec-ISiK-Basismodul/pull/1040
* `improve` Verpflichtende Einführung des Suchparameters `_lastUpdated`  https://github.com/gematik/spec-ISiK-Basismodul/pull/1053
* `fix` Ersetzen der Suchparameter `combo-code` und `combo-code-value-quantity` durch die neueren Suchparameter `code-value-concept` und `code-value-date` https://github.com/gematik/spec-ISiK-Basismodul/pull/1066