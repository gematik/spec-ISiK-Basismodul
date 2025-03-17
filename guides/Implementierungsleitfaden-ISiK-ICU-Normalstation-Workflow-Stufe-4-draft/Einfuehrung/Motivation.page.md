---
topic: ImplementationGuide-markdown-Motivation
---
# Motivation

Die bestehenden ISiK-Profile und Implementierungsleitfäden haben den Workflow einer bidirektionalen Überleitung von Patienten zwischen Intensiv- und Normalversorgung innerhalb eines Krankenhauses nicht adressiert. Da die ISiK-Stakeholder anerkannt haben, dass dieser Workflow  für die Krankenhausversorgung von besonderer Dringlichkeit ist, trifft der vorliegende Implementierungsleitfaden Festlegungen, um diesen zu unterstützen.

## Motivation und Hintergrund
Dieser Implementierungsleitfaden beschreibt eine bidirektionale Überleitung zwischen Intensiv- und Normalversorgung auf der Ebene eines Workflows zur Datenkommunikation zwischen den betroffenen Systemen (PDMS und KIS).

###  Stakeholder
Die Spezifikation richtet sich insbesondere an SW-Hersteller von KIS und PDMS.

Es handelt sich um eine technische Spezifikation, zu der keine weiteren medizinischen Fachexperten zu Rate gezogen werden. Allerdings sind Profile, die relevant sind für die Umsetzung des Workflows, unter Federführung der [Verantwortlichen des 'Kerndatensatzes Erweiterungsmodul Intensivmedizin' der Medizininformatik Initiative (MII)](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/IGMIIKDSModulICU.html) einer medizinischen Validierung unterzogen worden.

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