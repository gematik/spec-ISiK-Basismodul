---
topic: markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen-Performance
---

### Performance-Aspekte

Alle beteiligten Akteure (Server wie Clients) tragen eine (Teil-)Verantwortung für die Sicherstellung einer performanten REST-API. Zweck einer performanten REST-API ist, dass die typischen Arbeitsabläufe der jeweiligen Nutzer (z. B. Arzt, Pflege, Verwaltung) ohne wahrnehmbare Verzögerung durchgeführt werden können. Insbesondere dürfen für klinisch kritische Funktionen keine Wartezeiten entstehen, die eine zeitgerechte Patientenversorgung beeinträchtigen.

Zur Sicherstellung dieser Performance-Bedarfe können in einem ersten Schritt die Antwortzeiten der REST-Endpunkte (Server) als Baseline geprüft werden - d. h. im Best-Case und unabhängig von Last-Anforderungen.
Weitere Performance-Aspekte für Server zu Antwortzeiten unter Last, Lasten und Durchsatz sollten diesen Baseline Anforderungen folgen.


Da zur Gewährleistung der Performance während der Entwicklung sowohl Client- als auch Server-Hersteller beitragen müssen, werden unten weitere Hinweise zur Client-Implementierung formuliert. Die folgenden Festlegungen gelten dagegen für Server.

#### Performance-Kategorien - zunächst zur Antwortzeit (Baseline)
Die Performance-Kategorien und entsprechende Anforderungen beziehen sich zum jetzigen Zeitpunkt alle auf den Aspekt **Antwortzeit als Baseline**.

Die Antwortzeit bezeichnet dabei  einen Request/Reply-Zyklus zwischen einem Client und einem Server, der die Zeitspanne von der Absendung einer Anfrage durch den Client bis zum vollständigen Empfang der Antwort durch den Client in der Test-Umgebung umfasst und deckt sich damit weitgehend mit dem Konzept der Bearbeitungszeit wie [hier](https://gemspec.gematik.de/docs/gemSpec/gemSpec_Perf/latest/#2.1) definiert. Dabei wird hier zusätzlich eine Antwortzeit ohne signifikante Lasteinwirkung angenommen.


Die Antwortzeit dabei bezeichnet einen Request/Reply-Zyklus zwischen einem Client und einem Server, der die Zeitspanne von der Absendung einer Anfrage durch den Client bis zum vollständigen Empfang der Antwort durch den Client in der Test-Umgebung umfasst und deckt sich damit weitgehend mit dem Konzept der Bearbeitungszeit wie [hier](https://gemspec.gematik.de/docs/gemSpec/gemSpec_Perf/latest/#2.1) definiert.

Als kritisch (PK1 bis PK4) gelten REST-Abfragen, die von klinischen Nutzern in unmittelbar behandlungsrelevanten, zeitkritischen Situationen genutzt werden und deren Bereitstellung für den anfragenden Client nahezu zur Laufzeit stattfinden sollten.
Daher sind hierfür sehr kurze Antwortzeiten ohne wahrnehmbare Verzögerung anzustreben.

Die Antwortzeit bezeichnet einen Request/Reply-Zyklus zwischen einem Client und einem Server, der die Zeitspanne von der Absendung einer Anfrage durch den Client bis zum vollständigen Empfang der Antwort durch den Client in der Test-Umgebung umfasst /und deckt sich damit weitgehend mit dem Konzept der Bearbeitungszeit wie [hier](https://gemspec.gematik.de/docs/gemSpec/gemSpec_Perf/latest/#2.1) definiert.

Für diese Performance-Kategorien gilt:

- PK1: Request-Anfrage von Ressourcen unter bekannter ID
  - Anforderung: "unter einer Sekunde"
  - Beispiel: GET baseURL/Patient/89186842
  - Beispiel: GET baseURL/Observation/67890
  - Beispiel: GET baseURL/DocumentReference/54321
    - oder : baseURL/DocumentReference?_id=54321
  - Ausnahme: DocumentReference-Ressource mit base64 kodiertem Attachment bzw. Binary

- PK2: Suchanfragen zum Auffinden von Ressourcen auf Basis von weitestgehend eindeutigen Metadaten (z. B. .identifier und .birthdate) ohne _include und _revInclude, ohne Chaining.
  - Anforderung "unter einer Sekunde"
  - Beispielanfrage baseURL/Patient?identifier=12345 
  - Beispielanfrage baseURL/Patient?birthdate=1982-01-13
  - Beispielanfrage - Medikationsliste der einzelnen Patienten für eine Station: baseURL/MedicationRequest?patient=Patient/89186842
  - Ausnahme: DocumentReference-Ressource mit base64 kodiertem Attachment bzw. Binary

- PK3: Suchanfragen zum Auffinden von Patienten-gebundenen Ressourcen (ohne _include und _revInclude ohne Chaining) unter der Annahme, dass Patient.id bekannt.
  - Anforderung: "unter 2 Sekunden"
  - Beispielanfrage: baseURL/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|R10.0&patient=89186842
  - Beispielanfrage: baseURL/Condition?patient=Patient/89186842
  - Beispielanfrage: baseURL/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|vital-signs&patient=Patient/89186842
  - Ausnahme: DocumentReference-Ressource mit base64 kodiertem Attachment bzw. Binary

- PK4: Suchanfragen auf Patient und Encounter unter der Annahme, dass .identifier unbekannt und dass ein sehr großer Ergebnisraum der Suchanfrage möglich ist.
  - Kontext: Listen- und Übersichtsabfragen (z.B. Patientenlisten, Falllisten)
  - Anforderung: "unter 5 Sekunden"
  - Beispielanfrage - alle Patienten mit dem Namen Müller: baseURL/Patient?name=Müller
  - Beispielanfrage - alle Patienten auf der Station "123": baseURL/_has:Encounter:patient:location=Location/ward123

Als vorwiegend unkritisch gelten Abfragen (PK5 bis PK6), die z. B.
- im Rahmen der Planungs- und Organisationsinformationen mit Bezug zu Patienten (z.B. Terminpläne, Belegungspläne), 
-  Schreiboperationen, die nicht in der akuten Entscheidungssituation, sondern zeitnah im Verlauf erforderlich sind (z.B. Nachdokumentation),
- die überwiegend für Verwaltung, Abrechnung, Controlling, Stammdatenpflege, Reporting oder technische Administration genutzt werden oder
- Abfragen und Operationen zur Stammdatenpflege ohne unmittelbaren Behandlungskontext

Für diese Performance-Kategorien sind längere Antwortzeiten grundsätzlich tolerierbar; bei zu erwartenden längeren Laufzeiten sind asynchrone Verfahren möglich.

Für diese Performance-Kategorien gilt:

- PK5: weitere Suchanfragen bzw. Operationen.
  - Anforderung: "Unter 60 Sekunden"
  - Beispielanfrage - Prozeduren für eine Station: baseURL/Procedure?encounter.location=Location/ward123
  - Beispielanfrage - Liste aller Stationen: baseURL/Location?type=http://terminology.hl7.org/CodeSystem/location-physical-type|wa
  - Beispielanfrage - Niereninsuffizienz Screening mittels Serumkreatinin: baseURL/Observation?code=http://loinc.org|2160-0&combo-code-value-quantity=gt1.0|mg/dL

- PK6: weitere Suchanfragen und Custom-Operation
  - Anforderung: nicht geprüft
  - Beispiel - Operation zur Terminbuchung in ISiK : baseURL/$book 
  - Beispielanfrage - Alle verschriebenen bzw. verabreichten Medikamente (relevant bei auffälligen Medikationschargen): baseURL/MedicationRequest

Für diese Performance-Kategorien werden im Test-System des Zertifizierungsverfahrens die entsprechenden Performance-Anforderungen (z.B. Antwortzeiten - ggf. unter Berücksichtigung der Perzentile -; aber vorerst keine Lasten, Durchsatz etc.)implementiert.


**Hinweis zur Server-Implementierung bei Patienten- und Encounter-unabhängigen Suchen:**

Bei den Patienten- und Encounter-unabhängigen Suchen DARF ab einer bestimmten Komplexität der Suchanfrage ein Server OperationOutcomes mit Codes wie z.B. `too-costly` zurückgeben (es liegt also im Ermessen des Herstellers).
Vor einer solchen Lösung SOLLEN aber geeignete Mechanismen - wie Pagination - in Betracht gezogen werden.

Ein Beispiel für too-costly - alle Observations der letzten Jahre : baseURL/Observation?_lastUpdated=ge2020

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
- Nicht dauerhaft neu laden, sondern über [Subscriptions](https://gemspec.gematik.de/ig/fhir/isik/subscriptions/6.0.0-rc) intervallbasiert (z. B. alle 60 Sekunden) oder bei explizitem Nutzer-Refresh.
- Nur den neuen Zeitraum nachladen, z. B. ab letztem bekannten Messzeitpunkt.
- Vorteil: aktuelle Anzeige ohne unnötige Dauerlast.