---
topic: ImplementationGuide-markdown-Einfuehrung
---
<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/images/Gematik_Logo_Flag.svg" alt="gematik logo" width="400"/>

----
Version: 0.0.1

Datum: tbd.

Status: DRAFT

Realm: Deutschland





----

# Motivation Workflow Organspendetektion (?- TODO Wording zu Prüfen)

... TODO

Die Spezifikation ist in enger Kooperation mit der Deutsche Stiftung Organtransplantation (DSO) sowie des Datenintegrazionszentrums der Uniklinik Dresden (DIZ UKDD) und auch den [Verantwortlichen des 'Kerndatensatzes Erweiterungsmodul Intensivmedizin' der Medizininformatik Initiative (MII)](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/IGMIIKDSModulICU.html) entstanden.


## Motivation und Hintergrund
Dieser Implementierungsleitfaden beschreibt eine Workflow, bei dem Daten zum geschilderten Use Case durch ein PDMS bereitgestellt werden.

TODO

###  Stakeholder
Die Spezifikation richtet sich insbesondere an SW-Hersteller von PDMS.

Es handelt sich um eine technische Spezifikation. 

Allerdings sind Profile, die relevant sind für die Umsetzung des Workflows, unter Federführung unserer Kooperationspartner, der [Verantwortlichen des 'Kerndatensatzes Erweiterungsmodul Intensivmedizin' der Medizininformatik Initiative (MII)](https://simplifier.net/guide/Medizininformatik-Initiative-Modul-ICU-ImplementationGuide-DE/MII-IG-Modul-ICU?version=current), einer medizinischen Validierung unterzogen worden. 

Die Profile werden mit den Kooperationspartnern der MII, des DIZ UKDD und der DSO weiter in enger Kooperation gepflegt. Das Packaging der Profile erfolgt mittels ISiK. 

TODO - ggf. übernehmen Abschnitt zur Prüfung aus ICU

Die klinische Qualitätssicherung soll die Wahrscheinlichkeit von Fehlern reduzieren, kann Fehler aber nicht ausschließen.

Kommunikations-Workflows, die auf dieser Schnittstellen-Festlegung aufbauen, können lediglich der Unterstützung von Versorgung und Qualitätssicherungsmaßnahmen in der ... TODO .

###  User
Primär zu berücksichtigende User sind:
* transplantationsbeauftragte Ärztinnen und Ärzte

###  Einordnung in die ISiK Landschaft
Als übergreifender Use Case (bzw. Workflow) ist die Organspendetektion nicht allein im Modul Vitalparameter verankert. Fachlich relevant sind im ISiK-Kontext für die Intensivversorgung ebenfalls:

- TODO prüfen (ggf. an ICU orientieren)
 
###  Out-of-Scope
Aufgrund technischer Beschränkungen und Aufwände gibt es Aspekte, die aktuell außen vor bleiben müssen:
- TODO prüfen (ggf. an ICU orientieren)


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

