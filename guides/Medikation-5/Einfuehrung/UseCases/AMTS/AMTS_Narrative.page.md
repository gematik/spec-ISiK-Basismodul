## 1. Motivation und Hintergrund

Dieser Implementierungsleitfaden beschreibt die an der Schnittstelle verfügbaren Informationen für eine sichere Arzneimitteltherapie. Das beinhaltet die Vermeidung sämtlicher unerwünschter und potenziell gefährlicher Reaktionen eines individuellen Patienten im Zuge der Einnahme einer verordneten Medikation. Ein intuitives Beispiel dafür ist eine Penicillinallergie des Patienten.

Durch die Erweiterung des Moduls ISiK-Medikation werden die bereitgestellten Ressourcen der ISiK-Landschaft erweitert, sodass eine Vielzahl an Funktionen möglich ist, mit denen eine Medikation individuell durch die Informationssysteme beurteilt oder angepasst werden kann.
Die bedeutendsten abzudeckenden Use Cases sind Wechselwirkungen, Allergien und Kontraindikationen, die vor einer Abgabe identifiziert werden sollten. So lässt sich dann z.B. erkennen, ob ein Medikament in einem bestimmten Behandlungsfall nicht als sicher einzustufen ist. Mit den verfügbaren Informationen könnte potenziell auch ein individuell besser geeignetes Medikament vorgeschlagen werden.

## 2. Ziele

Ziele des vorliegenden IG sind:
1. Die Identifikation und Beschreibung zentral relevanter Anwendungsfälle.
2. Die Identifikation und nachfolgende Spezifikation neuer notwendiger (oder zu erweiternder) Ressourcen als Informationsträger für die AMTS Bewertung.
3. Die Schaffung eines Implementierungsleitfadens zur Bereitstellung ebendieser AMTS relevanten Informationen.
4. Die korrekte Abgrenzung des Leistungsumfangs ISiK-Medikation im Bezug auf AMTS (Out-of-Scope).

Die genauere Zielstellung kann unter Einbeziehung der Stakeholder in der Evolution von ISiK erweitert oder verändert werden.

### 2.1. Out-of-Scope

Aufgrund technischer Beschränkungen oder eines starken implizierten Aufwands gibt es auch Aspekte, die aktuell noch außen vor bleiben müssen:
* Die Schaffung, Abstimmung und Spezifikation eines vollständigen ISiK Labor Moduls.
* Medical Knowledge Management. Eine medizinische Wissensdatenbank ohne Patientenbezug, in der zum Beispiel Informationen zu bekannten Nebenwirkungen,Wechselwirkungen oder Kontra-Indikationen gespeichert werden (z.B. FHIR-R5 Ressource _ClinicalUseDefinition_). Leider stehen entsprechende Ressourcen erst in R5 zur Verfügung und es gibt kein einheitliches Bild wo eine solche Medical Knowledge DB in der deutschen Gesundheitslandschaft (und in der Telematik Infrastruktur) zu verorten wäre.
* Die Einbeziehung eines Therapieziel (FHIR-R4 Ressource _Goal_), da dies sehr komplex ist und ein erheblicher Abstimmungsaufwand impliziert wäre.
* Die Einbeziehung eines Therapieplan (FHIR-R4 Ressource _Careplan_), da dieser ein neues Fachfeld braucht. Dieses Feld (Onkologie) würde ein neues ISiK Modul sowie IG begründen und benötigt eine eigene Arbeitsgruppe in einer zukünftigen Stufe.

Einige dieser Aspekte sind bereits im Backlog für kommende ISiK Entwicklungsstufen aufgenommen.

## 3. Stakeholder, User und weitere Systeme

Die Spezifikation richtet sich insbesondere an SW-Hersteller von 1) KIS,  2) zugehörigen Submodulen und Subsystemen, die von Stationsapothekern genutzt werden sowie 3) eigenständigen aber im Ökosystem integrierten Systemen, die in der Krankenhausapotheke zum Einsatz kommen. Alle anderen Hersteller von ISiK-nahen Systemen sind auch eingeladen sich zu beteiligen, da Aufrufe und Ergebnisse potenziell propagiert werden müssen.

Es handelt sich um eine technische Spezifikation, zu der keine weiteren medizinischen Fachexperten zu Rate gezogen werden müssen. Die sogenannten 'AMTS-Checks' - zur medizinischen und pharmakologischen Bewertung von AMTS - müssen durch die IS weiterhin selbst durchgeführt werden.

### 3.1. User und Systeme im Fokus

Primär zu berücksichtigende User sind
* Krankenhausmitarbeiter (MFAs, Ärzte etc.)
* Pharmazeutisches Personal (Apotheker, PTAs etc.)
* Patienten (bei Aufnahme, Entlassung, stationärer Medikation usw.)

Beteiligte Systeme sind prinzipiell alle [bestätigungsrelevanten Systeme](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme). Primär hervorzuheben sind dabei:
* KIS, auch fokussierte KIS der Dentalklinik oder der Mund-, Kiefer- und Gesichtschirurgie
* KIS-Submodule der Medikation
* Eigenständige Systeme der Krankenhausapotheke (AVS)

Zudem sind hervorzuheben als mögliche Clients oder Subsysteme auch Datenbanken oder Services außerhalb der Krankenhauslandschaft, die Informationen bereitstellen über:
* Wirkstoffe und Wechselwirkungen
* Indikationen, Kontraindikationen und Nebenwirkungen
* Substitutionsmöglichkeiten und Generika

### 3.2. Einordnung in die ISiK Landschaft

Als Übergreifender Use Case ist AMTS grundsätzlich im Modul Medikation verankert. Dennoch werden AMTS-relevante Informationen aus weiteren ISiK-Modulen benötigt, die aus verschiedenen Gründen dort fachlich zugeordnet werden und verbleiben:

- **ISiK Modul Medikation: Mit Informationen zur Medikation und Verordnung** - In dem vorliegenden Modul finden sich Informationen zur aktuellen Medikation (z.B. Blutdruck-Senker) und patienten-spezifischen Verordnung. Ziel der hier verorteten Profile ist es vor allem, Wechselwirkungen mit weiteren Verordnungen oder Behandlungen zu identifizieren und ihr Risiko zu bewerten. Auch die Bewertung von akzeptierten Risiken findet sich hier. Da ISiK aktuell noch einen stark patientenzentrierten Ansatz verfolgt, sei darauf hingewiesen, dass es keine MedicationKnowledge-Profile gibt (also keine Arzneimittel- oder Wissensdatenbank im weiteren Sinne).
- **ISiK Basismodul: Mit Informationen zum Patienten und Diagnosen** - Hier sind Profile im Zusammenhang mit Allergien und Unverträglichkeiten verortet. Es gehören aber auch chronische Erkrankungen (z.B. Niereninsuffizienz), Lebensumstände (z.B. Schwangerschaft) und Lebensgewohnheiten (z.B. Raucher) dazu. 
[ISiK Basismodul](https://simplifier.net/guide/isik-basis-stufe-5)
- **ISiK Support Modul Labor: Mit Informationen aus der Labor Diagnostik** - In diesem Modul finden sich vor allem AMTS-relevante Beobachtungen und Messwerte, die als Ergebnis eines diagnostischen Prozesses oder einer Probe zugeordnet werden können.
[ISiK Modul Labor](https://simplifier.net/guide/isik-labor-stufe-5)
 
### 3.3. Weitere zu berücksichtigende Systeme und Standards

Die Kompatibilitäten zu den [gelisteten Spezifikationen](https://simplifier.net/guide/isik-medikation-stufe-5/Einfuehrung/UebergreifendeFestlegungen/Kompatibilitaet) sollen weiterhin gewahrt bleiben.

Da mit dem [MIO Medikationsplan](https://mio.kbv.de/display/EMP1X0X0/) eine FHIR-basierte Lösung zur Verwendung in der ePA für Alle erstellt wird, sollte die Kompatibilität sowohl organisatorisch als auch in der Umsetzung der Spezifikation angestrebt werden.

Neben den allgemein geltenden Festlegungen in FHIR und HL7v2 können auch folgende Festlegungen in die Entwicklung mit eingehen:
- Das Allergie Profil aus der Patientenkurzakte, [Allergy Intolerance (IPS) ](https://build.fhir.org/ig/HL7/fhir-ips/StructureDefinition-AllergyIntolerance-uv-ips.html)
- Die Bereiche *CAVE*, *Interaktionen* sowie *Indikationen und Nebenwirkungen* des AMTS-Modul der [ABDADatenbank²](https://abdata.de/produkte/abdadatenbank2/amts-modul/)
- Das AllergyIntolerance-Profil der KBV-Basisprofile [KBV_PR_Base_AllergyIntolerance](https://simplifier.net/base1x0/kbv_pr_base_allergyintolerance)
- Das AllergyIntolerance-Profil von GEVKO eMDAF [eMDAF Allergien und Unverträglichkeiten](https://simplifier.net/emdaf/emdafprallergyintolerance)

## 4. Anwendungsfälle und Versorgungsprozesse

Im Positionspapier [Digital gestützte Medikationsprozesse](https://www.ina.gematik.de/fileadmin/Arbeitskreisdokumente/Ergebnisdokumente/Analyse_der_Medikationsprozesse/Positionspapier_Analyse_der_Medikationsprozesse.pdf) aus dem Arbeitskreis *Analyse der Medikationsprozesse* des Interop Councils sind unter anderem Anwendungsfälle und Versorgungsprozesse für den stationären Sektor aufgeführt. Dieser ist für eine detaillierten Einstieg und Auseinandersetzung mit dem Thema geeignet und bildet die fachliche Grundlage (Motivation) des vorliegenden IG AMTS.


### 4.1. User Stories und Use Cases

In folgendem wird eine grob-granulare Übersicht über die User Stories bzw. Use Cases und die zugehörigen technischen Requirements gegeben.
User Stories sollen dazu dienen die Bereiche der Bedarfsanalyse grob abzudecken, daraufhin zu präzisieren und die Problemdefinition zu schärfen. Sie fokussieren sich auf den Nutzer und was dieser mit einer Funktionalität erreichen möchte. Use Cases sind eher technisch orientiert und fokussieren verschiedene Einsatzszenarien und deren Anwendungsfälle.

### 4.2. User Stories - Business

Die User Stories beschreiben die grundlegenden Kontexte, in denen der Bedarf nach einem AMTS-Check und einem entsprechenden Informationsaustausch entsteht.

- **User Story 01** - AMTS Prüfung bei Verordnung, Änderung der Verordnung und Abgabe
   - Ein Heilberufler (insb. Ärzte, Apotheker) möchte AMTS-relevante Informationen abrufen, um eine sichere Verordnung, Änderung einer Verordnung (z.B. Substitution) oder Abgabe einer Medikation zu gewährleisten.
   - **Requirement**: Im Rahmen der Medikationsverordnung, -Änderung oder -Ausgabe MUSS der Nutzer auf AMTS hin prüfen können.
- **User Story 02** - AMTS Prüfung bei neuer Informationslage
   - Ein Heilberufler (insb. Ärzte, Apotheker) möchte AMTS-relevante Informationen abrufen, um eine sichere Abgabe einer Medikation zu gewährleisten.
   - **Requirement**: Im Rahmen neu bekanntgewordener Informationen MUSS der Nutzer auf AMTS hin prüfen können.
- **User Story 03** - Stationäre Aufnahme mit Medikationsumstellung (Medication Reconciliation)
   - Bei der stationären Aufnahme eines Patienten soll die bestehenden (häusliche oder ambulante) Medikation mit in das geänderte Versorgungsumfeld übersetzt und angepasst werden, um eine gleichwertige und sichere stationäre Verordnung zu gewährleisten.
   - **Requirement**: Im Rahmen der Patientenaufnahme MUSS der Nutzer auf AMTS hin prüfen können.
- **User Story 04** - Entlassung mit Medikationsumstellung (Medication Reconciliation)
   - Bei der Entlassung eines Patienten aus der stationären Versorgung soll die initiale Medikation mit in das sich ändernde Umfeld übersetzt und angepasst werden, um eine gleichwertige und sichere Weiterführung der Medikation zu gewährleisten.
   - **Requirement**: Im Rahmen der Entlassung MUSS der Nutzer auf AMTS hin prüfen können.

Der zentrale Auslöser einer AMTS-Prüfung und damit auch für die Nutzung der Schnittstellen ist eine vorher unbekannte Informationslage. Die Informationen können initial neu sein, durch den Patienten später in den Prozess hinzugegeben werden, oder sich im Zuge einer Behandlung ergeben.

### 4.3. Exemplarische Abläufe

**Beispiel-Sequenz Geplanter operativer Eingriff mit stationärem Aufenthalt**  
Ein geriatrischer Patient unterzieht sich einer geplanten Hüftersatzoperation:
* Der Patient kommt am Tag vor dem Eingriff wie vereinbart zur stationären Aufnahme.
* Das Krankenhauspersonal erfasst den relevanten Krankheits- bzw. Versorgungsverlauf.
* Das Krankenhauspersonal erhebt relevante klinische Daten: Anamnese, Untersuchung, Vitalparameter, Allergien, Laborbefunde, Blutbild u.ä.
* Das Krankenhauspersonal erhebt seinen umfassenden Medikationsstatus: Anamnese, Medikationsplan, Einweisung & Begleitdokumentation u.ä.
* Das Krankenhauspersonal erarbeitet einen Vorschlag zur Umstellung auf Krankenhaus Medikation
* Mit Hilfe der Schnittstellen werden alle **AMTS relevanten Informationen konsolidiert** und ein AMTS-Check durchgeführt.
* Der Patient bekommt eine Hüftprothese und wird beobachtet.
* Klinische Daten werden nach dem Eingriff aktualisiert bzw. neu erhoben.
* Zur Entzündungsvermeidung ist eine weitere Verordnung notwendig.
* Im Rahmen des Entlassprozesses erarbeitet das Krankenhauspersonal einen Vorschlag zur Umstellung auf häusliche Gesamtmedikation.
* Mit Hilfe der Schnittstellen werden alle **AMTS relevanten Informationen konsolidiert** und ein AMTS-Check durchgeführt.
* Im Entlassgespräch werdend Veränderungen kommuniziert und erklärt.
* Der Patient wird mit einem neuen Medikationsplan entlassen.




### 4.4. Weitere implizite Annahmen und weitere Informationen

*Annahmen:*
* Ein beteiligtes und ISiK-AMTS-bestätigtes System verfügt über die grundlegende Funktion zur Durchführung eines AMTS-Checks. Wie ein AMTS-Check durchzuführen ist wird in diesem IG nicht beschrieben.
* Ein beteiligtes und ISiK-AMTS-bestätigtes System erkennt selber, ob ein (erneuter) AMTS-Check notwendig wird, z.B. nach einer Arzneimittelsubstitution. Fachliche Systemführung, fachliche Trigger oder Listener-Observer-Pattern zur Festlegung der Reihenfolge der AMTS-Teilschritte werden in diesem IG nicht beschrieben.

*Anmerkungen:*
* AMTS-Checks sollten protokolliert werden, um Verantwortlichkeit und Rückverfolgbarkeit zu gewährleisten. Dies gilt sowohl für den positiven Fall der Verträglichkeit als auch für den Fall, in dem eine akzeptierte oder eine nicht akzeptable Risikobewertung erstellt wird.
* AMTS-Checks könnten protokolliert werden, um redundante Prüfungen und Mehrarbeit zu vermeiden.


Weitere Anwendungsfälle und Versorgungsprozesse für den stationären Sektor sind im Positionspapier [Digital gestützte Medikationsprozesse](https://www.ina.gematik.de/fileadmin/Arbeitskreisdokumente/Ergebnisdokumente/Analyse_der_Medikationsprozesse/Positionspapier_Analyse_der_Medikationsprozesse.pdf) aus dem Arbeitskreis *Analyse der Medikationsprozesse* des Interop Councils zu finden. 
