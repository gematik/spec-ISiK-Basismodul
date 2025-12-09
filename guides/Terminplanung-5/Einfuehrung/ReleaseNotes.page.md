# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.


## Version 5.1.0

Datum: 23.10.2025

* `improve` Hinweis zur Handhabung von Create-Interaktionen hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/792 #No-Test-Change
* `improve` Klarstellung zur Fallunterscheidung bei der Patienteninstanz-Übergabe und Begründung sowie Hinweis hinzugefügt https://github.com/gematik/spec-ISiK-Basismodul/pull/793 -> #Mock-Change prüfen - Ticket https://service.gematik.de/browse/PTDATA-1919 #Test-Change (Patienten-Instanz-Anlegen) - A oR B Schema - HIER SOLLEN alle Anforderungen der book Operation entlang der neuesten Version umgesetzt werden - siehe https://simplifier.net/guide/isik-terminplanung-stufe-5/Einfuehrung/Festlegungen/Operations?version=5.1.0. Die in Folgenden gelisteten Anforderungs-Änderungen wären damit redundant/obsolet 
* `improve` Klarstellung zum Fehlercode bei nicht unterstütztem alleinstehendem Parameter 'start' https://github.com/gematik/spec-ISiK-Basismodul/pull/797 und Vorgabe zur error Code 422 gelockert (SOLL statt MUSS) https://github.com/gematik/spec-ISiK-Basismodul/pull/805 -> #Mock-Change prüfen - Ticket https://service.gematik.de/browse/PTDATA-1920 #Test-Change-Optional? (SOLL -> Optional)
* `improve` id-Elemente sind in *allen* Profilen dokumentiert und als bedingtes Pflicht-/MS-Feld gekennzeichnet. https://github.com/gematik/spec-ISiK-Basismodul/pull/799 #Test-Change? (id-Abfragen für Server MUSS auf alle Profile)
* `improve` Klarstellung welche Fehler zu einem HTTP 422 Response Code bei der Verarbeitung der $book-Operation führen #Test-Change-Optional? "In diesem Fall SOLL der HTTP Status-Code HTTP 422 - Unprocessable Entity verwendet werden. Eine OperationOutcome-Ressource KANN zu informativen Zwecken in jedem Fall zurückgegeben werden (s.o.)." (https://simplifier.net/guide/isik-terminplanung-stufe-5/Einfuehrung/Festlegungen/Operations.page.md)
* `documentation` Rendering der im Modul verwendeten ValueSets https://github.com/gematik/spec-ISiK-Basismodul/pull/802
* `documentation` Dokumentation der Suchparameter (Beispiele) in CpS überführt. Darüber hinaus wurden einige Suchparameter, aus Stufe 3 in Stufe 5 übernommen https://github.com/gematik/spec-ISiK-Basismodul/pull/809
* `documentation` Durch Entfernung des Abschnittes "Übersicht der Akteure" den Abschnitt Akteure klarer gestaltet https://github.com/gematik/spec-ISiK-Basismodul/pull/848


## Version 5.0.0

Datum: 26.06.2025

* `documentation` Dokumentation und Klarstellung zur Verwendung des Akteurs "Buchender" (als Patient und Angehöriger) in Prozessen https://github.com/gematik/spec-ISiK-Basismodul/pull/763
* `improve` Ausdifferenzierung der Prozesse rund um die Registrierung und den Identitätsnachweis bei Terminbuchung https://github.com/gematik/spec-ISiK-Basismodul/pull/764/files` -> #Mock-Change prüfen - Feauture IDP? - https://service.gematik.de/browse/PTDATA-1921 #No-Test-Change
* `improve` Entfernen der modulübergreifenden Terminologieseite, da nicht zielführend https://github.com/gematik/spec-ISiK-Basismodul/pull/767 #No-Test-Change
* `improve` Satz zur Übergabe von Appointments mit einer id klarer formuliert https://github.com/gematik/spec-ISiK-Basismodul/pull/773 #No-Test-Change

Mit Inkrafttreten der Stufe 5 werden auch sämtliche nachfolgend aufgeführten Änderungen verbindlich.

## Version 5.0.0-rc2 (Benehmensherstellung)

Datum: 5.6.2025

* `documentation` Dokumentation zu den Interaktionen entsprechend der $book-Operation zur Terminverschiebung angepasst https://github.com/gematik/spec-ISiK-Basismodul/pull/745


## Version 5.0.0-rc
-> #Test-Changes - Womöglich sind hier Test Changes schon in Stufe 3 abgebildet (s.u.)

Mit der Stufe 5 werden alle Technical Corrections der Stufe 4 bindend.

Datum: 09.04.2025


* `improve` Communication aus dem Modul Terminplanung entfernt zur Vermeidung einer Überlappung mit der Verwendung weiterer TI-Produkte (z.B. TI-Messenger und KIM-Nachrichten) https://github.com/gematik/spec-ISiK-Basismodul/pull/607 -> #Mock-Change prüfen - Ticket https://service.gematik.de/browse/PTDATA-1922 #Test-Change (Schwächung bzw Entfernen) -> ggf. Bereits gelöst mit ) Wo kann ich in diesem Repo einsehen, wann die Letzten Änderungen an den Test cases vorgenommen wurden?
* `improve` Encounter aus dem Modul Terminplanung als Profil entfernt und in das Basismodul übertragen, dafür Capability Statement erweitert um entsprechende Rolle https://github.com/gematik/spec-ISiK-Basismodul/pull/604 #No-Test-Change
* `documentation` Migration des IG auf die neue IG Struktur basierend auf FQL Templates, die für ISiK-Basis erstellt wurden https://github.com/gematik/spec-ISiK-Terminplanung/pull/277
* `improve` ISiKKalender enthielt ein required Binding auf ein VS welches auf ein `fragment`
  CodeSystem
  referenziert (Schedule.specialty.coding:ErweiterterFachabteilungsschluessel). Dies wurde durch ein
  extensible Binding und ein Pattern auf .system ersetzt um die Validierbarkeit des Feldes zu
  ermöglichen. https://github.com/gematik/spec-ISiK-Basismodul/pull/613 #Test-Change? Fraglich -> vermutlich obsolet, da entsprechender Slice nicht als MS und vermutlich nicht getestet

---

## Version 4.0.3

Datum: 08.04.2025

* `documentation` Verbesserung der Dokumentation der Interaktionen auf der Communication-Ressource nach Anpassung der Suchparameter `subject` und `patient`  https://github.com/gematik/spec-ISiK-Terminplanung/pull/273
* `improve` Erweiterung zur Übergabe einer Patienten- und RelatedPerson-Instanz mittels Parameters in $book https://github.com/gematik/spec-ISiK-Terminplanung/pull/269  und https://github.com/gematik/spec-ISiK-Terminplanung/commit/7f13332c26269ca95c024cf1167c2e8a7239681c -> #Mock-Change prüfen - Ticket https://service.gematik.de/browse/PTDATA-1919 
#Test-Change ggf. redundant/obsolet. S. o. zu "Patienten-Instanz-Anlegen"


---

## Version 4.0.2

Datum: 20.02.2025


* `improve` Die Verbindlichkeit des Suchparameters `subject` in Communication wurde von SHALL auf MAY reduziert. https://github.com/gematik/spec-ISiK-Terminplanung/pull/247 
Statt dessen wird der neue verbindliche Suchparameter `patient` eingeführt. Die geschieht zur Harmonisierung der Suchparameter mit den anderen ISiK-Modulen. -> #Mock-Change prüfen -> sollte Obsolet sein da Communication-Interaktionen entfernt
#Test-Change? Fraglich - vermutlich obsolet, da bereits in 3 als option / bzw. "bedingtes" MUSS - siehe https://simplifier.net/guide/isik-terminplanung-v3/ImplementationGuide-markdown-Datenobjekte-ISiKNachrichtCommunication
* `improve` Falscher Satz über keine notwendige Verbindlichkeit entfernt und Formulierung verbessert https://github.com/gematik/spec-ISiK-Terminplanung/pull/248 #No-Test-Change
* `fix` Display Values ISiKTerminCancelationReason https://github.com/gematik/spec-ISiK-Terminplanung/pull/264 #No-Test-Change
* `improve` Reiter-Struktur vereinfacht https://github.com/gematik/spec-ISiK-Terminplanung/pull/266 #No-Test-Change
* `improve` Neue Seite zur Zusammenfassung rund um Prozesse des Patient-Onboardings https://github.com/gematik/spec-ISiK-Terminplanung/pull/267 #No-Test-Change
* `fix` Anpassung Kardinalität Appointment.start/end https://github.com/gematik/spec-ISiK-Terminplanung/pull/260 #Test-Change (jede Instanz MUSS start und ende enthalten)



---

## Version 4.0.1

Datum: 02.12.2024

* `improve` Implizites ValueSet expandiert https://github.com/gematik/spec-ISiK-Terminplanung/pull/207 #No-Test-Change
* `documentation` Dokumentation zur Begründung der Kardinalitäten und Must-Support-Flags ergänzt https://github.com/gematik/spec-ISiK-Terminplanung/pull/209
* `improve` Für ISiKTermin Verschiebung des Slicing auf .specialty.coding. https://github.com/gematik/spec-ISiK-Terminplanung/pull/204 #No-Test-Change, da obsolet, da bereits in Stufe 3 umgesetzt https://simplifier.net/guide/isik-terminplanung-v3/ImplementationGuide-markdown-Datenobjekte-ISiKTerminAppointment
* Kardinalität für Schedule.actor.display geschwächt https://github.com/gematik/spec-ISiK-Terminplanung/pull/206 #No-Test-Change - obsolet, da bereits abgedeckt in 3 https://simplifier.net/guide/isik-terminplanung-v3/ImplementationGuide-markdown-Datenobjekte-ISiKKalenderSchedule
* Anforderungen an die Kodierung von Appointment/Schedule.serviceType geschwächt https://github.com/gematik/spec-ISiK-Terminplanung/pull/227
* `improve` Schwächung der Kardinalität von actor.display im Profil StructureDefinition-ISiKTermin https://github.com/gematik/spec-ISiK-Terminplanung/pull/233 #No-test-Change, da obsolet
 * Ergänzung von Anforderungen an Akteure https://github.com/gematik/spec-ISiK-Terminplanung/pull/236 #No-Test-Change
 * `fix` Fix der Canonical URL im Capability-Statement des Terminplanungsserver https://github.com/gematik/spec-ISiK-Terminplanung/pull/238 #No-Test-Change
 * `improve` Hinzufügen der Extension "Appointment Replaces" zum Profil ISiKTermin https://github.com/gematik/spec-ISiK-Terminplanung/pull/242 - #No-Test-Change - obsolet, da schon in 3 eingeführt
 * `improve` Update der Dependency de.ihe-d.terminology auf Version 3.0.1 https://github.com/gematik/spec-ISiK-Terminplanung/pull/240 - #No-Test-Change - obsolet
* `fix` Korrektur des Extension Kontext in ISiKKalender https://github.com/gematik/spec-ISiK-Terminplanung/pull/239 #No-Test-Change sehr wahrscheinlich kein Testfall hierfür
* Aktualisierung der Operation ISiKBookOperation https://github.com/gematik/spec-ISiK-Terminplanung/pull/245 #No-Test-Change obsolet - s.o. 

----

## Version 4.0.0

Datum: 01.10.2024

* Aktive Version ohne weitere Änderungen 

----

## Version 4.0.0-rc2

Datum: 26.6.2024

* `improve` Schwächung der Anforderung für ISiKBinary (entspricht Änderung in TC 3.0.4) https://github.com/gematik/spec-ISiK-Terminplanung/pull/187 #No-Test-Change 
* Anpassen der MS-Definition für Appointment.communication https://github.com/gematik/spec-ISiK-Terminplanung/pull/191 #No-Test-Change  obsolet
* `improve` Update der IHE ValueSets zu "practiceSetting" in ISiKTermin, ISiKKalender und ISiK MedizinischeBehandlungseinheit https://github.com/gematik/spec-ISiK-Terminplanung/pull/184/files #Test-Change? fraglich, sollte eigentlich schon dem Stand der Stufe 3 entsprechen daher wahrscheinlich obsolet, da bereits angepasst
* `improve` Klarstellung , dass unbekannte Kodierungen in .serviceType abgewiesen werden können https://github.com/gematik/spec-ISiK-Terminplanung/pull/195 #No-Test-Change 
* `improve` Änderung der Anforderung für Suchanfrage zu Terminblöcken aus Kalendern https://github.com/gematik/spec-ISiK-Terminplanung/pull/193 -> #Mock-Change geprüft -> Kombi-Parameter-Vorgabe statt Single und daher höchstwahrscheinlich irrelevant #No-Test-Change obsolet, da hier https://github.com/gematik/spec-ISiK-Terminplanung/pull/200/files 

----

## Version 4.0.0-rc

Datum: 4.4.2024

* `improve` Location als Aktuer eines Kalenders hinzugefügt, da in ISiK Basis Stufe 4 vorhanden by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/178 -> #Mock-Change prüfen #No-Test-Change
* `improve` Update $book: Verschiebung eines Termins by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/174 #Mock-Change prüfen #No-Test-Change - obsolet
* `improve` Dependency zu IHE-Package zwecks Auflösung von ValueSets hinzugefügt https://github.com/gematik/spec-ISiK-Terminplanung/pull/175 #No-Test-Change - obsolet
* Erweiterung von ISiKTermin zur Abdeckung der Kommunikations-Use-Cases und Hinweise zu letzteren https://github.com/gematik/spec-ISiK-Terminplanung/pull/173 #No-Test-Change - obsolet
* `improve` Klarstellung hinzugefügt, dass Terminkalender im Kontext eines Leistungserbringers abgefragt werden können
  * `improve` Hinweis zur Abfrage von Behandlungsleistungen im Kontext eines Behandlers @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/87 #No-Test-Change - obsolet
* Präzisierung book-Operation https://github.com/gematik/spec-ISiK-Terminplanung/pull/177 No-Test-Change - obsolet
* `improve` Hinweis zur Abfrage von Behandlungsleistungen im Kontext eines Leistungserbringers by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/144 #No-Test-Change - obsolet
* `fix` Fix CpS by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/179 #No-Test-Change
* `improve` Klarstellung cancelled-appt-id by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/177 No-Test-Change - obsolet

----

## Version: 3.0.4

Diese Technical Correction entfällt für Stufe 4, da die Änderungen direkt in Stufe 4 (4.0.0-rc2) eingebracht sind.

---

## Version: 3.0.3

Datum: 25.3.2024

* Reduzierung der Anforderung für ISiKNachricht https://github.com/gematik/spec-ISiK-Terminplanung/pull/172
* Präzisieren der Suchparameter-Anforderungen für Slot : https://github.com/gematik/spec-ISiK-Terminplanung/pull/168
* Präzisieren der Anforderungen für Encounter: https://github.com/gematik/spec-ISiK-Terminplanung/commit/d596744d910fd39b421fc7f6f97f73edf471d47a 
* Präzisierung informativ zu ISiKMedizinischeBehandlungseinheit (HealthcareService) https://github.com/gematik/spec-ISiK-Terminplanung/pull/176
* `improve` Update Dependency des Basismoduls auf 3.0.4

----

## Version: 3.0.2

Datum: 03.01.2024

* `improve` Update ISiK Basismodul Dependency -> 3.0.1
* Klärung zur Verwendung der Binary: add link for clarification by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/156
* `fix` CapabilityStatement Anforderungen entsprechend angepasst: fix CpS Encounter Read and Search interaction by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/154
* Klärung zur Verwendung der Ressourcen aus dem Basismodul: Feature/ptdata 723 update interactions by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/158
* Klärung zur Nutzung der ISiKNachricht;  Feature/clarify bidirectional anfisk 178 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/160

----
## Version: 3.0.1

Datum: 30.10.2023

Mit dem Release der Stufe 3.0.1 werden die unten gelisteten Änderungen normativ festgesetzt.

* `fix` Fixing KalenderName extension name ISiKKalenderSchedule.md by @alexey-tschudnowsky in https://github.com/gematik/spec-ISiK-Terminplanung/pull/110
* `fix` Fix Suchparameter "content-mode" zu "context-type-value" by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/120
* `improve` Anpassung CapabilityStatement an die textuelle Beschreibung der verpflichtenden Interaktionen by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/125
* Informative Anmerkung für den Fall, dass .extenstion:name nicht verfügbar ist by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/129
* `improve` Anpassung Sequenzdiagramme by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/127 
* `improve` Example Canonical für Behandlungsleistung angepasst by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/134
* Abfrage aller verfügbaren Slots für Kalender durch Termin-Requestor by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/135
* Verwendung realistische Dauer für einen Slot in den Beispielen by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/137
* Angleichung der Regeln zu meta.tag in Appointments by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/136
* `fix` Fix HTTP return code by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/131
* `improve` Hinweis zur Abfrage von Behandlungsleistungen hinzugefügt by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/139
* BookOperation Anforderung von KANN zu SOLLTE by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/143
* Austausch der Communication/Binary-Ressourcen genauer beschrieben by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/140
* `improve` Enhancement Appointment and Slot reference MS by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/133

----
## Version: 3.0.0

Datum: 01.07.2023

* Mit dem Release der Stufe 3.0.0 werden die unten gelisteten Änderungen normativ festgesetzt.

----
## Version: 3.0.0-rc2

Datum: 31.05.2023

* ISiKTerminAppointment   * Änderung zu Appointment.serviceType aus 3.0.0-rc1 (Kommentierung) wurde zurückgezogen
    * wurde revert Changes for Appointment.serviceType #88 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/89
  * `documentation` Eine IG Seite zur Encounter Beschreibung für Terminplanung wurde hinzugefügt
    * Encounter Beschreibung für Terminplanung by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/87
  * Mehrere Slots müssen nicht mehr  ein und denselben Schedule referenzieren
    * rm cosntraint: allow different Schedules #82 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/92
  * Die Änderung zu Appointment.specialty wurde um eine textuelle Vorgabe zum MS ergänzt
    * MS + textual constraint #72 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/91
* Operations statt eines Bundle reicht als Return-Wert ein Appointment
  * return Ressources #85 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/93

----
## Version: 3.0.0-rc1

Datum: 04.04.2023

* ISiKTerminKontaktMitGesundheitseinrichtung - by @f-peverali in <https://github.com/gematik/spec-ISiK-Terminplanung/commit/9f523157682bd26a304f388a6f0d7c91a91811da> : Entfernen des Profils da kein integraler Use Case für Terminvereinbarung und Inkompatibilität zum ISiK Basisprofil
* ISiKNachricht Hinweis zum Thema Sicherheit eingefügt. Ohne weitere Maßnahmen können über ISiKNachricht keine medizinischen Daten ausgetauscht werden. Hierfür sollte daher bevorzugt die ePA verwendet werden.
* ISiKTermin - Enhancement /appointment by @jcaumann in <https://github.com/gematik/spec-ISiK-Terminplanung/pull/79> :
  * `improve` Kardinalität der Elemente Appointment.specialty und Appointment.serviceType von 1..* auf 0..* geändert . MustSupport dieser Elemente von "true" auf "false" geändert.
    * FHIR erlaubt die Anlage von Appointments ohne Bindung an einen Slot und außerhalb des Worksflows über einen Kalender. Dies kann z.B. auch dann erforderlich sein, wenn ein Termin außerhalb der definierten Slots per Telefon vereinbart und dann in das System eingespeist wird. In diesem Fall findet keine "Vererbung" von serviceType und specialty aus einem Kalender statt. Die Person, die den Termin in das System einträgt sollte hier selbst entscheiden können, welche Attribute sie explizit angibt und welche sich implizit aus dem Kontext erschließen.
    * ISiK Terminblöcke referenzieren auf Kalender, die auch andere als ISIK Kalender sein können. Damit ist nicht sichergestellt, dass eine durchgängige, automatische "Vererbung" von specialty und serviceType über Schedule und Slot in ein Appointment möglich ist (in FHIR Schedule und ISiK Terminblock ist die Kardinalität jeweils "0..*", d.h. diese Angaben können auch gänzlich fehlen).
  * Kongruenz der Angaben in Appointment.start/end und Appointment.slot.start/end von MUSS auf SOLL herabgestuft.
    * s .o. Bei off-band-Buchungen wird eine gewisse Flexibilität im Umgang mit dem Kalender benötigt.
  * Hinweise zu den erwarteten Ergebnissen bei Suchanfragen auf "sepcialty" und "serviceType" in Fällen, bei denen diese Elemente keinen Wert haben.
* ISiKBookOperation Für die Abbildung eines manuellen Buchungsprozesses wurden die Vorgaben zu den Return Values beim Appointment.status um "pending" erweitert
  * in Enhancement/appointment by @jcaumann in <https://github.com/gematik/spec-ISiK-Terminplanung/pull/79>

____
## Version: 2.0.3

Datum: 24.03.2023

* `improve` enhancement backport extension r5 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/61
  * ISiKKalender - Harmonisierung mit den Empfehlungen der Basisprofile DE
* `fix` quickfix typo IG by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/63


**Full Changelog**: https://github.com/gematik/spec-ISiK-Terminplanung/compare/v2.0.2...v.2.0.3

----
## Version: 2.0.2

Datum: 31.01.2023

- ISiKTerminblock   
  - Reference(Schedule) statt Reference(ISiKKalender). Reference-Element erweitert auf die Kernspezifikation (entspricht allgemeinem Design-Prinzip), damit die Profile auch außerhalb des ISiK-Kontextes nutzbar sind.

- Update Basismodul Dependency -> 2.0.4
- weitere Änderungen an IG (informativ)

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

Datum: 31.03.2022
 - Initiale Ballotierungsversion für ISiK Stufe 2

----
