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
- [x] Vollständiger lokaler Lauf mit Ruby 4.0 und Jekyll 4.4.1 (29.10.2026): `fhirscripts build pipeline` mit
      Exit-Code 0 nach ca. 14 Minuten, davon gut 8 Minuten Jekyll. Der IG Publisher meldet dabei ein Jekyll-Timeout
      von 300 Sekunden, rendert aber vollständig.
- [x] Vergleich mit dem letzten Basis-Build auf gh-pages (`main-stufe-6/ISiK-Basis`, 05.10.2026):

  | | Fehler | Warnungen | Hinweise | Dateien in `output/` |
  |---|---|---|---|---|
  | bisher (CI, Gefyra-Image) | 3 | 583 | 287 | 4749 |
  | Pilot (lokal, fhirscripts) | 23 | 603 | 316 | 4968 |

  Herkunft der 20 zusätzlichen Fehler:
  - **17 × `ref-1` „invariants … cannot differ“** in ISiKAbrechnungsfall, ISiKAbrechnungsfallAmbulant, ISiKPatient
    und ISiKPersonImGesundheitsberuf. Ursache ist der Paket-Cache, nicht der Umbau: Die veröffentlichten Snapshots von
    `de.basisprofil.r4#1.6.0` enthalten die neuere R5-Fassung von `ref-1`, R4-Core die alte. In CI erzeugt das
    fhir-pkg-tool im Gefyra-Image die Snapshots neu, deshalb tritt der Fehler dort nicht auf. **Folge für die
    CI-Umstellung:** Die Snapshot-Erzeugung des fhir-pkg-tool wird gebraucht (`cache package --new` mit
    `fhir_pkg_tool`).
  - **3 Fehler aus Ressourcen, die bisher gar nicht im Basis-IG waren.** Der Expander hat nur übernommen, was vom
    CapabilityStatement aus erreichbar ist. 17 Ressourcen aus dem Basis-FSH fehlten deshalb im bisherigen IG, u. a.
    `ISiKBinary`, `ISiKPZNCoding`, `Bundle-Szenario1`/`-Szenario2`, `CodeSystem-MimeTypeCS`, mehrere ValueSets.
    Neu sichtbar sind dadurch: `MimeTypeCS` hat `^url = "urn:ietf:bcp:13"`, was nicht zur Canonical passt (2 Fehler),
    und `Binary-PDF-Example` verweist auf `Patient/example` (1 Fehler). Zu klären: Gehören diese Ressourcen in
    Basis, z. B. ISiKBinary nach Dokumentenaustausch?
  - Die 3 bisherigen Fehler bestehen unverändert.
- [ ] `fhirscripts check` grün bekommen. Stand: Versionen und direkte Abhängigkeiten konsistent. Offen sind
      `hl7.fhir.r4.core#4.0.0` im Cache, Warnungen zu mehreren Versionen indirekter Abhängigkeiten
      (de.basisprofil.r4 1.6.0/1.5.4, de.gematik.terminology 1.0.6/1.0.9, hl7.terminology.r4, dvmd.kdl.r4 …) und der
      Absturz beim Datumsvergleich (siehe unten).

### Phase 2: CI umbauen (`.github/workflows/ig-publisher.yml`)

Ausführlicher Plan für die Umstellung auf den fhirscripts-Container, Schritt für Schritt:
[CI-UMSTELLUNG.md](CI-UMSTELLUNG.md). Kurzfassung:

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
- Container: Statt des Gefyra-Images den öffentlichen gematik-Devcontainer `gematik1/fhir-devcontainer` verwenden
  (Docker Hub, per Digest gepinnt; Inhalt und Besonderheiten siehe CI-UMSTELLUNG.md).
- SUSHI mit ZTS-Paketen: Für Module mit BfArM-Abhängigkeiten den eingebauten Schritt `sushi` durch einen
  `shell:`-Schritt mit `sushi-wrap.sh` ersetzen (siehe `.github/actions/run-sushi-with-zts`).
- Bleiben unverändert: Änderungserkennung, Commit-Job.
- **Veröffentlichung per `fhirscripts deploy` statt gh-pages.** Standard für jeden CI-Build ist `deploy dev`: Der
  gebaute IG landet im Dev-Bucket (Google Cloud Storage) und wird dort angesehen, nicht mehr auf GitHub Pages. Prod
  nur bewusst, per `fhirscripts deploy prod --promote-from dev` (manueller Workflow, z. B. bei einem Release). Der
  PR-Kommentar verlinkt die Dev-URL statt der gh-pages-URL. Vorher zu lösen (siehe „Offene Entscheidungen“):
  Zielpfad pro Modul, Pfad pro Branch, Zugang zu den Buckets.
- `fhirscripts publish` vorerst nicht nutzen.

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
- **Expanded-CapabilityStatements weiter erzeugen?** Zur Diskussion. Heute erzeugt der Expander pro Modul ein
  zusätzliches `*-expanded`-CapabilityStatement, das die importierten CapabilityStatements (z. B. Basis) in eines
  zusammenführt.
  - Dafür: alle Anforderungen eines Moduls auf einen Blick, ohne den `imports` folgen zu müssen; eventuell nutzen
    Testwerkzeuge oder Bestätigungsverfahren genau diese Fassung (zu klären, wer sie verwendet).
  - Dagegen: eine Ressource mehr, die nicht im FSH steht und von der Quelle abweichen kann; eigener Python-Schritt
    in jeder Pipeline; `imports` ist der FHIR-Standardweg, und der IG Publisher verlinkt die importierten
    CapabilityStatements ohnehin.
  - Wenn sie entfallen: Schritt `expand-capabilitystatements.sh` aus allen `fhirscripts.config.yaml`, die
    CapabilityStatement-URLs in der Konfiguration und `scripts/capabilitystatement-expander/` (Phase 4) fallen weg.
- **`fhirscripts deploy` (Dev/Prod):**
  - *Zielpfad pro Modul.* `deploy` leitet das Projekt aus der IG-URL ab (`<canonical>/ImplementationGuide/<id>` →
    vorletztes Segment vor `ImplementationGuide`). Bei unserem gemeinsamen Canonical `https://gematik.de/fhir/isik`
    ist das für alle Module `isik`, Ziel also `gs://<bucket>/ig/fhir/isik/6.0.0`, und die Module überschreiben
    sich gegenseitig. Möglichkeiten: in jeder `fhirscripts.config.yaml` ein eigenes `deploy.path` setzen
    (z. B. `ig/fhir/isik-basis`), den Canonical pro Modul ändern (große Änderung, betrifft alle URLs), oder per
    `shell:`-Schritt selbst mit `gcloud storage cp` kopieren.
  - *Pfad pro Branch.* Nur IGs mit `releaseLabel: ci-build` landen unter `build/<projekt>/branches/<branch>`, alle
    anderen unter `<projekt>/<version>`. Unsere IGs haben `releaseLabel: active`, Branch-Builds würden sich also
    gegenseitig überschreiben. Für Dev-Builds daher `ci-build` setzen oder den Pfad selbst bestimmen.
  - *Zugang.* Namen der Dev- und Prod-Buckets, öffentliche URL der Dev-Umgebung, Service-Account bzw. Workload
    Identity Federation für GitHub Actions: bei gematik klären.
  - *Aufräumen.* Heute entfernt der Workflow gh-pages-Vorschauen gelöschter Branches. Für den Dev-Bucket braucht es
    etwas Vergleichbares, sonst sammeln sich Branch-Builds an.

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
- **Der IG Publisher braucht für das Rendering Jekyll und damit Ruby.** Unter Windows: Ruby (z. B. RubyInstaller
  4.0) installieren, `gem install jekyll`, und `C:\Ruby40-x64\bin` muss im `PATH` liegen. Jekyll braucht unter
  Windows gut 8 Minuten für Basis. Alternativ im Container bauen.

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
