# Workflow: CI (FHIR Validation) — `main.yml`

## Zweck in einem Satz

Der Workflow validiert die aus FSH generierten FHIR-Ressourcen mit dem Firely-Terminal /
Java-Validator, erzeugt einen menschenlesbaren Validierungsbericht und committet die
generierten FHIR-Dateien automatisch zurück ins Repository.

---

## Wann läuft der Workflow? (Trigger)

| Trigger | Bedingung | Zweck |
|---|---|---|
| `push` | Änderungen unter `Resources/**` oder `.github/workflows/**`, **außer** auf Branches `main**` | Validierung von Feature-Branches |
| `pull_request` | Ziel-Branch `main**` | Qualitäts-Gate vor dem Merge |
| `workflow_call` | Aufruf aus anderem Workflow | Wiederverwendung als Baustein; benötigt Secrets |
| `workflow_dispatch` | manuell | Ad-hoc-Lauf über die Actions-Oberfläche |

**Benötigte Secrets** (bei `workflow_call`): `SIMPLIFIER_USERNAME`, `SIMPLIFIER_PASSWORD`,
`WORKFLOW_PERMISSION_GITHUB`.

> ⚠️ **Offener Punkt:** `WORKFLOW_PERMISSION_GITHUB` wird in `workflow_call` als *required*
> deklariert, aber innerhalb der Steps **nicht verwendet**. Der einzige Workflow, der das Secret
> tatsächlich nutzte (`ToolUpdate.yml`), wurde entfernt (durch Dependabot abgelöst) — das Secret ist
> damit repo-weit ungenutzt und sollte aus der `workflow_call`-Signatur entfernt werden.

**Berechtigungen:** `actions: write`, `contents: write` (Letzteres wird für den Auto-Commit
am Ende benötigt).

---

## Was machen die einzelnen Steps?

Der einzige Job `CI_FHIR_VALIDATION` läuft auf `ubuntu-latest` und führt folgende Schritte aus:

1. **Checkout code (PR) / Checkout code (Main)**
   Zwei sich gegenseitig ausschließende Checkout-Schritte. Bei einem Pull Request wird
   gezielt der Head-Branch (`pull_request.head.ref`) ausgecheckt, damit der nachfolgende
   Auto-Commit auf den richtigen Branch zurückschreiben kann. Sonst Standard-Checkout.

2. **Firely.Terminal (GitHub Actions)** — der eigentliche Validierungs-Kern.
   - Führt zuerst **SUSHI** aus (`SUSHI_ENABLED: true`, Eingabe `Resources/`), um FSH → FHIR
     zu generieren.
   - Validiert die generierten Ressourcen aus `Resources/fsh-generated/resources/`.
   - **DOTNET-Validierung deaktiviert**, **Java-Validierung aktiv**.
   - Nutzt den **BfArM-Terminologieserver** (`TERMINOLOGY_SERVICE_BFARM_ENABLED: true`).
   - Schließt Slicing für die Validierung (`CLOSE_SLICING_FOR_VALIDATION: true`).
   - Erwartet, dass bestimmte interne Checks „fehlschlagen“ (`EXPECTED_FAILS`).

3. **Upload validation artifacts**
   Lädt `validation.json` und `validation.html` als Artefakt hoch (Aufbewahrung: 1 Tag).

4. **Convert Validation Report**
   Wandelt `validation.json` in einen Markdown-Bericht um (nur Errors). Eine **Filterliste**
   blendet bekannte, akzeptierte Findings aus (siehe unten „Technische Schulden“).

5. **Validate Resource Status**
   Prüft den `status` der FHIR-Ressourcen (z. B. `draft`/`active`) im Ordner
   `Resources/fsh-generated/resources/`.

6. **Add & Commit**
   Committet die generierten FHIR-Dateien (`Resources/fsh-generated/resources/`) automatisch
   zurück ins Repo (Bot-Commit „auto-generated FHIR files by GitHub Actions“).

---

## Stellschrauben (Konfiguration)

| Stellschraube | Ort | Wirkung |
|---|---|---|
| `DOTNET_VALIDATION_ENABLED` / `JAVA_VALIDATION_ENABLED` | Firely-Step | Welche Validatoren laufen |
| `JAVA_VALIDATION_OPTIONS` | Firely-Step | Sprache (`de`), Jurisdiktion (`de`), Advisor-Datei, Output-Formate, SNOMED-CT-Edition/Version |
| `-sct 11000274103/version/20251115` | Java-Optionen | **Fest verdrahtete SNOMED-CT-Version** (DE-Edition) |
| `EXPECTED_FAILS` | Firely-Step | Welche internen Validierungs-„Fehler“ als erwartet gelten |
| `filters:` | Convert-Step | Liste bekannter, bewusst unterdrückter Findings |
| `validator/advisor.json` | Java-Optionen | Steuert, welche Meldungen als Warnung/Info herabgestuft werden |
| `retention-days: 1` | Upload-Step | Aufbewahrungsdauer der Artefakte |

---

## Technische Schulden & offene Punkte

- **Hartkodierte Filterliste im Convert-Step.** Mehrere Einträge sind explizit als Workarounds
  für *Upstream-Bugs* dokumentiert (z. B. fehlende Snapshot-Erzeugung der Backport-Subscription-IG
  1.1.0, R5-CodeSystem für Encounter-Status, fehlende LOINC-LL-Codes). **Diese Filter sollten
  entfernt werden, sobald die referenzierten Upstream-Releases erschienen sind** (1.2.0 Backport
  Subscription IG, kommendes Basisprofil-Release mit Versions-Pinning). Empfehlung: regelmäßig auf
  Obsoleszenz prüfen und entfernen, sobald die Upstream-Releases verfügbar sind. (Verweise auf
  konkrete Tickets/Issues bleiben vorerst bewusst offen.)
- **Fest verdrahtete SNOMED-CT-Version** (`20251115`). Muss bei neuer Edition manuell aktualisiert
  werden — Kandidat für Zentralisierung/Variable.
- **`EXPECTED_FAILS`** maskiert dauerhaft erwartete Fehler. Sinnvoll, aber intransparent — sollte
  dokumentiert sein, warum DOTNET- und Java-Conformance-Fails erwartet werden.
- **DOTNET-Validierung deaktiviert** — bewusste, **dauerhafte** Entscheidung (es läuft nur die
  Java-Validierung). Kein offener Punkt, hier nur zur Klarstellung.
- **Auto-Commit zurück ins Repo** — **gewünschtes Verhalten.** Zu beachten: erzeugt Bot-Commits und
  kann bei PRs aus Forks zu Berechtigungsproblemen führen; die Trigger müssen sauber greifen, sonst
  besteht ein Risiko für Commit-Schleifen.
- **Ungenutztes Secret** `WORKFLOW_PERMISSION_GITHUB` (siehe oben).

---

## Externe Abhängigkeiten

| Action / Dienst | Version | Herkunft | Einschätzung |
|---|---|---|---|
| `FirelyTeam/firely-terminal-pipeline` | `v0.8.9` | Firely (offizieller FHIR-Tool-Anbieter) | **Beibehalten.** Kern der Validierung, gepflegt vom Hersteller. Version pinnen ✓. |
| `patrick-werner/validation-outcome-markdown-renderer` | `v1` | Open Source (MIT); Patrick Werner — offizieller Contributor zu HL7 FHIR Core und dem Java-Validator | **Beibehalten.** Etablierter FHIR-OSS-Entwickler, MIT-lizenziert (jederzeit forkbar/internalisierbar, falls je nötig). Einziger Hinweis: `v1` ist ein verschiebbarer Tag — optional auf festen SHA pinnen. |
| `patrick-werner/fhir-resource-status-check` | `1.2.1` | Open Source (MIT); Patrick Werner (s. o.) | **Beibehalten.** Gleiche Einordnung; klein und bei Bedarf leicht ersetzbar. |
| `EndBug/add-and-commit` | `v10` | Community, weit verbreitet | **Beibehalten.** Etabliert. |
| `actions/checkout` | `v6` | GitHub offiziell | Beibehalten. |
| `actions/upload-artifact` | `v7` | GitHub offiziell | Beibehalten. |
| BfArM-Terminologieserver | — | externer Dienst | **Beibehalten** (fachlich notwendig); Verfügbarkeit ist externe Laufzeit-Abhängigkeit. |
| Simplifier (via Secrets) | — | Firely | Beibehalten; Login für Paketauflösung. |

**Hinweis zu den `patrick-werner/*`-Actions:** Beide stammen von Patrick Werner, einem offiziellen
Contributor zu HL7 FHIR Core und dem Java-Validator, und stehen unter MIT-Lizenz. Sie sind damit
reguläre Open-Source-Abhängigkeiten und kein Risiko, das aktiv aufgelöst werden müsste. Da
MIT-lizenziert, könnten ihre Funktionen (Markdown-Rendering des Validierungsberichts, Status-Check)
bei Bedarf jederzeit in eigene Skripte unter `scripts/` überführt werden — notwendig ist das nicht.
Optional: die `v1`-Action auf einen festen SHA pinnen.