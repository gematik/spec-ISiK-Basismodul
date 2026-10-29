# Workflow: CompliesWith Export — `complieswith-export.yml`

## Zweck in einem Satz

Der Workflow aktiviert die `CompliesWith`-Verknüpfungen in den FSH-Dateien, fügt die nötigen
externen FHIR-Pakete als Abhängigkeiten hinzu, generiert die Ressourcen mit SUSHI und validiert
sie mit dem Java-Validator gegen die referenzierten externen Profile — und meldet das Ergebnis
als PR-Kommentar.

Hintergrund: `CompliesWith` drückt aus, dass eine ISiK-Ressource zu einem **externen** Profil
(z. B. MII, KBV, EU-FHIR) konform sein soll. Diese Prüfung ist im normalen CI-Lauf nicht aktiv und
wird hier separat ausgeführt.

---

## Wann läuft der Workflow? (Trigger)

| Trigger | Bedingung | Zweck |
|---|---|---|
| `pull_request` | jeder Branch (`'**'`) | CompliesWith-Validierung als PR-Feedback |
| `push` | `main-stufe-*` | Referenzlauf auf dem Hauptbranch; das Artefakt dient als Baseline für den Vergleich im PR-Kommentar |
| `workflow_dispatch` | manuell | Ad-hoc-Lauf |

Der PR-Kommentar wird nur bei `pull_request` erstellt. Bei `push` und `workflow_dispatch` werden
Rohlog und Details ausschließlich als Artefakt abgelegt.

**Berechtigungen:** `actions`, `contents`, `issues`, `pull-requests` jeweils `write`
(für Artefakt-Upload und PR-Kommentar).

---

## Externe Pakete (env `COMPLIESWITH_DEPENDENCIES`)

Zentral oben im Workflow definiert und an `add-dependencies.js` übergeben:

```
hl7.fhir.eu.eps#current
hl7.fhir.eu.hdr#current
hl7.fhir.eu.base#current
hl7.fhir.eu.laboratory#current
hl7.fhir.eu.mpd#current
de.medizininformatikinitiative.kerndatensatz.base#2026.0.0
kbv.basis#1.8.0
de.gevko.emdaf#1.3.0
```

> ⚠️ **Technische Schuld:** Fünf der acht Pakete nutzen `#current` (gleitende Version). Das macht
> Läufe **nicht reproduzierbar** — ein Lauf kann grün sein und der nächste rot, ohne dass sich am
> Repo etwas geändert hat. Ein Pinnen auf feste Versionen ist **derzeit nicht möglich**, da für die
> EU-FHIR-Pakete noch keine stabilen Releases vorliegen. Sobald diese verfügbar sind, auf feste
> Versionen umstellen und ab dann regelmäßig auf Updates prüfen und ggf. Versionen hochziehen.

---

## Was machen die einzelnen Steps?

Der einzige Job `export_validation` läuft auf `ubuntu-latest`:

1. **Checkout code** — checkt bei PR gezielt den Head-Branch aus, bei `push` den gepushten Branch.
2. **Test CompliesWith log parser** (`parse-validator-log.test.js`) — prüft den Rohlog-Parser gegen
   ein eingechecktes Fixture (siehe unten), bevor der eigentliche Lauf startet.
3. **Add CompliesWith dependencies** (`add-dependencies.js`) — trägt die oben gelisteten Pakete
   in die SUSHI-Konfiguration ein.
4. **Uncomment CompliesWith inserts** (`uncomment-inserts.js`) — aktiviert die im Normalbetrieb
   auskommentierten `CompliesWith`-Inserts in den FSH-Dateien.
5. **Run SUSHI** — `npx fsh-sushi Resources/ -s` generiert die FHIR-Ressourcen (mit Snapshots).
6. **Filter validation targets** (`filter-validation-targets.js`) — wählt aus, welche Ressourcen
   tatsächlich validiert werden (Ablage in `Resources/fsh-generated/complieswith-validation`).
   Nur Ressourcen mit `CompliesWith`-Verknüpfungen qualifizieren sich.
7. **Set up Java** (Temurin 17) — Laufzeit für den Validator.
8. **Download Java validator** — lädt das Validator-JAR per `curl` (siehe externe Abhängigkeiten).
9. **Run Java validator for CompliesWith** (`run-java-validator.js`, `continue-on-error: true`) —
   validiert gegen die externen Profile; schreibt `validation-raw.log` und `validation-details.json`.
   Der Schritt darf fehlschlagen, ohne den Job rot zu machen (Ergebnis kommt als Kommentar).
10. **Check validation outputs** — setzt `has_validation_details` je nachdem, ob die Details-Datei
    existiert (`if: always()`).
11. **Upload validation artifacts** — lädt Log + Details als Artefakt
    `complieswith-export-validation-results` hoch (90 Tage), nur wenn Details vorhanden.
12. **Comment validation results on PR** (`update-pr-comment.js`, `if: always()`, nur bei
    `pull_request`) — postet das Ergebnis als PR-Kommentar.
13. **Fail job on CompliesWith errors** — überträgt das Ergebnis des Validator-Steps auf den
    Job-Status. Der Job wird rot, sobald mindestens ein CompliesWith-Fehler vorliegt oder der
    Validator nicht ausgewertet werden konnte.

---

## Auswertung des Rohlogs (`parse-validator-log.js`)

Der Java-Validator schreibt je geprüfter Datei eine Sektion mit allen Meldungen. Eine verletzte
`CompliesWith`-Verknüpfung erscheint als Meldung
`This profile does not comply with claimed profile '<Zielprofil>' … {SD_EXTENSION_COMPLIES_WITH_ERROR}`,
gefolgt von eingerückten `slice error:`/`slice warn:`-Zeilen.

`parse-validator-log.js` ist der gemeinsame Parser für `run-java-validator.js` (erzeugt
`validation-details.json`) und `update-pr-comment.js` (Fallback, falls die JSON-Datei fehlt).
Er liefert **je Paar (ISiK-Profil, Zielprofil) genau einen Eintrag**; die Anzahl der Einträge
entspricht der Anzahl der `does not comply`-Meldungen im Rohlog. Die Detail-Sammlung eines Eintrags
endet bei der nächsten Validator-Meldung (`Error|Warning|Information @`) oder am Sektionsende.
Weicht die Anzahl der Einträge von der Anzahl der Meldungen ab, gibt `run-java-validator.js`
eine Warnung im Job-Log aus.

Der Test `parse-validator-log.test.js` belegt dieses Verhalten ohne CI-Lauf anhand eines
eingecheckten Rohlog-Ausschnitts (`fixtures/validation-raw.multi-violation.log`, vier Sektionen
mit 2/5/0/2 Verstößen) und läuft als erster Step des Workflows:

```
node --test scripts/complieswith/parse-validator-log.test.js
```

---

## Stellschrauben (Konfiguration)

| Stellschraube | Ort | Wirkung |
|---|---|---|
| `COMPLIESWITH_DEPENDENCIES` | env (top) | Welche externen Profile/Pakete einbezogen werden |
| Validator-JAR-URL | Download-Step | Welche Validator-Version genutzt wird |
| `java-version: '17'` / `temurin` | Setup-Java | Java-Laufzeit |
| `continue-on-error: true` | Validator-Step | Validierungs-Fehler brechen den Job nicht ab |
| `ADVISOR_FILE: validator/advisor.json` | Validator-Step (env) | Herabstufung von Meldungen |
| `VALIDATION_DIR` / `RESOLUTION_CONTEXT_DIR` | Validator-Step (env) | Eingabe- und Auflösungskontext |
| `retention-days: 90` | Upload-Step | Aufbewahrung der Artefakte (Baseline muss für Vergleiche verfügbar bleiben) |

---

## Technische Schulden & offene Punkte

- **🔴 Validator aus einem privaten Fork** (`jschoen-gefyra/org.hl7.fhir.core`,
  `v6.9.8-snapshot-build`, ein **SNAPSHOT**). Im Code ist die offizielle HAPI-FHIR-Quelle
  (`hapifhir/org.hl7.fhir.core` 6.9.7) auskommentiert daneben hinterlegt. Der Fork ergänzt die
  Möglichkeit, das `compliesWithProfile`-Reasoning über das Advisor-Framework zu filtern. Genau
  dieser Fix liegt bereits upstream als
  [hapifhir/org.hl7.fhir.core#2477](https://github.com/hapifhir/org.hl7.fhir.core/pull/2477) vor;
  sobald dieser gemerged und ein offizielles Release veröffentlicht ist, steht die Funktion auch im
  Standard-Validator zur Verfügung. Bis dahin ist der Fork + Snapshot-Build die
  Validierungsgrundlage — die gewichtigste technische Schuld dieses Workflows. **Empfehlung:** nach
  Merge von PR #2477 und Release auf das offizielle HAPI-JAR zurückwechseln und den auskommentierten
  HAPI-Link reaktivieren.
- **`#current`-Versionen** der EU-FHIR-Pakete (siehe oben) → keine Reproduzierbarkeit; ein Pinnen
  ist derzeit mangels stabiler Releases nicht möglich.
- **`continue-on-error: true`** am Validator-Step ist gewollt (Ergebnis als Kommentar statt
  hartem Fail). Theoretisch könnte das echte Infrastruktur-Fehler (z. B. fehlgeschlagener Download)
  verdecken. Die Unterscheidung zwischen „Validierung fand Findings“ und „Validator lief gar nicht“
  wird jedoch bereits über Schritt 9 (`has_validation_details`) abgebildet; nach aktuellem Stand
  greift das zuverlässig, daher besteht hier kein akuter Handlungsbedarf.
- **Auskommentierte Inserts** als Mechanismus (Schritt 3) — funktioniert, ist aber ein impliziter
  Zustand in den FSH-Quellen, der nur in diesem Workflow aktiviert wird.

---

## Externe Abhängigkeiten

| Action / Dienst | Version | Herkunft | Einschätzung |
|---|---|---|---|
| `jschoen-gefyra/org.hl7.fhir.core` (Validator-JAR) | `v6.9.8-snapshot-build` | **Privater Fork** | **🔴 Auflösen.** Persönlicher Fork + Snapshot; enthält die Advisor-Filterung des `compliesWithProfile`-Reasonings. Offiziell verfügbar nach Merge von [PR #2477](https://github.com/hapifhir/org.hl7.fhir.core/pull/2477) + Release. |
| `hl7.fhir.eu.*` Pakete | `#current` | HL7 Europe | **Beibehalten** (fachlich nötig). Pinnen derzeit **nicht möglich** (keine stabilen Releases) — nachholen, sobald verfügbar. |
| `de.medizininformatikinitiative.kerndatensatz.base` | `2026.0.0` | MII | Beibehalten (bereits gepinnt ✓). |
| `kbv.basis` | `1.8.0` | KBV | Beibehalten (gepinnt ✓). |
| `de.gevko.emdaf` | `1.3.0` | gevko | Beibehalten (gepinnt ✓). |
| `actions/checkout` | `v6` | GitHub offiziell | Beibehalten. |
| `actions/setup-java` | `v5` | GitHub offiziell | Beibehalten. |
| `actions/upload-artifact` | `v7` | GitHub offiziell | Beibehalten. |
| `actions/github-script` | `v8` | GitHub offiziell | Beibehalten. |

**Empfehlung zur Hauptabhängigkeit:** Der Fork-basierte Validator ist eine bewusste, befristete
Maßnahme. Der enthaltene Fix — Advisor-basierte Filterung des `compliesWithProfile`-Reasonings — ist
bereits upstream als [PR #2477](https://github.com/hapifhir/org.hl7.fhir.core/pull/2477) eingereicht.
Sobald dieser gemerged und ein offizielles Release verfügbar ist, auf das offizielle JAR umstellen
und den auskommentierten HAPI-Link reaktivieren.