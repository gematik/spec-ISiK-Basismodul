Profile: ISiKVersicherungsverhaeltnisSonstige
Parent: http://fhir.de/StructureDefinition/coverage-de-basis
Id: ISiKVersicherungsverhaeltnisSonstige
Description: "Dieses Profil ermöglicht die Darstellung sonstiger Versicherungsverhältnisses in ISiK Szenarien.  
### Motivation
ISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden, 
bei denen es sich *weder* um gesetzliche Versicherungen noch Selbstzahlerverhältnisse handelt.
In diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.  
In FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKVersicherungsverhaeltnisSonstige basiert auf dem [Basis-Coverage-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis). 

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
* insert Meta
* status MS
  * ^short = "Status"
  * ^comment = "Zeigt den aktuellen Status der Ressource an.     
  **WICHTIGER Hinweis für Implementierer:**    
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch den Wert `active`.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben."
* type MS
  * ^short = "Versicherungsart"
  * ^comment = "
  Die Angabe der Versicherungsart dient der Abgrenzung dieser Coverage-Ressource von Selbstzahler- oder gesetzlichen Versicherungsverhältnissen.  
  **Begründung Pflichtfeld:** Die Angabe der Versicherungsart dient der Unterscheidung, wenn zu einem Patienten mehrere Coverage-Ressourcen hinterlegt sind, 
  z.B. gesetzliche Versicherung + Sonstige und als Suchkriterium, um gezielt nach der in einem konkreten Kontext relevanten Coverage suchen zu können.  
  **Historie:**  
  28.07.2017 (zulip): TC Konsens bzgl. Verwendung eines eigenen ValueSets anstelle des im Standard definierten preferred bindings, da die dortigen Codes nicht passen."
/* * subscriber MS
  * display 1.. MS
  * reference MS
    * ^comment = "Motivation für MS: Da ein ISIK-Profil besteht, sollte dies ggf. referenziert werden." */
* beneficiary only Reference(Patient)
* beneficiary MS
  * ^short = "Begünstigte Person"
  * ^comment = "Hier handelt es ich konkret um den Patienten, für den die Kostenübernahme gilt."
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."  

* payor only Reference(Patient or RelatedPerson or Organization)
* payor MS
  * ^short = "Kostenträger"
  * ^comment = "Ein sonstiger Kostenträger kann eine Person oder eine Organisation (z.B. Botschaft/Amt) sein."
  * display MS
    * ^short = "Kostenträger-Bezeichnung"
    * ^comment = "Name des Kostenträgers"  
  


Instance: CoverageSonstige
InstanceOf: ISiKVersicherungsverhaeltnisSonstige
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#SOZ
* beneficiary = Reference(PatientinMusterfrau)
* payor.display = "Sozialamt Posemuckel"