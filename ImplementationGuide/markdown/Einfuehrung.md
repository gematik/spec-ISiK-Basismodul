<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Sicherheit/main-stufe-3/Material/images/Gematik_Logo_Flag.svg" alt="gematik logo" width="400"/>

----

Version: 5.1.0

Datum: 22.10.2025

Status: Aktiv

Realm: Deutschland

# Motivation - Connect Modul

Die sichere und interoperable Identitäts- und Zugriffskontrolle stellt eine zentrale Herausforderung im Gesundheitswesen dar. Insbesondere im Krankenhausumfeld müssen Systeme und Benutzer zuverlässig authentifiziert und autorisiert werden, um den Zugriff auf medizinische Daten zu steuern. 

## Herausforderung der Identitätsverknüpfung im Krankenhausumfeld

Die sichere und eindeutige Verknüpfung von Nutzern eines Patientenportals mit den tatsächlichen Patientenentitäten in einem patientenführenden System stellt eine zentrale Herausforderung im Gesundheitswesen dar. Derzeit existieren unterschiedliche Ansätze zur Authentifizierung und Autorisierung, jedoch fehlt eine einheitliche, standardisierte Methode zur sicheren Identitätszuordnung.

In der Praxis führt dies zu erheblichen Problemen:

* Patienten registrieren sich in einem Portal, doch ohne eine zuverlässige Verknüpfung mit ihrer Patientenakte im Krankenhausinformationssystem (KIS) oder anderen medizinischen Systemen bleibt unklar, ob sie tatsächlich berechtigt sind, auf die entsprechenden Daten zuzugreifen.
* Unterschiedliche Identitätsanbieter (IdPs) verwenden verschiedene Mechanismen zur Authentifizierung, was eine nahtlose Integration in bestehende Systeme erschwert.
* Fehlende Standardisierung in der Begriffsverwendung und den zugrunde liegenden Protokollen führt zu Interoperabilitätsproblemen zwischen Systemen verschiedener Hersteller.

Um eine sichere, interoperable und datenschutzkonforme Lösung für den Zugriff auf medizinische Daten zu schaffen, ist ein standardisierter Ansatz für die Identitäts- und Zugriffskontrolle erforderlich.

## Zielsetzung des Implementation Guide

Dieser Implementation Guide (IG) soll eine einheitliche Methode zur Autorisierung und Authentifizierung von Systemen und Benutzern im Krankenhausumfeld definieren. Der Fokus liegt insbesondere auf der sicheren Identitätsverknüpfung zwischen Nutzern eines Patientenportals und den entsprechenden Patientendaten in den Ressourcenservern.

Im Zentrum stehen folgende Anwendungsfälle:

### Sichere Authentifizierung des Patienten

Eine zuverlässige Authentifizierung stellt sicher, dass Patienten im Patientenportal eindeutig als berechtigte Nutzer identifiziert werden. Dies bildet die Grundlage für die sichere Zuordnung der digitalen Identität zu einer konkreten Patientenakte und den datenschutzkonformen Zugriff auf persönliche Gesundheitsinformationen.

### Gesicherter Zugriff auf medizinische Daten

Nach erfolgreicher Authentifizierung soll ein Patient über das Portal auf seine medizinischen Daten zugreifen können, beispielsweise auf Befunde, Arztbriefe oder Laborergebnisse aus Krankenhausinformationssystemen (KIS) oder anderen medizinischen Systemen. Eine fehlerhafte oder unzureichende Identitätszuordnung würde dabei ein erhebliches Sicherheits- und Datenschutzrisiko darstellen.

## Technische und konzeptionelle Grundlagen

Um eine sichere und interoperable Lösung zu ermöglichen, werden folgende Aspekte berücksichtigt:

* Standardisierte Autorisierungsprotokolle: Nutzung etablierter Protokolle wie OAuth2 und OpenID Connect zur sicheren Autorisierung und Authentifizierung.
* Integration von Identitätsanbietern (IdPs): Untersuchung der Nutzung externer Identity Provider (IdPs), z. B. des Gematik-IdP, zur Verbesserung der Authentifizierung und Integration in bestehende Systeme.
* Eindeutige Identitätszuordnung: Konzepte zur sicheren Verknüpfung von Identitäten zwischen Patientenportalen und den entsprechenden Patientenakten im Krankenhausinformationssystem.
- Konsistente Definition zentraler Begriffe: Bereitstellung klarer Definitionen für Konzepte wie Identity Provider, Autorisierungsserver und Ressourcen-Server, um Missverständnisse zu vermeiden und eine einheitliche Kommunikation zu ermöglichen.

## Technischer Rahmen

Der IG baut auf bestehenden Standards auf, insbesondere:

* SMART on FHIR: Nutzung der Konzepte aus dem SMART on FHIR IG, insbesondere für OAuth2-basierte Autorisierung und OpenID Connect zur Authentifizierung.
* FHIR R4: Sicherstellung der Kompatibilität mit der FHIR R4-Spezifikation.
* OAuth2 & OpenID Connect: Verwendung bewährter Sicherheitsstandards für den Zugriff auf medizinische Systeme.

Die normativen Festlegungen des Moduls ISiK Connect sind im Wesentlichen der Seite zu den {{pagelink: ImplementationGuide/markdown/Conformance.md, text:Festlegungen für Connect}} zu entnehmen.

## Bedeutung für das Gesundheitswesen

Die sichere und standardisierte Autorisierung von Zugriffen auf medizinische Daten ist essenziell für die digitale Vernetzung im Krankenhausumfeld. Eine zentrale Rolle spielt dabei das ISiK-Modul Connect (ISiK-Connect), das in ISiK Stufe 5 Anforderungen an die Autorisierung für über ISiK-Ressourcen-Server bereitgestellte FHIR-Endpunkte definiert. Dadurch wird es Krankenhäusern ermöglicht, die Zugriffsrechte eines Benutzers gezielt an verschiedene Clients zu delegieren – sei es an klinische Subsysteme, Patientenportale, Terminverwaltungssysteme oder mobile Anwendungen zur Erfassung von Gesundheitsdaten.

ISiK-Connect schafft eine einheitliche Grundlage für die Absicherung von FHIR-Schnittstellen und den darüber zugreifbaren Daten, sodass die Schutzziele Vertraulichkeit und Integrität in einer standardisierten Weise gewährleistet werden können. Dabei gibt das Modul selbst keine festen Berechtigungen vor, sondern fokussiert auf den interoperablen Austausch relevanter Autorisierungsinformationen. Dies ermöglicht es Krankenhäusern, bestehende Rollen- und Rechtekonzepte ISiK-konform weiterzuverwenden und nahtlos in ihre bestehenden IT-Strukturen zu integrieren.

Dieser Implementation Guide baut auf diesen Prinzipien auf und erweitert sie gezielt um Mechanismen zur sicheren Identitätsverknüpfung. Durch eine klare Methodik zur Authentifizierung und Autorisierung wird sichergestellt, dass Nutzer eines Patientenportals zuverlässig mit den entsprechenden Patientenakten in den patientenführenden Systemen verknüpft werden können. Damit leistet dieser IG einen entscheidenden Beitrag zur sicheren und interoperablen Nutzung von FHIR-Schnittstellen und fördert die digitale Transformation im Gesundheitswesen nachhaltig.

## Disclaimer
**Es ist zu beachten, dass durch das Erlangen einer Bestätigung für das vorliegende ISiK-Modul keine Aussagen über die Sicherheit der Implementierung im jeweiligen bestätigungsrelevanten System abgeleitet werden können. Die Bestätigung bezieht sich alleinig auf die Konformität zu der Spezifikation. Weitere Sicherheit-Audits werden ausdrücklich empfohlen.**


# Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen, verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. 
Für diesen Zweck wurden [FHIR-Profile](https://simplifier.net/guide/isik-basis-stufe-5/einfuehrung?version=current) und ein REST-basiertes Application Programming Interface (API) entwickelt. Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html).

Weitere Informationen siehe [§ 373 SGB V](https://www.gesetze-im-internet.de/sgb_5/__373.html).

Hinweis: Sowohl für die Implementierung der ISiK-Spezifikation als auch für den Betrieb eines Produktes, das die ISiK-Spezifikation implementiert, ist eine SNOMED-CT-Lizenz notwendig. Diese kann beim [National Release Center für SNOMED CT in Deutschland](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) beantragt werden.


**Kontakt**

Bringen Sie allgemeine Fragen und Anmerkungen gerne über unser Anfrageportal ein: [Anfragen ISiK + ISiP](https://service.gematik.de/servicedesk/customer/portal/16)

Falls Sie keinen Zugang zum Anfrageportal haben und dieses nutzen wollen, senden Sie uns bitte eine Nachricht an die Adresse isik [ at ] gematik.de mit dem Betreff "Portalzugang".

**Herausgeber**

gematik GmbH

[Impressum](https://www.gematik.de/impressum/)

**Gender-Hinweis**

Zugunsten des Leseflusses wird in dieser Publikation meist die
die in der Alltagssprache gebräuchliche Form verwendet. Wir bitten, dies nicht als Zeichen einer
geschlechtsspezifischen Wertung zu deuten. Diese Variante deckt auch alle
weiteren Geschlechter, neben männlich und weiblich, ab.
