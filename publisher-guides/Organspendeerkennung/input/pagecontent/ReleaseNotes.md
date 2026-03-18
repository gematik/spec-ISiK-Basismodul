---
topic: ImplementationGuide-markdown-ReleaseNotes
---
### Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Im Fall von prozessorientierten Implementierungsleitfäden beginnt die Versionierung nach Semver des Implementierungsleitfadens gemäß des Major Releases im Zuge dessen der Implementierungsleitfaden entstanden ist (X.0.0)

### Version 6.0.0-rc

Datum: tbd.

* `improve` Einführung zahlreicher Profile zur Abdeckung des geschilderten Use Cases: Neben den Verpflichtenden Profilen (GCS, RASS, Pupillenlichtreaktion - direkt und indirekt, und Pupillengroesse) weitere optional umzusetzende Profile. https://github.com/gematik/spec-ISiK-Basismodul/pull/1048 
    * vgl. auch Vorgaben und Release Notes zum IG "ICU"
* `improve`Einführung eines neuen freiwilligen Suchparameters `code_in` zur Erleichterung der Auffindbarkeit von Prozeduren (z. B. Beatmung und Reanimation) https://github.com/gematik/spec-ISiK-Basismodul/pull/1048
* `improve` Optionales Profil zur Abbildung von Serumnatrium hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/1047
* `improve` Implicit Rules auf 0..0 beschränkt https://github.com/gematik/spec-ISiK-Basismodul/pull/1075
* `improve` Performance und Paging-Anforderungen in den übergreifenden Festlegungen eingebracht (gilt für alle Module) https://github.com/gematik/spec-ISiK-Basismodul/pull/1068


### Version 0.0.1-rc

* Initialer Draft des Implementierungsleitfadens zur Organspendeerkennung im Rahmen von ISiK


