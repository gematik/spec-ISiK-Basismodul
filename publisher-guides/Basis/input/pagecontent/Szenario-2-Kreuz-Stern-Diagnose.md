---
expand: 5
---
### Szenario
* volljährige, hauptversicherte Patientin
* stationärer Aufenthalt
* Kreuz-Stern-Diagnose (ICD-10) als Krankenhaus-Hauptdiagnose

#### Ressourcen-Graph

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Szenario2-BundleViewer.png" alt="Szenario 2 Bundle Viewer" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong> </figcaption>
</figure>


#### Instanzen: Personen
<tabs>
    <tab title="Patientin">      
        {{render:SZ2Patient}}
        Link: {{link:SZ2Patient}}
    </tab>
</tabs>

#### Instanzen: Diagnosen
<tabs>
    <tab title="Primärdiagnose">      
        {{render:SZ2Primaerdiagnose}}
        Link: {{link:SZ2Primaerdiagnose}}
    </tab>
    <tab title="Sekundärdiagnose">      
        {{render:SZ2Sekundaerdiagnose}}
        Link: {{link:SZ2Sekundaerdiagnose}}
    </tab>
</tabs>

#### Instanzen: Versicherungsverhältnisse
<tabs>
    <tab title="Versicherung gesetzlich">
        {{render:SZ2VersicherungGesetzlich}}
        Link: {{link:SZ2VersicherungGesetzlich}}
    </tab>
</tabs>

#### Instanzen: Besuche
<tabs>
    <tab title="Stationär">
        {{render:SZ2Encounter}}
        Link: {{link:SZ2Encounter}} 
    </tab>
</tabs>


#### Instanzen: Abrechnungsfall
<tabs>
    <tab title="DRG-Abrechnungsfall">
        {{render:Resources/fsh-generated/resources/Account-SZ2DRGFall.json}}
        Link: {{link:Resources/fsh-generated/resources/Account-SZ2DRGFall.json}} 
    </tab>
</tabs>
