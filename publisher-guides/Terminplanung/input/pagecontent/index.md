Realm: Deutschland

----

### Motivation Terminplanung

Die Vereinbarung von Terminen für Behandlungsleistungen repräsentiert oftmals für Patienten oder für sie zuständige Leistungserbringer den Einstieg in den Versorgungsablauf im Krankenhaus. Die Terminplanung agiert somit als kritische Schnittstelle zwischen diversen Akteuren im Gesundheitswesen, inklusive der zu behandelnden Personen. Informationen zu notwendigen bzw. gewünschten Behandlungen, Verfügbarkeiten der involvierten Personen und abrechnungsrelevante Details zur Krankenversicherung müssen potenziell ausgetauscht werden, um einen optimierten Ablauf des Aufenthaltes im Krankenhaus zu ermöglichen.

Das Krankenhauszukunftsgesetz (KHZG) hebt die zentrale Rolle der Terminvereinbarung hervor, indem in den dazugehörigen Fördertatbeständen Vorgaben für die Terminplanung im digitalen Aufnahmemanagement bzw. für die Terminplanung mittels Patientenportalen gemacht werden (vgl. §19 Abs. 1 Satz 1 Nr. 2 KHSFV bzw. §21 Abs. 2 KHSFV).

Angelehnt an diese Vorgaben soll mittels ISiK die Grundlage geschaffen werden, um die beschriebenen oder ähnliche Use Cases durchzuführen und die fachlich-inhaltlichen Informationen in einer interoperablen Art und Weise auszutauschen. ISiK versteht sich somit als Schnittstellenbeschreibung, um eine einheitliche API zu dokumentieren, durch die ein Termin vereinbart und verwaltet werden kann. Das vorliegende ISiK-Modul bietet somit explizit KEIN umfassendes Datenmodell für die krankenhausinterne Ressourcenplanung. Hingegen legt ISiK lediglich Minimalvorgaben für bestätigungsrelevante Systeme fest, die als Grundlage für komplexere Workflows dienen.

Durch ISiK Terminplanung sollen folgende Möglichkeiten eröffnet werden:

* Abruf von Abbildungen von verfügbaren teil- und voll- stationären Behandlungsleistungen durch ein Krankenhaus
* Abfrage von Terminen und Verfügbarkeiten
* Buchungsmanagement von verfügbaren Terminen
* Benachrichtigungen bei Terminänderungen
* Anlage eines neuen Patienten im terminführenden System (Übermittlung Patient/Versicherungsinformationen)

### Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

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
