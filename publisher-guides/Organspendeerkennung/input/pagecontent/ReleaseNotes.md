Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

### Version 6.0.1

Datum: tbd

* `documentation` Update des Sequenzdiagramms. Suche nach allen Stationen wurde korrigiert https://github.com/gematik/spec-ISiK-Basismodul/pull/1296

### Version 6.0.0

Datum: 01.07.2026

* `improve` Update der Dependency auf die neue Basisprofile-DE version 1.6.0 für alle Module <https://github.com/gematik/spec-ISiK-Basismodul/pull/1272>

Mit Inkrafttreten der Stufe 6 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

### Version 6.0.0-rc1 (Benehmensherstellung)

Datum: 10.06.2026


* `improve` QA-Verbesserungen: IG-Publisher-Parameter hinzugefügt, ignoreWarnings.txt eingeführt, Umstellung auf deutsche Display-Validierung https://github.com/gematik/spec-ISiK-Basismodul/pull/1190
* `documentation` Pupillen-Beispiele (Pupillenlichtreaktion) korrigiert https://github.com/gematik/spec-ISiK-Basismodul/pull/1190
* `improve` Einführung des Suchparameters `category` für die Procedure Profil zur Vereinfachung der Abfrage dieser Profile
* `documentation` Beispiel für Beatmungsmodus St-Mod korrigiert 

Im Fall von prozessorientierten Implementierungsleitfäden beginnt die Versionierung nach Semver des Implementierungsleitfadens gemäß des Major Releases im Zuge dessen der Implementierungsleitfaden entstanden ist (X.0.0)

### Version 6.0.0-rc

Datum: 02.04.2026

* `improve` Einführung zahlreicher Profile zur Abdeckung des geschilderten Use Cases: Neben den Verpflichtenden Profilen (GCS, RASS, Pupillenlichtreaktion - direkt und indirekt, und Pupillengroesse) weitere optional umzusetzende Profile. <https://github.com/gematik/spec-ISiK-Basismodul/pull/1048> 
    * vgl. auch Vorgaben und Release Notes zum IG "ICU"
    * Einführung von Suchparametern zur Abfrage einer Stationsliste für Vitalparameter-Server <https://github.com/gematik/spec-ISiK-Basismodul/pull/1094>
* `improve` Optionales Profil zur Abbildung von Serumnatrium hinzugefügt <https://github.com/gematik/spec-ISiK-Basismodul/pull/1047>
* `improve` Implicit Rules auf 0..0 beschränkt <https://github.com/gematik/spec-ISiK-Basismodul/pull/1075>
* `improve` Performance und Paging-Anforderungen in den übergreifenden Festlegungen eingebracht (gilt für alle Module) <https://github.com/gematik/spec-ISiK-Basismodul/pull/1068>


### Version 0.0.1-rc

* Initialer Draft des Implementierungsleitfadens zur Organspendeerkennung im Rahmen von ISiK


