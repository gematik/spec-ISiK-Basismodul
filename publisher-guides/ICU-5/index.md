---
topic: ImplementationGuide-markdown-Einfuehrung
---
<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/images/Gematik_Logo_Flag.svg" alt="gematik logo" width="400"/>

----
Version: 5.1.0

Datum: 23.10.2025

Status: Aktiv

Realm: Deutschland





----

# Motivation ICU-Normalstation Workflow test

Die bestehenden ISiK-Profile und Implementierungsleitfäden haben den Workflow einer bidirektionalen Überleitung von Patienten zwischen Intensiv- und Normalversorgung innerhalb eines Krankenhauses nicht adressiert. Da die ISiK-Stakeholder anerkannt haben, dass dieser Workflow  für die Krankenhausversorgung von besonderer Dringlichkeit ist, trifft der vorliegende Implementierungsleitfaden Festlegungen, um diesen zu unterstützen.

Die Spezifikation ist in enger Kooperation mit den [Verantwortlichen des 'Kerndatensatzes Erweiterungsmodul Intensivmedizin' der Medizininformatik Initiative (MII)](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/IGMIIKDSModulICU.html) entstanden.


## Motivation und Hintergrund 
Dieser Implementierungsleitfaden beschreibt eine bidirektionale Überleitung zwischen Intensiv- und Normalversorgung auf der Ebene eines Workflows zur Datenkommunikation zwischen den betroffenen Systemen (PDMS und KIS).

###  Stakeholder
Die Spezifikation richtet sich insbesondere an SW-Hersteller von KIS und PDMS.

Es handelt sich um eine technische Spezifikation. 
Allerdings sind Profile, die relevant sind für die Umsetzung des Workflows, unter Federführung unserer Kooperationspartner, der [Verantwortlichen des 'Kerndatensatzes Erweiterungsmodul Intensivmedizin' der Medizininformatik Initiative (MII)](https://simplifier.net/guide/Medizininformatik-Initiative-Modul-ICU-ImplementationGuide-DE/MII-IG-Modul-ICU?version=current), einer medizinischen Validierung unterzogen worden. Die Profile werden mit den Kooperationspartnern der MII weiter in enger Kooperation gepflegt. Das Packaging der Profile erfolgt mittels ISiK. 

Das zugrundeliegende Informationsmodell der MII wurde vom Vorstand der DIVI (Deutsche Interdiziplinäre Vereinigung für Intensiv- und Notfallmedizin) freigegeben. Alle Universitätskliniken (im Rahmen der MII und des Netzwerks Universitätsmedizin (NUM)) haben die hier gelisteten Profile in allen Gremien bestätigt und sich auf deren Verwendung verpflichtet (z. B. Beschluss des nationalen Steuerungsgremiums (NSG) der MII 12/2024).

Im Sinne der Qualitätssicherung der Profile wurden die Snapshots und Beispiele nach [dieser Checkliste (PDF)](https://github.com/gematik/spec-ISiK-Basismodul/blob/main-stufe-5/Material/ICU/Checkliste%20fach%C3%A4rztliche%20Validierung%20spezifischer%20Snapshots%20und%20Beispiele%20V1.2.pdf) strukturiert von zwei in der Intensivmedizin erfahrenen Fachärzten, die nicht an der Profilierung beteiligt waren, unabhängig geprüft. Aus den resultierenden Testprotokollen wurde anschließend in einem Workshop mit weiteren Ärzten sowie technischen FHIR-Experten eine konkrete Handlungsempfehlung pro Profil und Beispiel abgeleitet und im nationalen Meeting des MII KDS ICU-Teams am 7.5.2024 konsentiert.

Die klinische Qualitätssicherung soll die Wahrscheinlichkeit von Fehlern reduzieren, kann Fehler aber nicht ausschließen.

Kommunikations-Workflows, die auf dieser Schnittstellen-Festlegung aufbauen, können lediglich der Unterstützung von Versorgung und Qualitätssicherungsmaßnahmen in der Überleitung zwischen Intensiv- und Normalversorgung (bidirektional) dienen.

###  User
Primär zu berücksichtigende User sind:
* Krankenhausmitarbeitende (insbesondere intensivmedizinisches Personal, MFAs, Ärzte etc.)

###  Einordnung in die ISiK Landschaft
Als übergreifender Use Case (bzw. Workflow) ist die Überleitung zwischen Intensiv- und Normalversorgung nicht allein im Modul Vitalparameter verankert. Fachlich relevant sind im ISiK-Kontext für die Intensivversorgung ebenfalls:

- **ISiK Basismodul: Mit Informationen zum Patienten und Diagnosen** - Hier sind Patientenstammdaten, Diagnosen und Prozeduren verortet. Es gehören aber auch chronische Erkrankungen (z.B. Niereninsuffizienz), Lebensumstände (z.B. Schwangerschaft) und Lebensgewohnheiten (z.B. Raucher) dazu. Siehe [ISiK Basismodul](https://simplifier.net/guide/isik-basis-v4)
- **ISiK Support Modul Labor: Mit Informationen aus der Labor Diagnostik** - In diesem Modul finden sich relevante Beobachtungen und Messwerte, die als Ergebnis eines diagnostischen Prozesses oder einer Probe zugeordnet werden können. Siehe [ISiK Modul Labor](https://simplifier.net/guide/isik-labor-v4)
 
###  Out-of-Scope
Aufgrund technischer Beschränkungen und Aufwände gibt es Aspekte, die aktuell außen vor bleiben müssen:
* Die Festlegung und Abstimmung eines vollständigen ISiK Labor Moduls
* Die konkrete Abdeckung von Versorgungsprozessen in der Intensivmedizin


# Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen, verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. Dieser FHIR ImplementationGuide (IG) beschreibt die für diesen Zweck entwickelten FHIR Profile und das [REST](https://de.wikipedia.org/wiki/Representational_State_Transfer)-basierte Application Programming Interface (API). Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html). Dieser Leitfaden konkretisiert die ISiK-relevanten Funktionen der Standard-REST-API und trifft inhaltliche Festlegungen zu den ISiK-relevanten Ressourcen in Form von Ressourcen-Profilen.

Hersteller bestätigungsrelevanter Systeme sollen durch diesen IG in die Lage versetzt werden, eine konforme Implementierung zu erstellen und das Bestätigungsverfahren der gematik erfolgreich zu absolvieren.

Weitere Informationen siehe [§373 SGB V](https://www.gesetze-im-internet.de/sgb_5/__373.html).

Hinweis: Sowohl für die Implementierung der ISiK-Spezifikation als auch für den Betrieb eines Produktes, das die ISiK-Spezifikation implementiert, ist eine SNOMED-CT-Lizenz notwendig. Diese kann beim [National Release Center für SNOMED CT in Deutschland](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) beantragt werden.

**Kontakt**

Bringen Sie Allgemeine Fragen und Anmerkungen gerne über unser Anfrageportal ein: [Anfragen ISiK + ISiP](https://service.gematik.de/servicedesk/customer/portal/16)

Falls Sie keinen Zugang zum Anfrageportal haben und dieses nutzen wollen, senden Sie uns bitte eine Nachricht an die Adresse isik [ at ] gematik.de mit dem Betreff "Portalzugang".

**Herausgeber**

gematik GmbH

[Impressum](https://www.gematik.de/impressum/)

**Gender-Hinweis**

Zugunsten des Leseflusses wird in dieser Publikation meist die
männliche Form verwendet. Wir bitten, dies nicht als Zeichen einer
geschlechtsspezifischen Wertung zu deuten. Diese Variante deckt auch alle
weiteren Geschlechter, neben männlich und weiblich, ab.

