---
topic: Akteurs- und Rollenmodell
---

# Erläuterung des Rollen- und Akteursmodells

Das hier dargestellte Modell unterscheidet zwischen **Rollen** und **Akteuren** als zentrale Konzepte zur modularen Beschreibung von Funktionalitäten in einem ISiK-Modul.

## Rollen: Wiederverwendbare Funktionseinheiten

**Rollen** repräsentieren in ISiK **abgrenzbare Funktionalitäten**, die als eigenständige, gekapselte Bausteine verstanden werden. Ein Beispiel ist die **Stammdatenrolle**, welche normativen Anforderungen zur Abfrage der grundlegenden Stammdateninformationen bündelt.

Diese Rollen sind so konzipiert, dass sie **wiederverwendbar** sind und eine klare, normative Beschreibung ihrer Funktionalität enthalten. Dadurch lassen sich **Redundanzen vermeiden**: Anstatt dass jeder Akteur sämtliche Anforderungen selbst im eigenen **FHIR CapabilityStatement (CpS)** aufführt, kann er **bestehende Rollen importieren**.

Das trägt zu einer sauberen Trennung von Verantwortlichkeiten bei und unterstützt eine wartbare sowie konsistente Systemarchitektur.

## Akteure: Zusammensetzung für konkrete Anwendungsfälle

**Akteure** stellen **konkrete Systemrollen** oder Systeme dar, die für bestimmte **Use-Cases** relevante Funktionalitäten bereitstellen. Ein Akteur ist dabei eine **Gruppe von Rollen**, die zusammen die Anforderungen eines bestimmten Anwendungskontexts abdecken.

Die Zusammenstellung erfolgt zielgerichtet: Akteure „implementieren“ Rollen, indem sie in seinem CapabilityStatement **importiert** (bzw. referenziert) werden. Diese `CapabilityStatement.import`-Elemente geben an, welche Rollen ein Akteur erfüllen muss.

## Zielsetzung des Modells

Dieses Modell ermöglicht eine **strukturierte, modulare und nachvollziehbare Definition** von Systemfähigkeiten. Es fördert die **Wiederverwendbarkeit** normativer Vorgaben, **vermeidet Duplikate** in den CapabilityStatements und unterstützt die klare **Zuordnung von Funktionalitäten zu konkreten Systemen**.

## Beispielhafte Darstellung unserer definierten rollen und Akteure

Zur Verdeutlichung der Abhängigkeiten zwischen Rollen und Akteuren steht das unten dargestellte Diagramm zur Verfügung. Es handelt sich um einen Ausschnitt der Akteure und Rollen aus den Modulen Vitalparameter-, Basis- und Medikationsmodul und stellt diese graphisch dar: 



<img src="/Material/Basis/images/diagrams/Akteurs_und_Rollenmodell_ISiK.svg" alt="Akteure und Rollen in ISiK"/> 