# Scope des Moduls

## 1. Zielsetzung

Dieser Leitfaden beschreibt eine standardisierte Methode zur Autorisierung von Systemen und Benutzern im Krankenhausumfeld. Zusätzlich kann auch das Thema Authentifizierung als wichtiger Bestandteil betrachtet werden. Das Ziel besteht darin, eine sichere und interoperable Lösung für die Identitäts- und Zugriffskontrolle zu ermöglichen.

Im Rahmen dieses Implementation Guide (IG) wird zunächst der Schwerpunkt auf die Integration von Patientenportalen gelegt. Insbesondere sollen folgende Anwendungsfälle adressiert werden:

#### Sichere Authentifizierung des Patienten  
Ein Patient registriert sich im Patientenportal und wird dabei eindeutig als berechtigter Nutzer/Patient authentifiziert. Dies stellt sicher, dass die im Portal aufgerufenen medizinischen Daten tatsächlich dem richtigen Patienten zugeordnet sind. Die erfolgreiche Authentifizierung bildet die Grundlage für den sicheren und datenschutzkonformen Abruf persönlicher Gesundheitsinformationen aus dem patientenführenden System.

#### Patient greift auf medizinische Daten zu  
Ein Patient meldet sich im Patientenportal an und ruft dort seine Befunde, Arztbriefe oder Laborergebnisse ab, die aus einem Krankenhausinformationssystem (KIS) oder einem anderen medizinischen System stammen.

### Technische und konzeptionelle Aspekte  

Darüber hinaus sollen folgende technische und konzeptionelle Aspekte adressiert werden:

- **Integration der Client-Systeme über ein sicheres Autorisierungsprotokoll:**  
  Standardisierte Nutzung eines Protokolls zur sicheren Autorisierung und Authentifizierung.  

- **Einbindung von Identitätsanbietern (IdPs):**  
  Untersuchung, wie Identity Provider (IdPs) genutzt werden können, um die Authentifizierung, insbesondere für Patienten, zu verbessern und eine nahtlose Integration in bestehende Systeme zu ermöglichen.  

- **Schaffung eines einheitlichen Verständnisses der Begrifflichkeiten:**  
  In der Praxis werden Begriffe wie Identity Provider (IdP), Autorisierungsserver, Ressourcenserver usw. oft uneinheitlich oder falsch verwendet. Der IG soll eine klare, standardisierte Definition zentraler Begriffe bieten, um Missverständnisse zu vermeiden und eine konsistente Kommunikation zwischen Akteuren zu ermöglichen.  

## 2. Zielgruppe  

- **Softwarehersteller:** Entwickler von Krankenhausinformationssystemen (KIS), Patientenportalen und klinischen Anwendungen.  
- **Krankenhaus-IT-Abteilungen:** Verantwortliche für IT-Sicherheit, Benutzerverwaltung und Systemintegration.  

## 3. Technischer Umfang  

- **Basierend auf "SMART on FHIR":** Nutzung zentraler Konzepte des SMART on FHIR Implementation Guides, insbesondere für OAuth2-basierte Autorisierung und OpenID Connect für Authentifizierung.  
- **Unterstützung von OAuth2 & OpenID Connect:** Nutzung bewährter Sicherheitsstandards für den Zugriff auf medizinische Systeme.  
- **Einbindung des Gematik-IdP:** Es soll geprüft werden, inwiefern der Identitätsprovider (IdP) der Gematik genutzt werden kann, um eine einheitliche, sichere und benutzerfreundliche Authentifizierung für Patienten und Leistungserbringer zu ermöglichen.  

## 4. Einschränkungen  

- **Kein Fokus auf Datenspeicherung:** Dieser IG beschreibt keine Vorgaben zur Speicherung von Nutzerdaten oder Berechtigungen in den jeweiligen Systemen.  
- **Keine Definition von FHIR-spezifischen Profilen:** Der IG behandelt primär Autorisierung und Authentifizierung und legt keine neuen FHIR-Profile fest.  

## 5. Abhängigkeiten & Referenzen  

- **SMART on FHIR:** Der IG stützt sich auf etablierte Konzepte des SMART on FHIR IG zur Autorisierung und Authentifizierung.  
- **FHIR R4:** Kompatibilität mit FHIR R4 wird sichergestellt.  
- **OAuth2 & OpenID Connect:** Verwendung dieser Standards zur sicheren Autorisierung und Authentifizierung.  
