## Motivation

Im Rahmen von Krankenhausbesuchen umfassen u.a. die Aufnahme-Workflows regelmäßig die manuelle Bearbeitung von Patientenstammdaten. Daher ist hier das Risiko redundant persistierter Patientendaten stets vorhanden. Dies hat auch zur Folge, dass Zusammenführungen von Patientendaten in Krankenhäusern an der Tagesordnung stehen.
Die Patientendatenzusammenführung (Patient merge) bezeichnet den Workflow der Bereinigung redundanter Patienten-Instanzen innerhalb eines KIS oder einer KH-IT-Umgebung. Die Bereinigung geschieht erfahrungsgemäß als halbautomatisierter Prozess, für den dedizierte Komponenten eingesetzt werden können.

Um als Subsystem über ein Patienten-Merge-Event informiert zu werden, KANN der FHIR Subscription Mechanismus gemäß der [FHIR R5 Spezifikation](https://hl7.org/fhir/R5/subscription.html) genutzt werden.

---
