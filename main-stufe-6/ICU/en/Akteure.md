# Akteure - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Akteure**

## Akteure

### Darstellung der Akteure

**Diskussion:**Dieser Abschnitt fasst einen laufenden Arbeitsstand zu einem Akteurs-Konzept in ISiK zusammen, sodass die hier getroffenen Festlegungen nicht als zusätzliche normative Festlegung (MUSS) zu verstehen sind. Vielmehr werden getroffene normative Festlegungen (MUSS), die im Kontext des [CapabilityStatements des Vitalparameter Implementierungsleitfadens](https://gemspec.gematik.de/ig/fhir/isik/vitalparameter/6.0.0-rc1/CapabilityStatement-ISiKCapabilityStatementVitalSignStandardSourceRolle.html) geführt werden, hier als 'Akteure' dargestellt und damit zur Umsetzung des ICU-Normalstation-Workflows definitorisch (informativ) präzisiert.

Folgende Akteure dienen der Umsetzung der beschriebenen Workflows (schematische Darstellung - eine technische Detaillierung mit normativer Geltung wird im CapabilityStatement getroffen).

#### Akteur - VitalSign ICU Source Minimal

* Profile: Profile MI-I
* Interaction: READ, SEARCH

Zur genauen Liste der Interaktionen siehe [CapabilityStatement-Minimal-ICU](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.md).

#### Akteur - VitalSign ICU Source Extended

Profile: Profile MI-I Interaction: READ, SEARCH

Zur genauen Beschreibung und Liste der Interaktionen siehe [CapabilityStatement-Extended-ICU](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md).

#### Erklärung zu weiteren Capability Statements

Die Akteure aggregieren in diesem Kontext weitere Rollen (als Funktionsbausteine), die als solche statische Mengen von Interaktionen festlegen. Um eine Minimalliste der zu implementierenden Profile einzusehen, sind die importierten Rollen (imports) in den jeweiligen Akteuren zu betrachten und die darin enthaltenen Interaktionen auf spezifische Profile. Die aggregierten Profil- und Interaktions-Anforderungen aus den Rollen, die ein Akteur aggregiert (imports) entsprechen einer Minimalliste der zu implementierenden Profile (wobei im Falle des vorliegenden Workflows einige spezialisierte Profile entfallen können, wenn die notwendigen Daten für ein bestätigungsrelevantes System nicht bereitstehen.)

### Festlegung zur Implementierung der Akteure

Eine Festlegung zur Implementierung erfolgt im Rahmen der Definition der bestätigungsrelevanten Systeme.

Basis-Server entsprechend der Definition zu den [bestätigungsrelevanten Systeme](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme.html) MÜSSEN folgenden Akteur implementieren:

* [Akteur - VitalSign ICU Source Minimal](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.md)

Vitalparameter-Server entsprechend der Definition zu den [bestätigungsrelevanten Systeme](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme.html) MÜSSEN folgenden Akteur implementieren:

* [Akteur - VitalSign ICU Source Extended](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md)

Primär hervorzuheben sind entsprechend der Definition der DKG dabei.

* KIS mit Funktion elektronische Kurve bzw. entsprechendes KIS-Modul
* Patientendaten-Managementsystem (PDMS) [z.B. für Intensivbereiche]
* Elektronische Kurve [z.B. für die Verwendung auf Normal-Stationen]

