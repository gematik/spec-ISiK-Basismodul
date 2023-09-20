### Interaktionen

Die Rückübermittlung eines Document-Bundles an ein Primärsystem erfolgt mittels einer 'POST'-Interaktion auf den Endpunkt des Primärsystems.

 Beispiele:

   `POST [base]/` mit einer FHIR-Bundle Ressource im Request-Body.

   Anwendungshinweise: Weitere Informationen zu den verschiedenen Endpunkten für Dokumente finden sich in der [FHIR-Basisspezifikation - Abschnitt "Document End-Points"](https://www.hl7.org/fhir/documents.html#bundle).
  
Das Bundle dient der Aggregation aller Ressourcen, die Bestandteil des Dokumentes sind. Dabei ist die erste Ressource im Bundle (Bundle.entry.resource) stets eine Composition, alle weiteren entries enthalten zusätzliche Ressourcen, auf die die Composition verweist.

Falls die Referenz auf die in der Composition enthaltenen Patienten und/oder Encounter nicht auflösbar ist, MUSS als Antwort der HTTP Status Code "422 - Unprocessable Entity" zurückgegeben werden. Im Body der Response ist eine OperationOutcome zurückzugeben, welche ein Issue mit dem Verweis auf die nicht auflösbare Referenz enthält. Zur Kodierung von OperationOutcome.issue.code MUSS als Code ["processing"](https://hl7.org/fhir/R4/codesystem-issue-type.html) verwendet werden.

Das Bundle muss folgendem Profil entsprechen:
{{tree:https://gematik.de/fhir/ISiK/StructureDefinition/ISiKBerichtBundle, hybrid}}

## Verarbeitung des Dokumentes

In der aktuellen Ausbaustufe von ISiK MUSS ein empfangenes Dokument in folgenden Schritten verarbeitet werden:

1. Extraktion der Patient-Ressource aus dem Bundle und Herstellung des Patientenbezuges anhand der Aufnahmenummer ('Patient.identifier')
2. Extraktion der Encounter.Ressource aus dem Bundle und Herstellung des Fallbezuges anhand der Aufnahmenummer ('Encounter.identifier')
3. Extraktion der Composition-Ressource aus dem Bundle und Auslesen der mit 'mustSupport' gekennzeichneten Meta-Daten, sowie der menschenlesbaren Repräsentation des Dokumentes ('Composition.text' + 'Composition.section.text')
4. Hinzufügen des Dokumentes und seiner Metadaten zur Fallakte des Patienten 
5. Visualisierung des Dokumentes und seiner Metadaten in der Fallakte des Patienten

{{render:Materialien/Composition-Bundle.png}}
*Die Grafik zeigt an einem vereinfachten Beispiel die Zuordnung des HTML-Dokumentes zu Patient und Kontakt in der aktuellen Ausbaustufe von ISiK (schwarze Pfeile). Die grauen Pfeile deuten die Übernahme strukturierter Daten, wie sie in weiteren Ausbaustufen erforderlich wird.*

## Hinweise zum Umgang mit der menschenlesbaren Repräsentation

Die menschenlesbare Repräsentation ("Narrative") eines Dokumentes setzt sich zusammen aus dem Inhalt von 'Composition.text', einer Repräsentation der Metadaten (z.B. Dokumenttyp, Patientenname, Patientennummer, Aufnahmenummer, datum) sowie der Aggregation der Inhalte von 'Composition.section', wobei zu beachten ist, dass ein Dokument beliebig viele Sections haben kann.
Die einzelnen Bestandteile des Narratives KÖNNEN mit \<div\>-Elementen zusammengefügt werden.

## Hinweise zum Umgang mit strukturierten Daten

Auch wenn in der aktuellen Stufe nur die Übernahme der menschenlesbaren Repräsentation erforderlich ist, empfiehlt es sich dennoch, das vollständige Bundle samt der strukturierten Anteile zu einem Dokument zu persistieren, so dass zu einem späteren Zeitpunkt, wenn eine Übernahme einzelner Daten möglich ist, diese auch rückwirkend erfolgen kann.
