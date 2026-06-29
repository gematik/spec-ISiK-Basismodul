# Workflow: Build and Publish IG — `ig-publisher.yml`

## Zweck in einem Satz

Der Workflow baut aus den gemeinsamen FSH-Quellen **mehrere Implementation Guides (IGs)
parallel** über eine Matrix, erkennt, ob ein Neubau überhaupt nötig ist, committet die
generierten Artefakte zurück und veröffentlicht die fertigen IGs auf GitHub Pages.

---

## Wann läuft der Workflow? (Trigger)

| Trigger | Bedingung | Zweck |
|---|---|---|
| `pull_request` | jeder PR | **Nur Build**, kein Deploy nach gh-pages |
| `push` | Branches `main-stufe-*` | Build **und** Publish nach gh-pages |
| `workflow_dispatch` | manuell mit Inputs | Erzwungener Build / Test / Publish |

**Manuelle Inputs (`workflow_dispatch`):**
- `force_build` — Build erzwingen, auch ohne erkannte Input-Änderungen.
- `run_publish` — Nach gh-pages veröffentlichen (nur sinnvoll auf `main-stufe-*`).
- `verbose_changes` — Vollständige Änderungslisten im Log der Change-Detection ausgeben.

**Concurrency:** Pro Branch (`github.ref`) läuft nur ein Lauf gleichzeitig; laufende Läufe
werden bei neuem Push abgebrochen (`cancel-in-progress: true`).

**Berechtigungen:** `actions`, `contents`, `issues`, `pull-requests` jeweils `write`
(für Commit, PR-Kommentare und Pages-Publish).

---

## Job-Übersicht

```
prepare ──► build (Matrix, parallel pro IG) ──┬──► publish_gate ──┬──► commit   (nur außerhalb main-stufe-*)
                                              │                   └──► publish  (nur main-stufe-*)
                                              ├──► comment_artifacts (nur PR)
                                              └──► cleanup_fhir_packages (immer)
```

### 1. `prepare` — gemeinsame Vorbereitung (einmal)
Läuft im Container `ghcr.io/gefyra/ig-publisher-with-snapshot-support:latest`.
- **Download Dependencies:** lädt FHIR-Paketabhängigkeiten via `fhir-pkg-tool` aus
  `sushi-config.yaml` in den Paket-Cache.
- **Run SUSHI:** konvertiert die gemeinsamen FSH-Eingaben **einmalig** zu FHIR.
- **Upload-Artefakte:** `fsh-generated` (FHIR-Output) und `fhir-packages` (Paket-Cache)
  werden für die parallelen Build-Jobs geteilt.

### 2. `build` — pro IG (Matrix, parallel)
Kern des Workflows. Die zu bauenden IGs stehen in `strategy.matrix.include` (siehe unten).
Pro Matrix-Eintrag:
- Checkout (volle Historie, `fetch-depth: 0` — nötig für die Change-Detection).
- Paket-Cache und `fsh-generated` aus `prepare` herunterladen und an die vom IG Publisher
  erwarteten Orte spiegeln (`/root/.fhir/packages`).
- **Expand CapabilityStatement** (nur wenn `capability_statement_urls` gesetzt): Python-Skript
  `scripts/capabilitystatement-expander/expand.sh` löst die CapabilityStatements zu konkreten
  Ressourcen auf, optional gefiltert nach Erwartungsstufe (`import_cps_filter`).
- **Apply expanded resources:** ersetzt `input/resources` des IG durch die expandierten Ressourcen.
- **Copy common files:** kopiert gemeinsame statische Dateien gemäß
  `scripts/common-files/config.json`.
- **Run SUSHI (IG local):** erzeugt IG-spezifische `ImplementationGuide`- und Menü-Inhalte.
- **Change-Detection** (`resolve-last-success-sha.js` + `check-changes.sh`): ermittelt den
  letzten erfolgreichen Head-SHA und entscheidet, ob sich Inputs geändert haben.
- **Build IG** (nur bei Änderungen): ruft `igpublisher` auf.
- Diverse **Upload-Schritte** für spätere Commit-/Publish-Jobs (SUSHI-Output, `input/resources`,
  `input/includes`, `input/pagecontent`, Build-Marker, Build-Ergebnis `output`).
- **Remove oversized files:** entfernt Dateien über 50 MiB vor dem Upload und loggt die entfernten Pfade.

### 3. `publish_gate` — Veröffentlichungs-Entscheidung
Sammelt die Build-Marker (`build-ran-*`). Wenn mindestens ein IG neu gebaut wurde →
`should_publish=true`. Steuert sowohl `commit` als auch `publish`.

### 4. `commit` — generierte Artefakte zurückcommitten
Läuft nur, wenn `should_publish=true` **und** der Branch **nicht** `main-stufe-*` ist
(also auf Feature-/PR-Branches). Lädt alle hochgeladenen Artefakte, kopiert sie via
`copy-artifacts.sh` in die Repo-Struktur und committet via `commit-artifacts.sh`.

### 5. `comment_artifacts` — PR-Kommentar (nur PR)
Postet einen Kommentar mit Links zu den Build-Artefakten via
`scripts/ig-publisher/update-pr-comment.js`.

### 6. `cleanup_fhir_packages` — Aufräumen (immer)
Löscht das große `fhir-packages`-Artefakt nach dem Build
(`scripts/ig-publisher/delete-fhir-packages.js`).

### 7. `publish` — Deploy nach GitHub Pages
Läuft nur auf `main-stufe-*` und nur bei `should_publish=true` (Push oder
`workflow_dispatch` mit `run_publish`). Lädt alle `fhir-ig-*`-Outputs und veröffentlicht
sie via `publish-branch.sh` auf den `gh-pages`-Branch. Eigene Concurrency-Gruppe
`gh-pages-publish` (kein Abbruch laufender Publishes).

---

## Stellschrauben (Konfiguration)

Einige Stellschrauben sind **Unterelemente eines übergeordneten Schlüssels** (eingerückt mit `↳`
dargestellt): Die `ig_*`-Felder gehören jeweils zu einem Eintrag von `strategy.matrix.include`, die
`force_build`/`run_publish`/`verbose_changes` zu `workflow_dispatch.inputs`.

| Stellschraube | Ort | Wirkung |
|---|---|---|
| **`strategy.matrix.include`** | `build`-Job | **Zentrale Liste der gebauten IGs.** Jeder Listeneintrag = ein IG (= ein paralleler Build-Job). Hier IGs hinzufügen/entfernen. |
| ↳ `ig_name` | Eintrag in `matrix.include` | Eindeutiger Anzeigename; genutzt für Artefaktnamen und Publishing |
| ↳ `ig_dir` | Eintrag in `matrix.include` | Verzeichnis unter `publisher-guides/` |
| ↳ `capability_statement_urls` | Eintrag in `matrix.include` | Welche CapabilityStatements expandiert werden (YAML-Liste). **Optional** — fehlt der Schlüssel, werden die Expansions-Schritte übersprungen. |
| ↳ `import_cps_filter` | Eintrag in `matrix.include` | Erwartungsstufe `SHALL`/`SHOULD`/`MAY` (inkl. höherer Stufen). **Optional.** |
| **`workflow_dispatch.inputs`** | top-level `on:` | Manuelle Steuerung beim Dispatch-Lauf |
| ↳ `force_build` | Eintrag in `inputs` | Build erzwingen, auch ohne erkannte Input-Änderungen |
| ↳ `run_publish` | Eintrag in `inputs` | Nach gh-pages veröffentlichen (nur sinnvoll auf `main-stufe-*`) |
| ↳ `verbose_changes` | Eintrag in `inputs` | Vollständige Änderungslisten im Log der Change-Detection |
| Container-Image-Tag `:latest` | `prepare` + `build` (`container.image`) | Welche IG-Publisher-Umgebung genutzt wird |
| `retention-days` | Upload-Steps | Aufbewahrung der Zwischen-Artefakte (1 Tag) |
| Concurrency-Gruppen | top-level + `publish` | Parallelitäts-/Abbruchverhalten |

> Ein IG ohne `capability_statement_urls` (z. B. **ISiK-Connect**) überspringt die
> Expansions-Schritte komplett — nützlich für IGs ohne CapabilityStatement-basierte Auflösung.

---

## Technische Schulden & offene Punkte

Bewusst getrennt nach **echter technischer Schuld** (suboptimal, sollte behoben werden) und
**offenen Punkten / bewussten Design-Entscheidungen** (zur Kenntnis, kein akuter Fix nötig).

### Technische Schulden (behebbar)

- **Container-Image über gleitenden `:latest`-Tag bezogen**
  (`ghcr.io/gefyra/ig-publisher-with-snapshot-support:latest`, in `prepare` und `build`). Das Image
  selbst ist gewollt (siehe externe Abhängigkeiten) — die Schuld ist **allein der `:latest`-Tag**:
  Ein neuer Image-Push kann Builds unbemerkt verändern oder brechen (nicht reproduzierbar).
  **Fix: auf festen Tag/Digest pinnen** und Updates kontrolliert nachziehen.
- **Ungenutzter Matrix-Anker `&ig_matrix`** (Zeile `include: &ig_matrix`). Der Anker ist definiert,
  wird aber nirgends per `*ig_matrix` referenziert (verifiziert) → **toter Ballast, kann entfernt
  werden.**

### Offene Punkte / bewusste Design-Entscheidungen (zur Kenntnis)

- **Viel Logik in Shell-/JS-Skripten** unter `scripts/ig-publisher/` (Change-Detection,
  Artefakt-Kopie, Commit, Publish, Cleanup). Bewusst so aufgeteilt — die YAML ist reine
  Orchestrierung. Hinweis: Die eigentliche Komplexität liegt dort und ist YAML-seitig nicht
  sichtbar; bei der Wartung mitdenken.
- **Auto-Commit generierter Artefakte** auf Feature-/PR-Branches erzeugt Bot-Commits. Bewusst von
  `main-stufe-*` entkoppelt; im Blick behalten wegen möglicher Interaktion mit der Change-Detection
  (Diff-Rauschen, Schleifenrisiko).
- **Change-Detection-Heuristik** (`resolve-last-success-sha.js`, `check-changes.sh`): mächtig, hängt
  aber am letzten erfolgreichen Lauf/SHA. Edge Cases bei force-push, Rebase oder erstem Lauf auf
  neuem Branch im Hinterkopf behalten (kein Defekt, nur Vorsicht).
- **Übergroße IG-Output-Dateien werden aktiv entfernt** (`remove-oversized-output-files.sh`),
  weil GitHub Dateien über 100 MB beim Push nach `gh-pages` ablehnt. Das Limit im Workflow liegt
  bewusst bei 50 MiB und die entfernten Pfade werden geloggt.
- **Datei-basierte Job-zu-Job-Kommunikation** über Marker-Dateien (`ig-dir.txt`, `.branch-name`,
  Build-Marker). Funktioniert, ist aber implizit und reagiert empfindlich auf Pfadänderungen.

---

## Externe Abhängigkeiten

| Action / Dienst | Version | Herkunft | Einschätzung |
|---|---|---|---|
| `ghcr.io/gefyra/ig-publisher-with-snapshot-support` | `:latest` | Gefyra GmbH — gebaut aus [`Gefyra/ig-publisher-action`](https://github.com/Gefyra/ig-publisher-action) (MIT) | **Wichtigste externe Abhängigkeit — bewusst gewählt, kein Fork.** Gepflegtes, zweckgebautes CI-Image: bündelt HL7 IG Publisher, SUSHI, `fhir-pkg-tool` (Snapshot-Erzeugung), Java 21 (Temurin) und Node 20; vorkonfiguriertes Memory (IG Publisher `-Xmx4g`, Package-Tool 2 GB), fertige Wrapper-Kommandos (`igpublisher`, `fhir-pkg-tool`), CI-Workdir `/github/workspace`, Bundler/Build-Tools für native Ruby-Extensions, Git/Unzip, Download-Validierung. Automatisierter Release-Prozess (täglicher Check auf neue IG-Publisher-Versionen). **Beibehalten** — einziger offener Punkt: den `:latest`-Tag pinnen. |
| `gematik.de/fhir/isik/...` (CapabilityStatement-URLs) | — | gematik (fachlich) | **Beibehalten** — fachliche Quell-URLs der ISiK-Spezifikation. |
| `actions/checkout` | `v6` | GitHub offiziell | Beibehalten. |
| `actions/upload-artifact` | `v7` | GitHub offiziell | Beibehalten. |
| `actions/download-artifact` | `v8` | GitHub offiziell | Beibehalten. |
| `actions/setup-python` | `v5` | GitHub offiziell | Beibehalten. |
| `actions/github-script` | `v8` | GitHub offiziell | Beibehalten. |

**Empfehlung zur Hauptabhängigkeit:** Das Container-Image ist kein abzulösender Fork, sondern eine
gepflegte, zweckgebaute CI-Umgebung mit eigenem Release-Prozess und regelmäßigen IG-Publisher-Updates
— es ist als reguläre Abhängigkeit zu behandeln. Einzige konkrete Maßnahme: statt des gleitenden
`:latest`-Tags auf einen **festen Tag/Digest** pinnen und Updates kontrolliert nachziehen. So bleiben
Builds reproduzierbar, ohne den Mehrwert des Images aufzugeben.

---

## Einen IG hinzufügen (Kurzanleitung)

In `strategy.matrix.include` einen Eintrag ergänzen:

```yaml
- ig_name: Mein-IG
  ig_dir: publisher-guides/Mein-IG
  capability_statement_urls:
    - https://example.com/CapabilityStatement/Server
  import_cps_filter: SHOULD   # optional
```

`ig_name` muss eindeutig sein (wird für Artefaktnamen und Publishing genutzt).
