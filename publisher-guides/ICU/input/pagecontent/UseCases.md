---
topic: ImplementationGuide-markdown-UseCasesAnwendung-UseCases
---

Es gibt zahlreiche Use Cases rund um den Überleitungsprozess zwischen einer Intensiv- und einer Normalstation  (bidirektional) innerhalb eines Krankenhauses. Neben illustrierenden User Stories wird an dieser Stelle auch eine Workflow-Perspektive eingenommen.

Zum jetzigen Stand kann die Spezifikation keine umfassende Abdeckung eines Überleitungsprozesses vorweisen. Vielmehr wird die Überleitung zwischen Intensiv- und Normalversorgung (bidirektional) auf der Ebene eines Informations- und Daten-Workflows abgebildet; d.h. der Fokus liegt auf der Kommunikation relevanter Daten aus Normalversorgung (KIS) und Intensivversorgung (PDMS) zwischen den entsprechenden Systemen.

#### Werte aus KIS und PDMS

Datenquellen für die hier betrachteten Fälle sind KIS und PDMS.
Einige Use Stories, die diesen Kontext illustrieren sind folgende:

**UC-VIT-ICU-NORM-001**: Eine Ärztin fragt während einer Kontroll-Maßnahme in der normal-stationären Kontrolle nachträglich Daten zur Herzfrequenz eines Patienten über ein KIS mit der Funktion einer elektronische Kurve ab (momentan liegt die Herzfrequenz bei 90 Schlägen pro Minute). Der Zweck besteht darin, sicherzustellen, dass die Herzfrequenz des Patienten im Vergleich zu den Werten aus der Intensivstation im Normalbereich liegt. Die Daten stammen aus einem intensiv-stationären Aufenthalt, den der Patient aufgrund einer supraventrikulären Tachykardie durchlaufen hat.

Hintergrund: fachlich wäre hier auch eine Blutdruckabfrage relevant - auch diese soll auf entsprechende Weise abgefragt werden können.

**UC-VIT-ICU-NORM-002**: Während der intensivmedizinischen Behandlung nutzt eine Ärztin das PDMS-Frontend, um rückblickend Blutdruckwerte aus dem vorherigen Aufenthalt auf der Normalstation abzurufen. Ziel ist es, den Beginn der Urosepsis besser einzugrenzen. Auf Normalstation war der Patient Aufgrund eines Harnwegs-Infektes.

**UC-VIT-ICU-NORM-003**: Eine Medizinische Fachangestellte (MFA) sendet vor der Überleitung in die Intensivstation Daten aus dem normalstationären Aufenthalt an ein PDMS-Frontend. Ausgelöst wird der Versand per Button im KIS-Frontend. Relevant sind dabei Daten zum Blutdruck, damit der Beginn der Urosepsis später in der Intensivversrogung zeitlich feststellbar ist. Auf Normalstation war der Patient Aufgrund eines Harnwegs-Infektes.


#### Laborwerte
Einige Werte, die für den geschilderten Kontext relevant sind, stammen aus einem Labor Informations System (LIS). Hierzu illustrierend:

**UC-VIT-ICU-NORM-LAB-001**: Während einer Kontrolle auf der Normalstation nutzt eine Ärztin das KIS mit elektronischer Kurvenansicht, um rückblickend Serumkreatininwerte eines Patienten einzusehen. Ziel ist es, die Stabilität der Nierenfunktion über die glomeruläre Filtrationsrate abzusichern. Die Daten stammen aus einem intensiv-stationären Aufenthalt, den der Patient aufgrund eines akuten Nierenversagens durchlaufen hat.

Vorannahmen zur User Story: Das PDMS verfügt über eine Historie der Serumkreatininwerte, da es die Labordaten (aus einem LIS stammend) persistiert. Das PDMS verfügt auch über eine Schnittstelle für READ-Interaktionen entsprechend der ISIK Festlegung. 

Hintergrund zur Konfiguration: Das KIS agiert hier als Client und das PDMS als Server. 
Da in der Praxis ein LIS, das mit PDMS integriert ist, i.d.R. auch mit einem KIS integriert ist, kann die Abfrage von Labordaten mit intensivmedizinischem Bezug aus dem KIS auch direkt erfolgen.



