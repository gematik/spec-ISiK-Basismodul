# CI-Umstellung: ig-publisher.yml auf den fhirscripts-Container

Stand: 28.10.2026 · gehört zu Phase 2 in [MIGRATIONSPLAN.md](MIGRATIONSPLAN.md)

## Ziel

`.github/workflows/ig-publisher.yml` baut jedes Modul mit `fhirscripts build pipeline` im fhirscripts-Container statt
mit dem Gefyra-Image `ghcr.io/gefyra/ig-publisher-with-snapshot-support`. Die modulspezifische Logik steht dann in
`publisher-guides/<Modul>/fhirscripts.config.yaml`, nicht mehr im Workflow. Lokal und in CI läuft derselbe Befehl im
selben Image.

## Was das fhirscripts-Image mitbringt

Quelle: `docker/buildcontainer` in [gematik/fhir-scripts](https://github.com/gematik/fhir-scripts), Stand main
28.10.2026.

| Merkmal | Bedeutung für uns |
|---|---|
| Basis `alpine`, Pakete: bash, git, python3, curl, sudo, dotnet8-sdk, nodejs/npm, openjdk21, jekyll, graphviz, gcloud | Java, Jekyll, Node und Python für unsere Skripte sind vorhanden |
| vorinstalliert: fhirscripts (main, ungepinnt), SUSHI (neueste), Firely Terminal, publishtools | Versionen beim Bau des Images nicht festgelegt, daher selbst pinnen |
| **nicht** installiert: IG Publisher | `fhirscripts install --config-file` lädt ihn pro Projekt nach `input-cache/` (ca. 240 MB) |
| `ENTRYPOINT` führt bei jedem Start aus: `install --config-file`, `update`, `cache package` (falls `package.json`), dann den Befehl | `update` zieht die jeweils neuesten Versionen aller nicht gepinnten Werkzeuge; `cache package` leert den Cache. Für CI den Entrypoint umgehen. |
| **kein veröffentlichtes Image** für den Buildcontainer, nur das Dockerfile (veröffentlicht ist nur `gematik1/fhir-devcontainer`, Benutzer `vscode`) | Wir müssen das Image selbst bauen und z. B. in GHCR ablegen |
| Alpine mit BusyBox-Werkzeugen | `grep -P` fehlt (nutzt `scripts/common-files/copy-config-files.sh`); jq, yq und uuidgen fehlen (braucht `sushi-wrap.sh` für ZTS) |

Was wir gegenüber dem Gefyra-Image verlieren und ersetzen müssen:

- **IG Publisher 2.3.4 fest im Image** (PTDATA-2412). Ersatz: Version in der Konfiguration pinnen
  (`igpub: 2.3.4`) oder direkt ins eigene Image backen.
- **`fhir-pkg-tool` mit Snapshot-Unterstützung** (zum Laden der Abhängigkeiten aus der `sushi-config.yaml`).
  Ersatz: `fhirscripts cache package` (Firely Terminal, Standard) oder `cache package --new`, das intern dasselbe
  fhir-pkg-tool nutzt. Dafür `fhir_pkg_tool` in die `install`-Liste aufnehmen und Java 21 nutzen, das ist im Image
  vorhanden. Im Spike prüfen, ob die Snapshot-Erzeugung für unsere Abhängigkeiten gebraucht wird.
- Der Befehl `igpublisher` aus dem Gefyra-Image entfällt. Aufruf über `java -jar input-cache/publisher.jar`.

## Grundsatzentscheidung: Job-Container oder `docker run` pro Schritt

| | A: `container:` auf Job-Ebene (wie heute) | B: Job auf `ubuntu-latest`, fhirscripts per `docker run` |
|---|---|---|
| JavaScript-Actions (checkout, upload/download-artifact, cache, github-script) | Laufen im Container. Bei Alpine laut GitHub nur eingeschränkt unterstützt, **im Spike prüfen**. | Laufen auf dem Runner, kein Risiko |
| Image | Muss alle Werkzeuge für alle Schritte haben | Nur für fhirscripts-Schritte |
| Dateirechte | Alles als root im Container | Dateien aus dem Container gehören root; nachfolgende Host-Schritte lesen problemlos, Löschen kann `sudo` brauchen |
| Lokale Reproduzierbarkeit | gleich | identischer Aufruf lokal: `docker run … build pipeline` |

**Empfehlung: B.** Das Image bleibt nah am gematik-Original, und die Actions laufen unabhängig von Alpine. Falls der
Spike zeigt, dass A mit Alpine problemlos funktioniert, ist A die kleinere Änderung am Workflow.

## Neue Bausteine

1. **Eigenes Image** `ghcr.io/gematik/isik-fhirscripts-build` mit eigenem Workflow `build-fhirscripts-image.yml`
   (manuell auslösbar und bei Änderungen am Dockerfile):
   - `FROM` dem gematik-Buildcontainer, gebaut aus einem **festen Commit** von gematik/fhir-scripts
   - zusätzlich: `grep` (GNU), `jq`, `yq`, `util-linux` (uuidgen)
   - fhirscripts, SUSHI und IG Publisher 2.3.4 fest pinnen; den IG Publisher z. B. unter `/opt/igpub/publisher.jar`
     ablegen und pro Projekt nach `input-cache/` verlinken. Das spart den Download pro Matrix-Job.
   - Tag mit Datum und Commit; im Workflow per Digest referenzieren, wie heute beim Gefyra-Image
2. **Composite Action** `.github/actions/fhirscripts`. Kapselt den `docker run`-Aufruf:
   ```bash
   docker run --rm -t \
     -v "$GITHUB_WORKSPACE":/project \
     -v "$HOME/.fhir":/root/.fhir \
     -w "/project/${IG_DIR}" \
     -e IG_NAME -e ACCEPTED_DOWNLOAD_CONDITIONS \
     --entrypoint fhirscripts \
     "$IMAGE" <befehl>
   ```
   Wichtig: `--entrypoint fhirscripts`, damit `update` und das Leeren des Caches nicht automatisch laufen.
3. **Skript `scripts/fhirscripts/run-sushi.sh`.** SUSHI über `sushi-wrap.sh` mit ZTS-Download (heute die Composite
   Action `run-sushi-with-zts`). Wird in den Modul-Konfigurationen statt des eingebauten Schritts `sushi` genutzt,
   wo BfArM-Pakete gebraucht werden.
4. **Basis-Paket für die anderen Module:** Job `basis` lädt `publisher-guides/Basis/output/package.tgz` als Artefakt
   hoch; die Matrix-Jobs entpacken es nach `~/.fhir/packages/de.gematik.isik-basismodul#<version>`.
5. **`actions/cache`** für `~/.fhir/packages`, Schlüssel ist der Hash aller `publisher-guides/*/package.json` und
   `sushi-config.yaml`. Ersetzt das Weitergeben des Caches als Artefakt.
6. **`fhirscripts check` als eigener Schritt** pro Modul. Ersetzt `sync-sushi-dependencies.sh`. Anfangs mit
   `continue-on-error: true`, weil der Check Warnungen als Fehler zählt; in Basis gibt es aktuell Warnungen zu
   mehreren Versionen indirekter Abhängigkeiten, und der Check stürzt bei Ressourcen ohne `date` ab.

## Schritt für Schritt: ig-publisher.yml

Legende: **bleibt** · **ändern** · **in Pipeline** (wandert in `fhirscripts.config.yaml`) · **entfällt** · **neu**

### Job `prepare` → wird zu Job `basis`

| Heutiger Schritt | Künftig | Anmerkung |
|---|---|---|
| `container:` Gefyra-Image | **entfällt** | Runner `ubuntu-latest`, fhirscripts per Composite Action |
| Checkout | **bleibt** | |
| Download Dependencies (`fhir-pkg-tool --sushi-deps-file Resources/…`) | **ändern** | `actions/cache` + `fhirscripts cache package --no-clear` in `publisher-guides/Basis` |
| Run SUSHI (Resources, mit ZTS) | **entfällt** | SUSHI läuft in der Basis-Pipeline |
| Upload FSH Generated Resources | **entfällt** | kein gemeinsames `fsh-generated` mehr |
| Upload FHIR Package Cache | **entfällt** | ersetzt durch `actions/cache` |
| – | **neu** | `fhirscripts build pipeline` für Basis (inkl. Änderungserkennung und `check`) |
| – | **neu** | Upload `publisher-guides/Basis/output/package.tgz` als Artefakt `basis-package` |
| – | **neu** | Upload Basis-IG-Ausgabe (`fhir-ig-ISiK-Basis`), damit Basis wieder veröffentlicht wird |

### Job `build` (Matrix, `needs: basis`)

| Heutiger Schritt | Künftig | Anmerkung |
|---|---|---|
| `container:` Gefyra-Image | **entfällt** | wie oben |
| Matrix-Felder `capability_statement_urls`, `import_cps_filter` | **entfällt** | stehen als Argumente von `expand-capabilitystatements.sh` in der Modul-Konfiguration |
| Checkout (`fetch-depth: 0`) | **bleibt** | für die Änderungserkennung |
| Download FHIR Package Cache | **ändern** | `actions/cache` + `cache package --no-clear` |
| Setup Package Cache for IG Publisher (Kopie nach `/root/.fhir`) | **entfällt** | Cache wird direkt nach `/root/.fhir` gemountet |
| Download FSH Generated Resources | **entfällt** | |
| – | **neu** | Artefakt `basis-package` laden und in den Cache entpacken |
| Setup Python | **entfällt** | python3 ist im Image |
| Expand CapabilityStatement | **in Pipeline** | `scripts/fhirscripts/expand-capabilitystatements.sh` |
| Apply expanded resources to IG input | **entfällt** | erledigt das Skript |
| Copy common files from config.json | **in Pipeline** | `scripts/fhirscripts/prepare-ig.sh`; `copy-config-files.sh` muss ohne `grep -P` auskommen (jq oder node) oder GNU grep ins Image |
| Sync SUSHI dependencies to IG config | **entfällt** | ersetzt durch `fhirscripts check` |
| Run SUSHI (IG local, mit ZTS) | **in Pipeline** | eingebauter Schritt `sushi` oder `shell: bash ../../scripts/fhirscripts/run-sushi.sh` |
| Write IG dir metadata (SUSHI) + Upload SUSHI-generated | **bleibt oder entfällt** | hängt davon ab, ob `fsh-generated` weiter eingecheckt wird (offene Entscheidung im Migrationsplan) |
| Resolve previous successful head SHA | **bleibt** | |
| Check for input changes | **ändern**, vor die Pipeline ziehen | `check-changes.sh` prüft heute die SUSHI-*Ausgabe* und `Resources/sushi-config.yaml`. Künftig: Quellen des Moduls (`input/`, `sushi-config.yaml`, `package.json`, `fhirscripts.config.yaml`), `publisher-guides/Basis/` für alle abhängigen Module, `scripts/common-files/`, `scripts/fhirscripts/`. Dadurch wird bei unveränderten Modulen auch SUSHI übersprungen. |
| Build IG (`igpublisher -ig …/ig.ini`) | **ändern** | `fhirscripts build pipeline` über die Composite Action |
| – | **neu** | `fhirscripts check` (anfangs `continue-on-error`) |
| Mark Build Ran | **bleibt** | |
| Remove oversized files | **bleibt** | |
| Generate publication-request.json | **in Pipeline** | Pipeline schreibt sie ins Modulverzeichnis; zusätzlich nach `output/` kopieren (gh-pages) |
| Upload Build Marker | **bleibt** | |
| Metadaten + Upload `input/resources` | **entfällt** | enthält nur noch erzeugte Dateien (expanded CS, Kopien aus common-files) → `.gitignore` |
| Metadaten + Upload `input/includes`, `input/pagecontent` | **entfällt** (empfohlen) | wird nur gebraucht, um die Kopien aus `scripts/common-files` zu committen; diese Kopien besser in die `.gitignore` aufnehmen |
| Record branch metadata for Pages cleanup | **bleibt** | |
| Upload IG Build Results | **bleibt** | |

### Übrige Jobs

| Job | Künftig | Anmerkung |
|---|---|---|
| `commit` | **ändern, eventuell entfällt** | „Sync SUSHI dependencies to all IG configs“ entfällt; `copy-artifacts.sh` und `commit-artifacts.sh` nur noch für `fsh-generated`, falls das eingecheckt bleibt. Werden alle erzeugten Dateien ignoriert, entfällt der ganze Job. |
| `publish_gate` | **bleibt** | |
| `comment_artifacts` | **bleibt** | |
| `cleanup_fhir_packages` | **entfällt** | kein `fhir-packages`-Artefakt mehr |
| `publish` | **bleibt** | gh-pages; `fhirscripts deploy` nicht nutzen (gemeinsamer Canonical, siehe Migrationsplan) |

## Weitere betroffene Dateien

| Datei | Änderung |
|---|---|
| `scripts/common-files/copy-config-files.sh` | `grep -oP` durch `jq` oder `node -e` ersetzen (Alpine) |
| `scripts/ig-publisher/check-changes.sh` | neue Pfadliste (s. o.), `Resources/` entfernen, Abhängigkeit zu Basis berücksichtigen |
| `scripts/ig-publisher/sync-sushi-dependencies.sh` | entfernen |
| `scripts/ig-publisher/copy-artifacts.sh`, `commit-artifacts.sh` | verkleinern oder entfernen (siehe `commit`) |
| `.github/actions/run-sushi-with-zts/` | Logik nach `scripts/fhirscripts/run-sushi.sh`, danach entfernen |
| `scripts/capabilitystatement-expander/expand.sh` | Modus `--workflow-file` (liest die Matrix) entfernen oder auf die Konfigurationsdateien umstellen |
| `publisher-guides/<Modul>/fhirscripts.config.yaml` | pro Modul anlegen; gemeinsame Pipeline eventuell als eine Datei per `FHIRSCRIPTS_CONFIG` |
| `.gitignore` | erzeugte Dateien in `input/resources`, Kopien aus `scripts/common-files`, eventuell `fsh-generated` |
| `.devcontainer/` | auf dasselbe Image umstellen, damit lokal identisch gebaut wird |
| `scripts/ig-publisher/README.md`, `.github/workflows/README.ig-publisher.md` | aktualisieren |
| `.github/workflows/main.yml`, `complieswith-export.yml` | nutzen `Resources/`; pro Modul umbauen oder entfallen (Validierung übernimmt der IG Publisher) – Phase 4 im Migrationsplan |

## Vorgehen

1. **Spike** (ein Workflow nur für Basis, `workflow_dispatch`):
   - gematik-Buildcontainer mit unseren Ergänzungen bauen
   - Basis mit Variante B bauen
   - prüfen: Jekyll-Rendering, `qa.json` im Vergleich zum bisherigen Basis-Build, Laufzeit, Dateirechte, ZTS
   - nebenbei Variante A testen: Laufen checkout und upload-artifact im Alpine-Job-Container?
2. **Image-Workflow** und Composite Action fertigstellen; Image per Digest pinnen.
3. **Skripte anpassen**: `copy-config-files.sh`, `check-changes.sh`, `run-sushi.sh`.
4. **`ig-publisher.yml` umbauen**: Job `basis` plus Matrix. Module, die noch nicht migriert sind, bleiben bis zu ihrer
   Migration (Phase 3) im alten Job; beide Varianten laufen also eine Zeit lang nebeneinander.
5. **Aufräumen**: alte Schritte, `cleanup_fhir_packages`, `run-sushi-with-zts`, `sync-sushi-dependencies.sh`.

## Offene Punkte

- Wo liegt das Image: GHCR im gematik-Repo, oder fragen wir bei gematik/fhir-scripts an, den Buildcontainer offiziell
  zu veröffentlichen?
- Wird die Snapshot-Erzeugung des fhir-pkg-tool für unsere Abhängigkeiten gebraucht? Davon hängt ab, ob
  `cache package` oder `cache package --new` genutzt wird.
- `fsh-generated` und die Kopien aus `scripts/common-files` weiter einchecken? Davon hängt ab, ob der `commit`-Job
  bleibt.
- `fhirscripts check` als hartes Gate erst, wenn die Warnungen zu indirekten Abhängigkeiten behoben sind und der
  Absturz bei fehlendem `date` gefixt ist.
