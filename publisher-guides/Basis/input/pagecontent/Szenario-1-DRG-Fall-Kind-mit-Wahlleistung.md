---
expand: 5
---

### Szenario 1: DRG Fall - Kind mit Wahlleistung

* minderjähriges Kind
* familienversichert über Mutter
* Selbstzahlerverhältnis mit abweichendem Rechnungsempfänger
* vorstationärer, stationärer und nachstationärer Besuch
* Abrechnung als DRG-Fall 
* stationärer Aufenthalt mit Wahlleistung Begleitperson (keine Kassenleistung, wird selbst bezahlt)

#### Ressourcen-Graph

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Szenario1-BundleViewer.png" alt="Szenario 1 Bundle Viewer" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> Aufbau des Bundles für Szenario 1 </figcaption>
</figure>


#### Instanzen: Personen

[SZ1 Patient](Patient-SZ1Patient.html)

[SZ1 Mutter](RelatedPerson-SZ1Mutter.html)

#### Instanzen: Versicherungsverhältnisse

[SZ1 Versicherung gesetzlich](Coverage-SZ1VersicherungGesetzlich.html)

[SZ1 Versicherung Selbstzahler](Coverage-SZ1VersicherungSelbstzahler.html)

#### Instanzen: Besuche

[Vorstationärer](Encounter-SZ1Vorstationaer.html)

[Stationärer](Encounter-SZ1Stationaer.html)

[Nachstionärer](Encounter-SZ1Nachstationaer.html)

#### Instanzen: Abrechnungsfall

[DRG-Abrechnungsfall](Account-SZ1DRGFall.html)

