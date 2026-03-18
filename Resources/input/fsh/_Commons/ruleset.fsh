Alias: $ISIKVersion = 5.1.1

RuleSet: Meta
* ^version = $ISIKVersion
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^date = "2025-12-17"

RuleSet: MetaInstance
* version = $ISIKVersion
* status = #active
* experimental = false
* publisher = "gematik GmbH"
* date = "2025-12-17"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"

RuleSet: Meta-CapabilityStatement
* insert MetaInstance
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json

RuleSet: Meta-CapabilityStatement-Rolle
* insert Meta-CapabilityStatement
* description = "Dieses CapabilityStatement beschreibt alle Interaktionen, 
  die ein System unterstützen MUSS, welches diese Rolle implementiert.   
  
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). 
Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, 
wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet."

RuleSet: Meta-CapabilityStatement-Akteur
* insert Meta-CapabilityStatement
* description = "Dieses CapabilityStatement beschreibt alle Interaktionen, 
  die ein System unterstützen MUSS, welches diesen Akteur implementiert.   

  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.
Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. 
Der `MODE`-Parameter kann ignoriert werden.  
Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). 
Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, 
wird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten 'SHALL' (=MUSS)  'SHOULD' (=SOLL)  'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet.  

Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen 
und die Versionsnummer angeben.   
Darüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden.
Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per 'imports'). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.

Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe 'imports') mit `SHALL` gekennzeichnet sind. 
Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, 
sofern diese in der Instanz implementiert wurden.  

Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich."


RuleSet: Expectation (expectation)
* extension[+]
  * url = $capabilitystatement-expectation
  * valueCode = {expectation}

RuleSet: ExpectationImports (expectation)
* extension[+]
  * url = Canonical(ExtensionISiKCapabilityStatementImportsExpectation)
  * valueCode = {expectation}

RuleSet: SupportedProfileCapExpectationExt(canonical, expectation)
* supportedProfile[+] = Canonical({canonical})
  * insert CapabilityStatementExpectationExt({expectation})

RuleSet: CapabilityStatementExpectationExt(expectation)
* extension.url = $capabilitystatement-expectation
* extension.valueCode = #{expectation}

RuleSet: supportedLaborProfile
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungSerumkreatinin
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungPCT
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungCRP
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungHb
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungTroponin
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $ISiKLaboruntersuchungGFR
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $ISiKLaboruntersuchungThrombozyten
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $ISiKLaboruntersuchungTSH
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL

RuleSet: ISiKVitalsignCommonsValue
// ISiK Vitalsign Commons Value is needed for the ISiK Vitalsign Profiles since some of them are not using the value[x] element (e.g. ISiKBlutdruck is using component).
* insert Meta
* value[x] MS
  * ^comment = "Motivation MS: Der Wert des Vitalparameters ist das zentrale Ergebnis der Untersuchung"
  * ^short = "Untersuchungsergebnis"

RuleSet: ISiKVitalsignCommons
* insert Meta
* status MS
  * ^comment = "**WICHTIGER Hinweis für Implementierer:**  
* Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch `final`.
* Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben."
  * ^short = "Untersuchungsstatus"
* category MS
  * ^comment = "Motivation MS: Dieses Feld erlaubt die Sortierung und Abfrage anhand der Kategorie der Untersuchung"
  * ^short = "Untersuchungskategorie"
* code MS
  * ^comment = "Motivation MS: Die Observation wird anhand des Codes identifiziert."
  * ^short = "Code"
  * coding MS
    * ^comment = "Motivation MS: Semantische Kodierung"
    * ^short = "Coding"
  * coding[loinc] MS
  * coding[loinc] only ISiKLoincCoding
    * ^short = "LOINC Kodierung"
    * ^comment = "Motivation MS: Kodierung des Vitalparameters mittels LOINC."
  * coding[snomed] MS
  * coding[snomed] only ISiKSnomedCTCoding
    * ^short = "SNOMED CT Kodierung"
    * ^comment = "Motivation MS: Kodierung des Vitalparameters mittels SNOMED CT."
* subject MS
  * insert Comment-Reference-Subject(Motivation MS)
  * ^short = "Patient"
* encounter MS
  * ^short = "Aufenthaltsbezug"
  * ^comment = "Motivation MS: Der Behandlungskontext ist für die Interpretation der Untersuchungsergebnisse relevant"
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * insert Comment-Reference-Encounter-with-hint(Begründung Pflichtfeld)
* effective[x] MS
  * ^comment = "Motivation MS: Das Datum und die Uhrzeit der Untersuchung sind für die Interpretation der Untersuchungsergebnisse relevant"
  * ^short = "Datum und Uhrzeit der Untersuchung"
* performer MS
  * ^comment = "Motivation MS: Dieses Feld stellt präzisierende Angaben zum Zweck der Qualitätsbewertung bereit"
  * ^short = "Untersuchender"
* method MS
  * ^comment = "**Einschränkung der übergreifenden MS-Definition:**  
Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung der Untersuchungsmethode, so MUSS dieses System die Information NICHT abbilden


  Motivation zum eingeschränkten MS: Dieses Feld stellt präzisierende Angaben zum Zweck der Qualitätsbewertung bereit. Allerdings rechtfertigt der Stand der Umsetzung in gängigen Systemen eine Implementierungspflicht (MS) für die Schnittstelle nicht."
  * ^short = "Untersuchungsmethode"
* device MS
  * ^comment = "**Einschränkung der übergreifenden MS-Definition:**  
  Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des Geräts, mittels dessen der Parameter erhoben worden ist, so MUSS dieses System die Information NICHT abbilden.

  Motivation zum eingeschränkten MS: Dieses Feld stellt präzisierende Angaben zum Zweck der Qualitätsbewertung bereit. Allerdings rechtfertigt der Stand der Umsetzung in gängigen Systemen eine Implementierungspflicht (MS) für die Schnittstelle nicht."
  * ^short = "Gerät"
* dataAbsentReason MS
  * ^comment = "Motivation MS: Dieses Feld erlaubt die Angabe von Gründen für fehlende Untersuchungsergebnisse"
  * ^short = "Grund für fehlende Untersuchungsergebnisse"


RuleSet: Quantity-MS
* valueQuantity MS
  * ^comment = "Motivation MS: valueQuantity muss für VitalSigns unterstützt werden"
  * ^short = "quantitatives Untersuchungsergebnis"
* valueQuantity.value MS
  * ^comment = "Motivation MS: Eine Quantity soll einen Wert enthalten"
  * ^short = "Wert"
* valueQuantity.unit MS
  * ^comment = "Motivation MS: Eine Quantity soll eine Einheit enthalten"
  * ^short = "Einheit"
* valueQuantity.system MS
  * ^comment = "Motivation MS: Eine Quantity soll ein System, mit dem die Einheit kodiert wird, enthalten"
  * ^short = "CodeSystem aus dem die Einheit stammt"
* valueQuantity.code MS
  * ^comment = "Motivation MS: Eine Quantity soll einen Code der die Einheit kodiert enthalten"
  * ^short = "Code der Einheit"

RuleSet: CodeableConcept-MS
* coding MS
  * ^comment = "Motivation MS: Semantische Kodierung."
  * ^short = "Coding"
  * code MS
    * insert Coding-Code-MS
  * system MS
    * insert Coding-System-MS

RuleSet: Coding-Code-MS
* ^short = "Code"
* ^comment = "Motivation MS: Kodierter Wert aus einem CodeSystem."

RuleSet: Coding-System-MS
* ^short = "System"
* ^comment = "Motivation MS: URL des CodeSystems des kodierten Wertes."

RuleSet: Coding-Display-MS
* ^short = "Display"
* ^comment = "Motivation MS: Anzeigename des kodierten Wertes."

RuleSet: Coding-Version-MS
* ^short = "Version"
* ^comment = "Motivation MS: Version des kodierten Wertes."

RuleSet: Component-MS
* ^comment = "Motivation MS: Erfassung der Komponenten eines Vitalparameters" 
* ^short = "Vitalparameter-Komponente"
* insert Component-Slice-MS

RuleSet: Component-Slice-MS
* code MS
  * ^comment = "Motivation MS: Die Komponente wird anhand des Codes identifiziert."
  * ^short = "Code"
  * coding MS
    * ^comment = "Motivation MS: Semantische Kodierung"
    * ^short = "Coding" 
* value[x] MS
  * ^comment = "Motivation MS: Der Wert der Komponente ist ein Ergebnis der Untersuchung"
  * ^short = "Wert der Komponente"

RuleSet: Observation-category-VSCat-MS
* category[VSCat] MS
  * ^comment = "Motivation MS: Die Kategorie 'vital-signs' dient der Kategorisierung von Vitalparametern"
  * ^short = "Vitalparameterkategorie"

RuleSet: EffectiveAndPerformer
* performer = Reference(PractitionerWalterArzt)
* effectiveDateTime = 2021-09-01T12:00:00Z


// ruleset for ICU-Normalstation Workflow IG
RuleSet: MII_SpecificIEEE-11073Slice
* coding contains 
  specific-IEEE-11073 0..1 MS


RuleSet: CommonElements
* id MS
  * ^short = "serverseitige, interne ID des Datensatzes"
  * ^comment = "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.
  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. "
* meta.lastUpdated
  * ^short = "Zeitpunkt der letzten Änderung"
  * ^comment = "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.
  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. " 
* meta.versionId 
  * ^short = "Eindeutiger Name der serverseitigen Version des Datensatzes"
  * ^comment = "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.
  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. " 
* implicitRules ..0
  * ^short = "Verweis auf die Regeln, nach denen die Ressource erstellt wurde"
  * ^comment = "Begründung Constraint: In ISiK existiert kein Use-Case für dieses Element. Da es sich um ein Modifying Element handelt, wird es daher ausgeschlossen.
  Darüber hinaus werden die Regeln als URI vorgehalten. Dies führt dazu, dass sich hinter der URI eine beliebige Menge an Regeln befinden kann; wodurch  nicht sichergestellt werden kann, dass alle Clients die Regeln korrekt interpretieren können." 

RuleSet: ISiKKontaktGesundheitseinrichtung-Encounter.location-Slice
* location 1.. MS
  * ^short = "Aufenthaltsort"
  * reference MS
    * ^short = "Location-Link"
    * ^comment = "**Begründung MS:** Die Verlinkung auf eine Location-Ressource dient der technischen Zuordnung des Besuchs zu einem Aufenthaltsort 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
  * identifier 1.. MS
    * ^short = "Identifier des Aufenthaltsortes"
    * system MS
      * ^short = "Namensraum des Identifiers"
      * ^comment = "Hier ist stets der eindeutige Name (URL) des Namensraums anzugeben, 
    aus dem der Identifier stammt. 
    Hinweise zur Festlegung der URLs für lokale Namensräume sind in den 
    [Deutschen Basisprofilen](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Terminologie-Namensraeume?version=current) beschrieben.  
    **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher. Darüber hinaus ermöglicht es der Identifier, die Suche (z.B. von aktuellen Aufenthalten auf einer Station) mittels `/Encounter?location:identifier=XXX` auch dann zu nutzen, wenn keine Verlinkung auf eine Location-Ressource vorhanden ist. Auf `location.display` ist im Standard derzeit kein Suchparameter definiert."
    * value 1.. MS
      * ^comment = "Enthält den eigentlichen Wert des Identifiers.  
      **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden."
  * display 1.. MS
    * ^short = "(Menschenlesbarer) Name des Aufenthaltsortes"

RuleSet: ISiKMedikament-CodingPZNComment
* ^comment = "Mehrfachcodierung ist zulässig, da für ein abstraktes Medikament auch mehrere PZN-Codes existieren können, z. B. existieren für Aspirin 3 verschiedene Packungsgrößen."

RuleSet: ISiKMedikament-CodingATCComment
* ^comment = "Mehrfachcodierung ist zulässig, da für ein abstraktes Medikament auch mehrere ATC-Codes existieren können, z. B. existieren für Aspirin 4 verschiedene Codes, je nachdem wofür das Medikament angewendet wird."


RuleSet: Comment-Reference-Subject(Einleitung)
* ^comment = "**{Einleitung}:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.
Im ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient) sein.
Jenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden."


RuleSet: Comment-Reference-Encounter-with-hint(Einleitung)
* ^comment = "**{Einleitung}:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.
**WICHTIGER Hinweis für Implementierer:** Die Zuordnung MUSS auf einen Encounter der Ebene \"Abteilungskontakt\" (siehe hierzu Basismodul > UseCases > Abbildung des Konstruktes \"Fall\") erfolgen.  
Bei der Auswahl des Encounters ist zu beachten, dass unter einer (Abrechnungs-)\"Fallnummer\" (hier: `Encounter.account`) unter Umständen mehrere Encounter gruppiert sein können (z.B. stationärer Besuch mit mehreren vor- und nachstationären Aufenthalten.)
Im ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung) sein.
Jenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden."


RuleSet: Comment-Reference-Encounter(Einleitung)
* ^comment = "**{Einleitung}:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.
Im ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung) sein.
Jenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden."

RuleSet: CompliesWith(canonical)
* ^extension[$compliesWith][+].valueCanonical = Canonical({canonical})

RuleSet: EU-BodySiteExtension
* bodySite.extension contains $BodyStructureReferenceExtension named BodyStructureReference ..1
* bodySite.extension[BodyStructureReference]
  * ^short = "Referenz auf eine BodyStructure-Ressource"
  * ^comment = "Im Kontext des Allingments mit dem EHDS und den damit verbundenen Spezifikationen von HL7 Europe wurde diese Extenion hinzugefügt. Es besteht aber noch keine Must-Support Anforderung, da die Abbildung der Lateralität noch in der Diskussion ist und somit keine klare Vorgabe für die Nutzung der Extension gegeben werden kann. Sobald dies geklärt ist, wird die Anforderung entsprechend angepasst. Eine referenzierte BodyStructure-Ressource sollte valide gegen [bodyStructure-eu-core](https://hl7.eu/fhir/base/StructureDefinition-bodyStructure-eu-core.html) sein."
