# Use Case Diagramm
Im Folgenden wird ein grafischer Überblick über möglichst in diesem Modul abgedeckten Anwendungsfälle gegeben.
Da es sich um eine Zusammenfassung handelt, werden nur folgende Use Case und dafür hinreichende Funktionen dargestellt:
* Allgemeine und intuitive verständliche Use Cases.
* * Kombinationen und weitere Details sind möglich.
    * Übergreifende Use Cases und und ihre Sub Use Cases können in einem separaten Diagramm auf den entsprechenden Seiten gefunden werden.
* Allgemeine und intuitive Adverse Use Cases. Diese gilt es zu vermeiden.

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/rc/main-stufe-4/Material/images/diagrams/usecases.svg" alt="Use Case Diagrams" width="90%"/>

**Use Case Digramm**

## Zusammenhang zwischen verketteten Suchparametern und Use Cases

Jeder Include oder Reverse Include Parameter ist mit mindestens einem {{pagelink:ImplementationGuide/markdown/UseCasesAnwendung/UseCases.md, text:Anwendungsfall}} begründet. Diese Details sie auf der Seite der jeweiligen Ressource unter {{pagelink:ImplementationGuide/markdown/Datenobjekte.md, text:Datenobjekte}} zu finden. 
Im Folgenden sollen für die Lesart des Diagramms zwei Beispiele gegeben werden:
* **Beispiel für einen Include Zusammenhang:** Eine Applikation muss in der Lage sein eine _ISiK Diagnose_ anhand des Falls in Form von _Encounter_ suchen zu können, um den (Adverse) Use Case einer _Verwechslung_ zu vermeiden.
* **Beispiel für einen Reverse Include Zusammenhang:** Eine Applikation muss in der Lage sein zu einem _ISiK Patient_ alle _Encounter_ anhand der Zugehörigkeit via _subject_ suchen zu können, um den Anwendungsfall der vollständigen _Dokumentation_ gewährleisten zu können.
