<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Medikation/main-stufe-4/Material/images/Gematik_Logo_Flag.svg" alt="gematik logo" width="400"/>

----
Version: 5.1.0

Datum: 21.10.2025


Status: Aktiv

Realm: Deutschland

----

# Motivation Medikationsmodul

Die Verordnung, Abgabe und Verabreichung von Medikamenten stellt eine der Kerntätigkeiten der Medizin dar.

Eine möglichst medienbruch-freie Kommunikation innerhalb dieses Workflows zwischen Behandelnden, Apotheken und Patienten kann zur Effizienz der Behandlungsprozesse beitragen und gleichzeitig die Therapiequalität sichern und verbessern (Stichworte: interne Qualitätssicherung, Arzneimitteltherapiesicherheit, Übernahme der Daten bei Verlegung zwischen Stationen, insbesondere zwischen Normal- und Intensivstation).

Dies gilt ebenso für die Dokumentation und Weiterverarbeitung der Aufnahme- bzw. Entlassmedikation (Medikationsplan), die derzeit noch häufig in Form von manueller und somit fehleranfälliger Übertragung der Medikationsangaben umgesetzt wird.

Das ISiK-Modul "Medikation" möchte diese Daten-Integration ermöglichen und stellt in dieser Ausbaustufe strukturierte Kommunikationsmöglichkeiten auf Basis einer RESTful API zum Austausch von Medikationsinformationen ("Medikationsplan") sowie Verordnungs- und Verabreichungsdaten zur Verfügung. Derzeit nicht berücksichtigt ist das Apothekenwesen.

Diese Spezifikation lehnt sich an die entsprechenden Teile des IHE-Profils HMW (Hospital Medication Workflow) sowie partiell auch an das IHE-Profil CMPD (Community Medication Prescription and Dispense) an. Weiterhin erfolgte ein Abgleich mit den aktuell in Deutschland bestehenden Spezifikationen im Bereich Medikation.

Der Fokus dieser Spezifikation liegt auf den Festlegungen zum Datenaustausch innerhalb einer Einrichtung, jedoch ist diese offen in dem Sinn, dass auch eine Nutzung in anderen Kontexten möglich ist.

# Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen, verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. Dieser FHIR ImplementationGuide (IG) beschreibt die für diesen Zweck entwickelten FHIR Profile und das [REST](https://de.wikipedia.org/wiki/Representational_State_Transfer)-basierte Application Programming Interface (API). Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html). Dieser Leitfaden konkretisiert die ISiK-relevanten Funktionen der Standard-REST-API und trifft inhaltliche Festlegungen zu den ISiK-relevanten Ressourcen in Form von Ressourcen-Profilen.

Hersteller bestätigungsrelevanter Systeme sollen durch diesen IG in die Lage versetzt werden, eine konforme Implementierung zu erstellen und das Bestätigungsverfahren der gematik erfolgreich zu absolvieren.

Weitere Informationen siehe [§373 SGB V](https://www.gesetze-im-internet.de/sgb_5/__373.html).

Hinweis: Sowohl für die Implementierung der ISiK-Spezifikation als auch für den Betrieb eines Produktes, das die ISiK-Spezifikation implementiert, ist eine SNOMED-CT-Lizenz notwendig. Diese kann beim [National Release Center für SNOMED CT in Deutschland](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) beantragt werden.

**Kontakt**

Bringen Sie allgemeine Fragen und Anmerkungen gerne über unser Anfrageportal ein: [Anfragen ISiK + ISiP](https://service.gematik.de/servicedesk/customer/portal/16)

Falls Sie keinen Zugang zum Anfrageportal haben und dieses nutzen wollen, senden Sie uns bitte eine Nachricht an die Adresse isik [ at ] gematik.de mit dem Betreff "Portalzugang".

**Herausgeber**

gematik GmbH

[Impressum](https://www.gematik.de/impressum/)

**Gender-Hinweis**

Zugunsten des Leseflusses wird in dieser Publikation meist die
männliche Form verwendet. Wir bitten, dies nicht als Zeichen einer
geschlechtsspezifischen Wertung zu deuten. Diese Variante deckt auch alle
weiteren Geschlechter, neben männlich und weiblich, ab.

