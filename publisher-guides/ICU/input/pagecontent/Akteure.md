---
topic: Akteure
---

### Darstellung der Akteure

<figure>
    <div class="gem-ig-img-container" style="--box-width: 40px;">
        <img src="Betriebskoordination_Gruen_gematik.svg">
    </div>
</figure>

**Diskussion**: Dieser Abschnitt fasst einen laufenden Arbeitsstand zu einem Akteurs-Konzept in ISiK zusammen, sodass die hier getroffenen Festlegungen nicht als zusätzliche normative Festlegung (MUSS) zu verstehen sind. Vielmehr werden getroffene normative Festlegungen (MUSS), die im Kontext des [CapabilityStatements des Vitalparameter Implementierungsleitfadens](https://simplifier.net/guide/isik-vitalparameter-stufe-5/Einfuehrung/Artefakte/CapabilityStatements) geführt werden, hier als 'Akteure' dargestellt und damit zur Umsetzung des ICU-Normalstation-Workflows definitorisch (informativ) präzisiert.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 40px;">
        <img src="Betriebskoordination_Gruen_gematik.svg">
    </div>
</figure>


Folgende Akteure dienen der Umsetzung der beschriebenen Workflows (schematische Darstellung - eine technische Detaillierung mit normativer Geltung wird im CapabilityStatement getroffen). 


#### Akteur - VitalSign ICU Source Minimal
* Profile: Profile MI-I
* Interaction: READ, SEARCH

Zur genauen Liste der Interaktionen siehe [CapabilityStatement-Minimal-ICU](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.html). 

#### Akteur - VitalSign ICU Source Extended

Profile: Profile MI-I
Interaction: READ, SEARCH

Zur genauen Beschreibung und Liste der Interaktionen siehe [CapabilityStatement-Extended-ICU](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.html).

#### Erklärung zu weiteren Capability Statements

Die Akteure aggregieren in diesem Kontext weitere Rollen (als Funktionsbausteine), die als solche statische Mengen von Interaktionen festlegen.
Um eine Minimalliste der zu implementierenden Profile einzusehen, sind die importierten Rollen (imports) in den jeweiligen Akteuren zu betrachten und die darin enthaltenen Interaktionen auf spezifische Profile. Die aggregierten Profil- und Interaktions-Anforderungen aus den Rollen, die ein Akteur aggregiert (imports) entsprechen einer Minimalliste der zu implementierenden Profile (wobei im Falle des vorliegenden Workflows einige spezialisierte Profile entfallen können, wenn die notwendigen Daten für ein bestätigungsrelevantes System nicht bereitstehen.)

### Festlegung zur Implementierung der Akteure
Eine Festlegung zur Implementierung erfolgt im Rahmen der Definition der bestätigungsrelevanten Systeme.

<!-- ANF-ICU-001 -->
Basis-Server entsprechend der Definition zu den [bestätigungsrelevanten Systeme](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme) MÜSSEN folgenden Akteur implementieren:
- [Akteur - VitalSign ICU Source Minimal](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.html) 



<!-- ANF-ICU-002 -->
Vitalparameter-Server entsprechend der Definition zu den [bestätigungsrelevanten Systeme](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme) MÜSSEN folgenden Akteur implementieren:
- [Akteur - VitalSign ICU Source Extended]((CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.html)

Primär hervorzuheben sind entsprechend der Definition der DKG dabei.

* KIS mit Funktion elektronische Kurve bzw. entsprechendes KIS-Modul
* Patientendaten-Managementsystem (PDMS) [z.B. für Intensivbereiche]
* Elektronische Kurve [z.B. für die Verwendung auf Normal-Stationen]


