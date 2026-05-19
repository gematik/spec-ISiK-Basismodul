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

Der `too-costly`-Mechanismus wird als eigenständiger, normativ beschriebener Fehlerfall in den IG aufgenommen. Die Spezifikation legt fest:

- **Auslösekriterien**: Explizit benannte Parameterkonstellationen, bei denen ein Server `too-costly` zurückgeben DARF (SHOULD/MAY), z.B.  
  - `_lastUpdated` ohne gleichzeitige Einschränkung auf einen Patienten oder einen engen Zeitraum (z.B.: bei erwarteten großen Mengen nicht größer als 30 Minuten, bei mittel bis kleinen erwarteten Mengen nicht größer als 6 Monate)
  - `Patient?address-country`, `Patient?gender`, `Patient?status` ohne Kombination mit identifizierenden Parametern (Identifier, Geburtsdatum)
  - Ressourcentyp-weite Abfragen ohne jeglichen Filter (PK6-Fälle)
- **HTTP-Antwortformat**: Rückgabe eines HTTP `400 Bad Request` mit einem `OperationOutcome`, dessen `issue.code` gleich `too-costly` ist und dessen `issue.severity` `error` ist (außerhalb des SearchSet-Bundles, also kein Paging-Konflikt)
- **CapabilityStatement-Ankündigung**: Server MÜSSEN für jeden Suchparameter, für den `too-costly` möglich ist, dies im CapabilityStatement dokumentieren (`CapabilityStatement.rest.resource.searchParam.documentation`)
- **Client-Verhalten**: Clients SOLLEN bei Empfang von `too-costly` die Anfrage mit engeren Filtern wiederholen (z.B. engerer Zeitraum, zusätzlicher Patientenbezug)
- **Testbarkeit**: Das Bestätigungsverfahren (Stufen 6) prüft, ob Server für definierte Parameterkonstellationen korrekt **kein** `too-costly` zurückgibt
  - z.B.: Patient?gender=female&_lastUpdated=ge{CURRENT_TIME-29min}
    - Patientinnen, die in den letzten 29 Minuten aktualisiert wurden.
  - z.B.: Observation?combo-code=http://snomed.info/sct|8499008$ge180&_lastUpdated=ge{CURRENT_TIME-5months}
    - Alle Puls-Messungen, die über 180 liegen und in den letzten 5 Monaten angelegt oder bearbeitet wurden.

**Vorteile:** Klare, testbare Vorgabe; interoperables Verhalten zwischen Herstellern; Clients können gezielt reagieren; `too-costly` bleibt optional
**Nachteile:** Höherer Spezifikationsaufwand; Server müssen implementieren, was sie bisher nur implizit konnten; enge Parameterauswahl muss sorgfältig abgewogen werden.

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

Empfehlung: 
Option 1 umsetzen
Option 2 ist nicht zu weit vom ist-stand entfernt und adressiert nicht die offenen Punkte
Option 3 ist zu einschränkend und benachteiligt die Server, die mehr könnten

## Konsequenzen


## Anhänge (optional)

Folgende Dateien wurden als Informationsquellen genutzt:

- [`publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Performance.md`](../../publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Performance.md) – Performance-Kategorien PK1–PK6, bestehender `too-costly`-Hinweis (Zeilen 73–78), Client-Implementierungshinweise
- [`publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Rest.md`](../../publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Rest.md) – Paging-Regelungen, OperationOutcome im SearchSet-Bundle (Zeilen 67–69)
- [`publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Suchparameter.md`](../../publisher-guides/Basis/input/pagecontent/UebergreifendeFestlegungen_Suchparameter.md) – Grundprinzip patientenzentrierter Suche, Modifier-Festlegungen, Best-Practice-Empfehlungen für Suchfilter
