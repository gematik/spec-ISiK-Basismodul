# Workflow: Cleanup Branch Pages — `cleanup-gh-pages.yml`

## Zweck in einem Satz

Der Workflow räumt den `gh-pages`-Branch auf: Er entfernt die veröffentlichten Verzeichnisse von
Branches, die im Repository nicht mehr existieren (z. B. nach gemergten/gelöschten Feature-Branches).

---

## Wann läuft der Workflow? (Trigger)

| Trigger | Bedingung | Zweck |
|---|---|---|
| `schedule` | täglich `0 2 * * *` (02:00 UTC) | Regelmäßiges, automatisches Aufräumen |
| `workflow_dispatch` | manuell, mit Input `dry_run` | Ad-hoc-Lauf, optional als Trockenlauf |

**Manueller Input (`workflow_dispatch`):**
- `dry_run` — wenn gesetzt, wird nur geloggt, **was** gelöscht würde (keine Änderung).

**Berechtigungen:** `contents: write` (für das Committen der Löschungen auf `gh-pages`).

**Concurrency:** Gruppe `gh-pages-publish`, `cancel-in-progress: false`.

> ⚠️ **Kopplung beachten:** Diese Gruppe ist **dieselbe** wie im `publish`-Job von
> `ig-publisher.yml`. Dadurch laufen Cleanup und Pages-Publish nie gleichzeitig (sie warten
> aufeinander, statt sich abzubrechen) — gewollt, um Konflikte auf `gh-pages` zu vermeiden.

---

## Was machen die einzelnen Steps?

Der einzige Job `cleanup` läuft auf `ubuntu-latest`:

1. **Check gh-pages branch** (`actions/github-script`) — prüft, ob der `gh-pages`-Branch existiert.
   Fehlt er (404), wird mit einer Warnung sauber abgebrochen (`exists=false`); alle weiteren Steps
   sind an `exists == 'true'` gebunden.
2. **Checkout default branch (scripts)** — checkt den Default-Branch nach `repo/` aus (liefert das
   Cleanup-Skript).
3. **Checkout gh-pages** — checkt den `gh-pages`-Branch mit voller Historie (`fetch-depth: 0`) nach
   `gh-pages/` aus.
4. **Prune deleted branch directories** — ruft `scripts/cleanup-gh-pages/cleanup.sh` im
   `gh-pages/`-Verzeichnis auf. Über Env werden Repo, Token, Git-Bot-Identität und
   `CLEANUP_DRY_RUN` (aus dem `dry_run`-Input) übergeben.

---

## Stellschrauben (Konfiguration)

| Stellschraube | Ort | Wirkung |
|---|---|---|
| `schedule.cron` | top-level `on:` | Wie oft aufgeräumt wird (täglich 02:00 UTC) |
| `dry_run` | Dispatch-Input | Trockenlauf — nur Logging, keine Löschung |
| Concurrency-Gruppe `gh-pages-publish` | Job-Level | Serialisierung gegen den Publish-Job aus `ig-publisher.yml` |
| `scripts/cleanup-gh-pages/cleanup.sh` | Prune-Step | **Die eigentliche Lösch-Heuristik** (welche Verzeichnisse als „verwaist“ gelten) |
| `GIT_AUTHOR_*` / Token | Prune-Step (env) | Identität und Auth des Cleanup-Commits |

---

## Technische Schulden & offene Punkte

Getrennt nach **echter Schuld** (sollte behoben werden) und **offenen Punkten** (zur Kenntnis).

### Offene Punkte / bewusste Design-Entscheidungen (zur Kenntnis)

- **Destruktiver, geplanter Lauf.** Der Workflow **löscht** Inhalte auf `gh-pages` und committet das.
  Der `dry_run`-Input und die robuste Branch-Existenzprüfung mildern das Risiko ab; die eigentliche
  Sicherheit hängt aber an der Korrektheit von `cleanup.sh`.
- **Kern-Logik im Skript, nicht im YAML.** Welche Verzeichnisse als verwaist gelten (Abgleich
  gh-pages-Verzeichnisse ↔ existierende Branches), steht in `scripts/cleanup-gh-pages/cleanup.sh`
  und ist YAML-seitig nicht sichtbar — bei Wartung dort mitlesen.
- **Concurrency-Kopplung an `ig-publisher.yml`.** Funktioniert bewusst über die gemeinsame Gruppe
  `gh-pages-publish`. Beim Umbenennen der Gruppe in einem der beiden Workflows geht die
  Serialisierung verloren — die Namen müssen synchron bleiben.

---

## Externe Abhängigkeiten

| Action / Dienst | Version | Herkunft | Einschätzung |
|---|---|---|---|
| `actions/github-script` | `v8` | GitHub offiziell | Beibehalten. |
| `actions/checkout` | `v6` | GitHub offiziell | Beibehalten (zweimal: Default-Branch + `gh-pages`). |
