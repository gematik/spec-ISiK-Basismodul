# ADR: Verallgemeinerung des `too-costly`-Mechanismus für potenziell kostspielige Suchanfragen

Datum: 2026-05-18  

Status: Vorgeschlagen  

Ticket: PTDATA-2233

## Kontext

ISiK legt Performance-Kategorien (PK1–PK6) fest, die Antwortzeiten für verschiedene Anfragetypen normieren. Während patientenbezogene Anfragen (z.B. alle Ressourcen eines einzelnen Patienten) klare Zeitgrenzen haben, entstehen bei bestimmten patientenungebundenen oder breit gefächerten Suchanfragen potenziell sehr große Ergebnismengen, die Server in ihrer Leistungsfähigkeit erheblich belasten können.

Konkrete Problemfälle sind u.a.:

- **`_lastUpdated` ohne enge Zeiteinschränkung** auf Ressourcen mit großem Datenvolumen (z.B. `baseURL/Observation?_lastUpdated=ge2020`), das gesamte Observations-Inventar mehrerer Jahre umfassen kann
- **Breite Patientensuchen** über Parameter wie `address-country`, `gender` oder `status` ohne gleichzeitige Einschränkung auf Identifier oder Geburtsdatum (PK4), die den gesamten Patientenbestand als Ergebnismenge haben können
- **Ressourcentyp-weite Abfragen** ohne Patienten- oder Encounter-Kontext (z.B. `baseURL/MedicationRequest` ohne weitere Filter, in PK6 als "nicht geprüft" eingestuft)

Aktuell enthält die Spezifikation lediglich einen informativen Hinweis (in `UebergreifendeFestlegungen_Performance.md`), dass Server bei patientenunabhängigen Suchen ab einer bestimmten Komplexität ein `OperationOutcome` mit dem Code `too-costly` zurückgeben *dürfen* – „es liegt also im Ermessen des Herstellers". Eine normative Vorgabe zu Auslösekriterien, HTTP-Status, Response-Format oder Client-Verhalten fehlt bislang vollständig.

Das Paging-Kapitel in `UebergreifendeFestlegungen_Rest.md` erlaubt `OperationOutcome`-Einträge im SearchSet-Bundle nur mit Schweregrad `information` oder `warning`; ein `too-costly`-Fehler (Schweregrad `error`) wäre dort explizit unzulässig. Es besteht damit eine Lücke: Der Mechanismus ist bisher weder spezifiziert noch testbar, und Clients wissen nicht, wie sie damit umgehen sollen.

## Optionen

### Option 1: Normative Vorgabe im IG – `too-costly` als definierter, testbarer Fehlerfall

Der `too-costly`-Mechanismus wird als eigenständiger, normativ beschriebener Fehlerfall in den IG aufgenommen. Statt `too-costly` an einer **Trefferanzahl** festzumachen (ein fixer Wert wie „1000 Elemente" wäre zu kurz gedacht – er reißt bei hochvolumigen Vitaldaten in Minuten, greift bei Stammdaten nie und ist auf datenarmen Testsystemen ohnehin nicht prüfbar), wird die Grenze über die **Begrenztheit der Anfrage** definiert: Eine Anfrage ist unkritisch, wenn ihre Ergebnismenge nicht mit wachsendem Datenbestand unbegrenzt mitwächst. Begrenztheit wird über zwei greifbare, datenmengen-unabhängig prüfbare Stellschrauben ausgedrückt: ein **maximales Zeitfenster** (temporale Parameter) und einen **Pflicht-Begleitparameter** (nicht-temporale Breitensuchen).

**1. Ressourcen-Volumenklassen.** Ressourcentypen werden nach erwartetem Datenaufkommen klassifiziert; daraus leitet sich der garantiert zu beantwortende Suchumfang ab:

| Klasse | Ressourcen | Charakter | Mindest-Suchumfang (Floor) für sonst ungefilterte Suchen |
| --- | --- | --- | --- |
| **Hochvolumig** | `Observation`, `DeviceMetric` | kontinuierlich erzeugt, wächst pro Patient unbegrenzt | `_lastUpdated`/Datums-Fenster **≤ 7 Tage** ODER Pflicht-Begleitparameter (`patient`/`encounter`/`category`+Fenster) |
| **Mittelvolumig** | `AllergyIntolerance`, `Appointment`, `Composition`, `Condition`, `DiagnosticReport`, `DocumentReference`, `Encounter`, `List`, `MedicationAdministration`, `MedicationRequest`, `MedicationStatement`, `Procedure`, `QuestionnaireResponse`, `RiskAssessment`, `Schedule`, `Slot` | pro Kontakt/Verordnung/Behandlungsepisode | Fenster **≤ 3 Monate** ODER Pflicht-Begleitparameter (`patient`/`encounter`) |
| **Niedrigvolumig / Stammdaten** | `Account`, `Binary`, `Device`, `HealthcareService`, `Location`, `Medication`, `Organization`, `Patient`, `Practitioner`, `PractitionerRole`, `Questionnaire`, `RelatedPerson` | begrenzter Bestand, primär stammdatenartig | kein Fenster nötig; deckt sich mit PK4 (breite Patient-/Encounter-Suchen sind ohnehin in ≤ 5 s zu beantworten) |
| **Infrastruktur / nicht-klinisch** | `Bundle`, `CapabilityStatement`, `CodeSystem`, `OperationDefinition`, `Parameters`, `SearchParameter`, `ValueSet` | keine patientenbezogenen Suchanfragen | nicht betroffen; `too-costly` nicht anwendbar |

**2. Zwei-Stufen-Modell (Floor/Ceiling).** Damit leistungsfähige Server nicht benachteiligt werden:
  - **Mindest-Suchumfang (Floor)** – normativ durch ISiK festgelegt (Tabelle oben). Innerhalb dieses Fensters bzw. mit dem geforderten Begleitparameter MUSS jeder Server ohne `too-costly` antworten. Dies ist die testbare PK-Konformität.
  - **Server-Ceiling** – Server, die mehr leisten, DÜRFEN einen erweiterten Suchumfang unterstützen und SOLLEN ihre tatsächliche Grenze im CapabilityStatement deklarieren. `too-costly` ist nur für Anfragen **außerhalb** des vom Server deklarierten (mind. des ISiK-Floor-)Suchumfangs zulässig.

**3. Auslösekriterien**: Ein Server DARF (SHOULD/MAY) `too-costly` zurückgeben, wenn eine Anfrage den vom Server unterstützten Suchumfang überschreitet, insbesondere:
  - `_lastUpdated`/Datumsparameter ohne Patient-/Encounter-Bezug und mit einem Fenster oberhalb des Floors der jeweiligen Volumenklasse (z. B. `baseURL/Observation?_lastUpdated=ge2020`)
  - `Patient?address-country`, `Patient?gender`, `Patient?status` ohne Kombination mit einem identifizierenden Begleitparameter (`identifier`, `birthdate`, `name`)
  - Ressourcentyp-weite Abfragen hochvolumiger Ressourcen ohne jeglichen Filter (PK6-Fälle)
  - Vor einer `too-costly`-Antwort SOLLEN geeignete Mechanismen wie Pagination geprüft werden.

**4. HTTP-Antwortformat**: Rückgabe eines HTTP `400 Bad Request` mit einem `OperationOutcome`, dessen `issue.code` gleich `too-costly` und dessen `issue.severity` `error` ist (außerhalb des SearchSet-Bundles, also kein Paging-Konflikt). `issue.diagnostics` SOLL einen menschenlesbaren Hinweis auf den überschrittenen Suchumfang enthalten (z. B. „Zeitfenster auf ≤ 7 Tage einschränken oder `patient` angeben").

**5. CapabilityStatement-Deklaration**: Server MÜSSEN für jeden Suchparameter, für den `too-costly` möglich ist, dies dokumentieren und SOLLEN den unterstützten Suchumfang angeben (`CapabilityStatement.rest.resource.searchParam.documentation`).

**6. Client-Verhalten**: Clients SOLLEN bei Empfang von `too-costly` die Anfrage mit engeren Filtern wiederholen (engeres Zeitfenster, zusätzlicher Patienten-/Encounter-Bezug, Pagination).

**7. Testbarkeit**: Das Bestätigungsverfahren (Stufe 6) prüft ausschließlich den **negativen** Fall – datenmengen-unabhängig, da auch eine leere, valide `200`-SearchSet-Antwort ein Pass ist: Für Anfragen **innerhalb** des ISiK-Floors gibt der Server korrekt **kein** `too-costly` zurück:
  - z. B. `Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|vital-signs&_lastUpdated=ge{CURRENT_TIME-7d}`
    - Vitalwerte der letzten 7 Tage (hochvolumig, innerhalb Floor) → MUSS ohne `too-costly` beantwortet werden.
  - z. B. `Patient?gender=female&_lastUpdated=ge{CURRENT_TIME-29min}`
    - Patientinnen, die in den letzten 29 Minuten aktualisiert wurden.
  - z. B. `Observation?combo-code=http://snomed.info/sct|8499008$ge180&_lastUpdated=ge{CURRENT_TIME-5months}`
    - Alle Puls-Messungen über 180, in den letzten 5 Monaten angelegt/bearbeitet.
  - Ergänzend wird die Existenz und syntaktische Gültigkeit der CapabilityStatement-Deklaration geprüft.

**Vorteile:** Klare, testbare Vorgabe ohne Abhängigkeit vom Datenvolumen des Testsystems; greifbare Grenzen (Zeitfenster, Begleitparameter) statt arbiträrer Trefferzahl; interoperables Verhalten zwischen Herstellern; Clients können gezielt reagieren; leistungsfähige Server werden über das Ceiling nicht benachteiligt; `too-costly` bleibt optional.
**Nachteile:** Höherer Spezifikationsaufwand; die Volumenklassen und konkreten Fenstergrößen müssen fachlich abgestimmt und gepflegt werden; Server müssen das Suchumfang-Konzept und die CapabilityStatement-Deklaration implementieren.

---

### Option 2: Optionaler Mechanismus mit definierten Mindestanforderungen (Strukturvorgabe ohne Zwang)

Der `too-costly`-Mechanismus bleibt optional (DARF/MAY), wird aber durch Mindestanforderungen an Format und Client-Verhalten ergänzt, ohne ihn für bestimmte Parameterkonstellationen vorzuschreiben:

- **Response-Format** wird normiert: HTTP `400` mit `OperationOutcome`, `issue.code = too-costly`, `issue.severity = error`, ergänzt um `issue.diagnostics` mit einem menschenlesbaren Hinweis auf die problematische Anfrage
- **CapabilityStatement**: Server KÖNNEN, aber MÜSSEN NICHT, `too-costly`-fähige Suchparameter dort kennzeichnen
- **Client-Verhalten**: Clients SOLLEN bei `too-costly` eine Anpassung der Anfrage versuchen; die Spezifikation gibt Empfehlungen (engerer Zeitraum, zusätzlicher Patientenbezug), aber keine Pflicht
- **Keine Testpflicht** im Bestätigungsverfahren: Der Mechanismus ist nicht Gegenstand der Zertifizierung
- Für die Suchparameter `address`, `gender`, `status` bei Patient und `_lastUpdated` wird in den jeweiligen Suchparameter-Beschreibungen ein informativer Hinweis ergänzt, dass Server `too-costly` zurückgeben können

**Vorteile:** Geringerer Normierungsaufwand; Implementierungsfreiheit bleibt erhalten; kein Risiko, Hersteller mit unklaren Testkriterien zu belasten.  
**Nachteile:** Ohne Testpflicht keine Garantie einheitlichen Verhaltens; Clients können sich nicht verlässlich auf die Reaktion verlassen; das grundsätzliche Problem nicht-performanter Anfragen wird nicht strukturell gelöst.

---

### Option 3: Präventiver Ansatz – Verpflichtende Parameterrestriktionen statt Laufzeitfehler

Anstatt `too-costly` als Laufzeitfehler zu spezifizieren, wird das Problem auf Designebene adressiert: Bestimmte Suchparameter dürfen nur in Kombination mit einschränkenden Pflichtparametern verwendet werden.

- Für `_lastUpdated` wird festgelegt, dass dieser Parameter allein (ohne weiteren Ressourcen-Filter wie `patient`, `category` oder engen Zeitbereich) von Servern abgelehnt werden DARF, und Clients SOLLEN ihn nicht isoliert verwenden
- Für `Patient?address`, `Patient?gender`, `Patient?status` wird festgelegt, dass Server diese nur dann ohne `too-costly` beantworten müssen, wenn ein weiterer einschränkender Parameter (z.B. `birthdate`, `identifier`) mitgegeben wird; andernfalls ist `too-costly` zulässig
- Servers MÜSSEN im CapabilityStatement für diese Suchparameter den Hinweis aufnehmen, dass isolierte Verwendung zu `too-costly` führen kann (maschinenlesbar)
- `too-costly` selbst wird damit implizit für diese Parameterkonstellationen spezifiziert, ohne einen generellen Mechanismus zu definieren

**Vorteile:** Präventiv statt reaktiv; Client-Design wird zu effizienten Anfragen gelenkt; testbar über CapabilityStatement-Inhalt.  
**Nachteile:** Schränkt Suchflexibilität ein; kann Clients mit legitimen Anwendungsfällen (z.B. Datenanalyse, Reporting) behindern; schwer vollständig auf alle betroffenen Parameter auszuweiten.

## Entscheidung

Option 1 wird umgesetzt.

Ergänzend wird ein **mengenbasiertes Fallback** als oberste, vom Suchumfang-Konzept unabhängige Auffanggrenze festgelegt:

- Ein Server DARF unabhängig von Volumenklasse und Zeitfenster `too-costly` zurückgeben, sobald eine Anfrage eine Ergebnismenge von **mehr als 10.000 Ressourcen pro SearchSet** erzeugen würde.
- Umgekehrt gilt dieser Wert als **garantierter Mindest-Floor**: Ein Server MUSS Anfragen bis einschließlich **10.000 Ressourcen** beantworten und DARF unterhalb dieser Schwelle **kein** `too-costly` zurückgeben (Pagination bleibt das Mittel der Wahl, um die Menge auszuliefern).

Das Fallback greift damit als grober Richtwert auch dort, wo die Suchumfang-Kriterien (Zeitfenster/Begleitparameter) eine Anfrage formal zulassen, die konkrete Ergebnismenge aber dennoch sehr groß ausfällt.

## Konsequenzen


## Anhänge (optional)

Folgende Dateien wurden als Informationsquellen genutzt:

- [`publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Performance.md`](../../publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Performance.md) – Performance-Kategorien PK1–PK6, bestehender `too-costly`-Hinweis (Zeilen 73–78), Client-Implementierungshinweise
- [`publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Rest.md`](../../publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Rest.md) – Paging-Regelungen, OperationOutcome im SearchSet-Bundle (Zeilen 67–69)
- [`publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Suchparameter.md`](../../publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Suchparameter.md) – Grundprinzip patientenzentrierter Suche, Modifier-Festlegungen, Best-Practice-Empfehlungen für Suchfilter
