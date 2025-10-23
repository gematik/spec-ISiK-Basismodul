# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

## Version 5.1.0

Datum: 23.10.2025

* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799
* `documentation` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802

----

## Version 5.0.0

Datum: 26.06.2025

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

## Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* `improve` Anpassung der MS-Definitionen, um klarzustellen, dass bestimmte Systeme keine Angaben zu Methode und Gerät machen müssen, wenn ihnen die entsprechende Datenstruktur fehlt https://github.com/gematik/spec-ISiK-Basismodul/pull/732
* `improve` Entfernen unnötiger value[x]-Elemente und Schwächung der Must-Support-Anforderungen für Blutdruck .meanBP https://github.com/gematik/spec-ISiK-Basismodul/pull/731


## Version 5.0.0-rc

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025

* RelatedPerson als optionalen Akteur in ISiKTermin hinzu https://github.com/gematik/spec-ISiK-Basismodul/pull/606 

---


## Version: 4.0.2

Datum: 18.03.2025

* `improve` Update der CapabilityStatements
* `improve` feat: added ISiK-KoerperkernTemperatur Profile
  fix: integrated mii profiles into Vitalparameter Module, KoerperKernTemp Profiles of MII are now derived from ISiK-KoerperkernTemperatur
  fix: fixed several validation errors https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/203
* `improve` .source of mii-icu-1 invariant corrected https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/203
* `improve` UCUM-ValueSets und bindings für valueQuantity-Profile entfernt, ersetzt durch ein pattern auf valueQuantity.code um eine einheitliche UCUM Nutzung zu gewährleisten. https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/203
* `improve` VS_MII_ICU_Code_Monitoring_und_Vitaldaten_ISO11073 fehlten zwei Codes die in Profilen verwendet wurden, diese wurden ergänzt. https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/203
* `improve` SD_MII_ICU_Sauerstoffsaettigung_Im_Arteriellen_Blut_Durch_Pulsoxymetrie: ändern der Kardinalität des loinc-fhir-core von slices auf 1.. um den verpflichtenden magic loinc value in jeder Instanz zu gewährleisten. https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/203
* `improve` SD_MII_ICU_Monitoring_Und_Vitaldaten: optionaler zweiter Categorycode wurde entfernt da dies ein panel-code und für die Verwendung auf .code einer Abbildung eines Panels gedacht ist. https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/203
* `improve` SD_MII_ICU_Sauerstoffsaettigung_Im_Blut_Postduktal_Durch_Pulsoxymetrie & SD_MII_ICU_Sauerstoffsaettigung_Im_Blut_Preduktal_Durch_Pulsoxymetrie sind keine gewöhnlichen Sauerstoffsättigungen. Der optionale magic loinc code wurde daher entfernt. https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/203
* `improve` dependency auf die dt. Basisprofile wurde auf die neuste Version: 1.5.3 aktualisiert. https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/203

---

## Version: 4.0.1

Datum: 24.2.2025

* `improve` Entfernen der strengeren VS-Bindings auf Observation.code[snomed] für die einfachen Vitalsignsprofile, um alle relevanten SnomedCT Concepte aus der de.basisprofil.r4 hier verwenden zu können https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/200
* Einführung der Datentypprofile für Coding Datentypen: ISiKCoding, ISiKSnomedCTCoding & ISiKLoincCoding aus dem ISiK Basisprofil-Modul https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/159  
* `improve` Fehlende ISO11073 Codes zu ValueSet `VS_MII_ICU_Code_Monitoring_und_Vitaldaten_ISO11073 hinzugefügt https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/179 
* `improve` Update der Abhängigkeit zu den Basisprofilen auf Version 1.5.1 - https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/195:
  * Einführung eines neuen, SnomedCT basierten, VS bindings für EKG-Ableitungen. Die bisher verwendeten LOINC Codes waren LP Codes, welche nicht zur Verwendung in Instanzen bestimmt sind. Die alten Codes sind weiterhin valide, aber per Slice als deprecated markiert.
  * Statt eines patterns für Observation.code werden die "magic-loinc-codes" nun per verpflichtendem Slice erzwungen.
* `improve` Fehlende Codes zu ValueSet hinzugefügt https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/175
* `improve` Beschreibungen und MS-Kommentare für alle "Nicht-MII"-Ressourcen hinzugefügt und MS für value[x] verbessert https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/184
* Formulierungsänderung zur Nutzung von Profilen aus der Basis https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/196
* `improve` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.  https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/192
* `improve` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind. https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/192 
* `improve` Update Suchparameter clinical-patient (SHALL) und subject (SHALL->MAY) + Hinweis zur Kontextherstellung + Einbindung CpS

---
## Version: 4.0.0

Datum: 30.09.2024

* Aktive Version ohne weitere Änderungen

---

## Version: 4.0.0-rc2

Datum: 26.6.2024

* `fix` Korrektur der übernommenen MII-ICU-Profile nach Review durch MII https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/166

----

## Version: 4.0.0-rc

Datum: 4.4.2024

* Klärung datenuebernahme pdms kis by @patrick-werner in https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/154
* `documentation` Hinzufügen eines IG Abschnitts zur Abdeckung der ICU-Normal-Überleitung - siehe https://simplifier.net/guide/isik-vitalparameter-v4/ImplementationGuide-markdown-UebergreifendeUseCases-Intensivversorgung 
* `improve` Hinzufügen der MII-ICU-Profile https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/150 
* `improve` Update der ISIk Basis Dependency: [update dependency ISIK Basis](https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/156)
* `improve` Hinzufügen von SnomedCT Coding Slices: [update dependency ISIK Basis](https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/156)
* `improve` Hinzufügen von MS für einzelne Components : https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/138
* `improve` Hinweis zu Profilen aus ISiK Support-Modul Labor hinzugefügt - siehe https://simplifier.net/guide/isik-vitalparameter-v4/ImplementationGuide-markdown-Datenobjekte-Laborprofile
* `fix` Fix CpS rendering by @alexzautke in https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/161 

----
## Version: 3.0.2

Datum: 20.03.2024


* MS auf dataAbsentReason gesetzt und Hinweis zur Nutzung https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/144 
* ISiK-EKG: .encounter MS Flag hinzu : https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/146
* Informationen zu Profilen präzisiert und Verpflichtung bei GCS und EKG geschwächt: https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/145

----
## Version: 3.0.1

Datum: 05.01.2024

* `improve` Update der ISIk Basis Dependency: [update dependency ISIK Basis](https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/141/commits/2d00c0a267756694cd86dd0866e8b0339f88d593)
* Klärung zur Nutzung der ISiK Basis Ressourcen: [update Datenobjekte Basis adoption](https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/141/commits/a8654b840e8ef4d57722eac4873d19eac1267870)
* `improve` Hinzugefügt Unterstützende Use Cases und Information zu KIS als Client : https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/pull/154

----
## Version: 3.0.0

Datum: 01.07.2023

* Mit dem Release der Stufe 3.0.0 wird werden die unten gelisteten Änderungen normativ festgesetzt - im Wesentlichen ein Update auf die Dependency des ISiK Basismoduls 3.0.0.

----
## Version: 3.0.0-rc2

Datum: 31.05.2023

* Ausschließlich Anhebung der ISiK Basismodul Dependency

----

## Version: 3.0.0-rc1

Datum: 11.04.2023

* Ausschließlich Anhebung der ISiK Basismodul Dependency

----

## Version: 2.0.3

Datum: 24.03.2023

* `improve` example temperature + heartrate #102 by @f-peverali in <https://github.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasse/pull/104>
  * Änderungen an Beispielen

----
## Version: 2.0.2

Datum: 31.01.2023

- Update Basismodul Dependency -> 2.0.4
- weitere Änderungen am Implementierungsleitfaden (informativ)

----
## Version: 2.0.1

Datum: 31.10.2022

- Update Basismodul Dependency -> 2.0.2

----
## Version: 2.0.0

Datum: 30.06.2022

- Initialer Release

----
## Version: 2.0.0 (Ballotierung)

Datum: 22.01.2022
 - Aufnahme des Profils für das Körpergewicht
 - Aufnahme des Profils für die Körpergrösse
 - Aufnahme des Profils für die Körpertemperatur
 - Aufnahme des Profils für den Kopfumfang
 - Aufnahme des Profils für die Atemfrequenz
 - Aufnahme des Profils für den Blutdruck
 - Aufnahme des Profils für die Herzfrequenz
 - Aufnahme des Profils für die Sauerstoffsättigung
 - Aufnahme des Profils für das EKG
 - Aufnahme des Profils für den Glasgow Coma Score
 - Aufnahme der Suchparameter in das CapabilityStatement
 - Anpassung der Cannonical URLs auf v2
 - Festlegung der bestätigungsrelevanten Systeme
 - Festlegung der zu unterstützenden Interaktionen
 - Verweis auf einen externen ImplementationGuide zur Profilierung von Signaldaten
 - Anmerkungen zu den Must-Support-Feldern