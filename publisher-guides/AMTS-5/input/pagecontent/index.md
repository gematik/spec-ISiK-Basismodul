<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Medikation/main-stufe-4/Material/images/Gematik_Logo_Flag.svg" alt="gematik logo" width="400"/>

----
Version: 5.1.1

Datum: 17.12.2025


Status: Aktiv

Realm: Deutschland

----

# Motivation AMTS Implementation Guide

Die Arzneimittel-Therapiesicherheit ist ein wesentlicher Bestandteil einer qualitativ hochwertigen Patientenversorgung, da Medikationsfehler sowie nicht berücksichtigte Risiken wie Wechselwirkungen, Allergien oder Kontraindikationen erhebliche gesundheitliche Schäden verursachen können. Ein Implementierungsleitfaden im ISiK-Kontext schafft die notwendige Grundlage, um sicherheitsrelevante Informationen standardisiert, interoperabel und systemübergreifend verfügbar zu machen. Dadurch können potenzielle Risiken frühzeitig erkannt, klinische Entscheidungen gezielt unterstützt und die Sicherheit der Arzneimitteltherapie nachhaltig verbessert werden.

Dieser Implementierungsleitfaden beschreibt die an der Schnittstelle verfügbaren Informationen für eine sichere Arzneimitteltherapie. Das beinhaltet die Vermeidung sämtlicher unerwünschter und potenziell gefährlicher Reaktionen eines individuellen Patienten im Zuge der Einnahme einer verordneten Medikation. Ein intuitives Beispiel dafür ist eine Penicillinallergie des Patienten.

Durch diesen Implementierungsleitfaden werden die bereitgestellten Ressourcen der ISiK-Landschaft erweitert, sodass eine Vielzahl an Funktionen möglich ist, mit denen eine Medikation individuell durch die Informationssysteme beurteilt oder angepasst werden kann.
Die bedeutendsten abzudeckenden Use Cases sind Wechselwirkungen, Allergien und Kontraindikationen, die vor einer Abgabe identifiziert werden sollten. So lässt sich dann z.B. erkennen, ob ein Medikament in einem bestimmten Behandlungsfall nicht als sicher einzustufen ist. Mit den verfügbaren Informationen könnte potenziell auch ein individuell besser geeignetes Medikament vorgeschlagen werden.

## Ziele

Ziele des vorliegenden IG sind:
1. Die Identifikation und Beschreibung relevanter Anwendungsfälle.
2. Die Identifikation und nachfolgende Spezifikation neuer notwendiger (oder zu erweiternder) Ressourcen als Informationsträger für die AMTS Bewertung.
3. Die Schaffung eines Implementierungsleitfadens zur Bereitstellung ebendieser AMTS relevanten Informationen.
4. Die korrekte Abgrenzung des Leistungsumfangs ISiK-Medikation im Bezug auf AMTS (Out-of-Scope).

Die genauere Zielstellung kann unter Einbeziehung der Stakeholder in der Evolution von ISiK erweitert oder verändert werden.

## Out-of-scope

Aufgrund technischer Beschränkungen oder eines starken implizierten Aufwands gibt es auch Aspekte, die aktuell noch außen vor bleiben müssen:
1. Die Schaffung, Abstimmung und Spezifikation eines vollständigen ISiK Labor Moduls.
2. Medical Knowledge Management. Eine medizinische Wissensdatenbank ohne Patientenbezug, in der zum Beispiel Informationen zu bekannten Nebenwirkungen,Wechselwirkungen oder Kontra-Indikationen gespeichert werden (z.B. FHIR-R5 Ressource _ClinicalUseDefinition_). Leider stehen entsprechende Ressourcen erst in R5 zur Verfügung und es gibt kein einheitliches Bild wo eine solche Medical Knowledge DB in der deutschen Gesundheitslandschaft (und in der Telematik Infrastruktur) zu verorten wäre.
3. Die Einbeziehung eines Therapieziel (FHIR-R4 Ressource _Goal_), da dies sehr komplex ist und ein erheblicher Abstimmungsaufwand impliziert wäre.
4. Die Einbeziehung eines Therapieplan (FHIR-R4 Ressource _Careplan_), da dieser ein neues Fachfeld braucht. Dieses Feld (Onkologie) würde ein neues ISiK Modul sowie IG begründen und benötigt eine eigene Arbeitsgruppe in einer zukünftigen Stufe.

Einige dieser Aspekte sind bereits im Backlog für kommende ISiK Entwicklungsstufen aufgenommen.

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

