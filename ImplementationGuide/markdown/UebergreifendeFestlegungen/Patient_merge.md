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

## Motivation und Hintergrund
Im Rahmen von Krankenhausbesuchen umfassen u.a. die Aufnahme-Workflows regelmäßig die manuelle Bearbeitung von Patientenstammdaten. Daher ist hier das Risiko redundant persistierter Patientendaten stets vorhanden. Dies hat auch zur Folge, dass Zusammenführungen von Patientendaten in Krankenhäusern an der Tagesordnung stehen. Ein Standard, der sich dem Austausch von Patientendaten innerhalb eines Krankenhauses verschreibt, sollte daher auch das Thema der Patientendatenzusammenführung (Patient merge) abdecken. Ziel ist es, dass externe Clients merge-Vorgänge nachvollziehen und entsprechend verarbeiten können.

Bisher trifft ISiK keine Festlegung zur Patientenzusammenführung. Aus diesem Grund ist die AG 'Patient merge' etabliert worden, die sich dem beschriebenen Thema im Rahmen von ISiK annehmen soll.

Dieses Dokument soll der Harmonisierung der Problemdefinition zum Patient merge in ISiK dienen. Änderungswünsche am Dokument per Pull Request sind willkommen. Pull Requests, die grundsätzliche Änderungen bewirken (z.B. Breaking Changes), werden im Rahmen der AG angekündigt und ggf. diskutiert.

## Ziele
Ziel der Arbeiten im Rahmen der Ausbaustufe 4 ist:
Die Schaffung eines modulübergreifenden Implementierungsleitfadens zum Vorgehen bei der Patientenzusammenführung.
Die Patientendatenzusammenführung (Patient merge) bezeichnet den Workflow der Bereinigung redundanter Patienten-Instanzen innerhalb eines KIS oder einer KH-IT-Umgebung. Die Bereinigung geschieht erfahrungsgemäß als halbautomatisierter Prozess, für den dedizierte Komponenten eingesetzt werden können.

Für die Implementierung ist dabei noch zu entscheiden, zu welchem Vorgang die Spezifikation eine mögliche Festlegung treffen sollte:

1. Eine Festlegung zum Patient merge-Prozess selbst unter Einbeziehung unterschiedlicher Systeme, oder
2. Eine Festlegung zur Kommunikation eines stattgefundenen Patient merges gegenüber einem Subsystem oder einem externen Service.

Die genauere Zielstellung sollte unter Einbeziehung der Stakeholder in der ersten Projektphase detailliert und festgelegt werden.

## Stakeholder und User
Die Spezifikation richtet sich insbesondere an SW-Hersteller von KIS und Patientenportalen. Alle anderen Hersteller von ISiK-nahen Systemen sind auch eingeladen sich zu beteiligen, da ihre Prozessen potenziell betroffen sein werden.

Es handelt sich um eine im engeren Sinne technische Spezifikation, zu der keine weiteren medizinischen Fachexperten jenseits der direkt betroffenen SW-Hersteller zu Rate gezogen werden müssen.

## Randbedingungen
### Technische Randbedingungen
In den bisherigen ISiK Spezifikationen bestehen keine expliziten Festlegungen, wie mit dem Zusammenführen von Patientendaten umzugehen ist.

Grundsätzlich stellt sich die Frage welche Vorgänge im Rahmen eines Patient merge Workflows Teil der Festlegung in einer zukünftigen Spezifikation sein sollten. Neben der in der Zielstellung beschriebenen Unterscheidung zwischen den merge-Workflows (merge) und der Kommunikation des merge-Prozesses (merge-inform), lassen sich weitere Aspekte anführen, die auch einzeln betrachtet werden können:

* Patient.link - ein FHIR-Mechanismus der sich auch zum referenzieren unterschiedlicher (ggf. obsoleter) Patienten-Instanzen eignet
* match - Der Abgleich zweier Patienten-Instanzen (dies wird immer Voraussetzung für den eigentlichen Bereinigungs-Workflow, also das merge, sein) mit dem Resultat einer Übereinstimmung oder dem Erkennen zwei verschiedener Patienten
* merge in HL7v2 - hier existieren eine Reihe von ADT-Nachrichten mittels derer ein Patient merge (link, match, merge-inform etc.) implementiert werden kann

Im Kontext des letztgenannten Aspekts muss auch geklärt werden, ob beim Festzulegenden eine Schnittstelle zur Überführung von v2-getriebenen merge-Prozessen in ein query-getriebenes (REST-)Paradigma zu priorisieren wäre. Ein exemplarischer Use Case für letzteres wäre:

* Ein Subsystem erkennt (query-getrieben) eine Änderung einer Patienten-Ressource nach einem Patient merge im KIS, um daraufhin in eigenen Ressourcen mittels Patient-ID (PID) auf die korrekte FHIR-Ressource / Patienteninstanz referenzieren zu können. (Das System wäre damit nicht mehr auf die erfolgreiche Übermittlung einer entsprechenden PUSH-Nachricht angewiesen).

Um die im Werden begriffene Problemdefinition besser abzugrenzen, treffen wir folgende Annahmen:

* Operationen zum merge-Verhalten sind in HL7-v2 gelöst und werden durch verschiedene KIS entsprechend umgesetzt.
* Ebenso existieren Lösungen und Operationen in FHIR (Patient-link, $match (R4) und $merge (R5)).
* Neben der Patienten-Ressource sollte auch der Encounter für den merge-Prozess prioritär berücksichtigt werden

### organisatorische Randbedingungen
Es gelten die Fristen wie in anderen Modulen

Die Konsentierung der Use Cases soll auch eine rein asynchrone Mitarbeit erlauben. Dies schließt eine asynchrone Entscheidungsfindung ein (dies noch genauer zu klären).

### Konventionen
Die Draft-Dokumente werden auf github zur Diskussion gestellt.

## Kontextabgrenzung
### User und Systeme

Zu berücksichtigende User sind
* Krankenhausmitarbeiter (MFAs, Ärzte etc.)
* Patienten (nur bei Nutzung Patientenportal, z.B. Terminplanung)

Beteiligte Systeme sind prinzipiell alle bestätigungsrelevanten Systeme (siehe [DKG Festlegung](https://www.dkgev.de/themen/digitalisierung-daten/elektronische-datenuebermittlung/datenuebermittlung-nach-373-sgb-v-informationssysteme-im-krankenhaus/)). Hervorzuheben sind dabei:

* KIS

Zudem sind hervorzuheben als mögliche Clients, Subsysteme (oder ggf. Drittanbieter-Systeme außerhalb der Krankenhausumgebung):

* Patientenportale

### Kontext der Festlegung

Die Spezifikationsarbeit schließt die Festlegung oder Definition neuer Identifier (analog zu gID, eID etc.) aus. Es kann lediglich darum gehen, technische Verfahren und organisatorische Mechanismen aufzuzeigen und festzulegen, die mit gegebenen Patienten-Identifiers (PID) innerhalb einer Organisation operieren.

Diese Verfahren oder Maßnahmen können nur für eine Institution gelten. Die Zusammenführung von Patientendaten zwischen unterschiedlichen Institutionen ist nicht im Scope der AG 'Patient merge' enthalten.

Die genauere Problemdefinition und Anforderungserhebung unter Einbeziehung der interessierten Stakeholder ist selbst Teil der der Projektarbeit (erste Projektphase).

### Patient Data Journey

Um die Regelungsbedarfe rund um den Patient merge genauer zu verstehen, ist die Analyse der Patient Journey, die möglichst viele Patientenattribute und die unterschiedlichen "Etappen" des Patienten durch das Krankenhaus erfasst, nicht zielführend (siehe dazu Annex I- tbd.), da zu feingranular.

Vielmehr, so die Annahmen, sollte es zunächst darum gehen eine Sicht auf die Synchronisierungsbedarfe zu legen, die zwischen unterschiedlichen Systemen bei Manipulationen einer Patienten-Instanz bestehen (in diesem Sinne ist es präziser hier von einer Patient Data Journey als von einer Patient Journey zu sprechen). Diese kann mittels folgendes, vereinfachenden Szenarios erfasst werden:

Gegeben seien zwei Systeme, die beide Patientendaten speichern können - auch von denselben Patienten. Patientendaten bestehen nur aus einem Attribut X, logischer ID sowie einer Geschäfts-ID (PID), wobei nur die logische ID innerhalb eines Patientendatensatzes in beiden Systemen erforderlich ist. Beide Systeme verwenden ihre eigene logische ID, die niemals manuell eingegeben wird und daher immer von einem der Systeme zugewiesen wird. Nur ein System kann vom Krankenhauspersonal Eingaben empfangen (System A), das andere nur vom Patienten (System B).

Basierend auf dem beschriebenen Szenario sind die möglichen Datenmanipulationen, die eine Synchronisation zwischen den beiden Systemen (System A und System B) erfordern würden (und damit ggf. auch einen Regelungsbedarf durch die ISiK Spezifikation):

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

Im Rahmen von ISiK ist es entscheidend Schnittstellen und Abläufe für einige dieser Szenarien festzulegen, um sicherzustellen, dass Patientendaten in allen Systemen konsistent bleiben.

Dabei ist zunächst auszuwählen welche Szenarien anhand feingranularer Use Cases (siehe unten) genauer zu beachten sind. 

Auch wenn es im Rahmen von ISiK nicht gewährleistet werden kann: Zusätzlich sind klare Kommunikation und Schulungen für das Krankenhauspersonal und die Patienten hinsichtlich der Datenverarbeitung und Synchronisationsprozesse unerlässlich.

## Lösungsstrategie

Vor der Entwicklung einer Lösungsstrategie, die eine Festlegung innerhalb einer ISiK-übergreifenden Spezifikation festlegt, müssen zunächst Ziel- und Problemdefinition besser ausgearbeitet werden.

Dennoch lassen sich grundsätzliche Lösungsszenarien nennen.

Zunächst sollte für jedes bestätigungsrelevante System der Umfang des Festzulegenden einzeln bestimmt werden.

### merge-inform

Sollte allein die Festlegung zum merge-inform als Zieldefinition konsentiert werden, sollten auch bestehenden Mechanismen aus HL7v2 berücksichtigt werden.

### merge (und match)

Sollte die Festlegung eines merge-Verhaltens auf FHIR-Basis als Zieldefinition konsentiert werden, sollte auf bestehende Festlegungen im FHIR Kontext zurückgegriffen werden.

Da ein merge immer einen Abgleich von Ressourcen voraussetzt, wäre der Ansatz, zunächst eine match-Operation festzulegen (womöglich als eine erste normative Festlegung eines IGs).

Zudem stellt FHIR Version R5 eine dezidierte Operation bereit (siehe https://hl7.org/fhir/patient.html#merge, insbesondere Operation "merge").
Da ISiK auf Basis von FHIR R4 entwickelt worden ist und diese Version beibehalten werden soll (bis zu einer hypothetischen Deutschlandweiten Upgrade-Inititative auf R5/R6) müssten gegebene Lösungswege aus der verlinkten Spezifikation rückportiert werden (ggf. als dedizierte Operationen).

Im Kontext von Hl7 v2 sind zur Bereinigung von Duplikaten und Fehlzuordnungen folgende Mechanismen zu beachten:

- merge patient/account/visit: Zusammenführen von zwei Patientenstämmen, Abrechnungsfällen bzw. Aufenthalten in einem System und den abhängigen Subsystemen
- move patient/account/visit information: Verschieben eines Patienten zu einem anderen "Master-Patienten", Verschieben eines Abrechnungsfalls zu einem anderen Patienten bzw. Verschieben eines Aufenthalts zu einem anderen Abrechnungsfall etc.

## Use Cases

In folgendem wird zwischen User Stories (Business-Seite) und Use Cases (technisch) unterschieden.

User Stories sollen dazu dienen die Bereiche der Bedarfsanalyse zu präzisieren und die Problemdefinition zu schärfen. Die Frage, die sich hier stellt, ist ob auf Business-Ebene nur auf User Stories zu achten ist, die eindeutig die Gefahr eines Duplikats bergen, oder ob nicht auch jegliche Manipulationen an Patienten-Daten und Dokumenten einzuschließen sind? Wir nehmen an, dass ersteres der Fall ist und sollten uns daher fragen: Wo entsteht der Bedarf nach einem Patient merge? Was der Frage entspricht: Wo entstehen potentiell Duplikate?

Den Ursprung der Duplikate entlang der Patient Journey zu analysieren hilft nicht beim Verständnis des eigentlich technischen Use Cases Patient merge. Auch ein Fokus auf die ISiK Module mit Blick darauf wie ein Patient merge sich auf referenzierende Ressourcen auswirkt, erscheint für den Anfang wenig erkenntnisreich (es würde stets eine Rereferenzierung für verschiedene Ressourcen, wie Encounter, Account etc. in verschiedenen Komponenten notwendig; hier wären vermutlich alle Profile in ISiK und entsprechend alle Systeme betroffen).

Unsere Annahme ist dagegen, dass uns zur Schärfung der Problemdefinition, zunächst eine Sicht auf die involvierten Komponenten-Arten hilft – zum Beispiel:

- KIS (Interface mit Mitarbeiter)
- Subsystem (ggf. PDMS mit Interface zu trackender HW - z.B. Spritzenpumpe/Infusionspumpe)
- Patientenportal (Interface zu Patient)

Diese Systeme können stellvertretend für Komponenten-Arten stehen, die eine Interaktion mit einem spezifischen User oder eine automatisierte Form des Daten-Inputs vorweisen.

Die Präzisierung der Frage nach dem "Wo?" wäre daher: Was für ein spezifischer Bedarf an ein Patient merge ergibt sich bei verschiedenen Komponentenarten aufgrund der unterschiedlichen Art des Inputs (nach Rolle des Users oder automatisiert/händisch)?

### User Stories - Business

Zur Konkretisierung der Frage, lassen sich verschiedene User Stories erzählen, für die jeweils die Frage zu beantworten wäre: Was für ein spezifischer Bedarf an ein Patient merge ergibt sich in diesem Szenario?

Drei User Stories beschreiben exemplarisch die grundlegenden Kontexte, in denen der Bedarf nach einem Patient merge entsteht – mit unterschiedlicher Komponenten für die User-System Interaktion:

- US01: Eine Patientin bucht über ein Patientenportal einen Termin bei einem Krankenhaus (in dem sie bereits stationär aufgenommen worden war).
- US02: Ein KH-Mitarbeiter legt bei der Patientenaufnahme von eines Patienten in einem KIS händisch eine Patienteninstanz an.
- US03: Eine MFA der Intensivstation legt eine Instanz für den Patienten im PDMS an, sodass andere KH-Mitarbeiterinnen in Zukunft vom KIS die Herzfrequenz abfragen können.

Wir nehmen an, dass für US02 und US03 es dem KIS intern überlassen ist wie es einen Merge regelt oder nicht. Daher wären diese User Stories aus ISiK-Sicht nicht unmittelbar relevant. Z.B. wenn im KIS händisch eine Aufnahme erfolgt, muss das System entscheiden, wie die Patient-Ressource erstellt wird. Wenn das KIS intern merged und direkt die richtige Ressource herausgibt, besteht keine Notwendigkeit für einen Merge oder ein Merge-Event.

Zu US03 besteht womöglich der Bedarf nach einem vom KIS unabhängigen PDMS.

In diesem Sinne wäre US01 für die folgende Entwicklung technischer Use Cases zum Patient merge zu priorisieren.

---
**HINWEIS**

Auch bei dieser Listung ist der konkrete Pain Point für einen Festlegungsbedarf noch nicht klar herausgearbeitet. Hier benötigen wir den Input der SW-Hersteller zu Beantwortung der Frage: Was verursacht Probleme beim Patient merge, wenn keine regulatorische Festlegung getroffen wird.

---

### Use Cases - Technisch

Aus einer Perspektive der Workflows auf eher technischer Ebene lassen sich weitere Use Cases (UCs) ausdifferenzieren.

tbd.
