# Beispielszenarien - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Beispielszenarien**

## Beispielszenarien

### Szenario 1: DRG Fall - Kind mit Wahlleistung

* minderjähriges Kind
* familienversichert über Mutter
* Selbstzahlerverhältnis mit abweichendem Rechnungsempfänger
* vorstationärer, stationärer und nachstationärer Besuch
* Abrechnung als DRG-Fall
* stationärer Aufenthalt mit Wahlleistung Begleitperson (keine Kassenleistung, wird selbst bezahlt)

#### Ressourcen-Graph

**Abbildung:**Aufbau des Bundles für Szenario 1
#### Instanzen: Personen

[SZ1 Patient](Patient-SZ1Patient.md)

[SZ1 Mutter](RelatedPerson-SZ1Mutter.md)

#### Instanzen: Versicherungsverhältnisse

[SZ1 Versicherung gesetzlich](Coverage-SZ1VersicherungGesetzlich.md)

[SZ1 Versicherung Selbstzahler](Coverage-SZ1VersicherungSelbstzahler.md)

#### Instanzen: Besuche

[Vorstationärer](Encounter-SZ1Vorstationaer.md)

[Stationärer](Encounter-SZ1Stationaer.md)

[Nachstionärer](Encounter-SZ1Nachstationaer.md)

#### Instanzen: Abrechnungsfall

[DRG-Abrechnungsfall](Account-SZ1DRGFall.md)

### Szenario 2: Kreuz-Stern Diagnose

* volljährige, hauptversicherte Patientin
* stationärer Aufenthalt
* Kreuz-Stern-Diagnose (ICD-10) als Krankenhaus-Hauptdiagnose

#### Ressourcen-Graph

**Abbildung:**
#### Instanzen: Personen

[Patientin](Patient-SZ2Patient.md)

#### Instanzen: Diagnosen

[Primärdiagnose](Condition-SZ2Primaerdiagnose.md)

[Sekundärdiagnose](Condition-SZ2Sekundaerdiagnose.md)

#### Instanzen: Versicherungsverhältnisse

[Versicherung gesetzlich](Coverage-SZ2VersicherungGesetzlich.md)

#### Instanzen: Besuche

[Stationärer](Encounter-SZ2Encounter.md)

#### Instanzen: Abrechnungsfall

[DRG-Abrechnungsfall](Account-SZ2DRGFall.md)

