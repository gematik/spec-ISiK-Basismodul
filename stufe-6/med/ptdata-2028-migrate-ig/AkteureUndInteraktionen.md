# Akteure und Interaktionen - ISiK Medikation Implementierungsleitfaden v6.0.0-rc

ISiK Medikation Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Akteure und Interaktionen**

## Akteure und Interaktionen

Innerhalb des ISiK-Moduls Medikation kann ein beteiligtes System verschiedene Rollen einnehmen und somit unterschiedliche Aufgaben übernehmen.

In Anlehnung an IHE HMW werden im Folgenden diese Rollen mithilfe der Definition von Akteuren formalisiert und die Interaktionen zugeordnet.

Hierbei wird wiederum unterschieden zwischen den folgenden drei Bereichen:

* **Medication Summary (Medikationsinformationen, “Medikationspläne”):** Bildet den Medikationsstatus eines Patienten ab, z.B. Informationen über Dauermedikation oder Selbstmedikation. In diesem Kontext wird häufig noch eine Liste verwendet, in der die einzelnen Medikationsinformationen strukturiert sind - siehe .
* **Medication Order (Medikations-Verordnungen):** Informationen über die Verordnung von Medikamenten im Rahmen des medizinischen Workflows - .
* **Administered Medication (Medikations-Verabreichungen):** Informationen über die (erfolgte) Verabreichung bzw. Einnahme von Medikamenten im Rahmen des medizinischen Workflows - .

Für jeden dieser Bereiche wurden jeweils drei Systemrollen identifiziert, die in einem oder mehreren Systemen implementiert sein können:

* **Repository:** Hält die jeweiligen Informationen (Datenobjekte) vor und verwaltet diese. Es ermöglicht das Erstellen, Ändern und Lesen dieser Informationen.

Folgende Rollen entsprechen einem Client, wofür in diesem Implementierungsleitfaden keine Festlegungen getroffen werden:

* **Provider:** Erstellt bzw. generiert die Informationen und übermittelt sie an das Repository.
* **Consumer:** Liest die Informationen aus dem Repository, beispielsweise um sie dem Benutzer anzuzeigen oder anderweitig zu verarbeiten.

Die Interaktionen sind somit in allen drei Bereichen äquivalent:

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Medikation/main-stufe-4/Material/images/diagrams/Interaktionen.svg)

Zum AMTS-Akteur siehe den entsprechenden Abschnitt unter Use Cases.

