# Migration nach publisher 

## Risiken
- Im Zuge des Vorgehens redundante Zwischenstände vermeiden
    - Grundidee: Der bestehende Ressourcenordner sollte beibehalten werden
    

## Aufwandsschätzung
- Je nach Länge des IGs sollten 1-3 Personentage für die Migration eingeplant werden, da insbesondere Link-Erneuerung etc. einige Zeit in Anspruch nehmen kann.

## Offene Fragen:

- Wie Redundanz vermeiden - z.B. für ISiKPatient etc.?
    - Resources wie gehabt in einem Ordner mit sushi generieren und dann relevanten per skript (infos aus CpS) in den entsprechenden publisher Folder übertragen.
ggf. mit symlink
- Wie Profile und Artefakte in dropdown 
    - wollen wir das wirklich? -> Argument dagegen : momentan werden diese geniert und sind in der TOC gerendert, allerdings fehlt die Einbindung im Menü
- Wie Package generieren?

## Nächste Schritte
- Siehe Tickets - https://service.gematik.de/browse/PTDATA-1766 etc.


# Dokumentation - ISiK Subscriptions-5 IG Migration: Von Simplifier zu IG Publisher

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


---

## Phase 2: IG Publisher Grundstruktur

```
/publisher-guides/Subscriptions-5/
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
- siehe Datei (nutzt gematik Template)

#### package.json anpassen
- siehe Datei

### 2.3 Build-Skripte
```bash

# Zurück zum IG Verzeichnis
cd ../publisher-guides/Subscriptions-5

# IG Publisher herunterladen falls nicht vorhanden

# IG Publisher ausführen in folder \input

java "-Dfile.encoding=UTF-8" -jar .\input-cache\publisher.jar -ig ig.ini -sushi-timeout 600

java "-Dfile.encoding=UTF-8" -jar .\input-cache\publisher.jar -no-sushi -ig ig.ini 
```

---

## Phase 3: Narrative Inhalte migrieren

### 3.1 Seiten nach IG Publisher Standard kopieren
- d.h. nach: /publisher/guides/Subscriptions-5/ 

### 3.2 Markdown-Dateien für IG Publisher anpassen
- Simplifier-spezifische Syntax entfernen
- IG Publisher Markdown-Syntax verwenden

**Typische Anpassungen:**
```markdown
# Vorher (Simplifier):
{{pagelink:ImplementationGuide/markdown/Einfuehrung.md}}

# Nachher (IG Publisher):
[Einführung](index.html)
```

### 3.2 Menu für IG Publisher in sushi-config.yaml anpassen

- siehe Datei
---

## Phase 4: Erster Build-Test


```bash
java "-Dfile.encoding=UTF-8" -jar .\input-cache\publisher.jar -ig ig.ini -sushi-timeout 600

java "-Dfile.encoding=UTF-8" -jar .\input-cache\publisher.jar -no-sushi -ig ig.ini
```

