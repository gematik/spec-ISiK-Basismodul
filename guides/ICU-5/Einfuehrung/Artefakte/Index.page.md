# {{page-title}}

# MII-Profile - Vitalparameter für die Intensiv- und Normalversorgung

An dieser Stelle werden Festlegungen zu Profilen getroffen, die für die Intensiv- sowie Normalversorgung vorgesehen sind und dem Kontext des Moduls zur Intensivmedizinische Versorgung (ICU) der MII entstammen.

Datenobjekte, die der Rolle  *VitalSign Standard Source* zugeordnet sind, werden hier nicht als eigenständige Profile geführt, sondern sind dem entsprechenden [Implementierungsleitfaden](https://simplifier.net/guide/isik-vitalparameter-stufe-5) zu entnehmen.

## Motivation zur Übernahme
Im Rahmen des [Moduls zur Intensivmedizinische Versorgung (ICU) der MII](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/MonitoringundVitaldaten.html) hat die MII Profile bereitgestellt, die sich für die Verarbeitung von Vitalparametern im Rahmen der intensiv- sowie normalstationären Versorgung eignen.
Die Profile der MII sind medizinisch qualitätsgesichert und weisen eine feingranulare Kodierung vor.

Durch die Übernahme der Profile der MII und Abbildung auf das ISIK-Setting, können feingranular kodierte Profile zu Vitalparametern im Krankenhauskontext genutzt werden - für die Normal- wie für die intensivmedizinische Versorgung.

## Designentscheidung
- Maximale Kardinalitäten von Coding Slices wurden von der MII übernommen
- Die Profil-Eigenschaften der MII-Profile, die den bisherigen, existenten Profilen in ISiK entsprechen, wurden in die existenten Profile des [generischen Implementierungsleitfadens Vitalparemeter](https://simplifier.net/guide/isik-vitalparameter-stufe-5) übernommen.

# Datenobjekte aus der Basis

Folgende Datenobjekte aus dem Modul [ISiK Basis](https://simplifier.net/guide/isik-basis-stufe-5) werden in diesem Modul verwendet: 
* [Patient](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Patient)
* [Kontakt/Fall (Encounter)](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Kontakt)
* [Person im Gesundheitsberuf](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_PersonImGesundheitsberuf)

Die Verwendung der genannten Ressourcen in diesem Modul bedeutet:
Wenn ein Profil aus diesem Modul auf die genannten Datenobjekte aus dem Basismodul referenziert, dann MÜSSEN die referenzierten FHIR-Ressourcen im ISiK-Kontext konform zu Vorgaben an diese Ressourcen aus dem Basismodul sein (Profilkonformität). In diesem Zusammenhang sind insbesondere die Vorgaben zur [Herstellung des Patienten- und Encounter-Kontextes](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/Patient-Besuch-Kontext.md) zu beachten.

Die konkreten Vorgaben zu Interaktionen und Abhängigkeiten zwischen Modulen werden noch präzisiert.

# Profile aus dem ISiK Support Modul Labor

Zur Unterstützung der Überleitung zwischen intensivmedizinischer und normalstationärer Versorgung (siehe Use Cases), MÜSSEN alle
Profile aus dem [ISIK Support Modul Labor](https://simplifier.net/guide/isik-labor-stufe-5) von einem bestätigungsrelevanten System implementiert werden, sofern das System diese Daten verwaltet (z.B. in Form einer Übernahme aus einem Laborinformationssystem).

## Profilhierarchie 

Die folgende Darstellung zeigt die Vererbungsstruktur aller ICU-Profile in diesem Modul:

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/ICU/Ableitungshierarchie_vereinfacht_ICU.drawio.svg"/>

---

# Index

{{index:current}}