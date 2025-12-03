---
topic: Akteure
---

# Darstellung der Akteure

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>

**Diskussion**: Dieser Abschnitt fasst einen laufenden Arbeitsstand zu einem Akteurs-Konzept in ISiK zusammen, sodass die hier getroffenen Festlegungen nicht als zusätzliche normative Festlegung (MUSS) zu verstehen sind. Vielmehr werden getroffene normative Festlegungen (MUSS), die im Kontext des [CapabilityStatements des Vitalparameter Implementierungsleitfadens](https://simplifier.net/guide/isik-vitalparameter-stufe-5/Einfuehrung/Artefakte/CapabilityStatements) geführt werden, hier als 'Akteure' dargestellt und damit zur Umsetzung des ICU-Normalstation-Workflows definitorisch (informativ) präzisiert.
<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>


Folgende Akteure dienen der Umsetzung der beschriebenen Workflows (schematische Darstellung - eine technische Detaillierung mit normativer Geltung wird im CapabilityStatement getroffen). 


## Akteur - VitalSign ICU Source Minimal
* Zur genauen Beschreibung und Liste der Interaktionen siehe 
* Profile: Profile MI-I
* Interaction: READ, SEARCH

Zur genauen Liste der Interaktionen siehe {{pagelink:ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur,text:CapabilityStatement-Minimal-ICU}}. 

## Akteur - VitalSign ICU Source Extended

Profile: Profile MI-I
Interaction: READ, SEARCH

Zur genauen Beschreibung und Liste der Interaktionen siehe  {{pagelink:ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur, text:CapabilityStatement-Extended-ICU}}.

## Erklärung zu weiteren Capability Statements

Die Akteure aggregieren in diesem Kontext weitere Rollen (als Funktionsbausteine), die als solche statische Mengen von Interaktionen festlegen.

# Festlegung zur Implementierung der Akteure
Eine Festlegung zur Implementierung erfolgt im Rahmen der Definition der bestätigungsrelevanten Systeme.

<!-- ANF-ICU-001 -->
Basis-Server entsprechend der Definition zu den [bestätigungsrelevanten Systeme](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme) MÜSSEN folgenden Akteur implementieren:
- Akteur - VitalSign ICU Source Minimal

<!-- ANF-ICU-002 -->
Vitalparameter-Server entsprechend der Definition zu den [bestätigungsrelevanten Systeme](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme) MÜSSEN folgenden Akteur implementieren:
- Akteur - VitalSign ICU Source Extended

Primär hervorzuheben sind entsprechend der Definition der DKG dabei.

* KIS mit Funktion elektronische Kurve bzw. entsprechendes KIS-Modul
* Patientendaten-Managementsystem (PDMS) [z.B. für Intensivbereiche]
* Elektronische Kurve [z.B. für die Verwendung auf Normal-Stationen]


