Instance: ISiKCapabilityStatementBasisServerAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasisServerAkteur"
* name = "ISiK-CapabilityStatementBasisServerAkteur"
* title = "Akteur ISiKCapabilityStatementBasisServerAkteur"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = """   
  CapabilityStatement für den Akteur ISiKCapabilityStatementBasisServerAkteur.
  Dieser Akteur aggregiert die Rollen zur Abfrage von Stammdaten, Erweiterte Stammdaten, Aufbau-Struktur, Terminologie, klinischen Daten, Abrechnungsinformationen und Gesundheitsstatus.
  """
* imports[+] = Canonical(ISiKCapabilityStatementStammdatenRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementErweiterteStammdatenRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementAufbaustrukturRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementLeistungserbringerRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementGesundheitsstatusRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementKlinischeRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementTerminologieRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementVersicherungsverhaeltnisRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementCompositionKonsumentenRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementAmbulanteStammdatenRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementImplantatRolle)
  * insert ExpectationImports(#MAY)  


* rest.mode = #server



