# Konzept Patient merge (WIP)
## Table of Contents

1. [Motivation und Hintergrund](#motivation-und-hintergrund)
2. [Ziele](#ziele)
3. [Stakeholder und User](#stakeholder-und-user)
4. [Randbedingungen](#randbedingungen)
   - [Technische Randbedingungen](#technische-randbedingungen)
   - [Organisatorische Randbedingungen](#organisatorische-randbedingungen)
5. [Konventionen](#konventionen)
6. [Kontextabgrenzung](#kontextabgrenzung)
   - [User und Systeme](#user-und-systeme)
   - [Kontext der Festlegung](#kontext-der-festlegung)
   - [Patient Data Journey](#patient-data-journey)
7. [Lösungsstrategie](#lösungsstrategie)
   - [merge-inform](#merge-inform)
   - [merge (und match)](#merge-und-match)
8. [Use Cases](#use-cases)
   - [User Stories - Business](#user-stories---business)
   - [Use Cases - technisch](#use-cases---technisch)
      - [UC-01 - Patient merge](#UC-01-patient-merge)
9. [Priorisierte Liste weiterer Bedarfe an die Spezifikation](#priorisierte-liste-weiterer-bedarfe-an-die-spezifikation)
9. [Annex I](#annex-i---patient-journey)
9. [Annex II](#annex-ii---patient-data-journey)

## Motivation und Hintergrund
Im Rahmen von Krankenhausbesuchen umfassen u.a. die Aufnahme-Workflows regelmäßig die manuelle Bearbeitung von Patientenstammdaten. Daher ist hier das Risiko redundant persistierter Patientendaten stets vorhanden. Dies hat auch zur Folge, dass Zusammenführungen von Patientendaten in Krankenhäusern an der Tagesordnung stehen. Ein Standard, der sich dem Austausch von Patientendaten innerhalb eines Krankenhauses verschreibt, sollte daher auch das Thema der Patientendatenzusammenführung (Patient merge) abdecken. Ziel ist es, dass externe Clients merge-Vorgänge nachvollziehen und entsprechend verarbeiten können.

Bisher trifft ISiK keine Festlegung zum Patient merge. Aus diesem Grund ist die AG 'Patient merge' etabliert worden, die sich dem beschriebenen Thema im Rahmen von ISiK annehmen soll.

Dieses Dokument soll der Harmonisierung der Problemdefinition zum Patient merge in ISiK dienen. Änderungswünsche am Dokument per Pull Request sind willkommen. 

## Ziele
Ziel der Arbeiten im Rahmen der Ausbaustufe 4 ist:
Die Schaffung eines modulübergreifenden Implementierungsleitfadens zum Vorgehen bei der Patientenzusammenführung.
Die Patientendatenzusammenführung (Patient merge) bezeichnet den Workflow der Bereinigung redundanter Patienten-Instanzen innerhalb eines KIS oder einer KH-IT-Umgebung. Die Bereinigung geschieht erfahrungsgemäß als halbautomatisierter Prozess, für den dedizierte Komponenten eingesetzt werden können.

Für die Implementierung ist dabei noch zu entscheiden, zu welchem Vorgang die Spezifikation eine mögliche Festlegung treffen sollte:

1. Eine Festlegung zum Patient merge-Prozess selbst unter Einbeziehung unterschiedlicher Systeme, oder
2. Eine Festlegung zur Kommunikation eines stattgefundenen Patient merges gegenüber einem Subsystem oder einem externen Service.

Die genauere Zielstellung sollte unter Einbeziehung der Stakeholder in der ersten Projektphase detailliert und festgelegt werden.

## Stakeholder und User
Die Spezifikation richtet sich insbesondere an SW-Hersteller von KIS und Patientenportalen. Alle anderen Hersteller von ISiK-nahen Systemen sind auch eingeladen sich zu beteiligen, da ihre Prozesse potenziell betroffen sein werden.

Es handelt sich um eine technische Spezifikation, zu der keine weiteren medizinischen Fachexperten zu Rate gezogen werden müssen.

## Randbedingungen
### Technische Randbedingungen
In den bisherigen ISiK Spezifikationen bestehen keine expliziten Festlegungen, wie mit dem Zusammenführen von Patientendaten umzugehen ist.

Grundsätzlich stellt sich die Frage welche Vorgänge im Rahmen eines Patient merge Workflows Teil der Festlegung in einer zukünftigen Spezifikation sein sollten. Neben der in der Zielstellung beschriebenen Unterscheidung zwischen den merge-Workflows (merge) und der Kommunikation des merge-Prozesses (merge-inform), lassen sich weitere Aspekte anführen, die auch einzeln betrachtet werden können:

* Patient.link - ein FHIR-Mechanismus der sich auch zum referenzieren unterschiedlicher (ggf. obsoleter) Patienten-Instanzen eignet
* match - Der Abgleich zweier Patienten-Instanzen (dies wird immer Voraussetzung für den eigentlichen Bereinigungs-Workflow, also das merge, sein) mit dem Resultat einer Übereinstimmung oder dem Erkennen zwei verschiedener Patienten
* merge in HL7v2 - hier existieren eine Reihe von ADT-Nachrichten mittels derer ein Patient merge (link, match, merge-inform etc.) implementiert werden kann

Im Kontext des letztgenannten Aspekts muss auch geklärt werden, ob beim Festzulegenden eine Schnittstelle zur Überführung von v2-getriebenen merge-Prozessen in ein query-getriebenes (REST-)Paradigma zu priorisieren wäre. Ein exemplarischer Use Case für letzteres wäre:

* Ein Subsystem erkennt (query-getrieben) eine Änderung einer Patienten-Ressource nach einem Patient merge im KIS, um daraufhin in eigenen Ressourcen mittels Patient-ID (PID) auf die korrekte FHIR-Ressource / Patienteninstanz referenzieren zu können. (Das System wäre damit nicht mehr auf die erfolgreiche Übermittlung einer entsprechenden PUSH-Nachricht angewiesen).

Um die Problemdefinition besser abzugrenzen, treffen wir folgende Annahmen:

* Operationen zum merge-Verhalten sind in HL7-v2 gelöst und werden durch verschiedene KIS entsprechend umgesetzt.
   * hierbei orientieren wir uns an HL7 v2.3 (http://www.hl7.eu/HL7v2x/v23/std23/ch3.htm#Heading43), da wir annehmen, dass für diese Version die Verbreitung in deutschen Krankenhäusern am größten. 
* Ebenso existieren Lösungen und Operationen in FHIR (Patient-link, $match (R4) und $merge (R5)).
* Neben der Patient-Ressource sollte auch der Encounter für den merge-Prozess prioritär berücksichtigt werden

Neben den genannten Standards, existieren auch relevante IHE-Standards - diese sind u.a.:
- PIX (Patient Identifier Cross-referencing) - https://profiles.ihe.net/ITI/PIXm/index.html
- PAM (Patient Administration Management) - https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14
- XCPD (Cross-Community Patient Discovery) - https://profiles.ihe.net/ITI/TF/Volume1/ch-27.html#27
- PDQ (Patient Demographics Query)
- MHD (Mobile access to Health Documents)

Insbesondere PIX ist für den gesamten Patient-merge-Prozess relevant, aber auch PAM - für Kontexte der provisorischen [Instanz-Erzeugung](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.2) und das [Kontakt-Management bzw. die Fachabteilungs-Überweisung](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.2.1). Für Aspekte des Patient matching ist insbesondere XCPD (Cross-Community Patient Discovery) relevant.

### Organisatorische Randbedingungen
Es gelten die Fristen wie in anderen Modulen.

Die Konsentierung der Use Cases soll auch eine rein asynchrone Mitarbeit erlauben. Dies schließt eine asynchrone Entscheidungsfindung ein.

### Konventionen
Die Draft-Dokumente werden auf github zur Diskussion gestellt.

Pull Requests, die grundsätzliche Änderungen bewirken, sollten in der Regel im Rahmen der AG angekündigt und ggf. diskutiert werden.

## Kontextabgrenzung
### User und Systeme
Zu berücksichtigende User sind
* Krankenhausmitarbeiter (MFAs, Ärzte etc.)
* Patienten (nur bei Nutzung Patientenportal, z.B. Terminplanung)

Beteiligte Systeme sind prinzipiell alle bestätigungsrelevanten Systeme (siehe [DKG Festlegung](https://www.dkgev.de/themen/digitalisierung-daten/elektronische-datenuebermittlung/datenuebermittlung-nach-373-sgb-v-informationssysteme-im-krankenhaus/)). Hervorzuheben sind dabei:

* KIS

Zudem sind hervorzuheben als mögliche Clients, Subsysteme (oder ggf. Drittanbieter-Systeme außerhalb der Krankenhausumgebung):

* Patientenportale

Eine im Zuge des merges genutzte Komponenten ist ein Master Patient Index (MPI). Die Nutzung von MPIs in Krankenhäusern wird bei Use Cases (s.u.) mitbedacht.

### Kontext der Festlegung
Die Spezifikationsarbeit schließt die Festlegung oder Definition neuer Identifier (analog zu gID, eID etc.) aus. Es kann lediglich darum gehen, technische Verfahren und organisatorische Mechanismen aufzuzeigen und festzulegen, die mit gegebenen Patienten-Identifiers (PID) innerhalb einer Organisation operieren.

Diese Verfahren oder Maßnahmen können nur für eine Institution gelten. Die Zusammenführung von Patientendaten zwischen unterschiedlichen Institutionen ist nicht im Scope der AG 'Patient merge' enthalten.

Die genauere Problemdefinition und Anforderungserhebung unter Einbeziehung der interessierten Stakeholder ist selbst Teil der der Projektarbeit (erste Projektphase).

### Patient Data Journey

Um die Regelungsbedarfe rund um den Patient merge genauer zu verstehen, ist die Analyse der Patient Journey, die möglichst viele Patientenattribute und die unterschiedlichen "Etappen" des Patienten durch das Krankenhaus erfasst, zunächst nicht zielführend (siehe dazu [Annex I](#annex-i---patient-journey)), da zu abstrakt gegenüber dem technischen Regelungsbedarf.

Vielmehr, so die Annahmen, sollte es zunächst darum gehen eine Sicht auf die Synchronisierungsbedarfe zu legen, die zwischen unterschiedlichen Systemen bei Manipulationen einer Patienten-Instanz bestehen (in diesem Sinne ist es präziser hier von einer Patient Data Journey als von einer Patient Journey zu sprechen). Diese kann mittels folgendes, vereinfachenden Szenarios erfasst werden:

Gegeben seien zwei Systeme, die beide Patientendaten speichern können - auch von denselben Patienten. Patientendaten bestehen nur aus einem Attribut X, logischer ID sowie einer Geschäfts-ID (PID), wobei nur die logische ID innerhalb eines Patientendatensatzes in beiden Systemen erforderlich ist. Beide Systeme verwenden ihre eigene logische ID, die niemals manuell eingegeben wird und daher immer von einem der Systeme zugewiesen wird. Nur ein System kann vom Krankenhauspersonal Eingaben empfangen (System A), das andere nur vom Patienten (System B).

Basierend auf dem beschriebenen Szenario sind die möglichen Datenmanipulationen unterscheidbar, die eine Synchronisation zwischen den beiden Systemen (System A und System B) erfordern würden (und damit ggf. auch einen Regelungsbedarf durch die ISiK Spezifikation). Für eine ausführliche Liste der Szenarien siehe [Annex II](#annex-ii---patient-data-journey).

Im Rahmen von ISiK ist es entscheidend Schnittstellen und Abläufe für einige aus diesem Szenario abgeleiteten Fälle festzulegen, um sicherzustellen, dass Patientendaten in allen Systemen konsistent bleiben. Dabei ist zunächst auszuwählen welche Szenarien anhand feingranularer Use Cases (siehe unten) genauer zu beachten sind.

## Lösungsstrategie
Vor der Entwicklung einer Lösungsstrategie, die eine Auswahl konkreter Bedarfe benennt, müssen zunächst Ziel- und Problemdefinition besser ausgearbeitet werden. Dennoch lassen sich grundsätzliche Lösungsszenarien nennen.

Zunächst sollte für jedes bestätigungsrelevante System der Umfang des Festzulegenden einzeln bestimmt werden.

Allgemein sollte im Zuge des Patient merge auch eine Ablösungsstrategie zu Hl7 v2 festgehalten werden - zwar nicht als ein Ausschluss des bestehenden Standards - dieser wird vermutlich noch weitere Jahre produktiv sein -, zumindest aber als perspektivische Alternative zur Einbindung von externen Dienst im Sinne eines Best-of-Breed-Ansatzes auf FHIR-Basis - z.B. bei Patientenportalen (s.u.).

### Bestehende Standards
Neben geltenden Festlegungen in FHIR und HL7v2 sind bei der weiteren Problemdefinition auch die oben benannten IHE-Profile zu berücksichtigen

### merge (und match)
Eine erste Spezifikation zum Patient merge sollte nicht auf eine vollumfängliche Abdeckung der Workflows zum Patient merge zielen.

Sollte die Festlegung eines merge-Verhaltens auf FHIR-Basis als Zieldefinition konsentiert werden, sollte auf bestehende Festlegungen im FHIR Kontext zurückgegriffen werden.

Da ein merge immer einen Abgleich von Ressourcen voraussetzt, wäre der Ansatz, zunächst eine match-Operation festzulegen (womöglich als eine erste normative Festlegung eines IGs).

Zudem stellt FHIR Version R5 eine dezidierte Operation bereit (siehe https://hl7.org/fhir/patient.html#merge, insbesondere Operation "merge").

Im Kontext von Hl7 v2 sind zur Bereinigung von Duplikaten und Fehlzuordnungen folgende Mechanismen zu beachten:
- merge patient/account/visit: Zusammenführen von zwei Patientenstämmen, Abrechnungsfällen bzw. Aufenthalten in einem System und den abhängigen Subsystemen
- move patient/account/visit information: Verschieben eines Patienten zu einem anderen "Master-Patienten", Verschieben eines Abrechnungsfalls zu einem anderen Patienten bzw. Verschieben eines Aufenthalts zu einem anderen Abrechnungsfall etc.

Hier sind auch die IHE Profile PIX, PAM und XCPD zu beachten.

### merge-inform
Sollte allein die Festlegung zum merge-inform als Zieldefinition konsentiert werden, sollten auch bestehenden Mechanismen aus HL7v2 berücksichtigt werden.

Zum merge-Inform könnten Lösungsansätze sein:
- FHIR-Messaging
- (Topic-Based-)Subscription
- passiv über Link-Element in REST-Ressource.

## Use Cases

In folgendem wird zwischen User Stories (Business-Seite) und Use Cases (technisch) unterschieden.

User Stories sollen dazu dienen die Bereiche der Bedarfsanalyse grob abzudecken, daraufhin zu präzisieren und die Problemdefinition zu schärfen. Bei User Stories stellt sich zunächst die Frage: Wo entsteht der Bedarf nach einem Patient merge?

Unsere Annahme ist, dass uns zur Schärfung der Problemdefinition zunächst eine Sicht auf die involvierten Komponenten-Arten hilft – zum Beispiel:

- KIS (Interface mit Mitarbeiter)
- Subsystem (ggf. PDMS mit Interface zu trackender HW - z.B. Spritzenpumpe/Infusionspumpe)
- Patientenportal (Interface zu Patient)

Diese Systeme können stellvertretend für Komponenten-Arten stehen, die eine Interaktion mit einem spezifischen User oder eine automatisierte Form des Daten-Inputs vorweisen.

Die Präzisierung der Frage nach dem "Wo?" wäre daher: Was für ein spezifischer Bedarf an ein Patient merge ergibt sich bei verschiedenen Komponentenarten aufgrund der unterschiedlichen Art des Inputs (nach Rolle des Users oder automatisiert/händisch)?

Jenseits der komponentenzentrierten Sicht  wäre es zusätzlich möglich zur Identifikation weiterer User Stories die eigentliche Patient Journey (siehe Annex I) zu analysieren in Hinblick auf die Frage wo ein Patient merge wünschenswert wäre.

### User Stories - Business

Zur Konkretisierung der Frage, lassen sich verschiedene User Stories erzählen, für die jeweils die Frage zu beantworten wäre: Was für ein spezifischer Bedarf an ein Patient merge ergibt sich in diesem Szenario?

Drei User Stories beschreiben exemplarisch die grundlegenden Kontexte, in denen der Bedarf nach einem Patient merge entsteht – mit unterschiedlicher Komponenten für die User-System Interaktion:

- US-01 - Terminbuchung Patientenportal:
   - Eine Patientin bucht über ein Patientenportal einen Termin bei einem Krankenhaus.
- US-02 - händische Patientenaufnahme:
   - Ein KH-Mitarbeiter legt bei der Patientenaufnahme eines Patienten in einem KIS händisch eine Patienteninstanz an.
-  US-03 - Anlegen in Subsystem: 
   - Eine MFA der Intensivstation legt eine Instanz für den Patienten im PDMS an, sodass andere KH-Mitarbeiterinnen in Zukunft vom KIS die Herzfrequenz abfragen können.

Für US-01 und US-02 sollte der Fall berücksichtigt werden, dass eine lokale Instanz eines Subsystems bei Update mit zusätzlichen Informationen auf den Status 'aktiv' überprüft wird. Dieser Fall sollte für alle UCs (s.u.) und alle Komponenten (Subsystem-Typen - ggf. aus ISiK) bedacht werden.

### US-01: Terminbuchung Patientenportal
Bei US-01 kann man differenzieren zwischen Fällen, in denen ein externes Patientenportal angeschlossen ist und eine hausinterne Komponente verwendet wird. Weiterhin könnte man in diesem Sinne differenzieren zwischen fachspezifischen und internen Terminplanungs-Systeme, z.B. für OP-Planung oder Strahlentherapie-Planung.

Eine Ablauf-Darstellung der Terminbuchung mit Patientenportal ist im folgenden [GITHUB Issue](https://github.com/gematik/spec-ISiK-Basismodul/issues/264#issuecomment-1553022809) vorgestellt worden. 

Bereits an dieser Stelle lässt sich eine erste funktionale Anforderung (REQ) festhalten:

**REQ-002**: "Ein Termin-Repository MUSS einen Benachrichtigungsmechanismus bereitstellen, der einen Termin-Requestor über erfolgte Patient merges informiert."

### US-02 - händische Patientenaufnahme
Eine händische Aufnahme kommt vor, wenn z.B. ein Patient eine Karte vergessen hat.
Auch ein Fall sind bereits gedruckte Etiketten (z.B. im Kontext von Labor-Informations-Systeme - LIS), sodass alle im Umlauf befindlichen IDs verfügbar sein müssen.
Diese Story ist auch relevant für Patientenportale.

### US-03 - Anlegen in Subsystem
Nach Praxiserfahrung kommt es durchaus vor, dass eine Instanz ad-hoc in einem PDMS angelegt wird (mit eigener ID), ohne dass ein merge mit einem KIS/Patientenführenden-System gewährleistet werden kann.

Hier besteht womöglich der Bedarf nach einem vom KIS unabhängigen PDMS.

### Fazit zu User Stories
Wir nehmen an, dass für US-02 und US-03 es in der Regel dem KIS intern überlassen ist wie es einen Merge regelt oder nicht. Daher wären diese User Stories aus ISiK-Sicht nicht prioritär. Z.B. wenn im KIS händisch eine Aufnahme erfolgt, muss das System entscheiden, wie die Patient-Ressource erstellt wird. Wenn das KIS intern merged und direkt die richtige Ressource herausgibt, besteht keine Notwendigkeit für einen Merge oder ein Merge-Event.

In diesem Sinne wäre US-01 für die folgende Entwicklung technischer Use Cases zum Patient merge zu priorisieren, wobei als externer Client nicht nur ein Patientenportal zu berücksichtigen ist, sondern auch sonstige Client-Systeme die auf ISiK-Schnittstellen zugreifen.

### Use Cases - Technisch
Aus einer Perspektive der Workflows lassen sich weitere Use Cases (UCs) ausdifferenzieren.

In der Interaktion mit einem System, das Patientendaten verwaltet, lassen sich zunächst zwei UCs feststellen, die direkt Aspekte des Patientendatenzusammenführung betreffen:

- Erzeugen einer neuen Patienten-Instanz (Vorbedingung)
- und das Mergen einer Instanz

Dabei darf die merge-Interaktion nur von KH-Mitarbeitern mit dedizierten Rechten durchgeführt werden (nie von Patienten selbst). Auch vollständig automatisierte merge-Vorgänge sind möglich, bestenfalls sind sie die Regel.

An den beschriebenen Haupt-Use-Case grenzen weitere. Wobei nicht alle gelisteten Use Cases von einer technischen Festlegung betroffen sein sollten.

Besondere Beachtung sollten folgenden UCs erhalten:

* **UC-00: Instanz anlegen**
   * *Beschreibung:* Anlegen einer Patienteninstanz. Vorbedingung für den Haupt-Use-case
   * *Akteure:* System (Server und eher kein Client?), Mitarbeiterin , Patienten (bei Portal)
* **UC-01: Patient-merge**
   * *Beschreibung:* Haupt-Use Case, der den Merge von Patientendaten im Krankenhauskontext darstellt.
   * *Akteure:* System, Mitarbeiterin
* **UC-02: match (Patientendatenabgleich)**
   * *Beschreibung:* Identifikation von potenziell zusammenzuführenden Patientendaten.
   * *Akteure:* System
* **UC-03: Inform about merge**
   * *Beschreibung:* Benachrichtigung über den erfolgten Merge an relevante Parteien.
   * *Akteure:* System
* **UC-04: Clearing**
   * *Beschreibung:* Manueller Bereinigungsprozess von Patientendaten nach einer erfolgreichen Identifikation von zusammenzuführenden Daten, die allerdings nicht automatisiert zusammengeführt werden konnten (aufgrund niedrigen Threshholds (bei MPI) oder von Konflikten)
   * *Akteure:* System, Mitarbeiterin
* **UC-05: Datenbereinigung**
   * *Beschreibung:* Bereinigung von Daten vor oder während des Merge-Prozess. 
   * *Akteure:* System, Mitarbeiterin
* **UC-06: Konfliktlösung**
   * *Beschreibung:* Wenn es Inkonsistenzen oder Konflikte zwischen den zu mergenden Daten gibt (z.B. unterschiedliche Blutgruppen), muss ein Mechanismus zur Konfliktlösung implementiert werden.
   * *Akteure:* System, Mitarbeiterin
* **UC-07: Meldung von Dateninkonsistenzen**
   * *Beschreibung:* Falls während des Merge-Prozesses Inkonsistenzen oder Unstimmigkeiten festgestellt werden, sollten Mechanismen zur Meldung und Bearbeitung dieser Probleme bereitgestellt werden.
   * *Akteure:* System, Mitarbeiterin
* **UC-08: Neu referenzieren**
   * *Beschreibung:* Verarbeitung und Update der Referenzen, der in einer Patienten-Instanz referenzierter Ressourcen oder auf diese Patienten-Instanz referenzierende Dokumente im Zuge des Patient-merge

Weiterhin sind relevant, sollten aber nicht teil einer normativen Spezifikationsabdeckung sein:

* **UC-09: Datenvalidierung**
   * *Beschreibung:* Vor dem Zusammenführen der Patientendaten müssen die Daten validiert werden, um sicherzustellen, dass sie korrekt und vollständig sind.
   * *Akteure:* System (ggf. Mitarbeiterin) 
* **UC-10: Historie verwalten (Audit-Trail)**
   * *Beschreibung:* Es ist wichtig, eine Historie der durchgeführten Merges zu führen, um nachverfolgen zu können, welche Daten zusammengeführt wurden und wann dies geschah, einschließlich der beteiligten Akteure und Zeitstempel.
   * Akteure: System
* **UC-11: Fehlerbehandlung**
   * *Beschreibung:* Es sollte ein Mechanismus zur Behandlung von Fehlern und Ausnahmesituationen implementiert werden, um sicherzustellen, dass der Merge-Prozess robust und fehlertolerant ist.
   * *Akteure:* System
* **UC-12: Datenschutz und Compliance**
   * *Beschreibung:* Sicherstellen, dass der Merge-Prozess den geltenden Datenschutzrichtlinien und -vorschriften entspricht, um die Privatsphäre und Sicherheit der Patientendaten zu schützen.
   * *Akteure:* Mitarbeiterin, System

![Use Case Diagram](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.github.com/gematik/spec-ISiK-Basismodul/Nachbereitung-AG/ImplementationGuide/markdown/UebergreifendeFestlegungen/Use-Case-Diagram.iuml)

Die im UC Diagram grün gekennzeichneten UCs sind besonders zu priorisieren, daher in Folge eine schematische Analyse.

Die hervorgehobenen Anwendungsfälle (UC-01, UC-02, UC-03) können Interaktionen mit externen Systemen oder Datenbanken beinhalten, um zusätzliche Patienteninformationen abzurufen (z.B. bei der Anbindung eines Patientenportals).

Ein weitere Sonderfall, der ggf. einzeln zu betrachten wäre, ist folgender:

* Ein Subsystem kommuniziert dem Primärsystem eine Änderung und möglichen Bedarf an Zusammenführung (operation / gegeben in V2?).

Use Cases werden je nach IT-Architektur einer Einrichtung abweichen. Man kann beispielsweise folgende Aspekte benennen:
* (monolithische) KIS-Systeme, die eine FHIR-Fassade nutzen, um den REST-Abfragen nach ISiK zu entsprechen (wird die Regel sein)
* Systeme, die einen (teil-)automatisierten Clearing-Mechanismus zur Zusammenführung von Patienten-Instanzen implementiert haben.
* Systeme, die einen Master Patient Index (MPI) implementiert haben, um in ihrer (heterogenen) IT-Landscape PIDs zu administrieren
* FHIR-nativen IT-Landscapes – diese gibt es in Deutschland vermutlich (noch) überhaupt nicht (jedoch ggf. angestrebt und sollten daher mitgedacht werden)

Die Analyse dieser Ausprägungen sollen zunächst keinen großen Stellenwert einnehmen, da wir uns einer IT-Architektur-neutralen Problemdefinition nähern möchten.

Weitere UCs in Zusammenhang mit den FHIR Ressourcen Encounter und Abrechnung sind folgende:

* bei der administrativen Aufnahme wird geprüft, ob der Patient im Haus bereits bekannt ist, oder ob ein neuer Patient angelegt werden muss
* bei der administrativen Aufnahme wird ein neuer Aufenthalt angelegt und einem in System bestehenden Patienten zugeordnet
* bei der administrativen Aufnahme wird geprüft, ob zu dem Patienten noch ein offene Abrechnungsfall besteht, dem der Aufenthalt zugeordnet werden muss, oder ob ein neuer Abrechnungsfall anzulegen ist
* bei der administrativen Aufnahme wird der neue Aufenthalt zu einem Abrechnungsfall zugeordnet
* sofern das Haus Fallakten unterstützt oder seine Berechtigungen analog der OH KIS organisiert, wird ein Aufenthalt bei der medizinischen Aufnahme einem medizinischem Fall zugeordnet oder es wird ein neuer medizinischer Fall angelegt.

Auch diesen UC Cases rund um derivierte/referenzierte/referenzierende Ressourcen zu Patient können erst in einem zweiten Schritt der Verfeinerung der Use Case Analyse genauer betrachtet werden.

Die folgende Liste der Use Cases entspricht der Priorisierung im Rahmen des Festlegungs-Vorhabens 'Patient merge'.

#### UC-01 Patient-merge
*Anwendungsfall-ID:* UC-01 

*Anwendungsfall-Name:* Patient merge (Zusammenführung von Patientenressourcen)

*Akteur:* Krankenhauspersonal, System

*Beschreibung (ausführlich):* 

Dieser UC beinhaltet den (komplexen) Prozess der Zusammenführung von Patientenressourcen innerhalb des KIS eines Krankenhauses (inklusive angeschlossener Subsysteme), um kohärente Patientenakten sicherzustellen. Dieser Prozess beinhaltet die Bereinigung von doppelten oder fragmentierten Patientendaten.

**REQ-001:** Ein bestätigungsrelevantes System (insbesondere KIS) muss sicherstellen, dass nach dem abgeschlossenen merge alle Instanzen über eine führende Referenz auffindbar sind.

Als kritisch und daher in einer Spezifikation abzudecken, ist der Sonderfall (UC noch anzulegen) für einen Patienteninstanz, die von einem Subsystem (besonders kritisch Patientenportal) erzeugt wird und einem KIS übergeben wird.

Zur Illustration können erneut User Stories dienen:
- Eine Patientin bucht über ein Patientenportal einen Termin bei einem Krankenhaus (s.o. US-01).
- Eine Ärztin sucht in einem KIS nach möglichen anamnestischen Daten und Vitalparametern eines Patienten, wobei dieser doppelt im KIS aufgenommen worden war.

Entsprechend der User Story 1. ließe sich der Fall folgendermaßen weiterentwickeln:
* Eine Ärztin gibt über eine Suchanfrage in der Maske Vor- und Nachnamen des Patienten an (Max Mustermann). Es erscheinen zwei Patienteninstanzen mit identischen Stammdaten (bis auf einen offensichtlichen Tippfehler).
* Die Ärztin führt die Patientendaten über einen Clearingmechanismus zusammen
* Das KIS sendet über einen Kommunikationsserver eine PUSH-Nachricht (Hl7 v2) an alle Subsystem (inklusive PDMS), um den Update-Status der Patienten-Ressource und den geschehenen merge zu informieren.
* Die Subsysteme verarbeiten die merge-informationen und updaten die entsprechende organisationsinterne Patienten-ID (PID)

Nun kommt ein Subsystem als Komponente hinzu (PDMS):
* Über eine Schnittstelle ruft die Ärztin sämtliche Körpertemperaturmessungen der letzten Tage des Patienten ab.
* Das KIS fragt über eine REST-Schnittstelle die entsprechenden Vitaldaten beim PDMS ab (über  Suchparameter "Patient" nach https://simplifier.net/guide/Implementierungsleitfaden-ISiK-Modul-Vitalparameter-Stufe-3/ImplementationGuide-markdown-Interaktionen?version=current )

Die User Story 1. (s.o. US-01) erweitert das System um die Komponente Patientenportal, diese ist Konsument von ISiK-Ressourcen und Diensten:
* Das Patientenportal erzeugt aufgrund der von der Patientin angegeben Fall- und Anamnese-Daten verschiedene FHIR-Ressourcen, die einer FHIR Patient Ressource (PatientMustermannPatientenportal) zugeordnet werden.
* Nach dem Synchronisierungsprozess der Terminbuchung zwischen Patientenportal und KIS des KHs wird die FHIR-Instanz PatientMustermannPatientenportal mit der im KIS vorhandenen Instance PatientMustermannKH im Rahmen eines Clearing-Prozesses unter Beteiligung einer KH-Mitarbeitern im KIS zusammengeführt zu PatientMustermannMerge.
* (extends) Die Referenzierten Ressourcen (FHIR Observations) werden (extrahiert und) und mit den zusammengeführten Daten von PatientMustermannMerge verknüpft
* Das Patientenportal erkennt (query-getrieben) eine Änderung von Patienten-Ressource nach einem Patient-merge im KIS (dies wäre anzusiedeln bei **UC-03: Inform about merge**)

*Voraussetzungen:* 
* Das Krankenhaus verfügt über ein funktionierendes Gesundheitsinformationssystem (KIS), das in der Lage ist, HL7-v2-Nachrichten und/oder FHIR-Operationen bzw. vergleichbare proprietäre Operationen zu verarbeiten.
* Es wurden identifizierte doppelte oder fragmentierte Patientenakten festgestellt, die zusammengeführt werden müssen.

*Nachbedingungen:* 

Die Patientenakten werden zusammengeführt, und eine vereinheitlichte, genaue Akte wird erstellt.

*Priorität:* Hoch

*Nutzungshäufigkeit:* Gelegentlich

*Normaler Ablauf:*
* Das Krankenhauspersonal startet den Zusammenführungsprozess über das KIS (ggf. Über das KAS).
* Das KIS ruft die für die Zusammenführung identifizierten Patientenakten ab.
* Das System analysiert die Akten auf potenzielle Duplikate anhand von Übereinstimmungskriterien (z. B. Name, Geburtsdatum usw.).
* Das System zeigt potenzielle Übereinstimmungen dem Krankenhauspersonal zur Überprüfung und Bestätigung an.
* Das Krankenhauspersonal überprüft und wählt die Akten aus, die zusammengeführt werden sollen.
* Das System führt die ausgewählten Akten zusammen und priorisiert Daten aus der genauesten und vollständigsten Quelle.
* Das System aktualisiert alle relevanten Verweise auf die zusammengeführte Patientenakte.

*Alternative Abläufe:*

Wenn keine identifizierten Duplikate vorhanden sind, benachrichtigt das System den Benutzer, und der Prozess endet.

*Ausnahmen:*

Bei technischen Problemen, die den Zusammenführungsprozess verhindern, wird eine Fehlermeldung generiert, und der Prozess wird abgebrochen.

*Includes (weitere UCs):* 
* In einer Fallunterscheidung lassen sich unterscheiden:
   * vollautomatisiertes matching und merging
   * vollautomatisiertes matching mit manuellem merge
   * (halb)automatisiertes matching mit vollautomatisiertem merge
   * Notification über match/merge durch ein Subsystem

*extends (weitere UCs):*
* tbd.


*Annahmen:* 
* Das KIS-System verfügt über die erforderlichen Funktionen zur Durchführung der Zusammenführung von Patientenakten.
* Das Krankenhauspersonal, das die Zusammenführung initiiert oder tätigt, verfügt über die entsprechenden Berechtigungen und Schulungen.

*Anmerkungen und Probleme:* 
* Patient merges sollten protokolliert werden, um Verantwortlichkeit und Rückverfolgbarkeit zu gewährleisten.

#### UC-02 - match (Patientendatenabgleich)

*Anwendungsfall-ID:* UC-02

*Anwendungsfall-Name:* match (Patientendatenabgleich)

*Akteur:* System, Krankenhauspersonal

*Beschreibung:* Der Use Case umfasst den Abgleich von Patientendaten innerhalb des Gesundheitsinformationssystems (KIS) eines Krankenhauses. Dabei werden entweder adäquate HL7-v2-Nachrichten oder die FHIR ($match)-Operation oder vergleichbare proprietäre Operationen verwendet, um potenzielle Duplikate oder fragmentierte Datensätze zu identifizieren.

#### UC-03 - Inform about merge

*Anwendungsfall-ID:* UC-03

*Anwendungsfall-Name:* Inform about merge (Abgleich und Benachrichtigung nach Merge)

*Akteur:* System

*Beschreibung:* Dieser Anwendungsfall beinhaltet die Benachrichtigung angeschlossener Systeme über den erfolgreichen Merge.

Siehe in FHIR https://build.fhir.org/patient-operation-merge.html#notification.

#### UC-XY
Sollten weitere UCs genauer erörtert werden?

## Priorisierte Liste der Use Cases nach Bedarf
Hier werden die UCs priorisiert.
Die Priorisierung entspricht Arbeitspaketen für die konzeptuelle Aufbereitung. Eine technische Umsetzung im Rahmen der Stufe 4 soll dabei explizit nicht für alle UCs angestrebt werden.

Für folgende UCs soll eine Festlegung in Stufe 4 angestrebt werden (Stand 13.10.2023):

1. **UC-03: Inform about merge**
   - Bedarfsmeldung im Rahmen der 1. AG Patient merge vom 10.10.2023 und [hier](https://chat.fhir.org/#narrow/stream/287581-german.2Fisik/topic/.5BBasis.5D.20Patient.20merge.20-.20Kick-Off)

Weitere UCs in priorisierter Reihenfolge:

1. **UC-08: Neu referenzieren**
   - Kommentar: ggf. ausarbeiten im Sinne der Kommunikation von geänderten Ressourcen
   - Bedarfsmeldung im Rahmen der 1. AG Patient merge vom 10.10.2023 und [hier](https://chat.fhir.org/#narrow/stream/287581-german.2Fisik/topic/.5BBasis.5D.20Patient.20merge.20-.20Kick-Off)
1. **UC-02: match (Patientendatenabgleich)**


## Priorisierte Liste weiterer Bedarfe an die Spezifikation
Hier werden Bedarfe an die Spezifikation vorgehalten, die nicht unmittelbar über die oben priorisierten UCs abgedeckt sind.

1. Definition von Best-Practices für den Client im Falle eigener Datenhaltung
1. ...

## Annex I - Patient Journey

Zur Abbildung der Patient Journey durch ein Krankenhaus kann ein typischer Prozess wie folgt skizziert werden, indem für die einzelnen Prozessschritte die jeweils relevanten ISiK Ressourcen neben Patient benannten werden:

- Terminvereinbarung und Vorbereitung:
    - Patient vereinbart einen Termin mit dem Arzt oder der Klinik.
    - Die Rezeptionistin fragt nach persönlichen Informationen und Versicherungsdetails.
    - Ressourcen: Appointment (Terminplanung), Encounter (Basis), Coverage (Basis)

- Ankunft und Registrierung:
    - Der Patient kommt zum vereinbarten Zeitpunkt im Krankenhaus an.
    - An der Rezeption meldet er/sie sich und wird registriert.
    - Der Patient füllt möglicherweise Formulare zu seiner Krankengeschichte und Versicherung aus.
    - Ressourcen: ...

- Wartezeit und Voruntersuchungen:
    - Der Patient wartet im Wartezimmer aufgerufen zu werden.
    - Eine Krankenschwester oder ein Pfleger ruft den Patienten auf und nimmt Vitalzeichen (Blutdruck, Puls, etc.) auf.
    - Der Patient wird gegebenenfalls zu verschiedenen Abteilungen für spezifische Voruntersuchungen (z.B. Bluttests, Röntgen) geschickt.

- Arztkonsultation:
    - Der Arzt bespricht die Ergebnisse der Voruntersuchungen und untersucht den Patienten.
    - Der Arzt stellt eine Diagnose und bespricht den Behandlungsplan.

- Behandlung und Aufnahme:
    - Wenn eine stationäre Aufnahme notwendig ist, wird ein Zimmer zugewiesen.
    - Der Patient erhält Informationen zu seiner Krankheit, dem geplanten Verlauf und der geplanten Behandlung.

- Behandlung und Pflege:
    - Das Pflegepersonal übernimmt die Pflege und Unterstützung des Patienten während seines Aufenthalts.
    - Der Patient erhält Medikamente und Therapien gemäß dem Behandlungsplan.

- Überwachung und Visiten:
    - Der Zustand des Patienten wird regelmäßig überwacht.
    - Ärzte führen tägliche Visiten durch, um den Fortschritt zu überprüfen und Anpassungen am Behandlungsplan vorzunehmen.

- Entlassungsvorbereitung:
    - Wenn der Patient sich verbessert hat, wird die Entlassung vorbereitet.
    - Der Arzt gibt Anweisungen zur weiteren Erholung, Medikamenteneinnahme und eventuellen Folgeterminen.

- Entlassung:
    - Der Patient erhält Entlassungspapiere und Rezepte für benötigte Medikamente.
    - Die Rezeptionistin klärt finanzielle Angelegenheiten und gibt Anweisungen zur Nachsorge.

- Nachsorge und Folgetermine:
    - Der Patient folgt den Anweisungen zur Nachsorge, nimmt Medikamente ein und vereinbart gegebenenfalls Folgetermine.
    - 


## Annex II - Patient Data Journey

Hier eine ausführliche Liste der Szenarien, aus dem in [Patient Data Journey](#patient-data-journey) geschilderten Modell.

1. Initiale Dateneingabe:
   - Wenn ein neuer Patient in einem der Systeme registriert wird, müssen Attribut X und/oder die Business-ID (PID) des Patienten mit dem anderen System synchronisiert werden.
2. Aktualisierungen der Patienteninformationen:
   - Wenn Attribut X oder Business-ID (PID) von Patienten in einem System geändert werden (System A oder System B), muss die Änderung mit dem anderen System synchronisiert werden.
3. Zuweisung logischer IDs:
   - Beide Systeme weisen den Patientendateninstanzen ihre eigenen logischen IDs zu. Wenn eine logische ID von einem der Systeme generiert wird, muss sie mit dem anderen System synchronisiert werden.
4. Löschung von Patientendaten:
   - Wenn ein Patient in einem System (System B) darum bittet, seine Daten zu löschen, sollte dieser Wunsch mit dem anderen System (System A) synchronisiert werden.
5. Wiederherstellung gelöschter Daten:
   - Wenn ein Patient die Wiederherstellung zuvor gelöschter Daten in einem System beantragt (System B), sollte diese Aktion mit dem anderen System (System A) synchronisiert werden, um die Konsistenz sicherzustellen.
6. Konfliktlösung:
   - Falls es zu Konflikten bei den Daten kommt (z.B. wenn die Informationen zu Patienten in beiden Systemen aktualisiert werden, bevor die Synchronisation erfolgt), muss es einen Prozess zur Lösung dieser Konflikte geben, um sicherzustellen, dass die aktuellsten Informationen in beiden Systemen wiedergegeben werden.
7. Zugriffsberechtigungen für Daten:
   - Wenn der Patient seine Berechtigungen oder Zustimmungseinstellungen für den Datenzugriff in einem System aktualisiert (System B), sollten diese Änderungen mit dem anderen System (System A) synchronisiert werden, um sicherzustellen, dass der Zugriff entsprechend gewährt oder eingeschränkt wird.
8. Datenintegritätsprüfungen:
   - Regelmäßige Überprüfungen sollten durchgeführt werden, um sicherzustellen, dass die in beiden Systemen gespeicherten Daten konsistent und korrekt bleiben. Etwaige Diskrepanzen oder Fehler sollten identifiziert und durch Synchronisation behoben werden.
9. Datenbackups und -wiederherstellung:
   - Beide Systeme sollten einen Mechanismus für das Backup und die Wiederherstellung von Daten haben. Die Synchronisation ist wichtig, um sicherzustellen, dass die Backups in beiden Systemen konsistent und auf dem neuesten Stand sind.
10. Synchronisation der Protokolldatei:
   - Jegliches Protokollieren von Datenzugriff und -modifikation sollte zwischen den beiden Systemen synchronisiert werden, um einen vollständigen Datensatz aller Aktivitäten zu behalten.

Das Szenario kann um eine weitere Komponenten erweitert werden:

Ein System C kann weitere Daten zum Patienten bereitstellen in Form eines Attribut Y (z.B. Vitalzeichen oder Labordaten), das aber lediglich von einer IT-Komponente automatisch befüllt wird. Sonst gelten auch für dieses System die obigen Restriktionen und Umstände. Zusätzliche Szenarien für das System C:

11. Automatische Befüllung von Attribut Y (z.B. Vitalzeichen und Labordaten):
   - Da System C automatisch von einer IT-Komponente befüllt wird, müssen die übermittelten Daten Attribut Y (z.B. Vitalzeichen oder Labordaten) in regelmäßigen Abständen zwischen den Systemen synchronisiert werden, um sicherzustellen, dass alle relevanten Patienteninformationen aktuell und korrekt sind.
12. Automatische Aktualisierung der logischen ID:
   - Da System C von einer IT-Komponente betrieben wird, die automatisch logische IDs vergibt, muss sichergestellt werden, dass diese IDs in den anderen Systemen entsprechend aktualisiert werden, um die Konsistenz der Daten zu wahren.
