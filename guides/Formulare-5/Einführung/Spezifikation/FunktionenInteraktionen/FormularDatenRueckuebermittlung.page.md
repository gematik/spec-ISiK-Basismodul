---
topic: FormularDatenRueckuebermittlung
---

## Interaktion: FormularDaten-Rückübermittlung

Die Rückübermittlung von {{pagelink:FormularDaten}} erfolgt gemäß den Festlegungen in [ISiK Basis Stufe-5: Datenübermittlung aus Subsystemen](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/UseCasesAnwendung/Daten%C3%BCbermittlung-aus-Subsystemen.page.md)

<plantuml>
@startuml
FormularDatenSender -> FormularDatenEmpfänger : POST (DocumentBundle)
@enduml
</plantuml>   

| **Work in Progress** | **Fehlendes Artefakt** |
|-|-|
|<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/> | In der weiteren Entwicklung dieses Moduls wird ein Dokumenten-Profil festgelegt, das die Rückübermittlung von FormularDaten, FormularDefintionen und Strukturierten Inhalten, sowie die Erstellung von Narrativen für die menschenlesbare Darstellung von Formularinhalten spezifiziert |
