---
topic: Datenobjekte
---
# Datenobjekte - FHIR-Profile für den Use Case Überleitung Normal- und Intensivversorgung

Im Rahmen des Use Case Überleitung Normal- und Intensivversorgung sind neben den [Profilen des Moduls Vitalparameter - insbesondere MII Profile - ](https://simplifier.net/guide/isik-vitalparameter-v4/ImplementationGuide-markdown-Datenobjekte-MII_Intensiv_Normal?version=current) alle Profile des [ISIK Support Modul Labor](https://simplifier.net/guide/isik-vitalparameter-v4/ImplementationGuide-markdown-Datenobjekte-Laborprofile?version=current) relevant.
Eine Liste der Profile ist dem Abschnitt zu den {{pagelink:ISiKCapabilityStatementsICU, text:CapabilityStatements}} in den einzelnen CapabilityStatements zu entnehmen, die mit einzelnen {{pagelink:Akteure, text: Akteuren}} übereinstimmen (eine vollständige Abdeckung der Akteure ist derzeit noch nicht abgeschlossen bzw. noch in Arbeit).

Folgende Datenobjekte aus dem Modul [ISiK Basis Stufe 4](https://simplifier.net/guide/isik-basis-v4?version=current) werden in diesem Modul verwendet: 
* [Patient](https://simplifier.net/guide/isik-basis-401/Einfuehrung/Datenobjekte/Datenobjekte_Patient?version=current)
* [Kontakt/Fall (Encounter)](https://simplifier.net/guide/isik-basis-401/Einfuehrung/Datenobjekte/Datenobjekte_Kontakt?version=current)

Die Verwendung der genannten Ressourcen in diesem Modul bedeutet:
Wenn ein Profil aus diesem Modul auf die genannten Datenobjekte aus dem Basismodul referenziert, dann MÜSSEN die referenzierten FHIR-Ressourcen im ISiK-Kontext konform zu Vorgaben an diese Ressourcen aus dem Basismodul sein (Profilkonformität). 

Die konkreten Vorgaben zu Interaktionen und Abhängigkeiten zwischen Modulen werden noch präzisiert. Eine Festlegung zur Interaktionen, die die Patienten- und Encounter-Ressourcen betreffen, werden auf der Seite zu den {{pagelink: UebergreifendeAnforderungen, text: Übergreifende Anforderungen}} festgehalten.


# MII-Profile - Vitalparameter für die Intensiv- und Normalversorgung

An dieser Stelle werden Festlegungen zu Profilen getroffen, die für die Intensiv- sowie Normalversorgung vorgesehen sind und dem Kontext des Moduls zur Intensivmedizinische Versorgung (ICU) der MII entstammen.

## Motivation zur Übernahme
Im Rahmen des [Moduls zur Intensivmedizinische Versorgung (ICU) der MII](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/MonitoringundVitaldaten.html) hat die MII Profile bereitgestellt, die sich für die Verarbeitung von Vitalparametern im Rahmen der intensiv- sowie normalstationären Versorgung eignen.
Die Profile der MII sind medizinisch qualitätsgesichert und weisen eine feingranulare Kodierung vor.

Durch die Übernahme der Profile der MII und Abbildung auf das ISIK-Setting, können feingranular kodierte Profile zu Vitalparametern im Krankenhauskontext genutzt werden - für die Normal- wie für die intensivmedizinische Versorgung.

## Designentscheidung
- Maximale Kardinalitäten von Coding Slices wurden von der MII übernommen
- Die Profil-Eigenschaften der MII-Profile, die den bisherigen, existenten Profilen in ISiK entsprechen, wurden in die existenten Profile des [generischen Implementierungsleitfadens Vitalparemeter](https://simplifier.net/guide/isik-vitalparameter-v4?version=current) übernommen.