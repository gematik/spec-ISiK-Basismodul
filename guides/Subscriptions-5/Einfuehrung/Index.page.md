---
topic: ImplementationGuide-markdown-Einfuehrung
---
<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/images/Gematik_Logo_Flag.svg" alt="gematik logo" width="400"/>

----
Version: 5.1.1

Datum: 11.12.2025

Status: Aktiv (in Erprobung)

Realm: Deutschland



----

# Motivation Subscription Modul

Im Kontext von ISiK wird eine übergreifende Lösung für die strukturierte und kontextbezogene Bereitstellung von Änderungen benötigt. Ein entsprechender Lösungsansatz für die Kommunikation einer erfolgten Zusammenführung von ISiK-Patienten-Instanzen (patient-merge) ist bereits erarbeitet worden und wurde hier übernommen. Eine Verallgemeinerung dieses Ansatzes für ISiK soll im vorliegenden Implementierungsleitfaden erfolgen.

Die Einführung von FHIR Subscriptions im Rahmen des ISiK-Standards zielt daher darauf ab, den
event-basierten FHIR-Datenaustauschmechanismus zwischen verschiedenen Systemen im Krankenhaus (z.B.
KIS, Patientenportale, Dokumentenserver, PDMS etc.) zu standardisieren und zu verbessern. 

Bislang stellt [Polling](https://build.fhir.org/exchanging-polling.html) die einzige Option für Client-Systeme dar, um Updates zeitnah zu erhalten. Dieses
Verfahren ist jedoch ineffizient, da es regelmäßige Anfragen an den Server erfordert, auch wenn
keine neuen Daten vorhanden sind. Dies führt zu unnötigem Netzwerkverkehr und Serverlast. Durch
Subscriptions können Systeme stattdessen gezielt über relevante Änderungen informiert werden,
wodurch Ressourcen geschont und die Reaktionszeiten verbessert werden.

Die Verwendung des [Subscription Backport Implementation Guides](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/components.html) ermöglicht die Nutzung neuerer FHIR
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

----

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
