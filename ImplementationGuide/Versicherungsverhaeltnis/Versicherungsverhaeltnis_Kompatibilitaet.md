### Kompatibilität

#### Profil ISiKVersicherungsverhaeltnisGesetzlich

Das Profil ISiKVersicherungsverhaeltnisGesetzlich basiert auf dem Profil ["Coverage, deutsches GKV Profil" der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-gkv). 

Instanzen, die gegen ISiKVersicherungsverhaeltnisGesetzlich valide sind, sind auch valide gegen
* Profil ["Coverage, deutsches GKV Profil" der deutschen Basisprofile - v1.0.0](http://fhir.de/StructureDefinition/coverage-de-gkv)
 
Instanzen, die gegen ISiKVersicherungsverhaeltnisGesetzlich valide sind, sind **nicht** valide gegen:
* Profil [KBV_PR_FOR_Coverage der Formularübergreifenden Vorgaben der KBV (eRezept/eAU) - v1.0.3](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Coverage)

  Um die Kompatibilität herzustellen, sind folgende Schritte erforderlich:
    * folgende Elemente MÜSSEN entfernt werden:
      * `Coverage.identifier`
      * `Coverage.status` MUSS den Wert `active` enthalten


#### Profil ISiKVersicherungsverhaeltnisSelbstzahler

Das Profil ISiKVersicherungsverhaeltnisSelbstzahler basiert auf dem Profil ["Coverage, deutsches Selbstzahlerprofil" der deutschen Basisprofile - v1.0.0](http://fhir.de/StructureDefinition/coverage-de-sel).

Instanzen, die gegen ISiKVersicherungsverhaeltnisSelbstzahler valide sind, sind auch valide gegen
* Profil ["Coverage, deutsches Selbstzahlerprofil" der deutschen Basisprofile - v1.0.0](http://fhir.de/StructureDefinition/coverage-de-sel)

---