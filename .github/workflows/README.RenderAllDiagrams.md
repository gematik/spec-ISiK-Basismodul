# Workflow: Render All Diagrams — `RenderAllDiagrams.yml`

## Zweck in einem Satz

Der Workflow rendert geänderte Diagramm-Quellen (PlantUML, draw.io) aus
`Material/images/src/**` zu SVGs, legt sie unter `Material/images/diagrams/` ab und committet die
Ergebnisse automatisch zurück.

---

## Wann läuft der Workflow? (Trigger)

| Trigger | Bedingung | Zweck |
|---|---|---|
| `push` | Änderungen an `**/Material/images/src/**/*.puml`, `*.drawio` oder `*.bpmn`, **außer** auf Branches `main**` | Diagramme nach Quelländerung neu rendern |
| `workflow_dispatch` | manuell | Ad-hoc-Lauf über die Actions-Oberfläche |

> Auf `main**`-Branches läuft der Workflow bewusst **nicht** (`branches-ignore`). Das Rendern +
> Auto-Commit passiert auf Feature-Branches.

---

## Was machen die einzelnen Steps?

Der einzige Job `build` läuft auf `ubuntu-latest`:

1. **Checkout repository.**
2. **Install Java** (Temurin 21) — Laufzeit für die PlantUML-JAR.
3. **Setup Graphviz** (`ts-graphviz/setup-graphviz`) — von PlantUML für bestimmte Diagrammtypen
   benötigt.
4. **Download plantuml file** — lädt `plantuml.jar` **fest auf v1.2024.2** per `wget` aus den
   PlantUML-GitHub-Releases.
5. **Ensure and clean folder** — legt `Material/images/diagrams` an und löscht **alle** vorhandenen
   `*.svg` darin (Vollregenerierung).
6. **Render PUML to SVG and Move files** — rendert jede `*.puml` unter `*/images/src/*/` per
   `java -jar plantuml.jar -tsvg`.
7. **remove plantuml file** — entfernt die JAR wieder.
8. **Render DrawIO to SVG** (`rlespinasse/drawio-export-action`) — exportiert `*.drawio` aus
   `Material/images/src/drawio/` als SVG.
9. **Move SVGs to target image folder** — verschiebt alle erzeugten SVGs nach
   `Material/images/diagrams`.
10. **Commit rendered files** (`stefanzweifel/git-auto-commit-action`) — committet die generierten
    Diagramme automatisch zurück.

---

## Stellschrauben (Konfiguration)

| Stellschraube | Ort | Wirkung |
|---|---|---|
| `on.push.paths` | top-level `on:` | Welche Quelldateitypen einen Lauf auslösen |
| `branches-ignore: main**` | top-level `on:` | Auf welchen Branches **nicht** gerendert wird |
| PlantUML-Version `v1.2024.2` (Download-URL) | Download-Step | Welche PlantUML-Version genutzt wird |
| `java-version: '21'` / `temurin` | Install-Java | Java-Laufzeit für PlantUML |
| `img_dir=Material/images/diagrams` | Render-/Move-Steps | Zielordner der generierten SVGs |
| `path`, `format`, `remove-page-suffix` | DrawIO-Step | Quelle/Format des draw.io-Exports |
| Commit-Autor/-Message | Commit-Step | Wie der Auto-Commit erscheint |

---

## Technische Schulden & offene Punkte

Getrennt nach **echter Schuld** (sollte behoben werden) und **offenen Punkten** (zur Kenntnis).

### Technische Schulden (behebbar)

- **`*.bpmn` löst Läufe aus, wird aber nie gerendert.** Der Trigger enthält `*.bpmn`, es gibt
  jedoch **keinen** BPMN-Render-Step (nur PlantUML und draw.io werden verarbeitet). Entweder einen
  BPMN-Render-Schritt ergänzen oder `*.bpmn` aus dem Trigger entfernen.
- **Toter Code:** Der auskommentierte `peter-evans/create-pull-request`-Block (alte PR-Variante)
  sollte entfernt werden — verwendet wird `git-auto-commit-action`.
- **PlantUML-Version per `wget` zur Laufzeit gepinnt** (`v1.2024.2`). Funktioniert, ist aber von der
  Verfügbarkeit des GitHub-Release abhängig und muss manuell hochgezogen werden.

### Offene Punkte (zur Kenntnis)

- **Vollregenerierung:** Schritt 5 löscht alle SVGs und rendert komplett neu — robust, aber bei
  vielen Diagrammen unnötig teuer (kein inkrementelles Rendern).
- **Auto-Commit auf Feature-Branches** erzeugt Bot-Commits. Bewusst von `main**` entkoppelt.

---

## Externe Abhängigkeiten

| Action / Dienst | Version | Herkunft | Einschätzung |
|---|---|---|---|
| `ts-graphviz/setup-graphviz` | `v2` | Community | **Beibehalten** — etabliert; PlantUML-Voraussetzung. |
| `rlespinasse/drawio-export-action` | `v2` | Community | **Beibehalten** — Standard für draw.io-Export. |
| `stefanzweifel/git-auto-commit-action` | `v7` | Community, weit verbreitet | **Beibehalten** — etabliert. |
| `plantuml.jar` (GitHub Releases) | `v1.2024.2` | PlantUML | **Beibehalten**, aber Version bewusst pflegen; Download-Abhängigkeit zur Laufzeit. |
| `actions/checkout` | `v6` | GitHub offiziell | Beibehalten. |
| `actions/setup-java` | `v5` | GitHub offiziell | Beibehalten. |
