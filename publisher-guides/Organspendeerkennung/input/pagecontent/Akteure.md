---
topic: Akteure
---

# Darstellung der Akteure

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>

**Diskussion**: Dieser Abschnitt fasst einen laufenden Arbeitsstand zu einem Akteurs-Konzept in ISiK zusammen, sodass die hier getroffenen Festlegungen nicht als zusätzliche normative Festlegung (MUSS) zu verstehen sind. Vielmehr werden getroffene normative Festlegungen (MUSS), die im Kontext der CapabilityStatements dieses Implementierungsleitfadens geführt werden, hier als 'Akteure' (informativ) beschriebene.
<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>


Folgende Akteure dienen der Umsetzung der beschriebenen Workflows (schematische Darstellung - eine technische Detaillierung mit normativer Geltung wird im CapabilityStatement getroffen). 


## Akteur - Rolle Minimal Organspende

Dieser Akteur stellt eine Minimal-Variante dar, deren Funktionen zur Umsetzung der Workflows der Organspenderkennung mittels ISiK-Schnittstelle unabdinglich sind.

Profile: MUSS-Profile aus dem Modul Organspende
Interaction: READ, SEARCH

## Akteur - Rolle Organspende extended

Dieser Akteur beinhaltet über die Minimal-Variante hinaus weitere Interaktionen, die nützlich sind um mittels zusätzliche Parameter die Umsetzung der Workflows der Organspenderkennung mittels ISiK-Schnittstelle weitergehend zu unterstützen.

Profile: MUSS und KANN Profile aus dem Modul Organspende
Interaction: READ, SEARCH

## Akteur - VitalSign ICU Source Extended

Dieser Akteur ist der umfassendste Akteur im Kontext der Organspendeerkennung. Er beinhaltet sämtliche Profile und Interaktionen, die zur Umsetzung der Workflows der Organspenderkennung mittels ISiK-Schnittstelle relevant sind und definiert darüber hinausgehende Interaktionen, die im Kontext der Intensivmedizin relevant sind. 

Profile: Profile aus dem Modul Vitalparameter (MI-I) - beinhaltet neben zahlreichen weiteren Profilen auch Profile aus dem Modul Organspende
Interaction: READ, SEARCH

Zur genauen Beschreibung und Liste der Interaktionen siehe [hier](https://simplifier.net/guide/isik-icu-stufe-5/Einfuehrung/Artefakte/CapabilityStatements?#ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur).

## Erklärung zu weiteren Capability Statements

Die Akteure aggregieren in diesem Kontext weitere Rollen (als Funktionsbausteine), die als solche statische Mengen von Interaktionen festlegen.
Um eine Minimalliste der zu implementierenden Profile einzusehen, sind die importierten Rollen (imports) in den jeweiligen Akteuren zu betrachten und die darin enthaltenen Interaktionen auf spezifische Profile. Die aggregierten Profil- und Interaktions-Anforderungen aus den Rollen, die ein Akteur aggregiert (imports) entsprechen einer Minimalliste der zu implementierenden Profile (wobei im Falle des vorliegenden Workflows einige spezialisierte Profile entfallen können, wenn die notwendigen Daten für ein bestätigungsrelevantes System nicht bereitstehen.)

# Festlegung zur Implementierung der Akteure
Eine Festlegung zur Implementierung erfolgt im Rahmen der Definition der bestätigungsrelevanten Systeme.

<!-- ANF-ICU-002 -->
Vitalparameter-Server entsprechend der Definition zu den [bestätigungsrelevanten Systeme](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme) MÜSSEN folgenden Akteur implementieren:
- [Akteur - VitalSign ICU Source Extended](https://simplifier.net/isik-stufe-5/ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur/~json)

Primär hervorzuheben sind entsprechend der Definition der DKG dabei.

* KIS mit Funktion elektronische Kurve bzw. entsprechendes KIS-Modul
* Patientendaten-Managementsystem (PDMS) [z.B. für Intensivbereiche]
* Elektronische Kurve [z.B. für die Verwendung auf Normal-Stationen]