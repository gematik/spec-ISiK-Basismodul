# CI-Umstellung: ig-publisher.yml auf den fhirscripts-Container

Stand: 29.10.2026 · gehört zu Phase 2 in [MIGRATIONSPLAN.md](MIGRATIONSPLAN.md)

## Ziel

`.github/workflows/ig-publisher.yml` baut jedes Modul mit `fhirscripts build pipeline` im fhirscripts-Container statt
mit dem Gefyra-Image `ghcr.io/gefyra/ig-publisher-with-snapshot-support`. Die modulspezifische Logik steht dann in
`publisher-guides/<Modul>/fhirscripts.config.yaml`, nicht mehr im Workflow. Lokal und in CI läuft derselbe Befehl im
selben Image. Veröffentlicht wird per `fhirscripts deploy` in die Dev-Umgebung statt auf gh-pages.

## Auf einen Blick

| Thema | Heute | Künftig |
|---|---|---|
| Image | Gefyra-Image mit IG Publisher 2.3.4 und fhir-pkg-tool | `gematik1/fhir-devcontainer` (öffentlich, Docker Hub), per Digest gepinnt |
| Abhängigkeiten laden | `fhir-pkg-tool` aus `Resources/sushi-config.yaml`, Cache als Artefakt weitergereicht | `fhirscripts cache package` pro Modul aus `package.json`, Cache per `actions/cache` |
| SUSHI | einmal für alle Module (`Resources/`), dann noch einmal pro Modul | einmal pro Modul, als Schritt der Pipeline |
| Basis für andere Module | über das gemeinsame `fsh-generated` | Basis wird zuerst gebaut, `package.tgz` geht als Artefakt an die anderen Module |
| CapabilityStatement-Expander | kopiert Modul-Ressourcen aus `fsh-generated` und erzeugt `*-expanded` | erzeugt nur `*-expanded` (oder entfällt, siehe Migrationsplan) |
| Abhängigkeiten abgleichen | `sync-sushi-dependencies.sh` schreibt Versionen in jede `sushi-config.yaml` | `fhirscripts check` prüft die Konsistenz |
| Modulspezifisches | Matrix-Felder und Inline-Schritte im Workflow | `fhirscripts.config.yaml` pro Modul |
| Erzeugte Dateien | `commit`-Job checkt `fsh-generated`, `input/resources`, Kopien aus `common-files` ein | möglichst nichts mehr einchecken (`.gitignore`), dann entfällt der `commit`-Job |
| Veröffentlichung | `publish`-Job auf gh-pages (nur `main-stufe-*`) | `fhirscripts deploy dev` nach jedem Build; Prod per manuellem Workflow |
| PR-Kommentar | verlinkt Artefakte und gh-pages | entfällt |
| Release der Pakete | kein automatisierter Ablauf im Repo | eigener Workflow: Build im Publikationsmodus, `fhirscripts publish`, `deploy prod`, ein Paket pro Modul (siehe „Release“) |

## Image: `gematik1/fhir-devcontainer`

Wir bauen kein eigenes Image, sondern nutzen den gematik-Devcontainer aus Docker Hub. Er ist **öffentlich**, ein
anonymer Pull reicht. Gepinnt ist im Workflow `1.0.0-b49`
(`sha256:a552e62af7ac99f79949233710004e48d37d28f83c1f8d09a1c1398fa3948d03`, 14.10.2026, ca. 1,8 GB).

Inhalt laut Dockerfile (`docker/devcontainer` in [gematik/fhir-scripts](https://github.com/gematik/fhir-scripts)) und
Basis-Image `mcr.microsoft.com/devcontainers/base:alpine`. Das Image selbst konnte ich noch nicht starten; im ersten
Lauf bestätigen:

| Vorhanden | Fehlt / Abweichung | Folge |
|---|---|---|
| fhirscripts (Stand main beim Bau), SUSHI, Firely Terminal, OpenJDK 21, Jekyll, Node/npm, .NET 8, gcloud, graphviz, FHIR Validator | **kein IG Publisher** | `install --config-file` lädt `igpub: 2.3.4` nach `input-cache/` (ca. 240 MB pro Lauf) |
| bash, git, curl, sudo, GNU `grep`, `sed`, `coreutils`, `jq`, `util-linux` (uuidgen) | – | `copy-config-files.sh` (`grep -P`) läuft unverändert |
| uv (mit eigenem Python für fhirscripts) | **kein `python3` im PATH** | `expand-capabilitystatements.sh` nutzt dafür bereits `uv python find` |
| – | **kein `yq`** | `sushi-wrap.sh` (ZTS) läuft deshalb auf dem Runner vor dem Container-Build, dort ist `yq` vorhanden |
| Benutzer **`vscode`** (Home `/home/vscode`), passwortloses `sudo` | nicht root | eingebundene Verzeichnisse vorher an `vscode` übergeben, danach zurück; `npm -g` (SUSHI-Pin) nutzt fhirscripts mit `sudo` |
| kein eigener Entrypoint | – | wir starten `bash -c "<befehle>"`, es läuft nichts implizit |

Im Workflow wird das Image per `docker run` aus der Composite Action `.github/actions/fhirscripts` gestartet. Die
GitHub-Actions (checkout, cache, upload-artifact …) laufen damit auf dem Runner, nicht im Container. Vereinfacht:

```bash
sudo chown -R <vscode-uid> "$GITHUB_WORKSPACE" "$HOME/.fhir/packages"   # danach zurück an den Runner
docker run --rm \
  -v "$GITHUB_WORKSPACE":/project \
  -v "$HOME/.fhir/packages":/home/vscode/.fhir/packages \
  -w "/project/${IG_DIR}" \
  -e IG_NAME -e ACCEPTED_DOWNLOAD_CONDITIONS \
  --entrypoint bash \
  "$IMAGE" -c "fhirscripts install --config-file && fhirscripts cache package --no-clear && fhirscripts build pipeline"
```

Eingebunden wird nur `~/.fhir/packages`, damit der FHIR Validator unter `~/.fhir/validators` aus dem Image erhalten
bleibt. `install` und `build` laufen im selben Container, weil die gepinnte SUSHI-Version sonst mit dem Container
verloren geht.

## Was wir gegenüber dem Gefyra-Image verlieren und ersetzen müssen

- **IG Publisher 2.3.4 fest im Image** (PTDATA-2412). Ersatz: Version in der Konfiguration pinnen
  (`igpub: 2.3.4`); `fhirscripts install --config-file` lädt ihn dann pro Projekt nach `input-cache/`.
- **`fhir-pkg-tool` mit Snapshot-Unterstützung** (zum Laden der Abhängigkeiten aus der `sushi-config.yaml`).
  Ersatz: `fhirscripts cache package` (Firely Terminal, Standard) oder `cache package --new`, das intern dasselbe
  fhir-pkg-tool nutzt. Dafür `fhir_pkg_tool` in die `install`-Liste aufnehmen und Java 21 nutzen. **Die
  Snapshot-Erzeugung wird gebraucht.** Ohne sie liefert der lokale Pilot 17 zusätzliche `ref-1`-Fehler, weil die
  Snapshots in `de.basisprofil.r4#1.6.0` eine andere `ref-1`-Fassung enthalten als R4-Core (siehe MIGRATIONSPLAN.md,
  Phase 1).
- Der Befehl `igpublisher` aus dem Gefyra-Image entfällt. Aufruf über `java -jar input-cache/publisher.jar`.
- **Werkzeuge für unsere Skripte:** bis auf `yq` (ZTS) und `python3` im PATH vorhanden, siehe Tabelle oben.

## ig-publisher.yml von oben nach unten

Legende: **bleibt** · **ändern** · **Pipeline** (wandert in `fhirscripts.config.yaml`) · **entfällt** · **neu**

### Kopf

| Heute | Künftig |
|---|---|
| Trigger `pull_request`, `push` auf `main-stufe-*`, `workflow_dispatch` | **bleibt** |
| Input `run_publish` (gh-pages) | **entfällt**, Dev-Deploy läuft immer, Prod über eigenen Workflow |
| Inputs `force_build`, `verbose_changes`; `concurrency` | **bleibt** |
| `permissions` | **ändern**: zusätzlich `id-token: write` für die Google-Cloud-Anmeldung |

### Job `prepare` → wird Job `basis`

Heute läuft hier SUSHI einmal für alle Module. Künftig baut der Job das Basismodul komplett, mit denselben Schritten
wie die Matrix unten, und gibt das Paket weiter.

| # | Heute | Künftig |
|---|---|---|
| 1 | `container:` Gefyra-Image | **entfällt**, fhirscripts über die Composite Action |
| 2 | Checkout | **bleibt** |
| 3 | Download Dependencies (`fhir-pkg-tool`) | **ändern**: `actions/cache` + `fhirscripts cache package --no-clear` |
| 4 | Run SUSHI (`Resources/`, mit ZTS) | **entfällt**, SUSHI läuft in der Pipeline jedes Moduls |
| 5 | Upload FSH Generated Resources | **entfällt** |
| 6 | Upload FHIR Package Cache | **entfällt**, ersetzt durch `actions/cache` |
| – | | **neu**: Schritte wie in `build` (Änderungserkennung, Pipeline, check, Deploy) für Basis |
| – | | **neu**: Upload `publisher-guides/Basis/output/package.tgz` als Artefakt `basis-package` |

### Job `build` (Matrix pro Modul, `needs: basis`)

| # | Heute | Künftig |
|---|---|---|
| 1 | `container:` Gefyra-Image | **entfällt**, wie oben |
| 2 | Matrix-Felder `capability_statement_urls`, `import_cps_filter` | **Pipeline**: Argumente von `expand-capabilitystatements.sh`; Matrix nur noch `ig_name`, `ig_dir` |
| 3 | Checkout (`fetch-depth: 0`) | **bleibt** |
| – | | **neu**: `docker pull` des Images (Anmeldung nur optional, gegen das Pull-Limit) |
| 4 | Download FHIR Package Cache | **ändern**: `actions/cache` + `cache package --no-clear` |
| 5 | Setup Package Cache for IG Publisher | **entfällt**, der Cache wird direkt nach `/root/.fhir` gemountet |
| 6 | Download FSH Generated Resources | **ändern**: stattdessen `basis-package` laden und nach `~/.fhir/packages/de.gematik.isik-basismodul#<version>` entpacken |
| 7 | Setup Python | **entfällt**, Python ist im Image |
| 8 | Expand CapabilityStatement | **Pipeline**: `expand-capabilitystatements.sh`, nur noch `*-expanded` (Zukunft offen) |
| 9 | Apply expanded resources to IG input | **entfällt**, erledigt das Skript |
| 10 | Copy common files from config.json | **Pipeline**: `prepare-ig.sh` |
| 11 | Sync SUSHI dependencies to IG config | **entfällt**, ersetzt durch `fhirscripts check` |
| 12 | Run SUSHI (IG local, mit ZTS) | **Pipeline**: Schritt `sushi`. ZTS-Pakete vorher auf dem Runner per `run-sushi-with-zts` laden (nur Download, `sushi-command: true`), Firely Terminal findet sie dann im Cache |
| 13 | Write IG dir metadata + Upload SUSHI-generated | **entfällt**, wenn `fsh-generated` nicht mehr eingecheckt wird |
| 14 | Resolve previous successful head SHA | **bleibt** |
| 15 | Check for input changes | **ändern**: vor Schritt 4 ziehen; prüft künftig die Quellen statt der SUSHI-Ausgabe (Modulordner, `publisher-guides/Basis/`, `scripts/common-files/`, `scripts/fhirscripts/`) |
| 16 | Build IG (`igpublisher`) | **ändern**: `fhirscripts build pipeline` |
| – | | **neu**: `fhirscripts check`, anfangs mit `continue-on-error` |
| 17 | Mark Build Ran | **bleibt**, falls `publish_gate` bleibt |
| 18 | Remove oversized files | **entfällt**, war nur für gh-pages nötig |
| 19 | Generate publication-request.json | **Pipeline** |
| 20 | Upload Build Marker | **bleibt**, falls `publish_gate` bleibt |
| 21 | Write/Upload `input/resources` | **entfällt**, enthält nur noch erzeugte Dateien → `.gitignore` |
| 22 | Write/Upload `input/includes`, `input/pagecontent` | **entfällt**, Kopien aus `scripts/common-files` → `.gitignore` |
| 23 | Record branch metadata for Pages cleanup | **entfällt** |
| 24 | Upload IG Build Results | **entfällt**, ersetzt durch: |
| – | | **neu**: Google-Cloud-Anmeldung (`google-github-actions/auth`) und `fhirscripts deploy dev -y --only-ig` |

### Übrige Jobs

| Job | Künftig |
|---|---|
| `commit` | **entfällt**, wenn keine erzeugten Dateien mehr eingecheckt werden; sonst nur noch `fsh-generated` |
| `publish_gate` | **entfällt** mit `commit` und `publish`, weil nur diese beiden Jobs es nutzen |
| `comment_artifacts` | **entfällt** |
| `cleanup_fhir_packages` | **entfällt**, es gibt kein `fhir-packages`-Artefakt mehr |
| `publish` (gh-pages) | **entfällt**, ersetzt durch den Dev-Deploy im Build-Job |
| – | **neu**: Workflow `promote-prod.yml` (manuell): `fhirscripts deploy prod --promote-from dev -y` pro Modul |
| – | **neu, eventuell**: Branch-Builds im Dev-Bucket nach dem Löschen eines Branches aufräumen |

### Deploy-Konfiguration pro Modul

```yaml
deploy:
  env:
    dev: <dev-bucket>
    prod: <prod-bucket>
  path: ig/fhir/isik-basis   # pro Modul eigener Pfad, sonst landen alle Module unter "isik"
```

Branch-Builds getrennt ablegen: `releaseLabel: ci-build` für Dev-Builds oder eigener Pfad je Branch (siehe
Migrationsplan, „Offene Entscheidungen“).

## Release: mehrere Pakete unter einem Canonical

Zielbild: ein Canonical `https://gematik.de/fhir/isik` für alle Profile, aber ein IG und ein FHIR-Paket pro Modul,
veröffentlicht über einen eigenen, manuell gestarteten Workflow mit fhirscripts.

### Geht das?

Grundsätzlich ja. Pakete werden über ihre `packageId` unterschieden, nicht über den Canonical, und die
Profil-URLs bleiben eindeutig, solange sich die Ressourcen-IDs über die Module hinweg nicht überschneiden. Pro Modul
eindeutig sein muss:

| Was | Basis | Stand |
|---|---|---|
| `packageId` | `de.gematik.isik-basismodul` | erledigt für Basis; pro Modul in Phase 3 |
| URL der ImplementationGuide-Ressource | `https://gematik.de/fhir/isik/ImplementationGuide/basis` | eindeutig über die IG-`id` |
| Veröffentlichungsort (`path` in `publication-request.json`) | `https://gematik.de/fhir/isik/de.gematik.isik-basismodul/6.0.0` | `generate.js` leitet das schon pro Modul ab; mit gematik abstimmen, unter welcher URL der Bucket erreichbar ist |
| Versionshistorie (`package-list.json`, `index.html`) | im Veröffentlichungsordner des Moduls | publishtools erzeugt sie pro Projekt |

### Wo fhirscripts von einem IG pro Canonical ausgeht

fhirscripts 0.32.0 leitet den „Projektnamen“ an mehreren Stellen aus dem Canonical ab. Bei uns ergibt das für jedes
Modul `isik`:

| Stelle | Verhalten | Folge für uns | Lösung |
|---|---|---|---|
| Schritt `igpub` | `-publish <canonical>/<version>` | alle Module bekämen `https://gematik.de/fhir/isik/6.0.0` | IG Publisher per `shell:` mit `-publish <path aus publication-request.json>` aufrufen |
| `deploy` (aus dem Build) und `deploy --only-meta` | Projekt = Segment vor `ImplementationGuide` in der IG-URL | alle Module unter `…/isik/<version>`, eine gemeinsame `package-list.json` | `deploy.path` pro Modul als Behelf; besser Änderung in fhirscripts |
| `deploy --promote-from` | Projekt aus `publication-request.json` | pro Modul eindeutig, aber anderer Pfad als beim direkten Deploy | wie oben: einheitlich aus `publication-request.json` ableiten |
| `publish project` (publishtools) | nutzt `publication-request.json` | pro Modul eindeutig | passt |

Empfehlung: Issue oder PR an gematik/fhir-scripts, damit `igpub` und `deploy` den Projektpfad einheitlich aus der
`publication-request.json` nehmen. Das löst das Problem für alle gematik-Projekte mit gemeinsamem Canonical und spart
uns die Behelfe.

### Release-Workflow (Skizze, `release-ig.yml`)

Manuell gestartet; Inputs: Modul(e), Zielumgebung. Basis zuerst, weil die anderen Module davon abhängen.

1. Checkout des Release-Stands (Tag oder `main-stufe-*`)
2. ZTS-Pakete laden, Paket-Cache wie im Build
3. Build im **Publikationsmodus**: IG Publisher mit `-publish <path>` aus der `publication-request.json`. Erst dann
   enthält `package.tgz` die echte URL und kein `notForPublication` mehr.
4. Bisherige Historie des Moduls (`package-list.json`) und die IG-Registry (`ig_list.json`, `package-feed.xml`) aus
   dem Bucket holen
5. `fhirscripts publish project --ig-registry <dir>`: aktualisiert `package-list.json` und `index.html` des Moduls
   sowie `package-feed.xml` und die Übersicht in der Registry
6. `fhirscripts deploy prod -y` für IG, Metadaten (`--only-meta`) und Registry (`--ig-registry`), oder zuerst nach
   Dev und dann `--promote-from dev`
7. Der FHIR-Package-Crawler liest `package-feed.xml` und übernimmt die Pakete in die Registry (packages.fhir.org).
   Dafür muss der Feed einmalig beim Crawler bekannt sein.

Die anderen Module sollten im Release gegen die veröffentlichte Basis-Version bauen, nicht gegen das Artefakt aus
demselben Lauf.

### Offen für den Release

- Unter welcher URL ist der Prod-Bucket erreichbar, und passt das zu `path` in der `publication-request.json`?
- Wo liegt die IG-Registry (`ig_list.json`, `package-feed.xml`)? Nutzt gematik schon eine gemeinsame Registry mit
  registriertem Feed?
- Prüft der IG Publisher im Publikationsmodus die Historie unter `<canonical>/package-list.json`? Dann würden sich
  die Module dort in die Quere kommen. Im ersten Release-Test klären.
- Wird zusätzlich auf Simplifier veröffentlicht, oder reicht der Weg über den Crawler?

## Beispiel-Workflow (Spike)

Umgesetzt als Kopie neben der bisherigen `ig-publisher.yml`, die unverändert weiterläuft:

| Datei | Inhalt |
|---|---|
| `.github/workflows/ig-publisher-fhirscripts.yml` | Job `basis` und Matrix `build`; Matrix nur über den Input `modules` (bisher nur Basis migriert) |
| `.github/workflows/fhirscripts-build-module.yml` | wiederverwendbarer Workflow mit den Schritten pro Modul, Kommentare verweisen auf die Tabelle oben |
| `.github/actions/fhirscripts/action.yml` | `docker run` des fhirscripts-Images |
| `scripts/ig-publisher/check-changes.sh` | neue Variable `CHECK_PATHS` für die Pfadliste; ohne sie unverändert |
| `scripts/ig-publisher/resolve-last-success-sha.js` | Workflow-Datei per `WORKFLOW_ID` wählbar |

Verwendete Actions:

| Action | Wofür | Status gegenüber heute |
|---|---|---|
| `actions/checkout@v7` | Checkout mit Historie | wie bisher |
| `actions/github-script@v9` | letzter erfolgreicher Lauf (`resolve-last-success-sha.js`) | wie bisher |
| `actions/cache@v6` | `~/.fhir/packages` pro Modul | neu, ersetzt das Artefakt `fhir-packages` |
| `actions/upload-artifact@v7`, `actions/download-artifact@v8` | `basis-package`; ohne Deploy `fhir-ig-<Modul>` | wie bisher, andere Inhalte |
| `google-github-actions/auth@v3` | Anmeldung bei Google Cloud für `fhirscripts deploy` | neu, nur mit Input `deploy` |
| `./.github/actions/fhirscripts` | Composite Action: `docker run` des fhirscripts-Images | neu |
| `./.github/actions/run-sushi-with-zts` | ZTS-Pakete (z. B. `kbv.all.terminology.allergyintolerance`) in den Cache laden | wie bisher, aber ohne SUSHI-Lauf |

Auslöser: `push` auf `stufe-6/all/fhir-scripts-*` (nur bei Änderungen an Basis, den Skripten oder dem Workflow)
und `workflow_dispatch`. Ohne weitere Einstellungen lauffähig; optional in den Repository-Einstellungen:

- Variable `FHIRSCRIPTS_IMAGE` für ein anderes Image als den Standard (oder Input `image`)
- Secrets `DOCKERHUB_USERNAME` und `DOCKERHUB_TOKEN`, falls das anonyme Pull-Limit stört
- für Deploy zusätzlich die Variablen `GCP_WORKLOAD_IDENTITY_PROVIDER` und `GCP_SERVICE_ACCOUNT` sowie den
  `deploy`-Abschnitt in der `fhirscripts.config.yaml` (für Basis als Kommentar vorbereitet)

Ohne Deploy lädt der Workflow `output/` als Artefakt `fhir-ig-<Modul>` hoch. `workflow_dispatch` lässt sich in der
GitHub-Oberfläche erst starten, wenn die Datei auf dem Standardbranch liegt; vorher über `push` auf den Testbranch.

Bewusste Vereinfachungen im Spike:
- Werden weitere Module gebaut, wird Basis immer mitgebaut, weil sonst kein Basis-Paket da ist. Später: Paket
  bei unverändertem Basis aus einem Cache oder der Registry holen.
- `cache package --no-clear` nutzt Firely Terminal; die Snapshot-Frage (`--new` mit `fhir_pkg_tool`) ist offen.
- ZTS über die bestehende Action `run-sushi-with-zts` auf dem Runner, nicht in der Pipeline. Basis braucht `kbv.all.terminology.allergyintolerance`; die Registry von Firely Terminal kennt das Paket nicht (erster Lauf scheiterte daran).
- Der IG Publisher (ca. 240 MB) wird pro Lauf neu geladen; ließe sich per `actions/cache` auf `input-cache/` sparen.

## Weitere betroffene Dateien

| Datei | Änderung |
|---|---|
| `.github/workflows/ig-publisher-fhirscripts.yml`, `fhirscripts-build-module.yml` | neu (Beispiel, s. o.); ersetzen später `ig-publisher.yml` |
| `.github/actions/fhirscripts/action.yml` | neu: Composite Action für den Container-Aufruf |
| `scripts/ig-publisher/resolve-last-success-sha.js` | Workflow-Datei per `WORKFLOW_ID` (erledigt) |
| `scripts/common-files/copy-config-files.sh` | keine Änderung nötig, das Image hat GNU grep |
| `scripts/ig-publisher/check-changes.sh` | Pfadliste per `CHECK_PATHS` (erledigt, der Beispiel-Workflow setzt sie inkl. Basis); nach der Umstellung die alte Standardliste mit `Resources/` entfernen |
| `scripts/ig-publisher/sync-sushi-dependencies.sh` | entfernen |
| `scripts/ig-publisher/copy-artifacts.sh`, `commit-artifacts.sh` | verkleinern oder entfernen (siehe `commit`) |
| `scripts/ig-publisher/publish-branch.sh`, `remove-oversized-output-files.sh` | entfernen (gh-pages) |
| `scripts/ig-publisher/update-pr-comment.js` | entfernen (PR-Kommentar entfällt) |
| `.github/actions/run-sushi-with-zts/` | bleibt, nur noch zum Herunterladen der ZTS-Pakete; eventuell später als reines Download-Skript |
| `scripts/capabilitystatement-expander/expand.sh` | Modus `--workflow-file` (liest die Matrix) entfernen oder auf die Konfigurationsdateien umstellen |
| `publisher-guides/<Modul>/fhirscripts.config.yaml` | pro Modul anlegen; gemeinsame Pipeline eventuell als eine Datei per `FHIRSCRIPTS_CONFIG` |
| `.gitignore` | erzeugte Dateien in `input/resources`, Kopien aus `scripts/common-files`, eventuell `fsh-generated` |
| `.devcontainer/` | auf dasselbe Image umstellen, damit lokal identisch gebaut wird |
| `scripts/ig-publisher/README.md`, `.github/workflows/README.ig-publisher.md` | aktualisieren |
| `.github/workflows/main.yml`, `complieswith-export.yml` | nutzen `Resources/`; pro Modul umbauen oder entfallen (Validierung übernimmt der IG Publisher) – Phase 4 im Migrationsplan |

## Vorgehen

1. **Spike** (ein Workflow nur für Basis, `workflow_dispatch`):
   - Basis mit `gematik1/fhir-devcontainer` bauen
   - prüfen: Jekyll-Rendering, `qa.json` im Vergleich zum bisherigen Basis-Build, Laufzeit, Dateirechte, ZTS,
     Werkzeuge und Benutzer `vscode` im Image (siehe Tabelle „Image“)
   - `fhirscripts deploy dev` aus CI: Anmeldung, Zielpfad, Aufruf der Dev-URL
2. **Composite Action** fertigstellen; Image per Digest pinnen.
3. **Skripte anpassen**: ZTS-Download eventuell als eigenes Skript statt der Action; `check-changes.sh` ist erledigt.
4. **`ig-publisher.yml` umbauen**: Job `basis` plus Matrix. Module, die noch nicht migriert sind, bleiben bis zu ihrer
   Migration (Phase 3) im alten Job; beide Varianten laufen also eine Zeit lang nebeneinander.
5. **Aufräumen**: alte Schritte, `cleanup_fhir_packages`, `sync-sushi-dependencies.sh`.

## Offene Punkte

- Image: Reicht der Devcontainer dauerhaft, oder bitten wir gematik/fhir-scripts, den Buildcontainer zu veröffentlichen?
  fhirscripts ist im Image nicht versioniert (Stand main beim Bau); welche Version steckt in `1.0.0-b49`?
- Erzeugt `fhirscripts cache package --new` die Snapshots genauso wie das Gefyra-Image (fhir-pkg-tool 0.5.0 mit
  Snapshot-Unterstützung)? Im Spike an den `ref-1`-Fehlern prüfen.
- `fsh-generated` und die Kopien aus `scripts/common-files` weiter einchecken? Davon hängt ab, ob der `commit`-Job
  bleibt.
- Deploy: Bucket-Namen, Dev-URL und Zugang für GitHub Actions bei gematik klären; Zielpfad pro Modul und pro Branch
  festlegen (Details im Migrationsplan).
- Ob der Schritt `expand-capabilitystatements.sh` bleibt, hängt von der Diskussion zu den
  Expanded-CapabilityStatements ab (Migrationsplan, „Offene Entscheidungen“).
- `fhirscripts check` als hartes Gate erst, wenn die Warnungen zu indirekten Abhängigkeiten behoben sind und der
  Absturz bei fehlendem `date` gefixt ist.
