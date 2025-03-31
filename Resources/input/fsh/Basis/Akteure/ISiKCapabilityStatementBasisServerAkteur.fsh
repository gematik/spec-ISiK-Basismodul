Instance: ISiKCapabilityStatementBasisServerAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-actor
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasisServerAkteur"
* name = "ISiK-CapabilityStatementBasisServerAkteur"
* title = "Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
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


* rest.mode = #server



