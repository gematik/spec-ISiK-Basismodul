# Anforderungen an das FHIR Quality Assurance Tool

## Überblick
Das QA-Tool automatisiert Qualitätssicherungsprüfungen für FHIR-Profile (StructureDefinition JSON-Dateien) basierend auf bewährten Praktiken.

## Funktionale Anforderungen

### 1. Validierung von MustSupport-Elementen
- **F1.1**: Das Tool muss prüfen, dass MustSupport-Elemente sowohl eine `short`-Beschreibung als auch einen `comment` haben
- **F1.2**: Fehlende `short`-Beschreibungen sollen als Warnung klassifiziert werden
- **F1.3**: Fehlende `comment`-Beschreibungen sollen als Fehler klassifiziert werden
- **F1.4**: Die Prüfung soll nur auf Elemente der ersten Ebene angewendet werden (z.B. `Appointment.status`)

### 2. Kardinalitätsprüfung
- **F2.1**: Elemente mit eingeschränkter Kardinalität müssen als MustSupport markiert sein
- **F2.2**: Elemente mit Kardinalität `0..0` dürfen kein `mustSupport`-Attribut haben
- **F2.3**: Bei Verletzung dieser Regeln soll ein Fehler ausgegeben werden

### 3. Profil-Beschreibung
- **F3.1**: Das Tool muss prüfen, dass `StructureDefinition.description` ausgefüllt ist
- **F3.2**: Leere oder fehlende Beschreibungen sollen als Warnung klassifiziert werden

### 4. Suppression-Funktionalität
- **F4.1**: Profile können über eine Konfigurationsdatei von der Prüfung ausgeschlossen werden
- **F4.2**: Die Suppression-Konfigurationsdatei muss `suppression.config.json` heißen und im gleichen Verzeichnis wie das Script liegen
- **F4.3**: Einzelne Elemente von Ressourcen können gezielt unterdrückt werden --> Entfernen
- **F4.4**: Unterdrückte Profile und Elemente müssen explizit in der Log-Datei ausgegeben werden
- **F4.5**: Suppression-Einträge können optionale Kommentare enthalten

### 5. Fehler- und Warnungsklassifikation
- **F5.1**: Das Tool muss zwischen Fehlern und Warnungen unterscheiden
- **F5.2**: Fehler sollen kritische Verstöße gegen Best Practices darstellen
- **F5.3**: Warnungen sollen empfohlene, aber nicht kritische Verbesserungen darstellen

## Technische Anforderungen

### 6. Dateisystem-Integration
- **T6.1**: Das Tool muss alle JSON-Dateien rekursiv aus einem Verzeichnis lesen können
- **T6.2**: Der Standardsuchpfad ist `../../Resources/fsh-generated/resources`
- **T6.3**: Das Tool muss nur StructureDefinition-Ressourcen verarbeiten

### 7. Logging und Ausgabe
- **T7.1**: Das Tool muss sowohl Konsolen- als auch Datei-Logging unterstützen
- **T7.2**: Log-Dateien sollen im `./logs`-Verzeichnis mit Zeitstempel erstellt werden
- **T7.3**: Das Tool muss eine Übersicht der Fehler pro Ressource ausgeben
- **T7.4**: Erfolgreiche Prüfungen sollen mit einem grünen Häkchen (✅) dargestellt werden
- **T7.5**: Fehler sollen mit einem roten X (❌) dargestellt werden

### 8. Exit-Codes
- **T8.1**: Das Tool muss mit Exit-Code 1 beenden, wenn Fehler gefunden wurden
- **T8.2**: Das Tool muss mit Exit-Code 0 beenden, wenn nur Warnungen oder keine Probleme gefunden wurden

### 9. Konfiguration
- **T9.1**: Die Suppression-Konfiguration muss als JSON-Format vorliegen
- **T9.2**: Das Tool muss mit leerer Suppression-Konfiguration funktionieren, wenn die Datei nicht existiert
- **T9.3**: Fehler beim Laden der Konfigurationsdatei sollen zum Abbruch des Programms führen --> Anpassung im Tool 

### 10. Modularität
- **T10.1**: Das Tool muss als Node.js-Modul exportierbar sein --> checken wo das umgesetzt ist
- **T10.2**: Kernfunktionen sollen für Tests zugänglich sein

## Ausgabeformat-Anforderungen

### 11. Meldungsformat
- **O11.1**: Fehlermeldungen müssen Dateipfad und betroffenes Element enthalten
- **O11.2**: Warnungen sollen mit "⚠️" gekennzeichnet werden
- **O11.3**: Fehler sollen mit "❌" gekennzeichnet werden
- **O11.4**: Unterdrückte Elemente sollen mit "🚫" gekennzeichnet werden

### 12. Strukturierung der Ausgabe
- **O12.1**: Unterdrückte Profile und Elemente sollen separat aufgelistet werden
- **O12.2**: Eine Übersichtstabelle soll die Anzahl der Fehler pro Ressource anzeigen
- **O12.3**: Detaillierte Fehler- und Warnungslisten sollen nach der Übersicht folgen

## Qualitätsanforderungen

### 13. Robustheit
- **Q13.1**: Das Tool muss fehlerhafte JSON-Dateien graceful handhaben --> Was ist damit gemeint?
- **Q13.2**: Parsing-Fehler sollen geloggt werden, ohne das gesamte Tool zu stoppen
- **Q13.3**: Fehlende Verzeichnisse sollen automatisch erstellt werden

### 14. Wartbarkeit
- **Q15.1**: Der Code soll gut kommentiert und strukturiert sein
- **Q15.2**: Validierungsregeln sollen erweiterbar sein
- **Q15.3**: Die Konfiguration soll flexibel und erweiterbar sein
