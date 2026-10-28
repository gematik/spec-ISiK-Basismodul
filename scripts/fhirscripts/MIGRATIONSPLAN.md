# Migrationsplan: eigenständige Modul-IGs mit fhirscripts

Stand: 28.10.2026 · Branch `stufe-6/all/fhir-scripts-test` · fhirscripts 0.32.0

## Ziel

Der gemeinsame Ordner `Resources/` (ein SUSHI-Lauf für alle Module, `FSHOnly`) entfällt. Jedes Modul unter
`publisher-guides/<Modul>/` wird ein eigenständiges IG-Projekt mit eigenem FSH, eigenem SUSHI-Lauf, eigener
`package.json` und eigener `fhirscripts.config.yaml`. Gebaut wird pro Modul mit dem gematik-Werkzeug
[fhirscripts](https://github.com/gematik/fhir-scripts), lokal und in CI mit demselben Befehl:

```bash
cd publisher-guides/<Modul>
fhirscripts build pipeline
```

## Ausgangslage

| Heute | Ziel |
|---|---|
| FSH aller Module in `Resources/input/fsh/<Modul>`, ein SUSHI-Lauf (`FSHOnly`) | FSH in `publisher-guides/<Modul>/input/fsh`, SUSHI pro Modul |
| CapabilityStatement-Expander sucht die Modul-Ressourcen aus dem gemeinsamen `fsh-generated` und kopiert sie nach `input/resources` | SUSHI erzeugt die Modul-Ressourcen direkt; der Expander liefert nur noch das zusammengeführte `*-expanded`-CapabilityStatement |
| Abhängigkeiten zentral in `Resources/sushi-config.yaml`, verteilt per `sync-sushi-dependencies.sh` | Abhängigkeiten pro Modul in `sushi-config.yaml` und `package.json`, Konsistenz per `fhirscripts check` |
| eine `package.json` im Repo-Root | eine `package.json` pro Modul |
| Matrix-Workflow `ig-publisher.yml` mit Inline-Schritten | Matrix-Workflow ruft pro Modul `fhirscripts build pipeline` auf |

### Abhängigkeiten zwischen Modulen

Fast alle Module nutzen Profile aus Basis (grobe Suche nach Bezeichnern im FSH-Code):

| Modul | nutzt aus Basis (Auswahl) |
|---|---|
| Dokumentenaustausch | ISiKBinary, ISiKPatient |
| Formulare | ISiKBerichtBundle, ISiKPatient |
| ICU | ISiKProzedur, ISiKCoding, ISiKSnomedCTCoding |
| Labor | ISiKLoincCoding |
| Medikation | ISiKAllergieUnvertraeglichkeit, ISiKCoding, PZN-/ATC-/ASK-/SCT-Codings |
| Organspendeerkennung | ISiKPatient, ISiKKontaktGesundheitseinrichtung, ISiKStandort |
| Subscription | ISiKPatient |
| Terminplanung | ISiKPatient, ISiKAngehoeriger, ISiKPersonImGesundheitsberuf, ISiKStandort, ISiKValueSet |
| Vitalparameter | – |

Daraus folgt:

1. Basis wird FHIR-Paket-Abhängigkeit (`de.gematik.isik-basismodul`) der anderen Module.
2. Rulesets und Aliases aus `_Commons` landen in keinem Paket und müssen als FSH in jedem Modul vorliegen.
3. Beispiele, die auf Beispiele anderer Module verweisen (z. B. `Patient-DorisResultat`), lassen sich nach der
   Trennung nicht mehr auflösen und müssen ins jeweilige Modul.

## Phasen

### Phase 1: Pilot Basis (umgesetzt, lokal getestet)

- [x] FSH nach `publisher-guides/Basis/input/fsh` kopiert, inklusive eigener `_Commons`-Kopie ohne das Labor-Ruleset
      `supportedLaborProfile`
- [x] `packageId: de.gematik.isik-basismodul` in `publisher-guides/Basis/sushi-config.yaml`
- [x] `publisher-guides/Basis/package.json` mit denselben Abhängigkeiten wie die `sushi-config.yaml`
- [x] `publisher-guides/Basis/fhirscripts.config.yaml` mit Werkzeug-Pins und Pipeline
- [x] Pipeline-Hilfsskripte unter `scripts/fhirscripts/`:
  - `prepare-ig.sh`: kopiert die gemeinsamen Dateien aus `scripts/common-files/config.json`
  - `expand-capabilitystatements.sh`: erzeugt nur das `*-expanded`-CapabilityStatement
- [x] Die bisher vom Expander befüllten Dateien in `publisher-guides/Basis/input/resources` (148 Stück) entfernt. Sie
      entstehen jetzt durch SUSHI. Nicht mehr enthalten sind Beispiele anderer Module, die der Expander über
      `meta.profile` mitgezogen hatte: DorisQuelle, DorisZiel (Subscription), IsikPatientTemplate (Formulare),
      isik-encounter-Sternenfall, isik-station-anaesthesie, isik-patient-156722 (Organspendeerkennung).
- [x] Beispiel `BloodPressureObservation` (in `ISiKBerichtSubSysteme.fsh`) nutzte das Vitalparameter-Profil
      `ISiKBlutdruckSystemischArteriell`, also eine Abhängigkeit in Gegenrichtung. Es setzt die Festwerte jetzt
      explizit, das erzeugte JSON ist identisch zur vorherigen Fassung.
- [x] Basis aus der alten Matrix in `.github/workflows/ig-publisher.yml` genommen, damit der Expander dort keine
      Duplikate erzeugt
- [x] `.gitignore`: `output/`, `input-cache/`, `temp/`, `template/` und `publication-request.json` pro IG sowie
      `build-record.yaml`
- [x] Lokaler Lauf `fhirscripts build pipeline` (28.10.2026, Windows): alle Schritte bis einschließlich IG Publisher
      erfolgreich (Laden, Validierung, Erzeugen der Seiten). Abbruch erst beim Jekyll-Rendering, weil lokal kein
      Ruby installiert ist (`ruby.exe` nicht gefunden). Das ist ein Problem der Umgebung, nicht der Pipeline.
- [ ] Vollständiger Lauf inklusive Jekyll im Container (Gefyra-Image plus fhirscripts), danach Vergleich mit dem
      bisherigen Basis-Build (`output/qa.json`, Seiten, Artefaktliste)
- [ ] `fhirscripts check` grün bekommen. Stand: Versionen und direkte Abhängigkeiten konsistent. Offen sind
      `hl7.fhir.r4.core#4.0.0` im Cache, Warnungen zu mehreren Versionen indirekter Abhängigkeiten
      (de.basisprofil.r4 1.6.0/1.5.4, de.gematik.terminology 1.0.6/1.0.9, hl7.terminology.r4, dvmd.kdl.r4 …) und der
      Absturz beim Datumsvergleich (siehe unten).

### Phase 2: CI umbauen (`.github/workflows/ig-publisher.yml`)

- Job `basis`: `fhirscripts cache package`, dann `fhirscripts build pipeline` in `publisher-guides/Basis`, danach
  `output/package.tgz` als Artefakt hochladen.
- Matrix-Job pro Modul (`needs: basis`):
  1. `fhirscripts cache package`
  2. Basis-Paket nach `~/.fhir/packages/de.gematik.isik-basismodul#<version>` entpacken
  3. `fhirscripts build pipeline`

  Die Reihenfolge ist wichtig: `cache package` leert den gesamten Cache. Alternative: `--no-clear`.
- Die Matrix reduziert sich auf `ig_name` und `ig_dir`. Die CapabilityStatement-URLs stehen in der jeweiligen
  `fhirscripts.config.yaml`.
- `fhirscripts check` als Pflichtschritt pro Modul ersetzt `sync-sushi-dependencies.sh`.
- Container: Das Gefyra-Image bekommt zusätzlich uv und fhirscripts, an einen Commit-Hash gepinnt.
- SUSHI mit ZTS-Paketen: Für Module mit BfArM-Abhängigkeiten den eingebauten Schritt `sushi` durch einen
  `shell:`-Schritt mit `sushi-wrap.sh` ersetzen (siehe `.github/actions/run-sushi-with-zts`).
- Bleiben unverändert: Änderungserkennung, Commit-Job, PR-Kommentar, gh-pages-Publish.
- `fhirscripts deploy` und `publish` vorerst nicht nutzen. Wir veröffentlichen auf gh-pages, und `deploy` würde alle
  Module wegen des gemeinsamen Canonicals unter demselben Projektnamen `isik` ablegen.

### Phase 3: Module einzeln migrieren

Pro Modul:

1. FSH aus `Resources/input/fsh/<Modul>` nach `publisher-guides/<Modul>/input/fsh` **verschieben**, nicht kopieren
2. `_Commons` übernehmen
3. `packageId` und `package.json` anlegen, Basis als Abhängigkeit eintragen
4. `fhirscripts.config.yaml` anlegen
5. das Modul in die neue Matrix aufnehmen

Reihenfolge: zuerst Module mit wenigen Basis-Bezügen (Vitalparameter, Labor, Subscription), zuletzt Terminplanung,
Medikation, Organspendeerkennung.

Übergangsphase: `Resources/input/fsh/Basis` bleibt bestehen, solange andere Module noch über `Resources/` gebaut
werden, weil sie die Basis-Profile brauchen. Bis dahin müssen Änderungen an Basis-FSH an **beiden** Stellen
erfolgen.

### Phase 4: Gemeinsame Teile abbauen

Diese Stellen verweisen noch auf `Resources/` und müssen pro Modul umgestellt oder entfernt werden:

- `.github/workflows/main.yml` (Firely-Validierung)
- `.github/workflows/complieswith-export.yml` und `scripts/complieswith/*`
- `scripts/ig-publisher/check-changes.sh`, `scripts/ig-publisher/sync-sushi-dependencies.sh`
- `scripts/capabilitystatement-expander/*` (Standardpfade)
- `scripts/QualityAssuranceAutomation/qa-fhir.js`, `scripts/check_rendering_in_markdown.py`
- READMEs unter `.github/workflows/` und `scripts/`

Danach `Resources/` und die `package.json` im Root löschen.

## Offene Entscheidungen

- **Woher kommt das Basis-Paket für die anderen Module?** Empfehlung: im selben CI-Lauf bauen und lokal in den Cache
  legen, damit Änderungen an Basis und einem Modul im selben PR möglich bleiben. Für Releases ist auch die
  veröffentlichte Version denkbar.
- **`_Commons`:** zentrale Quelle (z. B. `scripts/common-files/fsh/`) mit Kopierschritt in der Pipeline, oder
  eingecheckte Kopien pro Modul mit CI-Prüfung auf Abweichungen. Der Pilot nutzt eine eingecheckte Kopie.
- **`fsh-generated` einchecken?** Heute committet CI die SUSHI-Ausgabe. Mit eigenständigen Modulen ist sie
  reproduzierbar und könnte in die `.gitignore`.
- **`publication-request.json`:** `scripts/publication-request/generate.js` leitet den `path` aus der `packageId` ab
  (jetzt `https://gematik.de/fhir/isik/de.gematik.isik-basismodul/6.0.0`). Bei Bedarf über
  `scripts/publication-request/config.json` überschreiben.
- **Eingebauter Schritt `igpub`:** Er übergibt `-publish <canonical>/<version>`. Bei gemeinsamem Canonical aller
  Module ist das für alle Module derselbe Wert, also vor einer Umstellung prüfen.

## Bekannte Stolpersteine mit fhirscripts 0.32.0

- **Oracle-JDK wird nicht erkannt.** Die Versionserkennung sucht nach `jdk version`, Oracle gibt `java version` aus.
  Dadurch brechen `install --igpub` und der Schritt `igpub` mit „Java version 17 required“ ab. Workaround:
  OpenJDK/Temurin nutzen, oder wie im Piloten den IG Publisher per `shell:` aufrufen und die JAR selbst laden:
  `curl -L https://github.com/HL7/fhir-ig-publisher/releases/download/2.3.4/publisher.jar -o input-cache/publisher.jar`
- **Fehlermeldungen unter Windows.** Bei jedem Fehler stürzt fhirscripts zusätzlich mit
  `AttributeError: module 'os' has no attribute 'EX_DATAERR'` ab. Die eigentliche Meldung steht davor und ist mit
  `--long-log` sichtbar.
- **`shell:`-Schritte laufen unter Windows über `cmd.exe`.** `bash` muss daher auf Git Bash zeigen. Das ist gegeben,
  wenn fhirscripts aus Git Bash gestartet wird, sonst wird eventuell WSL-bash genutzt.
- **`fhirscripts cache package` löscht den gesamten `~/.fhir/packages`**, lokal also besser `--no-clear` verwenden.
- **SUSHI-Fehler beenden die Pipeline.** SUSHI liefert bei Fehlern einen Exit-Code ungleich 0.
- **`fhirscripts check` stürzt ab, wenn eine Ressource mit `version` kein `date` hat.** Fehler:
  `sequence item 1: expected str instance, NoneType found`. Betroffen in Basis: `ValueSet-current-smoking-status-uv-ips`
  (Version 1.1.0) und `ValueSet-ISiKValueSetExample` (Version 2.0.2).
- **Der IG Publisher braucht für das Rendering Jekyll und damit Ruby.** Unter Windows reicht der Jekyll-Aufruf allein
  nicht, Ruby muss im `PATH` liegen. Alternativ im Container bauen.

Diese Punkte sollten als Issues an [gematik/fhir-scripts](https://github.com/gematik/fhir-scripts) gemeldet werden.

## Pilot lokal ausführen

Voraussetzungen: Node mit SUSHI 3.21.0, Java ≥ 17, Jekyll, Firely Terminal, uv mit fhirscripts, Git Bash.

```bash
cd publisher-guides/Basis
fhirscripts install --config-file        # mit OpenJDK; bei Oracle-JDK die JAR per curl laden (s. o.)
fhirscripts cache package --no-clear     # Abhängigkeiten aus package.json
fhirscripts build pipeline               # prepare -> SUSHI -> expanded CS -> publication-request -> IG Publisher -> QA
fhirscripts check                        # Versionen und Abhängigkeiten konsistent?
```
