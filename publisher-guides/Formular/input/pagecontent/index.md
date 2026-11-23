Realm: Deutschland

### Hinweis zum Status

Der Implementierungsleitfaden zum Modul „ISiK Formulare“ wird in der vorliegenden Form nicht weiter gepflegt. Eine Weiterentwicklung des Moduls ist derzeit nicht vorgesehen; Fehlerkorrekturen und inhaltliche Ergänzungen erfolgen nicht mehr. Der Leitfaden bleibt als Stand der bisherigen Arbeiten veröffentlicht. **Für das Modul besteht in ISiK Stufe 6 keine Bestätigungsrelevanz.**
Bei einer Verwendung des Leitfadens sind die unten aufgeführten [bekannten Limitationen](#bekannte-limitationen) zu beachten. Rückfragen und Hinweise können weiterhin über die im Abschnitt „Hinweise“ (siehe unten) aufgeführten Kontaktwege eingereicht werden.
Das Modul wurde von Stufe 5 auf Stufe 6 an verschiedenen Stellen überarbeitet. Gerade in Hinblick auf die Nutzung durch den TI-Messenger wurde das Akteurs-Modell erweitert. Es ist daher ratsam, die Spezifikationen und BestPractices sorgfältig zu lesen, um die Änderungen zu verstehen und entsprechend umzusetzen. Hinweise zu Änderungen sind aus den [Release Notes](ReleaseNotes.html) ersichtlich.

### Bekannte Limitationen

Der Leitfaden weist in der vorliegenden Form folgende bekannte Limitationen auf:

* **Keine Ableitung von den SDC-Profilen:** Die Profile [ISiKFormularDefinition](StructureDefinition-ISiKFormularDefinition.html) und [ISiKFormularDaten](StructureDefinition-ISiKFormularDaten.html) sind direkt von den FHIR-Basisressourcen Questionnaire und QuestionnaireResponse abgeleitet, nicht von den Profilen des Implementierungsleitfadens ["Structured Data Capture (SDC)"](https://build.fhir.org/ig/HL7/sdc/). Aus SDC werden lediglich einzelne Extensions verwendet. Eine Konformität zu den SDC-Profilen ist damit nicht sichergestellt.
* **Eingeschränkter Funktionsumfang:** Der Leitfaden deckt bewusst nur einen kleinen Ausschnitt des SDC-Frameworks ab (siehe [Extensions](Extensions.html)). Es ist nicht geprüft, ob dieser Umfang für alle relevanten Anwendungsfälle ausreicht. Andere Spezifikationen, z. B. das Modul „Patient-Reported Outcomes (PRO)“ der Medizininformatik-Initiative, nutzen deutlich mehr SDC-Extensions.
* **Kein eigenes Bundle-Profil für die Rückübermittlung:** Das in früheren Fassungen dieses Leitfadens genannte Profil `FormularDatenRueckuebermittlungBundle` ist nicht Bestandteil der veröffentlichten Spezifikation. Die Rückübermittlung stützt sich daher auf das [ISiKBerichtBundle](StructureDefinition-ISiKBerichtBundle.html) (siehe Abschnitt „Interaktion: FormularDaten-Rückübermittlung“ unter [Funktionen und Interaktionen](FunktionenInteraktionen.html)).
* **Beispiele für FormularDaten nicht valide:** Die in diesem Leitfaden enthaltenen QuestionnaireResponse-Beispiele validieren derzeit nicht fehlerfrei und sind daher nur eingeschränkt als Implementierungsvorlage geeignet.

### Motivation "ISiK Formulare"

Der überwiegende Teil der Datenerfassung im Gesundheitswesen geschieht formularbasiert. Bislang fehlt es jedoch an einem standardisierten Verfahren, um Fragebögen und Formulare zwischen Systemen auszutauschen und mit den bereits vorhandenen, standardisierten Daten in den Systemen der Anwender zu verknüpfen.
Die Folge sind lange Latenzen, bis die Formulare den Anwendern zur Verfügung stehen, hohe Kosten für die individuelle Implementierung und Konfiguration in den proprietären Formulareditoren der einzelnen Systeme,
und redundante Datenerfassung aufgrund der fehlenden Verknüpfungen zu den bereits vorhandenen Daten. 
Aufgrund uneinheitlicher Modellierung der Formulare, sind die erhobenen Daten häufig nicht wiederverwendbar.

Der FHIR-Standard bietet mit dem internationalen Implementierungsleitfaden ["Structured Data Capture (SDC)"](https://build.fhir.org/ig/HL7/sdc/) eine Lösung für schnelles Deployment von standardisierten Formularen im Versorgungskontext. 
Die Ermittung von relevanten Informationen über die FHIR-Restful-API ermöglicht die automatische Vorbefüllung der Formulare und verhindert eine redundante Datenerfassung.
Die Extraktion der [FormularDaten](StructureDefinition-ISiKFormularDaten.html) in dedizierte FHIR-Ressourcen ermöglicht die Wiederverwendung der erhobenen Daten und erleichtert deren Auffindbarkeit.
Die vielfältigen Möglichkeiten der Datenvalidierung im FHIR-Kontext stellen die Vergleichbarkeit und Qualität der erhobenen Daten sicher.

Mögliche Einsatzszenarien sind u.a.:

* Erfassung von Meldedatensätzen für Register
* Verwendung von durch Fachgesellschaften standardisierten Formularen oder Protokollen (OP-Dokumentation, Anamnesebögen...)
* Patientenbefragungen
* Protokolle für klin. Studien

### Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen, verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. Dieser FHIR ImplementationGuide (IG) beschreibt die für diesen Zweck entwickelten FHIR Profile und das [REST](https://de.wikipedia.org/wiki/Representational_State_Transfer)-basierte Application Programming Interface (API). Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html). Dieser Leitfaden konkretisiert die ISiK-relevanten Funktionen der Standard-REST-API und trifft inhaltliche Festlegungen zu den ISiK-relevanten Ressourcen in Form von Ressourcen-Profilen.

Hersteller bestätigungsrelevanter Systeme sollen durch diesen IG in die Lage versetzt werden, eine konforme Implementierung zu erstellen und das Bestätigungsverfahren der gematik erfolgreich zu absolvieren.

Weitere Informationen siehe [§373 SGB V](https://www.gesetze-im-internet.de/sgb_5/__373.html).

Hinweis: Sowohl für die Implementierung der ISiK-Spezifikation als auch für den Betrieb eines Produktes, das die ISiK-Spezifikation implementiert, ist eine SNOMED-CT-Lizenz notwendig. Diese kann beim [National Release Center für SNOMED CT in Deutschland](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) beantragt werden.

### Mitwirkung
Die Abstimmung und Diskussion zu diesem Modul findet im  [ISiK-Unterforum](https://chat.fhir.org/#streams/287581/german.2Fisik) des [internationalen FHIR-Chats](https://chat.fhir.org/) statt.
**Bei der Anlage neuer Diskussionsthemen mit Bezug zu diesem Modul bitte das Präfix `[FORM]` verwenden!**

### Hinweise

**Kontakt**

Bringen Sie Allgemeine Fragen und Anmerkungen gerne über unser Anfrageportal ein: [Anfragen ISiK + ISiP](https://service.gematik.de/servicedesk/customer/portal/16)

Falls Sie keinen Zugang zum Anfrageportal haben und dieses nutzen wollen, senden Sie uns bitte eine Nachricht an die Adresse isik [ at ] gematik.de mit dem Betreff "Portalzugang".

**Herausgeber**

gematik GmbH

[Impressum](https://www.gematik.de/impressum/)

**Gender-Hinweis**

Zugunsten des Leseflusses wird in dieser Publikation meist die
männliche Form verwendet. Wir bitten, dies nicht als Zeichen einer
geschlechtsspezifischen Wertung zu deuten. Diese Variante deckt auch alle
weiteren Geschlechter, neben männlich und weiblich, ab.














