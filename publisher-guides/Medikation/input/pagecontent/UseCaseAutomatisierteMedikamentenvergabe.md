
### Einführung

Die automatisierte Medikamentenvergabe im Krankenhaus stellt einen komplexen, sicherheitskritischen Prozess dar, an dem mehrere Berufsgruppen und Systeme beteiligt sind. Medikationsfehler zählen weltweit zu den häufigsten vermeidbaren unerwünschten Ereignissen im stationären Bereich und können schwerwiegende Folgen für Patientinnen und Patienten haben. Die Digitalisierung und Automatisierung dieses Prozesses bietet das größte Potenzial, solche Fehler systematisch zu verhindern.

Dieser Abschnitt beschreibt zunächst das übergeordnete Konzept des **Closed-Loop-Medikationsmanagements** als Rahmenmodell für einen lückenlosen, digital gestützten Medikationskreislauf. Anschließend wird das **Unit-Dose-System** als eine der zentralen technischen und organisatorischen Säulen dieses Konzepts vertiefend erläutert. Das Verständnis beider Konzepte bildet die Grundlage für die in diesem Modul definierten FHIR-Ressourcen und Interaktionen.

### Closed-Loop-Medikationsverordnungsprozess

#### Konzept des Closed Loop

Der Begriff „Closed Loop Medication Management" (geschlossener Medikationskreislauf) beschreibt einen vollständig digitalisierten und medienbruchfreien Medikationsprozess innerhalb eines Krankenhauses. Ziel ist die lückenlose, elektronisch gestützte Kontrolle aller Schritte von der ärztlichen Verordnung bis zur dokumentierten Verabreichung am Patientenbett ohne manuelle Übertragungsschritte.

Während ein „offener" Prozess häufig durch Medienbrüche (z. B. handschriftliche Verordnungen, mündliche Weitergabe) und fehlende automatische Prüfschritte gekennzeichnet ist, schließt der Closed Loop jeden dieser Brüche durch IT-gestützte Verifikation. Der Kreislauf gilt als „geschlossen", sobald die erfolgte Verabreichung elektronisch dokumentiert und mit der ursprünglichen Verordnung abgeglichen ist.

#### Prozessstufen im Closed-Loop-Verfahren

Der Closed-Loop-Medikationsprozess lässt sich in folgende Kernprozesse unterteilen:

**1. Elektronische Verordnung (CPOE – Computerized Provider Order Entry)**

Der Arzt erfasst die Medikamentenverordnung direkt in einem digitalen System (z. B. KIS, PDMS). Dabei wird die Verordnung unmittelbar durch klinische Entscheidungsunterstützungssysteme (CDSS) auf Dosierung, Kontraindikationen, Allergiepotenzial und Arzneimittelinteraktionen geprüft. Fehlerhafte oder riskante Verordnungen werden dem Arzt sofort gemeldet.

**2. Apothekerische Prüfung und Freigabe**

Die elektronisch übermittelte Verordnung wird in der Krankenhausapotheke pharmazeutisch geprüft. Nach Freigabe durch den Apotheker wird die Verordnung an das Kommissioniersystem weitergeleitet.

**3. Automatisierte Arzneimittelbereitstellung (Unit Dose)**

Auf Basis der freigegebenen Verordnung werden die Medikamente automatisiert kommissioniert. Das hierfür eingesetzte Verfahren wird als **Unit-Dose-System** bezeichnet: Jede Einzel-Dosis wird patientenindividuell verpackt und mit einem maschinenlesbaren Barcode versehen, der die eindeutige Verknüpfung zur zugehörigen Verordnung sicherstellt. Das Unit-Dose-System ist damit eine Schlüsselkomponente des Closed Loop und wird im folgenden Abschnitt vertiefend beschrieben.

**4. Barcode-gestützte Verifikation bei der Verabreichung (BCMA – Barcode Medication Administration)**

Unmittelbar vor der Verabreichung am Patientenbett scannt die Pflegefachkraft:
- das Patientenarmband (Identifikation des Patienten), und
- den Barcode der Arzneimitteldosis (Identifikation des Medikaments).

Das System prüft in Echtzeit, ob das richtige Medikament in der richtigen Dosis zum richtigen Zeitpunkt für den richtigen Patienten verabreicht wird (Abgleich mit den sogenannten „5 Rs": **R**ichtiger Patient, **R**ichtiges Medikament, **R**ichtige Dosis, **R**ichtiger Applikationsweg, **R**ichtiger Zeitpunkt). Bei Abweichungen wird die Pflegefachkraft gewarnt.

**5. Elektronische Verabreichungsdokumentation (eMAR – electronic Medication Administration Record)**

Nach erfolgreicher Verifikation wird die Verabreichung automatisch im elektronischen Medikationsverabreichungsprotokoll dokumentiert. Damit ist der Kreislauf „geschlossen". Die dokumentierte Verabreichung ist direkt mit der ursprünglichen ärztlichen Verordnung verknüpft und für alle beteiligten Berufsgruppen transparent einsehbar.

#### Beteiligte Akteure

Im Closed-Loop-Medikationsprozess sind typischerweise folgende Akteure beteiligt:

| Akteur | Rolle im Prozess |
|---|---|
| Arzt / CPOE-System | Erfassung und elektronische Übermittlung der Medikamentenverordnung |
| Klinisches Entscheidungsunterstützungssystem (CDSS) | Automatisierte Prüfung auf Interaktionen, Kontraindikationen und Dosierungsfehler |
| Krankenhausapotheke / Apotheker | Pharmazeutische Prüfung und Freigabe der Verordnung |
| Kommissionierroboter / ADC | Automatisierte, patientenindividuelle Bereitstellung der Arzneimitteldosen |
| Pflegefachkraft / BCMA-System | Verifikation am Patientenbett, Verabreichung und Dokumentation |
| eMAR / KIS | Lückenlose elektronische Dokumentation aller Verabreichungsschritte |

#### Patientensicherheitspotenzial

Studien belegen, dass der vollständig implementierte Closed Loop die Rate klinisch relevanter Medikationsfehler substantiell reduziert. Insbesondere die Kombination aus CPOE, klinischer Entscheidungsunterstützung, Unit-Dose-Versorgung und BCMA adressiert die fehleranfälligsten Übergänge im Medikationskreislauf. Die lückenlose digitale Kette verhindert sowohl Transkriptionsfehler (z. B. beim händischen Übertragen von Verordnungen) als auch Verwechslungen bei der Verabreichung.

#### Prozessdarstellung

Das nachfolgende BPMN-Diagramm stellt den oben beschriebenen Prozess in einer möglichen Form dar. In der Praxis können institutionsspezifische Abweichungen auftreten – beispielsweise erfolgt die Kommissionierung der Medikamente in einigen Krankenhäusern nicht zentral über die Apotheke, sondern dezentral auf Stationsebene mittels automatisierter Ausgabegeräte (Automated Dispensing Cabinets).

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="ClosedLoop-Medikationsprozess.svg" alt="Closed-Loop-Medikationsprozess" style="width: 100%;">
    </div>
    <figcaption>Abbildung: Closed-Loop-Medikationsprozess</figcaption>
</figure>

### Unit-Dose-System

#### Was ist das Unit-Dose-System?

Das Unit-Dose-System (auch: Unit-Dose-Versorgung) ist das im Closed-Loop-Prozess eingesetzte Verfahren zur automatisierten, patientenindividuellen Arzneimittelbereitstellung durch die Krankenhausapotheke (Prozessschritt 3). Es beschreibt ein organisatorisches und technisches Konzept, bei dem jede einzelne Medikamentengabe (eine sogenannte Einzeldosis oder „Unit Dose") für jeden Patienten individuell zusammengestellt, verpackt und beschriftet bereitgestellt wird – in der Regel für einen definierten Versorgungszeitraum (typischerweise 24 Stunden).

Im Gegensatz zur klassischen Stationsbevorratung, bei der Medikamente in größeren Mengen auf der Station gelagert und von Pflegefachkräften dosiert abgeteilt werden, erfolgt beim Unit-Dose-System die Verpackung und Etikettierung einzelner Dosen durch die Krankenhausapotheke. Mit zunehmender Verbreitung automatisierter Kommissionierroboter (sog. Blister-Maschinen bzw. Unit-Dose-Roboter) wird dieser Prozess in modernen Apotheken vollständig maschinell unterstützt.

#### Ablauf des Unit-Dose-Prozesses

Der apothekenseitige Prozess innerhalb des Unit-Dose-Systems gliedert sich typischerweise in folgende Schritte:

1. **Entgegennahme der freigegebenen Verordnung:** Die durch den Apotheker geprüfte und freigegebene Verordnung wird an das Kommissioniersystem der Apotheke übermittelt.

2. **Automatisierte Kommissionierung:** Ein Apotheken-Roboter oder eine Unit-Dose-Maschine stellt auf Basis der freigegebenen Verordnung patientenindividuelle Medikamenten-Päckchen zusammen. Jedes Päckchen enthält genau eine Einzel-Dosis und ist mit Patientenname, Geburtsdatum, Einnahmezeit, Wirkstoff, Stärke und einem maschinenlesbaren Barcode bzw. Data-Matrix-Code eindeutig beschriftet.

3. **Transport auf die Station:** Die so verpackten Einzeldosen werden zeitgerecht, häufig in patientenindividuellen Kassetten oder Schubladen auf die jeweilige Station transportiert.

4. **Übergabe an die Verifikation:** Die bereitgestellten Unit-Dose-Päckchen werden von der Pflegefachkraft am Patientenbett per Barcode-Scan verifiziert (BCMA, Prozessschritt 4 des Closed Loop) und verabreicht.

Die Erzeugung der Einzel-Dosen ist ein gesonderter Prozess der zuvor ablaufen muss. Er wird in diesem IG nicht näher behandelt, da es sich hierbei eher um logistischen Prozess handelt, der nicht dem Scope von ISiK zugeordnet wird.

#### Vorteile des Unit-Dose-Systems

Das Unit-Dose-System bietet gegenüber traditionellen Verfahren wesentliche Vorteile:

- **Erhöhte Patientensicherheit:** Durch die eindeutige Beschriftung und maschinelle Zusammenstellung werden Verwechslungs- und Dosierungsfehler signifikant reduziert.
- **Lückenlose Nachverfolgbarkeit:** Jede ausgehändigte Einzel-Dosis ist rückverfolgbar, was die Transparenz des Medikationskreislaufs erhöht.
- **Entlastung des Pflegepersonals:** Das manuelle Stellen von Medikamenten entfällt, sodass Pflegefachkräfte mehr Zeit für direkte Patientenversorgung aufwenden können.
- **Reduktion von Bestandsabweichungen:** Überbestände und Ablaufdaten lassen sich besser kontrollieren.

### Einordnung in die FHIR-Spezifikation

Die oben beschriebenen Prozesse legen die Grundlage für die in diesem Modul definierten FHIR-Ressourcen und Interaktionen. Im Kontext des Unit-Dose-Systems sowie des Closed-Loop-Prozesses ergeben sich konkrete Anforderungen an den digitalen Datenaustausch zwischen den beteiligten Systemen (KIS, Apothekensystem, Pflegedokumentationssystem):

- Die **Medikationsverordnung** (`MedicationRequest`) repräsentiert die ärztliche Verordnung im digitalen Prozess.
- Die **Medikationsverabreichung** (`MedicationAdministration`) dokumentiert die erfolgte Gabe am Patienten und schließt damit den Kreislauf.
- Die **Medikationsabgabe** (`MedicationDispense`) bildet den Schritt der apothekerischen Freigabe und Bereitstellung ab.

