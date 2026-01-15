---
topic: ImplementationGuide-markdown-UseCasesAnwendung
---

### Use Cases und Anwendungsszenarien Organspendeerkennung

#### Use Case 

Die Organspendeerkennung umfasst die Identifikation von Patienten, die als Organspender infrage kommen. Zur Erhöhung der Identifikationsrate kann Software, die über Schnittstellenzugänge zu relevanten Vitalparametern aus einer Datenquelle (hier: PDMS) erhält, eine organisatorische Unterstützung für die Transplantationsbeauftragten bereitstellen.

Konkret kann der folgende Use Case beschrieben werden:

Ein Software-Client ruft über eine standardisierte Schnittstelle die im PDMS dokumentierten klinischen und administrativen Daten (z.B. Vitalparameter, Laborwerte, Bettenstellplatz) von Patienten auf Intensivstationen ab. Diese Daten werden kontinuierlich und automatisiert anhand definierter Kriterien gefiltert, die als Indikatoren für eine potenzielle Organspende dienen. Sobald ein Fall anhand dieser Parameter als relevant identifiziert wird, initiiert das System eine Benachrichtigung an die zuständigen Transplantationsbeauftragten. Durch diesen schnittstellenbasierten Zugriff auf Echtzeitdaten wird sichergestellt, dass potenzielle Spender frühzeitig erkannt werden und eine dezidierte Einschätzung hinsichtlich eines irreversiblen Hirnfunktionsausfalls sowie der Möglichkeit einer Organspende zeitgerecht erfolgen kann.


Datenquelle für die hier betrachteten Fälle ist ausschließlich ein PDMS.

#### User Stories

Einige User Stories, die diesen Kontext illustrieren, sind folgende:

**UC-ORGANSPENDEERKENNUNG-001**: 
Als transplantationsbeauftragte Ärztin möchte ich durch ein Tool, welches relevante Parameter aus dem PDMS zyklisch  (alle 4 bis 12 Stunden) abfragt und auf kritische Werte prüft, frühzeitig auf potenzielle Organspender hingewiesen werden, um rechtzeitig die notwendigen Schritte für eine Organspende einleiten zu können.

**UC-ORGANSPENDEERKENNUNG-002**:
Als Arzt in der Intensivmedizin möchte ich, dass eine dedizierte Anwendung die relevanten Vitalparameter und Laborwerte aus dem PDMS meiner Patienten kontinuierlich überwacht und mich benachrichtigt, wenn ein Patient Anzeichen für einen irreversiblen Hirnfunktionsausfall zeigt, um die Organspendeerkennung zu unterstützen.





