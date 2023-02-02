Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

---
Version: 1.0.9-pre-release

Datum: 02.02.2023

- Anpassung URL - https://github.com/gematik/spec-ISiK-Basismodul/pull/191/commits/59d0f694db5550d49850ec1af198a927b3f6098f

---
Version: 1.0.8

Datum: 30.01.2023

In einigen Profilen wurden Reference-Elemente erweitert auf die Kernspezifikation (entspricht allgemeinem Design-Prinzip), damit die Profile auch außerhalb des ISiK-Kontextes nutzbar sind. Betroffene Profile sind:
- ISiKVersicherungsverhaeltnisGesetzlich
  - ```Reference``` auf Kernspezifikation-Profil RelatedPerson statt ISiKAngehoreiger 
  - ```Reference``` auf Kernspezifikation-Profil Patient statt ISiKPatient 
- ISiKVersicherungsverhaeltnisSelbstzahler
  - ```Reference``` auf Kernspezifikation-Profil Patient statt ISiKPatient
  - ```Reference``` auf Kernspezifikation-Profil RleatedPerson statt ISiKAngehoeriger 
- ISiKBerichtSubSysteme
  - ```Reference``` auf Kernspezifikation-Profil Patient statt ISiKPatient
  - ```Reference``` auf Kernspezifikation-Profil Encounter statt ISiKKontaktGesundheitseinrichtung  
- ISiKAngehoeriger
  - ```Reference``` auf Kernspezifikation-Profil Patient statt ISiKPatient 

Weitere Änderungen:
- ISiKVersicherungsverhaeltnisGesetzlich
  - ```Coverage.beneficiary.identifier``` URL in ```patternidentifier.system``` ersetzt

- weitere Änderungen an Implementierungsleitfaden (informativ)


---
Version: 1.0.7

Datum: 21.12.2022

- Beispiel für BerichtBundle erzeugt
- ~~PersonInGesundheitsberuf MS von Identifier EFN entfernt~~
- Weitere Änderungen an IG oder Beschreibung, die keine Strukturänderungen an Profilen entsprechen


----
Version: 1.0.6

Datum: 31.10.2022

- Angehöriger
  - Line Extensions ```Strasse```, ```Hausnummer``` und ```Adresszusatz``` sind nun Must Support
- BerichtBundle wurde wiederhergestellt
- BerichtBundle für Subsysteme
  - ```id``` ist nun 0..1 und Must Support
  - ```identifier```, ```identifier.system```, ```identifier.value``` sind nun Must Support
  - ```status``` ist nun Must Support
  - ```type``` und ```type.coding``` sind nun Must Support
  - Die Codesysteme ```LOINC```, ```KDL``` und ```IHE``` im Element  ```type.coding``` sind nun Must Support
  - ```category``` ist nun Must Support
  - Die Codesysteme ```LOINC``` und ```IHE``` im Element ```category.coding``` sind nun Must Support
  - ```author``` ist nun Must Support
- Kontakt
  - Aufnahmegrund Extension ist mit den Elementen ```ErsteUndZweiteStelle``` ```DritteStelle``` und```VierteStelle``` Must Support
  - ```serviceType``` ist nun 0..1
  - ```reference``` ist nun Must Support
  - ```admitSource``` ist nun 0..1
- Patient
  - Der Identifier ```Versichertennummer-GKV``` wird zu ```VersichertenId-GKV```
- Invarianten wurden verbessert
----
Version: 1.0.5

Datum: 30.09.2022

- Stadtteil Extension ist bei ISiKAngehoeriger, ISiKPersonenImGesundheitsBeruf und ISiKPatient nun Must Support.
- Bei ISiKVersicherungsverhaeltnisSelbstzahler sind die Elemente ```relatedPerson.status```, ```relatedPerson.type```, ```relatedPerson.type.coding```,```relatedPerson.type.coding.system``` und ```relatedPerson.type.coding.code``` nun Must Support
----

Version: 1.0.4

Datum: 31.05.2022
- Die Kardinalität des Elements ```id``` ist nun ```0..1``` in den Ressourcen Patient, Encounter, Condition, Coverage, Bundle und Procedure.

----
Version: 1.0.3

Datum: 07.02.2022
- Update der Deutschen Basisprofile auf die Version 1.2.0
- Fix Type Slicing in ```Condition.extension:ReferenzPrimaerdiagnose.value[x]```
- ```onset-date``` als Kann-Suchparameter für Condition entfernt, da dieses Element nicht als Must-Support gekennzeichnet ist
- ```address``` als Kann-Suchparameter für Practitioner entfernt, da dieses Element nicht als Must-Support gekennzeichnet ist
- Korrektur .source-Elemente in FHIRPath Constraints
- Korrektur von .definition im CapabilityStatement für Suchparameter ```Encounter-location```, ```Encounter-part-of```, ```Encounter-service-provider```
- Harmonisierung Constraint ```sct-ops-1``` mit der dazugehörigen menschenlesbaren Beschreibung

----
Version: 1.0.2

Datum: 07.10.2021

- Update der Deutschen Basisprofile auf die Version 1.1.0
- Korrektur der Invarianten 'isik-pat-1', 'relatedp-de-1' und 'proc-ISiK-1'
- Slicing in Procedure.code.coding korrigiert
- Encounter.hospitalization Kardinalität korrigiert (1..1 -> 0..1)
- Fehlendes Must-Support Flag für Pflichtfeld RelatedPerson.patient hinzugefügt

----
Version: 1.0.1

Datum: 27.08.2021

- Korrektur der Suchinteraktion für das Datenobjekt "Condition": ```Condition.onset[x]``` enthält kein Must-Support-Flag, daher ist die Suche nach "onset-date" keine Pflicht. Der Suchparameter wurde nun als optional markiert.
- Beschreibung von Encounter.status enthielt Teile der Beschreibung von Condition.status. Diese wurden nun gelöscht.
- Der Slice Encounter.type:Kontaktart ist wurde fälschlicherweise als Pflichtfeld makiert. Um eine Kompabilität zu [Repräsentation der Fallarten in FHIR - Deutsche Basisprofile HL7 Deutschland](https://ig.fhir.de/basisprofile-de/1.0.0/Ressourcen-AmbulanterStationaererFall.html) gewährleisten wurde dieses Feld als optional gekennzeichnet.
- Das Binding an Procedure.code:OPS enthielt ein Binding an ein ValueSet mit falscher Canonical-URL.
- Korrektur der Interaktionen auf Coverage: Für Coverage.payor für das Profil ISiKVersicherungsverhaeltnisGesetzlich muss nur die Suche mittels des identifier-Modifiers untersützt werden, jedoch nicht die Suche auf die dazugehörige Referenz.
- Hinweis hinzugefügt, dass sowohl für die Implementierung von ISiK, als auch für den anschließenden Betrieb eines ISiK-konformen Systems eine SNOMED-Lizenz notwendig ist.
- Die FHIRPath-Constraints relatedp-de-1 und pat-de-1 resultierten in einem falschen Ergebnis falls das "gender"-Element innerhalb des Datenobjektes "Patient" bzw. "Practitioner" nicht gesetzt war.
- Hinweise hinzugefügt für die korrekte Implementierung einer OperationOutcome falls ein Bericht eines Subsystems eine nicht-existierende Referenz auf ein "Patient"- oder "Encounter"-Datenobjekt enthält.
- Update auf die [Deutschen Basisprofile Version 1.0.0](https://simplifier.net/packages/de.basisprofil.r4/1.0.0).

----
Version: 1.0.0

Datum: 29.06.2021

##### Übergreifende Festlegungen
- Korrektur von verpflichtenden Suchparametern im CapabilityStatement mit Hinblick auf Must-Support-Flags in den Datenobjekt-Profilen
- Anpassung der ISiK-Profile an die Version v1.0.0-rc4 der Deutschen Basisprofile

----
Version: 1.0.0 CC1

Datum: 25.05.2021

##### Übergreifende Festlegungen
- Hinweis angepasst, dass HTTPS im produktiven Einsatz verpflichtend ist
- Hinweis präzisiert, dass die eingesetzte Software eines Drittherstellers nur im Rahmen des Bestätigungsverfahrens zu einem Bestandteil des Primärsystems wird
- Canoncial der ImplementationGuide-Ressource für ISiK harmonisiert mit den Schema der restlichen Canonicals
- :not und :text Modifier waren als Modifier für String-Suchparameter anstelle von Token-Suchparameter definiert
- Anpassung der ISiK-Profile an die Version v1.0.0-rc1 der Deutschen Basisprofile:

###### Im Vergleich zu der Version 1.0.0-alpha9 ergeben sich in den deutschen Basisprofile folgende Änderungen:

- ValueSet Binding in Lebensphase-Extension korrigiert
- Übersetzung von marital-status ("S") korrigiert
- BSNR und LANR aus CodeSystem-identifier-type-de gelöscht (sind bereits in HL7 v2 Table 0203 enthalten)
- Constraint gender-amtlich-1 in die Extension gender-amtlich direkt eingefügt
- Verweis auf own-prefix Extension in Extension-humanname-namenszusatz korrigiert
- Anpassung der ICD-10-GM-Extensions und des Coding-Datentyp-Profils zur korrekten Abbildung von Mehrfachkodierungen
- Änderung der canonical URL folgender, ehemals DIMDI, jetzt BfArM CodeSysteme: ICD-10-GM, OPS, ATC

##### Diagnose
- Kein Must Support mehr für Condition.onset
- Kardinalität von Condition.diagnosis.use auf 1..1 angepasst
- FHIRPath Constraint isik-con1 hinzugefügt
- Hinweis zu Condition.encounter erweitert
- Must-support Flag für Condition.encounter hinzugefügt

##### Kontakt
- Hinweise zu der begrifflichen Abgrenzung von Fall / Kontakt hinzugefügt
- Basis-Statuswerte "in-progress", "finished" und "cancelled" werden nun gefordert

##### Patient
- Kardinalität 0..* für Slices von Patient.address
- FHIRPath Constraint isik-pat-1 hinzugefügt
- Update der Beispieldaten

##### Prozedur
- Must-support Flag für Procedure.encounter hinzugefügt
----
