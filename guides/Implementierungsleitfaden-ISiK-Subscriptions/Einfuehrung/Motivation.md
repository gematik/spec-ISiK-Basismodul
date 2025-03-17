---
topic: ImplementationGuide-markdown-Motivation
---

# Motivation

Im Kontext von ISiK wird eine übergreifende Lösung für die strukturierte und kontextbezogene Bereitstellung von Änderungen benötigt. Ein entsprechender Lösungsansatz für die Kommunikation einer erfolgten Zusammenführung von ISiK-Patienten-Instanzen (patient-merge) ist bereits erarbeitet worden. Eine Verallgemeinerung dieses Ansatzes für ISiK soll im vorliegenden Implementierungsleitfaden erfolgen.

Die Einführung von FHIR Subscriptions im Rahmen des ISiK-Standards zielt daher darauf ab, den
event-basierten FHIR-Datenaustauschmechanismus zwischen verschiedenen Systemen im Krankenhaus (z.B.
KIS, Patientenportale, Dokumentenserver, PDMS etc.) zu standardisieren und zu verbessern. 

Bislang stellt [Polling](https://build.fhir.org/exchanging-polling.html) die einzige Option für Client-Systeme dar, um Updates zeitnah zu erhalten. Dieses
Verfahren ist jedoch ineffizient, da es regelmäßige Anfragen an den Server erfordert, auch wenn
keine neuen Daten vorhanden sind. Dies führt zu unnötigem Netzwerkverkehr und Serverlast. Durch
Subscriptions können Systeme stattdessen gezielt über relevante Änderungen informiert werden,
wodurch Ressourcen geschont und die Reaktionszeiten verbessert werden.

Die Verwendung des [Subscription Backport Implementation Guides](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/components.html) ermöglicht die Nutzung moderner FHIR
R5-Subscription-Features bereits in FHIR R4-Umgebungen. Während FHIR R4 nur eine grundlegende
Subscription-Funktionalität bietet, führt FHIR R5 erweiterte Konzepte wie SubscriptionTopics ein,
die eine gezieltere und flexiblere Steuerung der Benachrichtigungen ermöglichen. Zusätzlich bieten
R5-Notification-Bundles eine strukturierte und kontextbezogene Bereitstellung von Änderungen. Die
Verwendung des Subscription Backport IGs ermöglicht eine standardisierte Nutzung von FHIR R5
Features in R4 und ermöglicht eine zukunftssichere Implementierung eines event-basierten
Datenaustauschmechanismus.

## Stakeholder

Die Spezifikation richtet sich insbesondere an Softwarehersteller von 1)
Krankenhausinformationssystemen (KIS), 2) zugehörigen Modulen und Subsystemen, die mit FHIR
Subscriptions arbeiten, sowie 3) eigenständigen, aber im Ökosystem integrierten Systemen, die
innerhalb eines Krankenhauses oder darüber hinaus eingesetzt werden.

Es handelt sich um eine technische Spezifikation, sodass keine weiteren medizinischen Fachexperten
konsultiert werden müssen. Die medizinische und fachliche Bewertung der Daten bleibt weiterhin in
der Verantwortung der jeweiligen Systeme.
