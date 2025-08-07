# ISiK Subscriptions-5 IG Migration: Von Simplifier zu IG Publisher

## Übersicht

Diese Anleitung beschreibt die Migration des ISiK Subscriptions-5 Implementation Guides von einer Simplifier-Vorlage zum HL7 FHIR IG Publisher, unter Beibehaltung der bestehenden Ordnerstruktur.

---

## Phase 0: Voraussetzungen und Umgebungsprüfung 

DONE

### 0.1 System-Voraussetzungen prüfen

#### Java 11+ Verifikation
```bash
# Java Version prüfen
java -version
# Sollte zeigen: "11" oder höher

# JAVA_HOME prüfen
echo $JAVA_HOME        # Linux/macOS
echo %JAVA_HOME%       # Windows CMD
echo $env:JAVA_HOME    # Windows PowerShell
```

**Falls Java 11+ nicht installiert:**

**Windows:**
```bash
# Microsoft OpenJDK herunterladen:
# https://docs.microsoft.com/en-us/java/openjdk/download#openjdk-11

# JAVA_HOME setzen:
# Systemsteuerung > System > Erweiterte Systemeinstellungen > Umgebungsvariablen
# Neue Systemvariable: JAVA_HOME = C:\Program Files\Java\jdk-11.0.x
# PATH erweitern: %JAVA_HOME%\bin
```

**macOS:**
```bash
# Homebrew Installation
brew install openjdk@11

# JAVA_HOME setzen
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 11)' >> ~/.zshrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
source ~/.zshrc
```

**Linux (Ubuntu/Debian):**
```bash
# OpenJDK 11 installieren
sudo apt update
sudo apt install openjdk-11-jdk

# JAVA_HOME setzen
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

#### Node.js/npm prüfen (für SUSHI)
```bash
node --version         # Sollte v14+ sein
npm --version

# Falls nicht installiert:
# https://nodejs.org/en/download/
```

### 0.2 IG Publisher Infrastruktur prüfen

#### SUSHI Installation prüfen
```bash
# SUSHI global installiert?
sushi --version

# Falls nicht installiert:
npm install -g fsh-sushi
```

#### IG Publisher Test
```bash
# In einem Test-Verzeichnis
mkdir ig-test && cd ig-test

# IG Publisher herunterladen
curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o publisher.jar

# Test-Ausführung
java -jar publisher.jar --help
# Sollte IG Publisher Hilfe anzeigen

# Test-Verzeichnis löschen
cd .. && rm -rf ig-test
```

#### Jekyll Installation prüfen (optional, für erweiterte narrative Seiten)
```bash
# Jekyll prüfen
jekyll --version
bundler --version
```

**Falls Jekyll nicht installiert:**

**Windows:**
```bash
# RubyInstaller herunterladen: https://rubyinstaller.org/downloads/
# Ruby+Devkit installieren
gem install jekyll bundler
```

**macOS:**
```bash
brew install ruby
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
gem install jekyll bundler
```

**Linux:**
```bash
sudo apt install ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler
```

### 0.3 Workspace-Bereitschaft prüfen

#### Aktuelle Struktur validieren
```bash
# Im Projekt-Root
ls -la guides/Subscriptions-5/Seiten/
ls -la Resources/input/fsh/Subscription/
cat Resources/sushi-config.yaml

# Prüfen ob alle erwarteten Dateien vorhanden sind
```

---

## Phase 1: Analyse und Vorbereitung

### 1.1 Bestandsaufnahme der aktuellen Struktur
```
guides/Subscriptions-5/
└── Seiten/                     # Deutsche narrative Inhalte

Resources/
├── sushi-config.yaml           # Bestehende SUSHI-Konfiguration
└── input/
    ├── fsh/
    │   └── Subscription/       # Subscriptions-spezifische FSH-Dateien
    └── fsh-generated/          # Bereits vorhandene FHIR JSON-Dateien
```

### 1.2 Abhängigkeiten und Konfiguration analysieren
```bash
# Bestehende SUSHI-Config analysieren
cat Resources/sushi-config.yaml

# Nach Subscriptions-relevanten Einträgen suchen:
grep -i subscription Resources/sushi-config.yaml
grep -i canonical Resources/sushi-config.yaml
```

---

## Phase 2: IG Publisher Grundstruktur

### 2.1 Minimale IG Publisher Struktur erstellen
```bash
# In guides/Subscriptions-5/
mkdir -p input/{pagecontent,images,includes}
mkdir -p input-cache
mkdir -p temp
mkdir -p output
```

**Resultierende Struktur:**
```
guides/Subscriptions-5/
├── input/
│   ├── pagecontent/            # Für migrierte Seiten
│   ├── images/                 # Bilder und Diagramme
│   └── includes/               # Template-Includes
├── input-cache/                # IG Publisher Cache
├── temp/                       # Temporäre Build-Files
└── output/                     # Generierte IG
```

### 2.2 IG Publisher Konfigurationsdateien erstellen

#### ig.ini erstellen
```ini
[IG]
ig = input/ImplementationGuide-subscriptions.json
template = hl7.fhir.template#current
# Relativer Pfad zu bestehenden FSH-Dateien
fsh = ../../Resources/input/fsh/Subscription
```

#### package.json erstellen
```json
{
  "name": "de.gematik.isik-subscriptions",
  "version": "5.0.0",
  "description": "ISiK Subscriptions Implementation Guide",
  "license": "CC0-1.0",
  "dependencies": {
    "de.gematik.isik-basismodul": "5.0.0",
    "hl7.fhir.r4.core": "4.0.1"
  }
}
```

#### ImplementationGuide Resource erstellen
Erstelle `input/ImplementationGuide-subscriptions.json`:
```json
{
  "resourceType": "ImplementationGuide",
  "id": "de.gematik.isik.subscriptions",
  "url": "https://gematik.de/fhir/isik/v5/subscriptions/ImplementationGuide/de.gematik.isik.subscriptions",
  "version": "5.0.0",
  "name": "ISiKSubscriptions",
  "title": "ISiK Subscriptions",
  "status": "active",
  "publisher": "gematik GmbH",
  "contact": [
    {
      "name": "gematik GmbH",
      "telecom": [
        {
          "system": "url",
          "value": "https://www.gematik.de"
        }
      ]
    }
  ],
  "description": "Implementation Guide für ISiK Subscriptions Modul",
  "fhirVersion": ["4.0.1"],
  "dependsOn": [
    {
      "uri": "https://gematik.de/fhir/isik/v5/basismodul",
      "packageId": "de.gematik.isik-basismodul",
      "version": "5.0.0"
    }
  ],
  "definition": {
    "page": {
      "nameUrl": "toc.html",
      "title": "Table of Contents",
      "generation": "html",
      "page": [
        {
          "nameUrl": "index.html",
          "title": "ISiK Subscriptions Startseite",
          "generation": "markdown"
        }
      ]
    }
  }
}
```

### 2.3 Build-Skripte erstellen

#### _genonce.sh (Linux/macOS)
```bash
#!/bin/bash
set -e

echo "=== ISiK Subscriptions IG Build ==="

# Java Version prüfen
if ! java -version 2>&1 | grep -q "11\|17\|21"; then
    echo "Fehler: Java 11+ erforderlich"
    echo "Aktuelle Version:"
    java -version
    exit 1
fi

# SUSHI auf bestehende FSH-Dateien anwenden
echo "1. SUSHI Ausführung..."
cd ../../Resources
sushi . --fsh-path input/fsh/Subscription --output ../guides/Subscriptions-5/temp/sushi-output

# Zurück zum IG Verzeichnis
cd ../guides/Subscriptions-5

# IG Publisher herunterladen falls nicht vorhanden
if [ ! -f "input-cache/publisher.jar" ]; then
    echo "2. IG Publisher herunterladen..."
    mkdir -p input-cache
    curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o input-cache/publisher.jar
fi

# IG Publisher ausführen
echo "3. IG Publisher ausführen..."
java -jar input-cache/publisher.jar -ig ig.ini

echo "=== Build abgeschlossen ==="
echo "Output: $(pwd)/output/index.html"
```

#### _genonce.bat (Windows)
```batch
@echo off
setlocal

echo === ISiK Subscriptions IG Build ===

REM Java Version prüfen
java -version 2>&1 | findstr /C:"11" /C:"17" /C:"21" >nul
if errorlevel 1 (
    echo Fehler: Java 11+ erforderlich
    echo Aktuelle Version:
    java -version
    exit /b 1
)

echo 1. SUSHI Ausführung...
cd ..\..\Resources
sushi . --fsh-path input/fsh/Subscription --output ..\guides\Subscriptions-5\temp\sushi-output

cd ..\guides\Subscriptions-5

if not exist "input-cache\publisher.jar" (
    echo 2. IG Publisher herunterladen...
    mkdir input-cache
    curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o input-cache/publisher.jar
)

echo 3. IG Publisher ausführen...
java -jar input-cache/publisher.jar -ig ig.ini

echo === Build abgeschlossen ===
echo Output: %cd%\output\index.html
```

**Ausführbar machen:**
```bash
chmod +x _genonce.sh  # Linux/macOS
```

---

## Phase 3: Narrative Inhalte migrieren

### 3.1 Seiten nach IG Publisher Standard kopieren
```bash
# In guides/Subscriptions-5/
cp -r Seiten/* input/pagecontent/

# Umbenennen zu .md falls nötig
cd input/pagecontent
for file in *.page.md; do
    mv "$file" "${file%.page.md}.md"
done
```

### 3.2 Markdown-Dateien für IG Publisher anpassen
- Simplifier-spezifische Syntax entfernen
- IG Publisher Markdown-Syntax verwenden  
- Links zu anderen ISiK-Modulen aktualisieren

**Typische Anpassungen:**
```markdown
# Vorher (Simplifier):
{{pagelink:ImplementationGuide/markdown/Einfuehrung.md}}

# Nachher (IG Publisher):
[Einführung](index.html)
```

---

## Phase 4: Erster Build-Test

### 4.1 Pre-Build Validierung
```bash
# In guides/Subscriptions-5/

# 1. Struktur prüfen
echo "=== Struktur-Check ==="
ls -la input/
ls -la ../../Resources/input/fsh/Subscription/

# 2. SUSHI-Test
echo "=== SUSHI Test ==="
cd ../../Resources
sushi . --fsh-path input/fsh/Subscription --output ../guides/Subscriptions-5/temp/test

# 3. Build-Skript ausführbar machen
cd ../guides/Subscriptions-5
chmod +x _genonce.sh
```

### 4.2 Erster vollständiger Build
```bash
# Build ausführen
./_genonce.sh

# Ergebnisse prüfen
ls -la output/
ls -la temp/

# Browser-Test (Linux/macOS)
open output/index.html

# Browser-Test (Windows)
start output/index.html
```

---

## Phase 5: Troubleshooting und Optimierung

### 5.1 Häufige Build-Probleme beheben

#### Java-Probleme
```bash
# JAVA_HOME prüfen und setzen
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64  # Linux
export JAVA_HOME=/usr/local/opt/openjdk@11            # macOS
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.x       # Windows

# Java Memory erhöhen falls OutOfMemory
java -Xmx4g -jar input-cache/publisher.jar -ig ig.ini
```

#### FSH-Pfad-Probleme
```bash
# Absolute Pfade testen
pwd
ls -la ../../Resources/input/fsh/Subscription/

# ig.ini anpassen falls nötig (absolute Pfade)
echo "fsh = $(realpath ../../Resources/input/fsh/Subscription)" >> ig.ini
```

#### Abhängigkeits-Probleme
```bash
# Dependencies manuell laden
mkdir -p input-cache
curl -L https://build.fhir.org/ig/gematik/ISiK-Basismodul/package.tgz -o input-cache/package.tgz
```

#### SUSHI-Probleme
```bash
# SUSHI Version prüfen
sushi --version

# Update falls nötig
npm update -g fsh-sushi

# Detaillierte SUSHI-Ausgabe
sushi . --fsh-path input/fsh/Subscription --output ../guides/Subscriptions-5/temp/sushi-output --verbose
```

### 5.2 Performance-Optimierung
```bash
# IG Publisher mit mehr Memory
java -Xmx4g -jar input-cache/publisher.jar -ig ig.ini

# TX Cache konfigurieren
echo "tx-cache: temp/txcache" >> ig.ini

# Build-Parallelisierung
echo "auto-ig-build: true" >> ig.ini
```

---

## Phase 6: Validierung und Integration

### 6.1 Vollständige Validierung
```bash
# 1. Build erfolgreich?
ls output/index.html

# 2. Alle Seiten generiert?
find output/ -name "*.html" | wc -l

# 3. FSH-Ressourcen korrekt verarbeitet?
ls temp/sushi-output/

# 4. Links funktionsfähig?
grep -r "broken link" output/ || echo "Keine broken links gefunden"

# 5. FHIR Validation
grep -r "ERROR" temp/ || echo "Keine FHIR Validationsfehler"
```

### 6.2 Integration mit bestehender Infrastruktur
```bash
# Keine Konflikte mit anderen IGs?
cd ../../..
find . -name "publisher.jar" -not -path "./guides/Subscriptions-5/*"

# Bestehende Resources/sushi-config.yaml nicht beeinträchtigt?
cd Resources
sushi . --fsh-path input/fsh --output temp/full-build-test
```

### 6.3 Cross-Browser Testing
```bash
# IG in verschiedenen Browsern testen
# Chrome, Firefox, Safari, Edge

# Mobile Responsiveness prüfen
# Entwicklertools in Browser verwenden
```

---

## Phase 7: Dokumentation und Finalisierung

### 7.1 README.md für Subscriptions-5
```markdown
# ISiK Subscriptions Implementation Guide

## Voraussetzungen
- Java 11+ (JAVA_HOME gesetzt)
- Node.js 14+ (für SUSHI)
- Ruby 3.0+ mit Jekyll (optional, für erweiterte narrative Seiten)

## Ordnerstruktur
```
guides/Subscriptions-5/         # IG Publisher Konfiguration
├── _genonce.sh/.bat           # Build-Skript
├── ig.ini                     # IG Publisher Config
├── package.json               # Dependencies
├── input/
│   ├── ImplementationGuide-subscriptions.json
│   └── pagecontent/           # Migrierte Seiten
└── output/                    # Generierte IG

Resources/input/fsh/Subscription/  # FSH-Definitionen (unverändert)
```

## Build-Anweisungen
```bash
cd guides/Subscriptions-5
./_genonce.sh          # Linux/macOS
_genonce.bat           # Windows
```

## Troubleshooting
- **Java-Fehler**: `echo $JAVA_HOME` prüfen
- **FSH-Fehler**: `../../Resources/input/fsh/Subscription/` existiert?
- **Build-Fehler**: Log in `temp/` prüfen
- **Memory-Fehler**: `-Xmx4g` zu Build-Skript hinzufügen

## CI/CD Integration
Das Build-Skript kann in GitHub Actions oder andere CI/CD-Pipelines integriert werden.
```

### 7.2 Checkliste für erfolgreiche Migration
```
☐ Java 11+ installiert und JAVA_HOME gesetzt
☐ SUSHI und IG Publisher funktionsfähig
☐ FSH-Dateien bleiben in Resources/input/fsh/Subscription/
☐ Build-Skript läuft erfolgreich durch
☐ Narrative Seiten werden korrekt generiert
☐ Keine Konflikte mit anderen IG-Ordnern
☐ Output in guides/Subscriptions-5/output/ vollständig
☐ Links funktionieren korrekt
☐ FHIR Validation erfolgreich
☐ Cross-Browser Testing bestanden
☐ Dokumentation aktualisiert
☐ CI/CD Integration (falls erforderlich)
```

### 7.3 Wartung und Updates

#### Regelmäßige Updates
```bash
# IG Publisher Update
curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o input-cache/publisher.jar

# SUSHI Update
npm update -g fsh-sushi

# Dependencies Update
# package.json Dependencies prüfen und aktualisieren
```

#### Monitoring
```bash
# Build-Logs überwachen
tail -f temp/publisher.log

# Output-Größe überwachen
du -sh output/

# Performance-Metriken
time ./_genonce.sh
```

---

## Anhang

### A.1 Häufige Fehlermeldungen und Lösungen

| Fehlermeldung | Ursache | Lösung |
|---------------|---------|--------|
| `java command not found` | Java nicht installiert/PATH | Java installieren, PATH setzen |
| `JAVA_HOME not set` | JAVA_HOME nicht gesetzt | Umgebungsvariable setzen |
| `sushi command not found` | SUSHI nicht installiert | `npm install -g fsh-sushi` |
| `OutOfMemoryError` | Zu wenig Heap-Speicher | `-Xmx4g` hinzufügen |
| `Publisher jar not found` | IG Publisher nicht geladen | Build-Skript ausführen |
| `FSH path not found` | Falscher relativer Pfad | Pfad in ig.ini korrigieren |

### A.2 Nützliche Links

- [HL7 FHIR IG Publisher](https://github.com/HL7/fhir-ig-publisher)
- [SUSHI Documentation](https://fshschool.org/docs/sushi/)
- [FHIR Shorthand (FSH) Language](https://build.fhir.org/ig/HL7/fhir-shorthand/)
- [ImplementationGuide Resource](https://hl7.org/fhir/R4/implementationguide.html)
- [gematik ISiK Spezifikation](https://simplifier.net/isik)

### A.3 Kontakt und Support

Bei Problemen oder Fragen zur Migration:
- GitHub Issues: [ISiK Basismodul Repository](https://github.com/gematik/spec-ISiK-Basismodul)
- gematik Support: [support@gematik.de](mailto:support@gematik.de)

---

*Diese Migrationsstrategie wurde erstellt für ISiK Stufe 5 und getestet mit IG Publisher 1.6.x und SUSHI 3.x*
