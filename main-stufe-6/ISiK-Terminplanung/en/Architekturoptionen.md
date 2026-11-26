# Architekturoptionen - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Architekturoptionen**

## Architekturoptionen

Im folgenden werden beispielhaft Architekturen dargestellt, die das Zusammenspiel von Systemen im Kontext der Terminplanung darstellen.

### KIS als terminführendes System

Eine in der Praxis vorkommende Architektur sieht das KIS als terminführendes System. Im Sinne des IGs wäre das KIS somit das Termin-Repository. Darüber hinaus existiert ein Patientenportal, über das Patienten online Termine buchen können. Das Patientenportal ist somit zugleich Termin-Requestor und Termin-Consumer.

### Patientenportal als Terminführendes System

Eine andere Variante sieht vor das Patientenportal als terminführendes System einzubinden. In dieser Variante ist das KIS weiterhin auch als Termin-Repository zu betrachten, da Kapazitäten der Leistungserbringer hier vorgehalten werden. Das Patientenportal erhält jedoch weitergehende Rechte und kann hierdurch direkt Termine buchen. Eine bidirektionale Synchronisierung des Patientenportals und des KIS müsste bei dieser Variante fortlaufend durchgeführt werden.

