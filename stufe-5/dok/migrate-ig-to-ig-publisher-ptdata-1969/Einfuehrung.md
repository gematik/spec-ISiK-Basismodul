# Einführung - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Einführung**

## Einführung

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/images/Gematik_Logo_Flag.svg)

-------

Version: 5.1.0

Datum: 23.10.2025

Status: Aktiv

Realm: Deutschland

-------

# Motivation Dokumentenaustausch

Die bedarfsgerechte Bereitstellung von klinischen Dokumenten spielt bei der Patientenversorgung eine wichtige Rolle. Dokumente liegen in den meisten Fällen in elektronischer Form vor (digital erstellt oder eingescannt). Die in den Einrichtungen etablierten Kommunikationsverfahren mittels HL7 Version 2 haben jedoch ausschließlich die Server-zu-Server-Kommunikation im Fokus und erlauben keine standardisierte query-getriebene Dokumentenbereitstellung, wie sie zum Beispiel für webbasierte und mobile Applikationen erforderlich wäre. Eine solche Form der Dokumentenverfügbarkeit ist jedoch die Voraussetzung dafür, ärztlichem und pflegerischem Personal relevante klinische Informationen an jedem Ort und zu jeder Zeit im benötigten Umfang zur Verfügung zu stellen.

Das ISiK-Modul “Dokumentenaustausch” möchte diese technologische Lücke schließen und webbasierten Applikationen darüber hinaus auch die Bereitstellung neu erstellter Dokumente (z.B. Formulare, die auf einem Tablet ausgefüllt wurden; Bilddokumentation, die mithilfe einer Smartphone-App erstellt wurde; Befunddokumentation, die an webbasierten Clients verfasst wurde; mit einer Smartphone-Kamera gescannte Dokumente; etc.) in den entsprechenden Dokumentenverwaltungssystemen mit einfachen Mitteln ermöglichen.

Bei der Festlegung dieser Spezifikation findet das IHE-MHD-Profil eine besondere Beachtung, um alle im ISiK-Kontext kommunizierten Dokumente mit möglichst wenig zusätzlichem Aufwand auch in einer IHE-XDS/MHD Kommunikation austauschen zu können.

Der Fokus dieser Spezifikation liegt zunächst auf den Festlegungen zum Datenaustausch **innerhalb** einer Einrichtung, soll künftig jedoch auch Best Practice-Empfehlungen zur Einstellung von Dokumenten in die ePA eines Patienten, der Weiterleitung an andere Leistungserbringer via KIM oder dem einrichtungsübergreifenden Dokumentenaustausch via MHD/XDS enthalten.

# Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen, verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. Dieser FHIR ImplementationGuide (IG) beschreibt die für diesen Zweck entwickelten FHIR Profile und das [REST](https://de.wikipedia.org/wiki/Representational_State_Transfer)-basierte Application Programming Interface (API). Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html). Dieser Leitfaden konkretisiert die ISiK-relevanten Funktionen der Standard-REST-API und trifft inhaltliche Festlegungen zu den ISiK-relevanten Ressourcen in Form von Ressourcen-Profilen.

Hersteller bestätigungsrelevanter Systeme sollen durch diesen IG in die Lage versetzt werden, eine konforme Implementierung zu erstellen und das Bestätigungsverfahren der gematik erfolgreich zu absolvieren.

Weitere Informationen siehe [§373 SGB V](https://www.gesetze-im-internet.de/sgb_5/__373.html).

Hinweis: Sowohl für die Implementierung der ISiK-Spezifikation als auch für den Betrieb eines Produktes, das die ISiK-Spezifikation implementiert, ist eine SNOMED-CT-Lizenz notwendig. Diese kann beim [National Release Center für SNOMED CT in Deutschland](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) beantragt werden.

**Kontakt**

Bringen Sie allgemeine Fragen und Anmerkungen gerne über unser Anfrageportal ein: [Anfragen ISiK + ISiP](https://service.gematik.de/servicedesk/customer/portal/16)

Falls Sie keinen Zugang zum Anfrageportal haben und dieses nutzen wollen, senden Sie uns bitte eine Nachricht an die Adresse isik [ at ] gematik.de mit dem Betreff “Portalzugang”.

**Herausgeber**

gematik GmbH

[Impressum](https://www.gematik.de/impressum/)

**Gender-Hinweis**

Zugunsten des Leseflusses wird in dieser Publikation meist die männliche Form verwendet. Wir bitten, dies nicht als Zeichen einer geschlechtsspezifischen Wertung zu deuten. Diese Variante deckt auch alle weiteren Geschlechter, neben männlich und weiblich, ab.

