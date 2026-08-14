### Performance-Aspekte

Alle beteiligten Akteure (Server wie Clients) tragen eine (Teil-)Verantwortung für die Sicherstellung einer performanten REST-API. Zweck einer performanten REST-API ist, dass die typischen Arbeitsabläufe der jeweiligen Nutzer (z. B. Arzt, Pflege, Verwaltung) ohne wahrnehmbare Verzögerung durchgeführt werden können. Insbesondere dürfen für klinisch kritische Funktionen keine Wartezeiten entstehen, die eine zeitgerechte Patientenversorgung beeinträchtigen.

Zur Sicherstellung dieser Performance-Bedarfe können in einem ersten Schritt die Antwortzeiten der REST-Endpunkte (Server) als Baseline geprüft werden - d. h. im Best-Case und unabhängig von Last-Anforderungen.
Weitere Performance-Aspekte für Server zu Antwortzeiten unter Last, Lasten und Durchsatz sollten diesen Baseline Anforderungen folgen.


Da zur Gewährleistung der Performance während der Entwicklung sowohl Client- als auch Server-Hersteller beitragen müssen, werden unten weitere Hinweise zur Client-Implementierung formuliert. Die folgenden Festlegungen gelten dagegen für Server.

#### Performance-Kategorien - zunächst zur Antwortzeit (Baseline)
Die Performance-Kategorien und entsprechende Anforderungen beziehen sich zum jetzigen Zeitpunkt alle auf den Aspekt **Antwortzeit als Baseline**.

Die Antwortzeit bezeichnet dabei einen Request/Reply-Zyklus zwischen einem Client und einem Server, der die Zeitspanne von der Absendung einer Anfrage durch den Client bis zum vollständigen Empfang der Antwort durch den Client in der Test-Umgebung umfasst und deckt sich damit weitgehend mit dem Konzept der Bearbeitungszeit wie [hier](https://gemspec.gematik.de/docs/gemSpec/gemSpec_Perf/latest/#2.1) definiert. Dabei wird hier zusätzlich eine Antwortzeit ohne signifikante Lasteinwirkung angenommen.

**Messmetriken für Antwortzeit**

Für die Überprüfung der Performance-Anforderungen im Zertifizierungsverfahren gelten folgende Metriken:


- **P95 (95. Perzentil):** 95 % aller gemessenen Anfragen eines Messlaufs werden innerhalb dieses Zeitwerts vollständig beantwortet; die verbleibenden 5 % dürfen ihn überschreiten. P95 ist die **maßgebliche Konformitätsmetrik**: Die in den Performance-Kategorien (PK1–PK5) genannten Zeitschwellen (z. B. „unter einer Sekunde") müssen als **P95-Wert** eingehalten werden.

Als kritisch (PK1 bis PK4) gelten REST-Abfragen, die von klinischen Nutzern in unmittelbar behandlungsrelevanten, zeitkritischen Situationen genutzt werden und deren Bereitstellung für den anfragenden Client nahezu zur Laufzeit stattfinden sollten.
Daher sind hierfür sehr kurze Antwortzeiten ohne wahrnehmbare Verzögerung anzustreben.

Für diese Performance-Kategorien gilt:

- **PK1:** Request-Anfrage von Ressourcen unter bekannter ID
  - Anforderung: **"unter einer Sekunde"**
    - Beispiel: `GET baseURL/Patient/89186842`
    - Beispiel: `GET baseURL/Observation/67890`
    - Beispiel: `GET baseURL/DocumentReference/54321`
      - oder : `baseURL/DocumentReference?_id=54321`
    - Ausnahme: DocumentReference-Ressource mit base64 kodiertem Attachment bzw. Binary

- **PK2:** Suchanfragen zum Auffinden von Ressourcen auf Basis von weitestgehend eindeutigen Metadaten (z. B. .identifier und .birthdate) ohne _include und _revInclude, ohne Chaining.
  - Anforderung **"unter einer Sekunde"**
    - Beispielanfrage `baseURL/Patient?identifier=12345` 
    - Beispielanfrage `baseURL/Patient?birthdate=1982-01-13`
    - Beispielanfrage - Medikationsliste der einzelnen Patienten für eine Station: `baseURL/MedicationRequest?patient=Patient/89186842`
    - Ausnahme: DocumentReference-Ressource mit base64 kodiertem Attachment bzw. Binary

- **PK3:** Suchanfragen zum Auffinden von Patienten-gebundenen Ressourcen (ohne _include und _revInclude ohne Chaining) unter der Annahme, dass `Patient.id` bekannt.
  - Anforderung: **"unter 2 Sekunden"**
    - Beispielanfrage: `baseURL/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|R10.0&patient=89186842`
    - Beispielanfrage: `baseURL/Condition?patient=Patient/89186842`
    - Beispielanfrage: `baseURL/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|vital-signs&patient=Patient/89186842`
    - Ausnahme: DocumentReference-Ressource mit base64 kodiertem Attachment bzw. Binary

- **PK4:** Suchanfragen auf Patient und Encounter unter der Annahme, dass `.identifier` unbekannt und dass ein sehr großer Ergebnisraum der Suchanfrage möglich ist.
  - Kontext: Listen- und Übersichtsabfragen (z.B. Patientenlisten, Falllisten)
  - Anforderung: **"unter 5 Sekunden"**
    - Beispielanfrage - alle Patienten mit dem Namen Müller: `baseURL/Patient?name=Müller`
    - Beispielanfrage - alle Patienten auf der Station "123": - Patienten und Kontakte auf einer bestimmten Station mit einem aktiven Kontakt auf dieser Station
    - Beispielabruf: `GET baseURL/Encounter?location=Location/loc-hospital&status=in-progress&_include=Encounter:subject`
    - Hinweis: Diese Abfrage kann ebenfalls in zwei Schritte unterteilt werden

Als vorwiegend unkritisch gelten Abfragen (PK5 bis PK6), die z. B.
- im Rahmen der Planungs- und Organisationsinformationen mit Bezug zu Patienten (z.B. Terminpläne, Belegungspläne), 
-  Schreiboperationen, die nicht in der akuten Entscheidungssituation, sondern zeitnah im Verlauf erforderlich sind (z.B. Nachdokumentation),
- die überwiegend für Verwaltung, Abrechnung, Controlling, Stammdatenpflege, Reporting oder technische Administration genutzt werden oder
- Abfragen und Operationen zur Stammdatenpflege ohne unmittelbaren Behandlungskontext

Für diese Performance-Kategorien sind längere Antwortzeiten grundsätzlich tolerierbar; bei zu erwartenden längeren Laufzeiten sind asynchrone Verfahren möglich.

Für diese Performance-Kategorien gilt:

- **PK5:** weitere Suchanfragen bzw. Operationen.
  - Anforderung: **"Unter 60 Sekunden"**
    - Beispielanfrage - Prozeduren für eine Station: `baseURL/Procedure?encounter.location=Location/ward123`
    - Beispielanfrage - Liste aller Stationen: `baseURL/Location?type=http://terminology.hl7.org/CodeSystem/location-physical-type|wa`
    - Beispielanfrage - Niereninsuffizienz Screening mittels Serumkreatinin: `baseURL/Observation?code=http://loinc.org|2160-0&combo-code-value-quantity=gt1.0|mg/dL`

- **PK6:** weitere Suchanfragen und Custom-Operation
  - Anforderung: **nicht geprüft**
    - Beispielanfrage - Alle verschriebenen bzw. verabreichten Medikamente (relevant bei auffälligen Medikationschargen): `baseURL/MedicationRequest`

- **Custom-Operationen mit modulspezifisch konkretisierten Anforderungen** – Fachmodule KÖNNEN für einzelne Custom-Operationen engere Antwortzeit-Anforderungen festlegen, die die PK6-Einordnung im jeweiligen Kontext konkretisieren.
  - Beispiel - Operation zur Terminbuchung in ISiK Terminplanung: `baseURL/$book`

Für diese Performance-Kategorien werden im Test-System des Zertifizierungsverfahrens die entsprechenden Performance-Anforderungen (z.B. Antwortzeiten - ggf. unter Berücksichtigung der Perzentile -; aber vorerst keine Lasten, Durchsatz etc.)implementiert.


#### Umgang mit kostspieligen Suchanfragen (`too-costly`)

Bei patientenunabhängigen oder breit gefächerten Suchanfragen können potenziell sehr große Ergebnismengen entstehen, die Server erheblich belasten. Pagination SOLL als primäres Mittel eingesetzt werden, bevor ein Server eine Anfrage ablehnt. Reicht Pagination nicht aus, DARF ein Server eine `too-costly`-Antwort zurückgeben – jedoch nur im Rahmen der nachfolgend definierten Regeln.

**Ressourcen-Volumenklassen**

Ressourcentypen werden nach erwartetem Datenaufkommen klassifiziert. Daraus ergibt sich der garantiert zu beantwortende Suchumfang (Floor): Innerhalb dieses Suchumfangs MUSS ein Server ohne `too-costly` antworten.

| Klasse | Ressourcen | Mindest-Suchumfang (Floor) |
| --- | --- | --- |
| **Hochvolumig** | `Observation`, `DeviceMetric`, `MedicationAdministration` | `_lastUpdated`/Datums-Fenster **≤ 7 Tage** ODER Pflicht-Begleitparameter (`patient`, `encounter` oder `category` mit Fenster) |
| **Mittelvolumig** | `AllergyIntolerance`, `Appointment`, `Composition`, `Condition`, `DiagnosticReport`, `DocumentReference`, `Encounter`, `List`, `MedicationRequest`, `MedicationStatement`, `Procedure`, `QuestionnaireResponse`, `RiskAssessment`, `Schedule`, `Slot` | Fenster **≤ 3 Monate** ODER Pflicht-Begleitparameter (`patient` oder `encounter`) |
| **Niedrigvolumig / Stammdaten** | `Account`, `Binary`, `Device`, `HealthcareService`, `Location`, `Medication`, `Organization`, `Patient`, `Practitioner`, `PractitionerRole`, `Questionnaire`, `RelatedPerson` | kein Fenster nötig (begrenzter Bestand; breite Patient-/Encounter-Suchen sind gemäß PK4 in ≤ 5 s zu beantworten) |
| **Infrastruktur** | `Bundle`, `CapabilityStatement`, `CodeSystem`, `OperationDefinition`, `Parameters`, `SearchParameter`, `ValueSet` | nicht betroffen, `too-costly` nicht anwendbar |

Zusätzlich gilt unabhängig von Volumenklasse und Zeitfenster ein **mengenbasiertes Fallback**: Ein Server DARF `too-costly` zurückgeben, wenn eine Anfrage eine Ergebnismenge von mehr als **10.000 Ressourcen** erzeugen würde. Umgekehrt MUSS ein Server Anfragen bis einschließlich 10.000 Ressourcen beantworten und DARF unterhalb dieser Schwelle kein `too-costly` zurückgeben.

**Zwei-Stufen-Modell (Floor/Ceiling)**

- **Mindest-Suchumfang (Floor)**: normativ durch ISiK festgelegt (Tabelle oben). Jeder Server MUSS innerhalb dieses Suchumfangs ohne `too-costly` antworten.
- **Server-Ceiling**: Server, die mehr leisten, DÜRFEN einen erweiterten Suchumfang unterstützen und SOLLEN ihre tatsächliche Grenze im CapabilityStatement deklarieren. `too-costly` ist nur für Anfragen außerhalb des vom Server deklarierten Suchumfangs zulässig.

**Auslösekriterien**

Ein Server DARF `too-costly` zurückgeben, wenn eine Anfrage den unterstützten Suchumfang überschreitet, insbesondere:

- `_lastUpdated` oder Datumsparameter ohne Patient-/Encounter-Bezug und mit einem Fenster oberhalb des Klassen-Floors (z. B. `baseURL/Observation?_lastUpdated=ge2020`)
- `Patient?address-country`, `Patient?gender`, `Patient?status` ohne identifizierenden Begleitparameter (`identifier`, `birthdate`, `name`)
- Ressourcentyp-weite Abfragen hochvolumiger Ressourcen ohne jeglichen Filter

**HTTP-Antwortformat**

Rückgabe eines HTTP `400 Bad Request` mit einem `OperationOutcome`:

- `issue.severity` = `error`
- `issue.code` = `too-costly`
- `issue.diagnostics` SOLL einen menschenlesbaren Hinweis auf den überschrittenen Suchumfang enthalten (z. B. „Zeitfenster auf ≤ 7 Tage einschränken oder `patient` angeben").

**CapabilityStatement-Deklaration**

Server MÜSSEN für jeden Suchparameter, für den `too-costly` möglich ist, dies im CapabilityStatement dokumentieren. Server SOLLEN dabei den unterstützten Suchumfang angeben (`CapabilityStatement.rest.resource.searchParam.documentation`).

**Client-Verhalten**

Clients SOLLEN bei Empfang von `too-costly` die Anfrage mit engeren Filtern wiederholen, z. B. durch ein engeres Zeitfenster, einen zusätzlichen `patient`- oder `encounter`-Parameter oder den Einsatz von Pagination.

#### Client-Implementierung

Auch Client-Hersteller tragen eine eigene Verantwortung bei der Gewährleistung der Performance für den Betrieb der definierten API-Schnittstelle.
Dazu gehören insbesondere eine effiziente Abfragestrategie (z. B. Paging statt großer Ergebnismengen), fachlich sinnvolle Suchfilter (z. B. Zeiträume und Organisationseinheiten), die Vermeidung unnötiger Wiederholungsabfragen sowie die Nutzung geeigneter Caching- und Aktualisierungsmechanismen (z. B. ETag/If-None-Match). Ziel ist, nur die für den eigenen Anwendungsfall benötigten Daten in angemessener Zeit zu laden.

**Beispiel** für eine Vitalparameter-App (ein Patient) unter dem Szenario:
Beim Öffnen der Patientenakte soll die App die zuletzt dokumentierten Vitalparameter (Puls, Blutdruck, Temperatur) schnell anzeigen und anschließend bei Bedarf den Zeitraum erweitern.

Konkrete Umsetzung der Performance-Aspekte:

1. Effiziente Abfragestrategie (klein starten, dann erweitern)
- Initial nur der klinisch relevante Kurzzeitbereich, z. B. letzte 24 Stunden.
- Vorteil: schnelle Erstanzeige statt großer Datenmengen beim Start.

2. Paging statt Gesamtliste
- Ergebnisse seitenweise laden, z. B. 50 Werte pro Seite.
- Bei Verlaufsgrafik weitere Seiten im Hintergrund im Voraus nachladen, z. B. wenn der Nutzer scrollt.
- Vorteil: Anzeigezeit geringer im Frontend.

3. Sinnvolle Suchfilter
- Wo möglich Patient, Kategorie, relevante Codes und Zeitraum einschränken.
- Vorteil: weniger irrelevante Daten und stabilere Performance.

4. Vermeidung unnötiger Wiederholungsabfragen
- Bereits geladene Seiten pro Patient und Zeitraum im Cache halten.
- Wechselt der Nutzer zwischen Tabs, keine neue Anfrage, solange Daten noch gültig sind.
- Such-/Filtereingaben mit kurzer Verzögerung (z. B. 300 ms Debounce), damit nicht jede Eingabe einen Request auslöst.
- Nutzung des `_lastUpdated` Suchparameter, um nur neue oder aktualisierte Daten seit der letzten Abfrage zu erhalten.

5. Caching und bedingte Aktualisierung (ETag/If-None-Match)
- Nach erster Antwort ETag aus Header speichern.
- Folgeaufruf mit If-None-Match senden.
- Bei 304 Not Modified keine erneute Datenübertragung
- Vorteil: weniger Netzlast bei häufigem Öffnen derselben Patientenkurve, UI bleibt schnell.

6. Aktualisierungsstrategie für Live-Betrieb
- Nicht dauerhaft neu laden, sondern über [Subscriptions](https://gemspec.gematik.de/ig/fhir/isik/subscriptions/latest) intervallbasiert (z. B. alle 60 Sekunden) oder bei explizitem Nutzer-Refresh.
- Nur den neuen Zeitraum nachladen, z. B. ab letztem bekannten Messzeitpunkt.
- Vorteil: aktuelle Anzeige ohne unnötige Dauerlast.