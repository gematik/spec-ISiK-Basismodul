---
topic: Akteurs- und Rollenmodell
---

# Erläuterung des Rollen- und Akteursmodells

Das hier dargestellte Modell unterscheidet zwischen **Rollen** und **Akteuren** als zentrale Konzepte zur modularen Beschreibung von Funktionalitäten in einem FHIR-basierten System.

## Rollen: Wiederverwendbare Funktionseinheiten

**Rollen** repräsentieren bei uns **abgrenzbare Funktionalitäten**, die als eigenständige, gekapselte Bausteine verstanden werden. Ein Beispiel ist die **Stammdatenrolle**, welche sämtliche normativen Anforderungen zur Abfrage von Stammdateninformationen bündelt.

Diese Rollen sind so konzipiert, dass sie **wiederverwendbar** sind und eine klare, normative Beschreibung ihrer Funktionalität enthalten. Dadurch lassen sich **Redundanzen vermeiden**: Anstatt dass jeder Akteur sämtliche Anforderungen selbst im eigenen **FHIR CapabilityStatement (CpS)** aufführt, kann er **bestehende Rollen importieren**.

Das trägt zu einer sauberen Trennung von Verantwortlichkeiten bei und unterstützt eine wartbare sowie konsistente Systemarchitektur.

## Akteure: Zusammensetzung für konkrete Anwendungsfälle

**Akteure** stellen **konkrete Systemrollen** oder Systeme dar, die für bestimmte **Use-Cases** relevante Funktionalitäten bereitstellen. Ein Akteur ist dabei eine **Gruppe von Rollen**, die zusammen die Anforderungen eines bestimmten Anwendungskontexts abdecken.

Die Zusammenstellung erfolgt zielgerichtet: Ein Akteur „implementiert“ Rollen, indem er sie in seinem CapabilityStatement **importiert** (bzw. referenziert). Diese `CapabilityStatement.import`-Elemente geben an, **welche Rollen ein Akteur erfüllt**.

## Zielsetzung des Modells

Dieses Modell ermöglicht eine **strukturierte, modulare und nachvollziehbare Definition** von Systemfähigkeiten. Es fördert die **Wiederverwendbarkeit** normativer Vorgaben, **vermeidet Duplikate** in den CapabilityStatements und unterstützt die klare **Zuordnung von Funktionalitäten zu konkreten Systemen**.

## Beispielhafte Darstellung unserer definierten rollen und Akteure

Zur Verdeutlichung haben wir die Abhängigkeiten zwischen Rollen und Akteuren aus den Modulen Vitalparameter-, Basis- und Medikationsmodul graphisch dargestellt: 

<img src="/Material/Basis/images/diagrams/Akteurs_und_Rollenmodell_ISiK.svg" alt="Akteure und Rollen in ISiK" width="75"/>