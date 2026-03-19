Instance: ISiKCapabilityStatementFormularDatenQuelleAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularDatenQuelleAkteur"
* name = "ISiK-CapabilityStatementFormularDatenQuelleAkteur"
* title = "Akteur `ISiKCapabilityStatementFormularDatenQuelleAkteur`"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"
* purpose = """   
  CapabilityStatement für den Akteur `ISiKCapabilityStatementFormularDatenQuelleAkteur`.
  Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten.
  Verpflichtend ist in diesem Kontext nur die Rolle `FormularDatenQuelleRolle` und `CompositionKonsumentenRolle`, die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können.
  """

* imports[+] = Canonical(ISiKCapabilityStatementFormularDatenQuelleRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementCompositionKonsumentenRolle)
  * insert ExpectationImports(#SHALL)
* imports[+] = Canonical(ISiKCapabilityStatementStammdatenRolle)
  * insert ExpectationImports(#MAY)
* imports[+] = Canonical(ISiKCapabilityStatementGesundheitsstatusRolle)
  * insert ExpectationImports(#MAY)
* imports[+] = Canonical(ISiKCapabilityStatementAMTSRolle)
  * insert ExpectationImports(#MAY)
* imports[+] = Canonical(ISiKCapabilityStatementVitalSignStandardSourceRolle)
  * insert ExpectationImports(#MAY)
* imports[+] = Canonical(ISiKCapabilityStatementLaborMinimalRolle)
  * insert ExpectationImports(#MAY)
* imports[+] = Canonical(ISiKCapabilityStatementVitalSignICUSourceExtendedRolle)
  * insert ExpectationImports(#MAY)
* imports[+] = Canonical(ISiKCapabilityStatementVitalSignICUSourceMinimalRolle)
  * insert ExpectationImports(#MAY)
* imports[+] = Canonical(ISiKCapabilityStatementKlinischeRolle)
  * insert ExpectationImports(#MAY)

* rest.mode = #server



