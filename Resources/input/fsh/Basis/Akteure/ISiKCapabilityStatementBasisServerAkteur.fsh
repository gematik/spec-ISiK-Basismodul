Instance: ISiKCapabilityStatementBasisServerAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasisServerAkteur"
* name = "ISiK-CapabilityStatementBasisServerAkteur"
* title = "Option &quot;OptionPatientMerge&quot; für Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* imports = Canonical(ISiKCapabilityStatementStammdatenRolle)
  * insert ExpectationImports(SHALL)
* imports = Canonical(ISiKCapabilityStatementErweiterteStammdatenRolle)
  * insert ExpectationImports(SHALL)
* imports = Canonical(ISiKCapabilityStatementAufbaustrukturRolle)
  * insert ExpectationImports(SHALL)
* imports = Canonical(ISiKCapabilityStatementLeistungserbringerRolle)
  * insert ExpectationImports(SHALL)
* imports = Canonical(ISiKCapabilityStatementGesundheitsstatusRolle)
  * insert ExpectationImports(SHALL)
* imports = Canonical(ISiKCapabilityStatementKlinischeRolle)
  * insert ExpectationImports(SHALL)
* imports = Canonical(ISiKCapabilityStatementTerminologieRolle)
  * insert ExpectationImports(SHALL)
* imports = Canonical(ISiKCapabilityStatementVersicherungsverhaeltnisRolle)
  * insert ExpectationImports(SHALL)
* imports = Canonical(ISiKCapabilityStatementCompositionKonsumentenRolle)
  * insert ExpectationImports(SHALL)

* description = 
  "Dieses CapabilityStatement beschreibt alle Interaktionen, 
  die ein System unterstützen MUSS, das den Akteur &quot;Basis Server Akteur&quot; implementiert.   

  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.
Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. 
Der `MODE`-Parameter kann ignoriert werden.  
Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). 
Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, 
wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.  

Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen 
und die Versionsnummer angeben. 
Darüber hinaus MUSS in `CapabilityStatement.instantiates` die Canonical URL des nachfolgenden CapabilityStatements angegeben werden.  

Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement mit `SHALL` gekennzeichnet sind. 
Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, 
sofern diese in der Instanz implementiert wurden.  

Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich."



