---
topic: ImplementationGuide-markdown-Einfuehrung
---

----
Version: 0.0.1-rc

Datum: tbd.

Status: DRAFT

Realm: Deutschland

----


### Organspendererkennung

Eine der vielfältigen Aufgaben von Ärzten im intensivmedizinischen Alltag und zentrale Aufgabe von Transplantationsbeauftragten, ist die Erkennung von potenziellen Organspendern.
In der konsequenten und frühzeitigen Erkennung von möglichen Organspendern liegt ein entscheidender Schlüssel zur Ausschöpfung des Organspendepotentials sowie zur Umsetzung des Patientenwillens am Lebensende. 
Werden Patienten, die für eine Organspende in Frage kommen könnten, rechtzeitig erkannt, kann die medizinische Behandlung frühzeitig im Sinne des Patientenwillens angepasst, Angehörige frühzeitig und gegebenenfalls psychologisch begleitet und die notwendigen organisatorischen Schritte für eine erfolgreiche Organspende und Transplantation eingeleitet werden. Zwingende Voraussetzung hierfür ist in Deutschland die Feststellung des irreversiblen Hirnfunktionsausfalls (IHA). 


#### Motivation und Hintergrund

[Wissenschaftliche Daten](https://link.springer.com/article/10.1007/s00101-018-0510-x) zeigen ein relevantes Erkennungsdefizit bei Patienten, die im Verlauf einen IHA erleiden könnten.
Ein erheblicher Anteil dieser Patienten verstirbt im Rahmen einer Therapielimitierung nach Feststellung einer infausten Prognose aufgrund einer schweren Hirnschädigung, ohne dass die Option einer Organspende zuvor evaluiert wurde.
 
Der IHA ist insgesamt ein sehr seltenes Ereignis auf Intensivstationen und erfordert daher eine besonders hohe Aufmerksamkeit des medizinischen Personals für entsprechende klinische Indikatoren.

Organisatorisch unterstützende Softwarelösungen können dazu beitragen, potenzielle relevante Fälle gezielt zu erkennen und in den klinischen Fokus zu rücken. 
In einer [wissenschaftlichen Studie](https://pubmed.ncbi.nlm.nih.gov/37626244/) konnte die Genauigkeit des hier beschriebenen Screening-Algorithmus nachgewiesen werden.
Eine weitere [Untersuchung](https://www.aerzteblatt.de/archiv/automatisiertes-elektronisches-screeningtool-detect-zur-erkennung-des-potenziell-irreversiblen-hirnfunktionsausfalls-cbec861b-c7e2-42c9-9e95-3f609d9e6855) zeigte zudem einen positiven Einfluss auf die Erkennung von Patienten mit drohendem IHA.
Als relevant gilt ein Fall, wenn spezifische, im intensivmedizinischen Kontext erhobene Parameter auf eine schwerste Hirnschädigung in einem kritischen Bereich hinweisen.


Die flächendeckende Einführung einer solchen Anwendung hängt insbesondere von der Nutzbarkeit vorhandener Daten aus dedizierten Systemen ab. Offene Schnittstellen und einheitliche Datenformate stellen dabei einen zentralen Multiplikator für die Integration in die klinische IT-Infrastruktur der Krankenhäuser dar und sind entscheidend für die Verbesserung der Erkennung potenzieller Organspender.  Dieser Implementierungsleitfaden beschreibt daher die notwendigen Prozesse, spezifizierten REST-Abfragen und FHIR-Profile, die durch ein PDMS bereitgestellt werden müssen, um die Integration eines entsprechenden Softwaresystems zu ermöglichen.


#### Stakeholder
Die Spezifikation richtet sich insbesondere an SW-Hersteller von PDMS.

Es handelt sich um eine technische Spezifikation, die keinerlei Vorgaben zur klinischen Umsetzung des Workflows macht.

Die Spezifikation ist in enger Kooperation mit der Deutschen Stiftung Organtransplantation (DSO) sowie dem Datenintegrationszentrum der Uniklinik Dresden (DIZ UKDD) und auch den [Verantwortlichen des 'Kerndatensatzes Erweiterungsmodul Intensivmedizin' der Medizininformatik Initiative (MII)](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/IGMIIKDSModulICU.html) entstanden.

Eine medizinische Validierung der Profile erfolgte durch die gematik nicht. 

Allerdings sind bestimmte Profile, die relevant sind für die Umsetzung des Workflows, unter Federführung unserer Kooperationspartner, der [Verantwortlichen des 'Kerndatensatzes Erweiterungsmodul Intensivmedizin' der Medizininformatik Initiative (MII)](https://simplifier.net/guide/Medizininformatik-Initiative-Modul-ICU-ImplementationGuide-DE/MII-IG-Modul-ICU?version=current), einer medizinischen Validierung unterzogen worden. 
Die klinische Qualitätssicherung soll die Wahrscheinlichkeit von Fehlern reduzieren, kann Fehler aber nicht ausschließen.

Die Profile werden mit den Kooperationspartnern der MII, des DIZ UKDD und der DSO weiter in enger Kooperation gepflegt. Das Packaging der Profile erfolgt mittels ISiK. 

#### User
Primär zu berücksichtigende User sind:
* transplantationsbeauftragte Ärztinnen und Ärzte

#### Einordnung in die ISiK Landschaft
Als Use Case (bzw. Workflow) ist die Organspendeerkennung im Modul Vitalparameter verankert. 

Fachlich relevant sind im ISiK-Kontext für die Intensivversorgung ebenfalls:

* **ISiK Basismodul: Mit Informationen zum Patienten und Diagnosen** - Hier sind Patientenstammdaten, Diagnosen und Prozeduren verortet. Siehe [ISiK Basismodul](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/index.html)
 
#### Out-of-Scope
Es werden keine Vorgaben zur konkreten technischen Umsetzung des Workflows gemacht, sondern lediglich die notwendigen Schnittstellen (inklusive Profile) spezifiziert.


###  Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

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

