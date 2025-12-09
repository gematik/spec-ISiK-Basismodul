# ISiK Connect Kontext - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **ISiK Connect Kontext**

## ISiK Connect Kontext

# ISiK-Connect

Konnektivität und Sicherheit haben im Zusammenhang mit einem interoperablen Datenaustausch in und mit Krankenhäusern viele Facetten: Nutzer müssen authentifiziert sein, Berechtigungen müssen definiert und durchgesetzt werden, Daten müssen gegen Verfälschung geschützt und verfügbar sein, Datenänderungen müssen nachvollziehbar sein etc. Hierzu können Technologien wie z. B. [**SAML**](https://saml.xml.org/saml-specifications) oder [**UMA**](https://docs.kantarainitiative.org/uma/wg/rec-oauth-uma-grant-2.0.html) genutzt werden. Diese Technologien basieren auf einem etablierten und erprobten Stack aus Standards wie [**ReST Representational State Transfer**](https://restfulapi.net/), [**OAuth2**](https://oauth.net/2/) oder , [**OpenID Connect**](https://openid.net/developers/specs/). Diese Standards sind domänenunabhängig spezifiziert und müssen daher für den Einsatz im deutschen Gesundheitswesen und ggf. auch für das Zusammenspiel mit dem HL7 FHIR-Standard profiliert werden. FHIR bietet hierzu unterstützende Ressourcen wie z. B. [**Consent**](https://hl7.org/fhir/R4/consent.html), [**AuditEvent**](https://hl7.org/fhir/R4/auditevent.html) oder [**CompartmentDefinition**](https://hl7.org/fhir/R4/compartmentdefinition.html) an, die eine Bindung zwischen FHIR und dedizierten Sicherheitsstandards herstellen können. Im Fall von ISiK sind zusätzlich im deutschen Gesundheitswesen bereits definierte Bausteine der Gesundheitstelematik wie z. B. sektorale Identitätsdienste oder Konnektoren/TI-Gateways zu berücksichtigen, die idealerweise für die Authentifizierung an Patienten- und Zuweiserportalen, dem Schutz von Gesundheitsdaten im Krankenhaus, einem Ende-zu-Ende gesicherten Datenaustausch mit Niedergelassenen und anderen potenziell ISiK-relevanten Themen genutzt werden sollen.

**Autorisierung von Zugriffen auf FHIR Ressourcen**

Ziel der vorliegenden Spezifikation ist es, per FHIR RESTful API formulierte Anfragen an einen Ressourcen-Server unter Nutzung eines zuverlässigen und sicheren Autorisierungsprotokolls - und damit unter Berücksichtigung von vergebenen Berechtigungen und formulierten Sicherheitsmechanismen - zu beantworten. Hierzu werden Teile des von **SMART Health IT** und **Boston Childrens Hospital** auf Basis des OAuth2-Standards definierten, von HL7 als Teil des FHIR-Standards übernommenen [**‘SMART on FHIR’ API**](https://smarthealthit.org/smart-on-fhir-api/) profiliert, so dass diese im Kontext der bestehenden ISiK-Festlegungen nutzbar sind. Das SMART-on-FHIR-API soll die Weiterentwicklung von **Electronic Health Records** (EHR) zu Plattformen befördern, bei denen - analog zu mobilen Plattformen wie iOS oder Android - Anwendungen aus einem **App Store** in eine solche Plattform eingebracht und dort in einer sicheren Umgebung ausgeführt werden (**“SMART App Launch”**).

Die normativen Festlegungen des Moduls ISiK Connect sind im Wesentlichen der Seite zu den zu entnehmen. Diese sind durch die bestätitungsrelevanten Akteure umzusetzen. In den weiteren Abschnitten folgt zunächst eine Einführung in das Thema SMART on FHIR. Zudem werden weitere Implementierungshinweise geliefert.

### SMART on FHIR

Technische Systeme können in einer SMART-on-FHIR-konformen Umsetzung eines Autorisierungssystems eine oder mehrere der folgenden Rollen einnehmen:

* Ressourcen-Server: IT-Systeme stellen in dieser Rolle geschützte Ressourcen über FHIR-RESTful-Endpunkte bereit oder nehmen geschützte Ressourcen über FHIR-RESTful-Endpunkte entgegen.
* Client: IT-Systeme in dieser Rolle fragen geschützte Ressourcen von Ressourcenservern ab oder senden geschützte Ressourcen an Ressourcen-Server.
* Autorisierungsserver: IT-Systeme in dieser Rolle stellen für authentifizierte Nutzer Sicherheitstoken aus, die einen Zugang zu auf Ressourcenservern verwalteten FHIR Ressourcen autorisieren.
* App-Launcher: IT-Systeme in dieser Rolle können einen Client aus ihrem eigenen Sicherheitskontext initialisieren oder in einen neu aufgesetzten Kontext stellen. Der Kontext kann z. B. der aktuell ausgewählte Patient oder Behandlungsfall sein.

Ein IT-System im Krankenhaus kann mehrere der genannten Rollen einnehmen. Beispielsweise kann ein KIS selbst Ressourcen bereitstellen (“Ressourcen-Server”), Ressourcen von spezialisierten Subsystemen abrufen (“Client”), die Autorisierung von Nutzern durchführen (“Autorisierungsserver”) und weitere Anwendungen aus dem aktuellen Nutzer- und/oder Patientenkontext heraus starten (“App-Launcher”). Durch eine solche Integration verschiedener Rollen kann ein KIS einen **Electronic Health Record** im Sinne von **SMART on FHIR** darstellen und damit als Plattform für wiederverwendbare, austauschbare und dynamisch startbare Anwendungen (**SMART Apps**) fungieren.

Hieraus ergeben sich die für das Modul ISiK Connect.

### SMART App Launch

ISiK-Connect soll durch eine wie oben skizzierte Integration verschiedener Systemrollen eine Umsetzung des als Teil des SMART-on-FHIR-API definierten [HL7 Implementierungsleitfadens**Smart App Launch**](https://hl7.org/fhir/smart-app-launch/STU2.2/index.html) ermöglichen. Ziel des **Smart App Launch** ist es, ein Zugriffstoken von einem OAuth2-kompatiblen Autorisierungsserver zu erhalten, mittels dessen ein Client eine FHIR-RESTful-Interaktion gegen einen Ressourcen-Server durchführen kann. Dies erfolgt unter Berücksichtigung der vorab festgelegten Zugriffsrechte der Benutzer, die sich z. B. aus deren Rollen oder anderen Nutzerattributen ableiten können. Um ein Zugriffstoken zu erhalten und mit diesem als Autorisierungsnachweis auf einen Ressourcen-Server zuzugreifen, sieht der **Smart App Launch** die in der nachfolgenden Tabelle aufgeführten Schritte vor. Die Kreuze geben an, welche der oben beschriebenen logischen Bausteine an dem jeweiligen Schritt beteiligt sind.

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | Aufsetzen der Vertrauensbeziehungen | X | X | X |   |
| 2 | Starten des Clients im Launch-Kontext |   | X | (X) | X |
| 3 | Abruf der SMART-Konfiguration | X | X |   |   |
| 4a | Autorisierungsanfrage des Clients |   | X | X |   |
| 4b | Prüfung der Anfrage und Ausgabe des Codes |   | X | X |   |
| 5 | Austausch des Codes gegen ein Zugriffstoken |   | X | X |   |
| 6 | Autorisierte ReST-Interaktion | X | X | (X) |   |
| 7 | Neuausstellung eines Zugriffstokens |   | X | X |   |

Eine Übersicht des zusammenhängenden **SMART App Launch** ist dem Abschnitt zu entnehmen.

## Vorgaben zur Autorisierung in ISiK Connect

Wie aus der Tabelle zu ersehen, betrifft das Gros der SMART-on-FHIR-Spezifikation das Zusammenspiel der Systeme in den Rollen des Clients und des Autorisierungsservers. Dieses wird zusätzlich stark geprägt durch den Kontext aus welchem bzw. in welchen der Client - d. h. die wiederverwendbare, austauschbare, modulare Anwendung - dynamisch gestartet wird:

* [SMART App Launch - EHR Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#step-2-launch-ehr): Ein Client kann aus dem Kontext eines anderen Systems (das dann in der Rolle des App-Launchers agiert) direkt innerhalb einer bestehenden **User Session** gestartet werden, beispielsweise indem der eingeloggte Benutzer den Client startet und dieser durch das System in einer neuen Browserinstanz oder einem eingebetteten **iframe** geöffnet wird.
* [SMART App Launch - Standalone Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#launch-app-standalone-launch): Clients, welche außerhalb eines anderen Systems gestartet werden (z.B. Mobile Apps welche Daten von einem ISiK-Ressourcen-Server abfragen möchten), müssen ihren Kontext explizit über eine Nutzerinteraktion gegen eine als ISiK-App-Launcher fungierende Komponente aufbauen. Dieses kann beispielsweise ein Widget zur Auswahl des zu aktivierenden Patientenkontextes sein.

Beide Launch-Sequenzen bedingen eine weitreichende Integration von Autorisierungsserver und App-Laucher, die gemeinsam den Launch-Kontext des Clients bestimmen und verwalten. Diese starke Kopplung lässt sich nur schwer mit den in den beschriebenen Zielen vereinbaren und erschwert den Einsatz marktüblicher Produkte oder Open-Source-Bibliotheken für den Aufbau eines IAM-Subsystems. **Daher werden in Modul ISiK Connect zunächst nur Interaktionen gegen Systeme in der Rolle eines Ressourcenservers definiert, der ISiK-relevante FHIR RESTful APIs anbietet. Diese Ressourcen-Server sind in ISiK Connect bestätigungsrelevant und werden im Folgenden als ‘ISiK-Ressourcen-Server’ bezeichnet.** Die Vorgaben umfassen dabei insbesondere die SMART-Konfiguration (Schritt 3) sowie die Syntax und Semantik der über das Zugriffstoken vermittelten Autorisierungen (Schritt 6).

Diese in ISiK Connect vorgenommene Profilierung des SMART-on-FHIR-API fokussiert somit auf die Absicherung der bereits in anderen ISiK Modulen betrachteten FHIR-Ressourcen wie z. B. **Patient**, **Encounter** oder **Observation**, macht den Herstellern und Krankenhäusern hierbei aber weder Vorgaben zu konkreten Berechtigungsmodellen/-regeln oder dem Zuschnitt der zum Identitäts- und Berechtigungsmanagement (IAM) einzusetzenden Produkte. Hersteller bestätigungsrelevanten Systemen werden durch die vorliegende Spezifikation in die Lage versetzt, eine konforme Erweiterung der bestehenden Implementierung zu erstellen und eine (Teil-)Konformität zu ISiK-Connect zu gewährleisten, ohne dass hierzu tiefgreifende systemische Änderungen an der bestehenden Autorisierungs- und Authentifizierungsinfrastruktur erforderlich sind.

Für ISiK Connect werden keine normativen Festlegungen getroffen, die andere Profile auf dem **OAuth2**-Standard wie z. B. **IHE IUA** grundsätzlich ausschließen. Dies soll es Krankenhäusern erlauben, für die Absicherung gegen externe Zugriffe (z. B. ausgehend von einem Patientenportal) und für die Autorisierung interner Zugriffe (z. B. zur Implementierung der Orientierungshilfe Krankenhausinformationssysteme (OH KIS)) unterschiedliche Standardprodukte einzusetzen, die jeweils auf die spezifischen Anforderungen zugeschnitten sind.

## Informative Hinweise zur weitergehenden Umsetzung von SMART on FHIR

Für Hersteller von Autorisierungsservern, **SMART Client-Apps**, KIS sowie Patienten- und Zuweiserportalen kann es attraktiv sein, ihre Lösungen über die in ISiK Connect normativen API-Aufrufe gegenüber ISiK-Ressourcenservern hinaus am SMART-on-FHIR-Standard auszurichten. Auch Krankenhäuser können von den grundlegenden Ideen hinter **SMART on FHIR** profitieren, z. B. indem funktionale Module von Drittherstellern über einen **Smart App Launch** einfacher in bestehende Systemlandschaften integriert werden können.

ISiK Connect unterstützt dies, indem die Integration der bestätigungsrelevanten Systeme und Schnittstellen in das gesamte SMART-on-FHIR-Ökosystem als informative Ergänzung beschrieben wird. Im Abschnitt werden die kompletten Interaktionen zwischen EHR (KIS, Portal), **SMART Apps**, Autorisierungsserver und Ressourcenservern auf Basis der aktuellen Fassung des SMART-on-FHIR-Standards beschrieben. Diese Beschreibungen sind informativ, da sie aktuell nicht Gegenstand der ISiK-Konformitätsfeststellungen sind und da sie - zumindest in Teilen - auch über den Standard hinausgehende Good Practices beinhalten. Um den Lesern dieser Spezifikation die Unterscheidung zwischen normativen und informativen Bestandteilen von ISiK Connect zu erleichtern, sind alle Seiten mit bestätigungsrelevanten Inhalten deutlich mit dem Label “Normativ” im Seitenkopf gekennzeichnet.

