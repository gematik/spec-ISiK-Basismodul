Instance: ISiKCapabilityStatementDokumentenServerAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementDokumentenServerAkteur"
* name = "ISiKCapabilityStatementDokumentenServerAkteur"
* title = "ISiK CapabilityStatement Dokumenten Server Akteur"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Dokumentenaustausch"
* imports[+] = Canonical(ISiKCapabilityStatementDokumentenverwaltungRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementMetadatenErzeugenRolle)
  * insert ExpectationImports(#MAY)
* imports[+] = Canonical(ISiKCapabilityStatementMetadatenUpdateRolle)
  * insert ExpectationImports(#MAY)


* rest.mode = #server

