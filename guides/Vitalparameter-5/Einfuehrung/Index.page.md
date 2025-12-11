<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/main-stufe-3/Material/images/Gematik_Logo_Flag.svg" alt="gematik logo" width="400"/>

----
Version: 5.1.1-rc

Datum: 11.12.2025

Status: Aktiv

Realm: Deutschland

----

# Motivation - ISiK Vitalparameter

Die Erhebung und Verarbeitung von Vitalparametern und Körpermaßen ist ein essentieller Bestandteil der medizinischen Versorgung und spielt insbesondere in Krankenhäusern eine wichtige Rolle. Durch Vitalparameter wird eine initiale Einschätzung der Gesundheit von Patienten ermöglicht und sie enthalten wichtige Hinweise auf potenzielle Krankheitsbilder. Vitalparameter können als begleitende Informationen bei der Anforderung von Untersuchungen oder der Verordnung von Medikamenten verwendet werden. Auch während der Genesung können Vitalparameter wichtige Anhaltspunkte bezüglich des Fortschritts geben. Durch die weite Verbreitung von Wearables haben Patienten heutzutage zusätzlich die Möglichkeit, ihre Vitalparameter tagesaktuell zu teilen. 

Um Vitalparameter und Körpermaße in verschiedenen Systemen verwenden zu können, müssen diese einheitlich und interoperabel zur Verfügung gestellt werden. Derzeit herrscht in Krankenhäusern ein reaktiver Datenaustausch vor, meist basierend auf HL7v2, und externe Geräte lassen sich nur schwer oder gar nicht mit in die Infrastruktur der Krankenhäuser einbinden. Auch mit Hinblick auf die uneinheitliche Kodierung der Vitalparameter ist oft keine systemübergreifende Interpretation der ausgetauschten Daten möglich. Die mit Vitalparametern befasste medizinische Forschung und Versorgung ist somit inhärent limitiert und kann durch die heterogene Datenlandschaft nicht ihr volles Potenzial entfalten. Um dies zu erreichen, trifft dieser Leitfaden Festlegungen zum strukturierten, REST-basierten Austausch von Vitalparametern im Krankenhaus. Mit diesen Festlegungen werden neue, digital unterstützte Anwendungsfälle ermöglicht und die medizinische Versorgung und Forschung im Krankenhaus verbessert.



# Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. Dieser FHIR ImplementationGuide (IG) beschreibt die für diesen Zweck entwickelten FHIR Profile und das [REST](https://de.wikipedia.org/wiki/Representational_State_Transfer)-basierte Application Programming Interface (API). Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html). Dieser Leitfaden konkretisiert die ISiK-relevanten Funktionen der Standard-REST-API und trifft inhaltliche Festlegungen zu den ISiK-relevanten Ressourcen in Form von Ressourcen-Profilen.

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
