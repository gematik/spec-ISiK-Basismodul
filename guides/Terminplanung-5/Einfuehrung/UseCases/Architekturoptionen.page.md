---
topic: Architekturoptionen
---

## {{page-title}}

Im folgenden werden beispielhafte mögliche Architekturen dargestellt, die das Zusammenspiel von Systemen im Kontext der Terminplanung darstellen.

### KIS als terminführendes System

Eine in der Praxis vermutlich häufig vorkommende Architektur sieht das KIS als terminführendes System, im Sinne des IGs ist es somit das Termin-Repository. Darüber hinaus existiert ein Patientenportal, über das Patienten online Termine buchen können. Das Patientenportal ist somit zugleich Termin-Requestor und Termin-Consumer.

![KIS als terminführendes System](../../../../Material/Terminplanung/images/diagrams/Termin_KIS_als_Repository.drawio.svg)

### Patientenportal als Terminführendes System

Eine andere Variante ist das Patientenportal als terminführendes System einzubinden. Hierbei würde das KIS sich weiterhin mit dem Termin-Repository synchronisieren, damit die Termine für Leistungserbringer weiterhin sichtbar sind. Das Patientenportal stellt in diesem Fall das Termin-Repository dar.

![Patientenportal als termiführendes System](../../../../Material/Terminplanung/images/diagrams/Termin_Patientenportal_als_Repository.drawio.svg)